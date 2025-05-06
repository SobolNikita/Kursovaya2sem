unit shipments;

interface
uses CartesianTree;
type
  PShipment = ^TShipment;
  TShipment = record
    ShipmentName: string;
    ID: integer;
    SourceID: PLocation;       // �����������
    DestinationID: PLocation;  // ����������
    ProductName: string;
    Count: Integer;
    next: PShipment;
  end;
implementation

end.
