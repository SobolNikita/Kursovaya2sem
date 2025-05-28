unit CartesianTreeItem;

interface
  uses Vcl.ExtCtrls, Types;

  function CreateNewItemNode(const Data: PItem): PTreapItemNode;
  procedure SplitTreapItem(t: PTreapItemNode; const key: Integer; var L, R: PTreapItemNode);
  function MergeTreapItem(var L, R: PTreapItemNode): PTreapItemNode;
  procedure InsertTreapItem(var Root, NewNode: PTreapItemNode);
  procedure EraseTreapItem(var Root: PTreapItemNode; const Key: Integer);
  procedure ClearTreapItem(var Root: PTreapItemNode);
  procedure InitTreeItem(var root: PTreapItemNode);
  function FindTreapItem(var Root: PTreapItemNode; const Key: Integer): PTreapItemNode;

implementation

procedure InitTreeItem(var root: PTreapItemNode);
begin
  root := nil;
end;

function CreateNewItemNode(const Data: PItem): PTreapItemNode;
begin
  New(Result);
  Result^.Data := Data;
  Result^.Left := nil;
  Result^.Right := nil;
  Result^.Priority := Random(MaxInt);
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


procedure SplitTreapItem(t: PTreapItemNode; const key: Integer; var L, R: PTreapItemNode);
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
    Exit(R);
  if R = nil then
    Exit(L);

  if (L^.Priority > R^.Priority)
     or ((L^.Priority = R^.Priority) and (L^.Data^.Key < R^.Data^.Key)) then
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

procedure InsertTreapItem(var Root, NewNode: PTreapItemNode);
var
  L, R: PTreapItemNode;
begin
  if Root = nil then
  begin
    NewNode^.Left := nil;
    NewNode^.Right := nil;
    Root := NewNode;
  end
  else if NewNode^.Priority > Root^.Priority then
  begin
    SplitTreapItem(Root, NewNode^.Data^.Key, L, R);
    NewNode^.Left  := L;
    NewNode^.Right := R;
    Root := NewNode;
  end
  else
  begin
    if NewNode^.Data^.Key < Root^.Data^.Key then
      InsertTreapItem(Root^.Left, NewNode)
    else
      InsertTreapItem(Root^.Right, NewNode);
  end;
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
