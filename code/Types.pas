unit Types;

interface

uses Vcl.ExtCtrls, System.Generics.Collections;

type

  TItem = record
    name, category: string[255];
    Volume, Count, Key, needToSend: Integer;
  end;
  PItem = ^TItem;


  PTreapItemNode = ^TTreapItemNode;
  TTreapItemNode = record
    Data: PItem;
    Left, Right: PTreapItemNode;
    Priority: Integer;
  end;

  PLocation = ^TLocation;
  PPShipment = ^PShipment;
  PShipment = ^TShipment;
  PTreapNode = ^TTreapNode;

  TShipment = record
    ShipmentName: string;
    ID: integer;
    SourceID: PLocation;       // Отправитель
    DestinationID: PLocation;  // Получатель
    ProductName: string;
    Count: Integer;
    next: PShipment;
  end;

  PArrow = ^TArrow;
  TArrow = record
    shipment: PShipment;
    Visible: boolean;
  end;

  TLocation = record
    name, street: string[255];
    house, building, capacity, usedCapacity, shipmentCapacity: integer;
    Key, X, Y: Integer;
    shape: TShape;
    Items: PTreapItemNode;
    OutgoingArrows: TList<PArrow>;
    IncomingArrows: TList<PArrow>;
  end;

  TTreapNode = record
    Data: PLocation;
    Left, Right: PTreapNode;
    Priority: Integer;
  end;

  TName = record
    name: string[255];
    ID: integer;
    Key: integer;
  end;
  PName = ^TName;

  PTreapNameNode = ^TTreapNameNode;
  TTreapNameNode = record
    Data: PName;
    Left, Right: PTreapNameNode;
    Priority: Integer;
  end;

  TFilter = record
    buildingType: integer;
    //objType = 0 (00b): none, 1(01b): shop, 2(10b): warehouse, 3(11b): both

    street: string[255];

    house, building,
    capacityFrom, capacityTo,
    usedCapacityFrom, usedCapacityTo: integer;
  end;

implementation

end.
