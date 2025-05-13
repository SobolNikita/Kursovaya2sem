unit BalanceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls,
  Types, Vars;

type
  TfrBalance = class(TForm)
    pnBalance: TPanel;
    sgBalanceTable: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SetData(const shops, warehouses: PTreapNode);
    function getSizObject(const item: PTreapNode): integer;
    function getSizItems(const item: PTreapItemNode): integer;
    procedure showDataObject(const item: PTreapNode; var i: integer);
    procedure showDataItem(const curObject: PTreapNode; const item: PTreapItemNode; var i: integer);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frBalance: TfrBalance;

implementation

{$R *.dfm}

var
  startHeight, startWidth: integer;

procedure TfrBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrBalance.getSizItems(const item: PTreapItemNode): integer;
begin
  Result := 0;
  if item <> nil then
  begin
    Inc(Result);
    Result := Result + getSizItems(item^.Left);
    Result := Result + getSizItems(item^.Right);
  end;
end;

function TfrBalance.getSizObject(const item: PTreapNode): integer;
begin
  Result := 0;
  if item <> nil then
  begin
    Result := Result + getSizItems(item^.Data^.Items);
    Result := Result + getSizObject(item^.Left);
    Result := Result + getSizObject(item^.Right);
  end;
end;

procedure TfrBalance.showDataItem(const curObject: PTreapNode; const item: PTreapItemNode; var i: integer);
begin
  if item <> nil then
  begin

    sgBalanceTable.Cells[0, i] := string(curObject^.Data^.name);
    if (curObject^.Data^.Key and mask) <> 0 then
      sgBalanceTable.Cells[1, i] := 'Магазин'
    else
      sgBalanceTable.Cells[1, i] := 'Склад';
    sgBalanceTable.Cells[2, i] := intToStr(curObject^.Data^.capacity);
    sgBalanceTable.Cells[3, i] := intToStr(curObject^.Data^.usedCapacity);
    sgBalanceTable.Cells[4, i] := intToStr(curObject^.Data^.shipmentCapacity);
    sgBalanceTable.Cells[5, i] := string(item^.Data^.name);
    sgBalanceTable.Cells[6, i] := string(item^.Data^.category);
    sgBalanceTable.Cells[7, i] := string(intToStr(item^.Data^.Key));
    sgBalanceTable.Cells[8, i] := intToStr(item^.Data^.Count);
    sgBalanceTable.Cells[9, i] := intToStr(item^.Data^.Count * item^.Data^.Volume);

    Inc(i);
    showDataItem(curObject, item^.Left, i);
    showDataItem(curObject, item^.Right, i);
  end;
end;

procedure TfrBalance.showDataObject(const item: PTreapNode; var i: integer);
begin
  if item <> nil then
  begin
    showDataItem(item, item^.Data^.Items, i);
    showDataObject(item^.Left, i);
    showDataObject(item^.Right, i);
  end;
end;

procedure TfrBalance.SetData(const shops, warehouses: PTreapNode);
var
  siz, i: integer;
begin
  siz := getSizObject(shops) + getSizObject(warehouses);
  sgBalanceTable.RowCount := siz + 1;
  i := 1;
  showDataObject(shops, i);
  showDataObject(warehouses, i);
end;

procedure TfrBalance.FormCreate(Sender: TObject);
begin
  startHeight := frBalance.ClientHeight;
  startWidth := frBalance.ClientWidth;
  FormStyle := fsNormal;
  Position := poMainFormCenter;

  sgBalanceTable.ColCount := 10;

  sgBalanceTable.ColWidths[0] := trunc(0.18 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[1] := trunc(0.05 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[2] := trunc(0.07 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[3] := trunc(0.07 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[4] := trunc(0.10 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[5] := trunc(0.15 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[6] := trunc(0.15 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[7] := trunc(0.05 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[8] := trunc(0.08 * frBalance.clientWidth);
  sgBalanceTable.ColWidths[9] := frBalance.clientWidth
                               -sgBalanceTable.ColWidths[0]
                               -sgBalanceTable.ColWidths[1]
                               -sgBalanceTable.ColWidths[2]
                               -sgBalanceTable.ColWidths[3]
                               -sgBalanceTable.ColWidths[4]
                               -sgBalanceTable.ColWidths[5]
                               -sgBalanceTable.ColWidths[6]
                               -sgBalanceTable.ColWidths[7]
                               -sgBalanceTable.ColWidths[8]
                               -sgBalanceTable.ColCount * sgBalanceTable.GridLineWidth
                               -12;

  sgBalanceTable.Cells[0, 0] := 'Объект';
  sgBalanceTable.Cells[1, 0] := 'Тип';
  sgBalanceTable.Cells[2, 0] := 'Вместимость';
  sgBalanceTable.Cells[3, 0] := 'Занято';
  sgBalanceTable.Cells[4, 0] := 'Резерв для доставок';
  sgBalanceTable.Cells[5, 0] := 'Товар';
  sgBalanceTable.Cells[6, 0] := 'Категория';
  sgBalanceTable.Cells[7, 0] := 'Артикул';
  sgBalanceTable.Cells[8, 0] := 'Количество';
  sgBalanceTable.Cells[9, 0] := 'Занято товаром';

  sgBalanceTable.RowCount := 0;
end;

procedure TfrBalance.FormResize(Sender: TObject);
begin
  frBalance.ClientHeight := startHeight;
  frBalance.ClientWidth := startWidth;
end;

end.
