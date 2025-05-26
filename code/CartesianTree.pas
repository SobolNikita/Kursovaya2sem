unit CartesianTree;

interface

  uses Vcl.ExtCtrls, CartesianTreeItem, System.Generics.Collections, Types;

  procedure SplitTreap(var t: PTreapNode; const key: Integer; var L, R: PTreapNode);
  function MergeTreap(var L, R: PTreapNode): PTreapNode;
  procedure InsertTreap(var Root: PTreapNode; var NewNode: PTreapNode);
  procedure EraseTreap(var Root: PTreapNode; const Key: Integer);
  procedure ClearTreap(var Root: PTreapNode);
  procedure InitTree(var root: PTreapNode);
  function FindTreap(var Root: PTreapNode; const Key: Integer): PTreapNode;
  function CreateNewNode(var Data: PLocation): PTreapNode;

implementation

procedure InitTree(var root: PTreapNode);
begin
  root := nil;
end;

function CreateNewNode(var Data: PLocation): PTreapNode;
begin
  New(Result);
  Result^.Data := Data;
  Result^.Left := nil;
  Result^.Right := nil;
  Result^.Priority := Random(MaxInt);
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
    Exit(R);
  if R = nil then
    Exit(L);

  if (L^.Priority > R^.Priority)
     or ((L^.Priority = R^.Priority) and (L^.Data^.Key < R^.Data^.Key)) then
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

procedure InsertTreap(var Root: PTreapNode; var NewNode: PTreapNode);
var
  L, R: PTreapNode;
begin
  if Root = nil then
  begin
    NewNode^.Left := nil;
    NewNode^.Right := nil;
    Root := NewNode;
  end
  else if NewNode^.Priority > Root^.Priority then
  begin
    SplitTreap(Root, NewNode^.Data^.Key, L, R);
    NewNode^.Left  := L;
    NewNode^.Right := R;
    Root := NewNode;
  end
  else
  begin
    if NewNode^.Data^.Key < Root^.Data^.Key then
      InsertTreap(Root^.Left, NewNode)
    else
      InsertTreap(Root^.Right, NewNode);
  end;
end;

procedure EraseTreap(var Root: PTreapNode; const Key: Integer);
var
  Temp: PTreapNode;
begin
  if Root = nil then
  begin
    { Узла не существует }
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
    root^.Data^.OutgoingArrows.Free;
    root^.Data^.IncomingArrows.Free;
    Root^.Data^.shape.Free;
    Dispose(Root);
    Root := nil;
  end;
end;

end.
