unit ShipmentsTableUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, shipments, Vcl.Grids, hash, Types;

type
  TfrShipmentsTable = class(TForm)
    sgShipmentsTable: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadData(var shipment: PShipment);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frShipmentsTable: TfrShipmentsTable;

implementation

var
  startHeight, startWidth: integer;

{$R *.dfm}

procedure TfrShipmentsTable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrShipmentsTable.LoadData(var shipment: PShipment);
var
  siz, i: integer;
  curShipment: PShipment;
begin
  siz := 0;
  curShipment := shipment;
  while curShipment <> nil do
  begin
    Inc(siz);
    curShipment := curShipment^.next;
  end;
  sgShipmentsTable.RowCount := siz + 1;
  curShipment := shipment;
  i := 1;
  while curShipment <> nil do
  begin
    sgShipmentsTable.Cells[0, i] := curShipment^.ShipmentName;
    sgShipmentsTable.Cells[1, i] := intToStr(curShipment^.ID);
    sgShipmentsTable.Cells[2, i] := string(curShipment^.SourceID^.name);
    sgShipmentsTable.Cells[3, i] := 'ул. ' + string(curShipment^.SourceID^.street)
                                    + ', д. ' + intToStr(curShipment^.SourceID^.house)
                                    +', корп. ';
    if curShipment^.SourceID^.building <> -1 then
      sgShipmentsTable.Cells[3, i] := sgShipmentsTable.Cells[3, i] + intToStr(curShipment^.SourceID^.building)
    else
      sgShipmentsTable.Cells[3, i] := sgShipmentsTable.Cells[3, i] + '-';

    sgShipmentsTable.Cells[4, i] := string(curShipment^.DestinationID^.name);

    sgShipmentsTable.Cells[5, i] := 'ул. ' + string(curShipment^.DestinationID^.street)
                                    + ', д. ' + intToStr(curShipment^.DestinationID^.house)
                                    + ', корп. ';
    if curShipment^.DestinationID^.building <> -1 then
      sgShipmentsTable.Cells[5, i] := sgShipmentsTable.Cells[5, i] + intToStr(curShipment^.DestinationID^.building)
    else
      sgShipmentsTable.Cells[5, i] := sgShipmentsTable.Cells[5, i] + '-';

    sgShipmentsTable.Cells[6, i] := curShipment^.ProductName;
    sgShipmentsTable.Cells[7, i] := intToStr(getHash(curShipment^.ProductName));
    sgShipmentsTable.Cells[8, i] := intToStr(curShipment^.Count);
    Inc(i);
    curShipment := curShipment^.next;
  end;
end;

procedure TfrShipmentsTable.FormCreate(Sender: TObject);
begin
  startWidth := frShipmentsTable.ClientWidth;
  startHeight := frShipmentsTable.ClientHeight;
  FormStyle := fsNormal;
  Position := poMainFormCenter;

  //Название (15), ID (5), отправитель (15), адрес отправителя (15),
  //получатель (15), адрес получателя (15), товар (10), артикул (5), количество(5)

  sgShipmentsTable.ColCount := 9;

  sgShipmentsTable.ColWidths[0] := trunc(0.14 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[1] := trunc(0.05 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[2] := trunc(0.14 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[3] := trunc(0.14 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[4] := trunc(0.14 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[5] := trunc(0.14 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[6] := trunc(0.10 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[7] := trunc(0.05 * frShipmentsTable.clientWidth);
  sgShipmentsTable.ColWidths[8] := frShipmentsTable.clientWidth
                               -sgShipmentsTable.ColWidths[0]
                               -sgShipmentsTable.ColWidths[1]
                               -sgShipmentsTable.ColWidths[2]
                               -sgShipmentsTable.ColWidths[3]
                               -sgShipmentsTable.ColWidths[4]
                               -sgShipmentsTable.ColWidths[5]
                               -sgShipmentsTable.ColWidths[6]
                               -sgShipmentsTable.ColWidths[7]
                               -sgShipmentsTable.ColCount * sgShipmentsTable.GridLineWidth
                               -11;

  sgShipmentsTable.Cells[0, 0] := 'Название';
  sgShipmentsTable.Cells[1, 0] := 'ID';
  sgShipmentsTable.Cells[2, 0] := 'Отправитель';
  sgShipmentsTable.Cells[3, 0] := 'Адрес отправителя';
  sgShipmentsTable.Cells[4, 0] := 'Получатель';
  sgShipmentsTable.Cells[5, 0] := 'Адрес получателя';
  sgShipmentsTable.Cells[6, 0] := 'Товар';
  sgShipmentsTable.Cells[7, 0] := 'Артикул';
  sgShipmentsTable.Cells[8, 0] := 'Количество';

  sgShipmentsTable.RowCount := 0;
end;

procedure TfrShipmentsTable.FormResize(Sender: TObject);
begin
  frShipmentsTable.ClientWidth := startWidth;
  frShipmentsTable.ClientHeight := startHeight;
end;

end.
