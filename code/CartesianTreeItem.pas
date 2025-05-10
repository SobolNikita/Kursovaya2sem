unit CartesianTreeItem;

interface
  uses Vcl.ExtCtrls;

  type
  TItem = record
    name, category: string[255];
    Volume, Count, Key, needToSend: Integer;
  end;
  PItem = ^TItem;


  PTreapItemNode = ^TTreapNode;
  TTreapNode = record
    Data: PItem;
    Left, Right: PTreapItemNode;
    Priority: Integer;
  end;

  function ExistsPriorityItem(var Node: PTreapItemNode; const pr: Integer): Boolean;
  function GenerateUniquePriorityItem(var Root: PTreapItemNode): Integer;
  procedure SplitTreapItem(var t: PTreapItemNode; const key: Integer; var L, R: PTreapItemNode);
  function MergeTreapItem(var L, R: PTreapItemNode): PTreapItemNode;
  procedure InsertTreapItem(var Root: PTreapItemNode; var Data: PItem);
  procedure EraseTreapItem(var Root: PTreapItemNode; const Key: Integer);
  procedure ClearTreapItem(var Root: PTreapItemNode);
  procedure InitTreeItem(var root: PTreapItemNode);
  function FindTreapItem(var Root: PTreapItemNode; const Key: Integer): PTreapItemNode;

implementation

procedure InitTreeItem(var root: PTreapItemNode);
begin
  root := nil;
end;

function FindTreapItem(var Root: PTreapItemNode; const Key: Integer): PTreapItemNode;
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
    Result := FindTreapItem(Root^.Left, Key);
  end
  else
  begin
    Result := FindTreapItem(Root^.Right, Key);
  end;
end;

function ExistsPriorityItem(var Node: PTreapItemNode; const pr: Integer): Boolean;
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
    Result := ExistsPriorityItem(Node^.Left, pr) or ExistsPriorityItem(Node^.Right, pr);
  end;
end;

function GenerateUniquePriorityItem(var Root: PTreapItemNode): Integer;
var
  pr: Integer;
begin
  repeat
    pr := Random(MaxInt);
  until not ExistsPriorityItem(Root, pr);
  Result := pr;
end;


procedure SplitTreapItem(var t: PTreapItemNode; const key: Integer; var L, R: PTreapItemNode);
begin
  if t = nil then
  begin
    L := nil;
    R := nil;
  end
  else if t^.Data^.Key < key then
  begin
    SplitTreapItem(t^.Right, key, t^.Right, R);
    L := t;
  end
  else
  begin
    SplitTreapItem(t^.Left, key, L, t^.Left);
    R := t;
  end;
end;


function MergeTreapItem(var L, R: PTreapItemNode): PTreapItemNode;
begin
  if L = nil then
    Result := R
  else if R = nil then
    Result := L
  else if L^.Priority > R^.Priority then
  begin
    L^.Right := MergeTreapItem(L^.Right, R);
    Result := L;
  end
  else
  begin
    R^.Left := MergeTreapItem(L, R^.Left);
    Result := R;
  end;
end;

procedure InsertTreapItem(var Root: PTreapItemNode; var Data: PItem);
var
  NewNode, L, R: PTreapItemNode;
begin
  New(NewNode);
  NewNode^.Data := Data;
  NewNode^.Left := nil;
  NewNode^.Right := nil;
  NewNode^.Priority := GenerateUniquePriorityItem(Root);

  if (Root = nil) or (NewNode^.Priority > Root^.Priority) then
  begin
    SplitTreapItem(Root, Data^.Key, L, R);
    NewNode^.Left  := L;
    NewNode^.Right := R;
    Root := NewNode;
  end
  else if Data^.Key < Root^.Data^.Key then
    InsertTreapItem(Root^.Left, Data)
  else
    InsertTreapItem(Root^.Right, Data);
end;

procedure EraseTreapItem(var Root: PTreapItemNode; const Key: Integer);
var
  Temp: PTreapItemNode;
begin
  if Root = nil then
  begin
    { Узел с таким ключом отсутствует }
  end
  else if Key < Root^.Data^.Key then
  begin
    EraseTreapItem(Root^.Left, Key);
  end
  else if Key > Root^.Data^.Key then
  begin
    EraseTreapItem(Root^.Right, Key);
  end
  else
  begin
    Temp := Root;
    Root := MergeTreapItem(Root^.Left, Root^.Right);
    Dispose(Temp);
  end;
end;

procedure ClearTreapItem(var Root: PTreapItemNode);
begin
  if Root <> nil then
  begin
    ClearTreapItem(Root^.Left);
    ClearTreapItem(Root^.Right);
    Dispose(Root);
    Root := nil;
  end;
end;

end.
