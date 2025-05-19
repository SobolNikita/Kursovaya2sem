unit shipments;

interface
uses CartesianTreeItem, Hash, Types, Vars;

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
  found: boolean;
  i: integer;
  newItemNode: PTreapItemNode;
begin
  Result := true;
  try
    begin
    found := false;
    i := 0;
    while (not found) and (i < shipment^.SourceID^.OutgoingArrows.Count) do
    begin
      if shipment^.SourceID^.OutgoingArrows[i]^.shipment = shipment then
      begin
        shipment^.SourceID^.OutgoingArrows.Remove(shipment^.SourceID^.OutgoingArrows[i]);
        found := true;
      end;
      Inc(i);
    end;

    found := false;
    i := 0;
    while (not found) and (i < shipment^.DestinationID^.OutgoingArrows.Count) do
    begin
      if shipment^.DestinationID^.OutgoingArrows[i]^.shipment = shipment then
      begin
        shipment^.DestinationID^.OutgoingArrows.Remove(shipment^.DestinationID^.OutgoingArrows[i]);
        found := true;
      end;
      Inc(i);
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
      newItemNode := CreateNewItemNode(newNode);
      InsertTreapItem(shipment^.DestinationID^.Items, newItemNode);
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
    end;
    Saved := false;
  end
  except
  begin
    Result := false;
  end;
  end;

end;

end.
