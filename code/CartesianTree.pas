unit CartesianTree;

interface

  uses Vcl.ExtCtrls, CartesianTreeItem, System.Generics.Collections;

  type

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


  function ExistsPriority(var Node: PTreapNode; const pr: Integer): Boolean;
  function GenerateUniquePriority(var Root: PTreapNode): Integer;
  procedure SplitTreap(var t: PTreapNode; const key: Integer; var L, R: PTreapNode);
  function MergeTreap(var L, R: PTreapNode): PTreapNode;
  procedure InsertTreap(var Root: PTreapNode; var Data: PLocation);
  procedure EraseTreap(var Root: PTreapNode; const Key: Integer);
  procedure ClearTreap(var Root: PTreapNode);
  procedure InitTree(var root: PTreapNode);
  function FindTreap(var Root: PTreapNode; const Key: Integer): PTreapNode;

implementation

procedure InitTree(var root: PTreapNode);
begin
  root := nil;
end;

function FindTreap(var Root: PTreapNode; const Key: Integer): PTreapNode;
begin
  if Root = nil then
  begin
    Result := nil;
  end
  else if Root^.Data^.Key = Key then
  begin
    Result := Root;
  end
  else if Key < Root^.Data^.Key then
  begin
    Result := FindTreap(Root^.Left, Key);
  end
  else
  begin
    Result := FindTreap(Root^.Right, Key);
  end;
end;

function ExistsPriority(var Node: PTreapNode; const pr: Integer): Boolean;
begin
  if Node = nil then
  begin
    Result := False;
  end
  else if Node^.Priority = pr then
  begin
    Result := True;
  end
  else
  begin
    Result := ExistsPriority(Node^.Left, pr) or ExistsPriority(Node^.Right, pr);
  end;
end;

function GenerateUniquePriority(var Root: PTreapNode): Integer;
var
  pr: Integer;
begin
  repeat
    pr := Random(MaxInt);
  until not ExistsPriority(Root, pr);
  Result := pr;
end;


procedure SplitTreap(var t: PTreapNode; const key: Integer; var L, R: PTreapNode);
begin
  if t = nil then
  begin
    L := nil;
    R := nil;
  end
  else if t^.Data^.Key < key then
  begin
    SplitTreap(t^.Right, key, t^.Right, R);
    L := t;
  end
  else
  begin
    SplitTreap(t^.Left, key, L, t^.Left);
    R := t;
  end;
end;


function MergeTreap(var L, R: PTreapNode): PTreapNode;
begin
  if L = nil then
    Result := R
  else if R = nil then
    Result := L
  else if L^.Priority > R^.Priority then
  begin
    L^.Right := MergeTreap(L^.Right, R);
    Result := L;
  end
  else
  begin
    R^.Left := MergeTreap(L, R^.Left);
    Result := R;
  end;
end;

procedure InsertTreap(var Root: PTreapNode; var Data: PLocation);
var
  NewNode, L, R: PTreapNode;
begin
  New(NewNode);
  NewNode^.Data := Data;
  NewNode^.Left := nil;
  NewNode^.Right := nil;
  NewNode^.Priority := GenerateUniquePriority(Root);

  if (Root = nil) or (NewNode^.Priority > Root^.Priority) then
  begin
    SplitTreap(Root, Data^.Key, L, R);
    NewNode^.Left  := L;
    NewNode^.Right := R;
    Root := NewNode;
  end
  else if Data^.Key < Root^.Data^.Key then
    InsertTreap(Root^.Left, Data)
  else
    InsertTreap(Root^.Right, Data);
end;

procedure EraseTreap(var Root: PTreapNode; const Key: Integer);
var
  Temp: PTreapNode;
begin
  if Root = nil then
  begin
    { Узел с таким ключом отсутствует }
  end
  else if Key < Root^.Data^.Key then
  begin
    EraseTreap(Root^.Left, Key);
  end
  else if Key > Root^.Data^.Key then
  begin
    EraseTreap(Root^.Right, Key);
  end
  else
  begin
    Temp := Root;
    Root := MergeTreap(Root^.Left, Root^.Right);
    Dispose(Temp);
  end;
end;

procedure ClearTreap(var Root: PTreapNode);
begin
  if Root <> nil then
  begin
    ClearTreap(Root^.Left);
    ClearTreap(Root^.Right);
    ClearTreapItem(Root^.Data^.Items);
    while root^.Data^.OutgoingArrows.Count <> 0 do
    begin
      root^.Data^.OutgoingArrows.Remove(root^.Data^.OutgoingArrows[0]);
    end;
    while root^.Data^.IncomingArrows.Count <> 0 do
    begin
      root^.Data^.IncomingArrows.Remove(root^.Data^.IncomingArrows[0]);
    end;
    Root^.Data^.shape.Free;
    Dispose(Root);
    Root := nil;
  end;
end;

end.
