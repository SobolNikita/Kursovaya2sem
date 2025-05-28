unit TableUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls,
  Types, Vars;

type
  TfrTableForm = class(TForm)
    pnItemsTableName: TPanel;
    sgItemsTable: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function GetTreeSize(const root: PTreapItemNode): integer;
    procedure LoadData;
    procedure SetDataToTable(const root: PTreapItemNode; var i: integer);
    procedure FormResize(Sender: TObject);
    procedure sgItemsTableDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure sgItemsTableTopLeftChanged(Sender: TObject);
  private
    { Private declarations }
  public
    Location: PLocation;
    { Public declarations }
  end;

var
  frTableForm: TfrTableForm;

implementation

var
  startWidth, startHeight: integer;

{$R *.dfm}

function TfrTableForm.GetTreeSize(const root: PTreapItemNode): integer;
begin
  if root = nil then
    Result := 0
  else
    Result := 1 + GetTreeSize(root^.Left) + GetTreeSize(root^.Right);

end;

procedure TfrTableForm.SetDataToTable(const root: PTreapItemNode; var i: integer);
begin
  if root <> nil then
  begin
    sgItemsTable.Cells[0, i] := string(root^.Data^.name);
    sgItemsTable.Cells[1, i] := string(root^.Data^.category);
    sgItemsTable.Cells[2, i] := intToStr(root^.Data^.Volume);
    sgItemsTable.Cells[3, i] := intToStr(root^.Data^.Count);
    sgItemsTable.Cells[4, i] := intToStr(root^.Data^.Key);
    Inc(i);
    SetDataToTable(root^.Left, i);
    SetDataToTable(root^.Right, i);
  end;
end;

procedure TfrTableForm.sgItemsTableDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
var
  S: string;
begin
  S := sgItemsTable.Cells[ACol, ARow];
  sgItemsTable.Canvas.FillRect(Rect);

  DrawText(
    sgItemsTable.Canvas.Handle,
    PChar(S), Length(S),
    Rect,
    DT_WORDBREAK or DT_NOPREFIX or DT_LEFT
  );
end;
procedure TfrTableForm.sgItemsTableTopLeftChanged(Sender: TObject);
begin
  sgItemsTable.LeftCol := 1;
end;


procedure TfrTableForm.LoadData;
var
  siz, i: integer;
begin
  siz := GetTreeSize(Location^.Items);
  sgItemsTable.RowCount := siz + 1;
  i := 1;
  pnItemsTableName.Caption := 'Товары ';
  if (Location^.Key and mask) <> 0 then
    pnItemsTableName.Caption := pnItemsTableName.Caption + 'в магазине'
  else
    pnItemsTableName.Caption := pnItemsTableName.Caption + 'на складе';
  pnItemsTableName.Caption := pnItemsTableName.Caption + ' ' + string(Location^.name);
  pnItemsTableName.Font.Style := pnItemsTableName.Font.Style + [fsBold];
  pnItemsTableName.Font.Size := 16;
  SetDataToTable(Location^.Items, i);
end;

procedure TfrTableForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrTableForm.FormCreate(Sender: TObject);
begin

  startWidth := frTableForm.ClientWidth;
  startHeight := frTableForm.ClientHeight;

  FormStyle := fsNormal;
  Position := poMainFormCenter;


  sgItemsTable.ColCount := 5;

  sgItemsTable.ColWidths[0] := trunc(0.328 * frTableForm.clientWidth);  // Название (32.8%)
  sgItemsTable.ColWidths[1] := trunc(0.266 * frTableForm.clientWidth);  // Категория (26.6%)
  sgItemsTable.ColWidths[2] := trunc(0.141 * frTableForm.clientWidth);  // Объем места (14.1%)
  sgItemsTable.ColWidths[3] := trunc(0.094 * frTableForm.clientWidth);  // Количество (9.4%)
  sgItemsTable.ColWidths[4] := frTableForm.clientWidth
                               -sgItemsTable.ColWidths[0]
                               -sgItemsTable.ColWidths[1]
                               -sgItemsTable.ColWidths[2]
                               -sgItemsTable.ColWidths[3]
                               -sgItemsTable.ColCount * sgItemsTable.GridLineWidth;  // Артикул (17.1%)

  sgItemsTable.Cells[0, 0] := 'Название';
  sgItemsTable.Cells[1, 0] := 'Категория';
  sgItemsTable.Cells[2, 0] := 'Объем единицы товара (у.е.)';
  sgItemsTable.Cells[3, 0] := 'Количество';
  sgItemsTable.Cells[4, 0] := 'Артикул';

  sgItemsTable.RowCount := 0;

  sgItemsTable.DefaultDrawing := false;
end;

procedure TfrTableForm.FormResize(Sender: TObject);
begin
  frTableForm.ClientWidth := startWidth;
  frTableForm.ClientHeight := startHeight;
end;

end.
