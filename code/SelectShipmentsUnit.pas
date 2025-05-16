unit SelectShipmentsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls,
  Shipments, Hash, CartesianTree, Types, Messages;

type
  TfrSelectShipments = class(TForm)
    sgSelectShipmentsTable: TStringGrid;
    pnSelectShipments: TPanel;
    btnSelectConfirm: TButton;
    btnSelectAll: TButton;
    btnSelectReset: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadData(shipmentsPtr: PPShipment);

    procedure sgSelectShipmentsTableDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgSelectShipmentsTableMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnSelectResetClick(Sender: TObject);
    procedure btnSelectConfirmClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure ToggleCheckbox(const ARow: Integer);
    var
      siz: integer;
      FShipmentsPtr: PPShipment;
  public
    { Public declarations }
  end;

var
  frSelectShipments: TfrSelectShipments;

implementation

{$R *.dfm}


const
  CHECKBOX_COL = 9;
  CHECKBOX_SIZE = 28;

var
  startHeight, startWidth: integer;

procedure TfrSelectShipments.btnSelectAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to siz - 1 do
  begin
    sgSelectShipmentsTable.Cells[CHECKBOX_COL, i] := '1'
  end;
  sgSelectShipmentsTable.Repaint;
end;

procedure TfrSelectShipments.btnSelectConfirmClick(Sender: TObject);
var
  i: integer;
  curShipment, prev, temp: PShipment;
  allCorrect: boolean;
begin
  curShipment := FShipmentsPtr^;
  prev := nil;
  allCorrect := true;
  for i := 1 to siz-1 do
  begin
    if sgSelectShipmentsTable.Cells[CHECKBOX_COL, i] = '1' then
    begin
      allCorrect := doShipment(curShipment) and allCorrect;
      if prev = nil then
       FShipmentsPtr^ := curShipment^.Next
      else
      begin
        prev^.Next := curShipment^.Next;
      end;
      temp := curShipment;
      curShipment := curShipment^.Next;
      Dispose(temp);
    end
    else
    begin
      prev := curShipment;
      curShipment := curShipment^.next;
    end;
    sgSelectShipmentsTable.Cells[CHECKBOX_COL, i] := '0';
  end;
  if allCorrect then
  begin
    showMessage('Успешно', 'Все отгрузки были выполнены успешно!');
  end
  else
  begin
    showMessage('Ошибка', 'Произошл ошибка!');
  end;
  loadData(FShipmentsPtr);
  sgSelectShipmentsTable.Invalidate;
end;

procedure TfrSelectShipments.btnSelectResetClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to siz - 1 do
  begin
    sgSelectShipmentsTable.Cells[CHECKBOX_COL, i] := '0'
  end;
  sgSelectShipmentsTable.Repaint;
end;

procedure TfrSelectShipments.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrSelectShipments.LoadData(shipmentsPtr: PPShipment);
var
  i: integer;
  curShipment: PShipment;
begin
  FShipmentsPtr := shipmentsPtr;
  siz := 1; //header
  curShipment := FShipmentsPtr^;
  while curShipment <> nil do
  begin
    Inc(siz);
    curShipment := curShipment^.next;
  end;
  sgSelectShipmentsTable.RowCount := siz;
  curShipment := FShipmentsPtr^;
  i := 1;
  while curShipment <> nil do
  begin
    sgSelectShipmentsTable.Cells[0, i] := curShipment^.ShipmentName;
    sgSelectShipmentsTable.Cells[1, i] := intToStr(curShipment^.ID);
    sgSelectShipmentsTable.Cells[2, i] := string(curShipment^.SourceID^.name);
    sgSelectShipmentsTable.Cells[3, i] := 'ул. ' + string(curShipment^.SourceID^.street)
                                    + ', д. ' + intToStr(curShipment^.SourceID^.house)
                                    +', корп. ';
    if curShipment^.SourceID^.building <> -1 then
      sgSelectShipmentsTable.Cells[3, i] := sgSelectShipmentsTable.Cells[3, i] + intToStr(curShipment^.SourceID^.building)
    else
      sgSelectShipmentsTable.Cells[3, i] := sgSelectShipmentsTable.Cells[3, i] + '-';

    sgSelectShipmentsTable.Cells[4, i] := string(curShipment^.DestinationID^.name);

    sgSelectShipmentsTable.Cells[5, i] := 'ул. ' + string(curShipment^.DestinationID^.street)
                                    + ', д. ' + intToStr(curShipment^.DestinationID^.house)
                                    + ', корп. ';
    if curShipment^.DestinationID^.building <> -1 then
      sgSelectShipmentsTable.Cells[5, i] := sgSelectShipmentsTable.Cells[5, i] + intToStr(curShipment^.DestinationID^.building)
    else
      sgSelectShipmentsTable.Cells[5, i] := sgSelectShipmentsTable.Cells[5, i] + '-';

    sgSelectShipmentsTable.Cells[6, i] := curShipment^.ProductName;
    sgSelectShipmentsTable.Cells[7, i] := intToStr(getHash(curShipment^.ProductName));
    sgSelectShipmentsTable.Cells[8, i] := intToStr(curShipment^.Count);
    Inc(i);
    curShipment := curShipment^.next;
  end;
end;

procedure TfrSelectShipments.sgSelectShipmentsTableDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  CheckRect: TRect;
begin
  if (ACol = CHECKBOX_COL) and (ARow > 0) then
  begin
    with sgSelectShipmentsTable.Canvas do
    begin
      // Очищаем фон
      Brush.Color := clWhite;
      FillRect(Rect);

      // Рассчитываем положение чекбокса
      CheckRect := Rect;
      CheckRect.Left := CheckRect.Left + (CheckRect.Width - CHECKBOX_SIZE) div 2;
      CheckRect.Top := CheckRect.Top + (CheckRect.Height - CHECKBOX_SIZE) div 2;
      CheckRect.Right := CheckRect.Left + CHECKBOX_SIZE;
      CheckRect.Bottom := CheckRect.Top + CHECKBOX_SIZE;

      // Рисуем рамку чекбокса
      Pen.Color := clBlack;
      Brush.Style := bsClear;
      Rectangle(CheckRect);

      // Рисуем галочку если отмечено
      if sgSelectShipmentsTable.Cells[ACol, ARow] = '1' then
      begin
        Font.Size := 16;
        Font.Name := 'Arial';
        Font.CharSet := DEFAULT_CHARSET;
        TextOut(CheckRect.Left + 1, CheckRect.Top - CHECKBOX_SIZE shr 1 + 3, '+');
      end;
    end;
  end;
end;

procedure TfrSelectShipments.sgSelectShipmentsTableMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
  CheckRect: TRect;
begin
  sgSelectShipmentsTable.MouseToCell(X, Y, ACol, ARow);

  if (ACol = CHECKBOX_COL) and (ARow > 0) then
  begin
    // Получаем область ячейки
    CheckRect := sgSelectShipmentsTable.CellRect(ACol, ARow);

    // Рассчитываем область чекбокса
    CheckRect.Left := CheckRect.Left + (CheckRect.Width - CHECKBOX_SIZE) div 2;
    CheckRect.Top := CheckRect.Top + (CheckRect.Height - CHECKBOX_SIZE) div 2;
    CheckRect.Right := CheckRect.Left + CHECKBOX_SIZE;
    CheckRect.Bottom := CheckRect.Top + CHECKBOX_SIZE;

    // Проверяем клик внутри чекбокса
    if (X >= CheckRect.Left) and (X <= CheckRect.Right) and
       (Y >= CheckRect.Top) and (Y <= CheckRect.Bottom) then
    begin
      ToggleCheckbox(ARow);
    end;
  end;
end;

procedure TfrSelectShipments.ToggleCheckbox(const ARow: Integer);
begin
  if sgSelectShipmentsTable.Cells[CHECKBOX_COL, ARow] = '1' then
    sgSelectShipmentsTable.Cells[CHECKBOX_COL, ARow] := '0'
  else
    sgSelectShipmentsTable.Cells[CHECKBOX_COL, ARow] := '1';

  sgSelectShipmentsTable.Repaint;
end;

procedure TfrSelectShipments.FormCreate(Sender: TObject);
begin
  startWidth := frSelectShipments.ClientWidth;
  startHeight := frSelectShipments.ClientHeight;
  FormStyle := fsNormal;
  Position := poMainFormCenter;

  //Название (15), ID (5), отправитель (15), адрес отправителя (15),
  //получатель (15), адрес получателя (15), товар (10), артикул (5), количество(5)

  sgSelectShipmentsTable.ColCount := 10;

  sgSelectShipmentsTable.ColWidths[0] := trunc(0.13 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[1] := trunc(0.05 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[2] := trunc(0.14 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[3] := trunc(0.13 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[4] := trunc(0.14 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[5] := trunc(0.13 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[6] := trunc(0.10 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[7] := trunc(0.05 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[8] := trunc(0.06 * frSelectShipments.clientWidth);
  sgSelectShipmentsTable.ColWidths[9] := frSelectShipments.clientWidth
                               -sgSelectShipmentsTable.ColWidths[0]
                               -sgSelectShipmentsTable.ColWidths[1]
                               -sgSelectShipmentsTable.ColWidths[2]
                               -sgSelectShipmentsTable.ColWidths[3]
                               -sgSelectShipmentsTable.ColWidths[4]
                               -sgSelectShipmentsTable.ColWidths[5]
                               -sgSelectShipmentsTable.ColWidths[6]
                               -sgSelectShipmentsTable.ColWidths[7]
                               -sgSelectShipmentsTable.ColWidths[8]
                               -sgSelectShipmentsTable.ColCount * sgSelectShipmentsTable.GridLineWidth
                               -12;

  sgSelectShipmentsTable.Cells[0, 0] := 'Название';
  sgSelectShipmentsTable.Cells[1, 0] := 'ID';
  sgSelectShipmentsTable.Cells[2, 0] := 'Отправитель';
  sgSelectShipmentsTable.Cells[3, 0] := 'Адрес отправителя';
  sgSelectShipmentsTable.Cells[4, 0] := 'Получатель';
  sgSelectShipmentsTable.Cells[5, 0] := 'Адрес получателя';
  sgSelectShipmentsTable.Cells[6, 0] := 'Товар';
  sgSelectShipmentsTable.Cells[7, 0] := 'Артикул';
  sgSelectShipmentsTable.Cells[8, 0] := 'Количество';
  //sgSelectShipmentsTable.Cells[9, 0] := 'Выбрать';

  sgSelectShipmentsTable.RowCount := 0;

  sgSelectShipmentsTable.DoubleBuffered := True;

  sgSelectShipmentsTable.OnDrawCell := sgSelectShipmentsTableDrawCell;
  sgSelectShipmentsTable.OnMouseDown := sgSelectShipmentsTableMouseDown;

  sgSelectShipmentsTable.Cells[CHECKBOX_COL, 0] := 'Выбрать';

end;

procedure TfrSelectShipments.FormResize(Sender: TObject);
begin
  frSelectShipments.ClientWidth := startWidth;
  frSelectShipments.ClientHeight := startHeight;
end;

end.
