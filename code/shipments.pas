unit shipments;

interface
uses CartesianTree, CartesianTreeItem, Hash;
type
  PShipment = ^TShipment;
  TShipment = record
    ShipmentName: string;
    ID: integer;
    SourceID: PLocation;       // Отправитель
    DestinationID: PLocation;  // Получатель
    ProductName: string;
    Count: Integer;
    next: PShipment;
  end;

function doShipment(const shipment: PShipment): boolean;

implementation

function doShipment(const shipment: PShipment): boolean;
var
  sendItemNode, destItemNode: PTreapItemNode;
  newNode: PItem;
begin
  Result := true;
  destItemNode := FindTreapItem(shipment^.DestinationID^.Items, getHash(shipment^.ProductName));
  sendItemNode := FindTreapItem(shipment^.SourceID^.Items, getHash(shipment^.ProductName));

  Dec(sendItemNode^.Data^.needToSend, shipment^.Count);

  if destItemNode = nil then
  begin
    newNode := new(PItem);
    newNode^.name := shortString(shipment^.ProductName);
    newNode^.category := sendItemNode^.Data^.category;
    newNode^.Volume := sendItemNode^.Data^.volume;
    newNode^.Count := 0;
    newNode^.Key := getHash(shipment^.ProductName);
    InsertTreapItem(shipment^.DestinationID^.Items, newNode);
    destItemNode := FindTreapItem(shipment^.DestinationID^.Items, getHash(shipment^.ProductName));
  end;

  if sendItemNode^.Data^.Volume = destItemNode^.Data^.Volume then
  begin
    Dec(shipment^.SourceID^.usedCapacity, sendItemNode^.Data^.Volume * shipment^.Count);
    Dec(shipment^.DestinationID^.shipmentCapacity, sendItemNode^.Data^.Volume * shipment^.Count);
    Inc(shipment^.DestinationID^.usedCapacity, sendItemNode^.Data^.Volume * shipment^.Count);

    Dec(sendItemNode^.Data^.Count, shipment^.Count);

    if sendItemNode^.Data^.Count = 0 then
    begin
      EraseTreapItem(sendItemNode, getHash(shipment^.ProductName));
    end;

    Inc(destItemNode^.Data^.Count, shipment^.Count);
  end
  else
  begin
    Result := false;
    end;
end;

end.
