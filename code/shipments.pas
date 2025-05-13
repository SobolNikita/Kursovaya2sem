unit shipments;

interface
uses CartesianTree, CartesianTreeItem, Hash;

function doShipment(var shipment: PShipment): boolean;
procedure ClearShipments(var shipment: PShipment);

implementation

procedure ClearShipments(var shipment: PShipment);
var
  prev: PShipment;
begin
  while shipment <> nil do
  begin
    prev := shipment;
    shipment := shipment^.next;
    Dispose(prev);
  end;
end;

function doShipment(var shipment: PShipment): boolean;
var
  sendItemNode, destItemNode: PTreapItemNode;
  newNode: PItem;
begin
  Result := true;

  if shipment = shipment^.next then
  begin

  end;

  destItemNode := FindTreapItem(shipment^.DestinationID^.Items, getHash(shipment^.ProductName));
  sendItemNode := FindTreapItem(shipment^.SourceID^.Items, getHash(shipment^.ProductName));

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
    Dec(sendItemNode^.Data^.needToSend, shipment^.Count);
    Dec(shipment^.SourceID^.usedCapacity, sendItemNode^.Data^.Volume * shipment^.Count);
    Dec(shipment^.DestinationID^.shipmentCapacity, sendItemNode^.Data^.Volume * shipment^.Count);
    Inc(shipment^.DestinationID^.usedCapacity, sendItemNode^.Data^.Volume * shipment^.Count);

    Dec(sendItemNode^.Data^.Count, shipment^.Count);

    if sendItemNode^.Data^.Count = 0 then
    begin
      EraseTreapItem(shipment^.SourceID^.Items, getHash(shipment^.ProductName));
    end;

    Inc(destItemNode^.Data^.Count, shipment^.Count);
  end
  else
  begin
    Result := false;
  end;
end;

end.
