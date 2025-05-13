unit CartesianTreeByName;

interface

  uses Vcl.ExtCtrls, Hash, Types;


  function ExistsPriorityName(var Node: PTreapNameNode; const pr: Integer): Boolean;
  function GenerateUniquePriorityName(var Root: PTreapNameNode): Integer;
  procedure SplitTreapName(var t: PTreapNameNode; const key: Integer; var L, R: PTreapNameNode);
  function MergeTreapName(var L, R: PTreapNameNode): PTreapNameNode;
  procedure InsertTreapName(var Root: PTreapNameNode; const name: string; const ID: integer);
  procedure EraseTreapName(var Root: PTreapNameNode; const Key: Integer);
  procedure ClearTreapName(var Root: PTreapNameNode);
  procedure InitTreeName(var root: PTreapNameNode);
  function FindTreapName(var Root: PTreapNameNode; const Key: Integer): PTreapNameNode;

implementation

procedure InitTreeName(var root: PTreapNameNode);
begin
  root := nil;
end;

function FindTreapName(var Root: PTreapNameNode; const Key: Integer): PTreapNameNode;
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
    Result := FindTreapName(Root^.Left, Key);
  end
  else
  begin
    Result := FindTreapName(Root^.Right, Key);
  end;
end;

function ExistsPriorityName(var Node: PTreapNameNode; const pr: Integer): Boolean;
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
    Result := ExistsPriorityName(Node^.Left, pr) or ExistsPriorityName(Node^.Right, pr);
  end;
end;

function GenerateUniquePriorityName(var Root: PTreapNameNode): Integer;
var
  pr: Integer;
begin
  repeat
    pr := Random(MaxInt);
  until not ExistsPriorityName(Root, pr);
  Result := pr;
end;


procedure SplitTreapName(var t: PTreapNameNode; const key: Integer; var L, R: PTreapNameNode);
begin
  if t = nil then
  begin
    L := nil;
    R := nil;
  end
  else if t^.Data^.Key < key then
  begin
    SplitTreapName(t^.Right, key, t^.Right, R);
    L := t;
  end
  else
  begin
    SplitTreapName(t^.Left, key, L, t^.Left);
    R := t;
  end;
end;


function MergeTreapName(var L, R: PTreapNameNode): PTreapNameNode;
begin
  if L = nil then
    Result := R
  else if R = nil then
    Result := L
  else if L^.Priority > R^.Priority then
  begin
    L^.Right := MergeTreapName(L^.Right, R);
    Result := L;
  end
  else
  begin
    R^.Left := MergeTreapName(L, R^.Left);
    Result := R;
  end;
end;

procedure InsertTreapName(var Root: PTreapNameNode; const name: string; const ID: integer);
var
  NewNode, L, R: PTreapNameNode;
begin
  New(NewNode);
  New(NewNode^.Data);
  NewNode^.Data^.name := shortString(name);
  NewNode^.Data^.Key := getHash(name);
  NewNode^.Data^.ID := ID;
  NewNode^.Left := nil;
  NewNode^.Right := nil;
  NewNode^.Priority := GenerateUniquePriorityName(Root);

  if (Root = nil) or (NewNode^.Priority > Root^.Priority) then
  begin
    SplitTreapName(Root, newNode^.Data^.Key, L, R);
    NewNode^.Left  := L;
    NewNode^.Right := R;
    Root := NewNode;
  end
  else if newNode.Data^.Key < Root^.Data^.Key then
    InsertTreapName(Root^.Left, name, ID)
  else
    InsertTreapName(Root^.Right, name, ID);
end;

procedure EraseTreapName(var Root: PTreapNameNode; const Key: Integer);
var
  Temp: PTreapNameNode;
begin
  if Root = nil then
  begin
    { Узел с таким ключом отсутствует }
  end
  else if Key < Root^.Data^.Key then
  begin
    EraseTreapName(Root^.Left, Key);
  end
  else if Key > Root^.Data^.Key then
  begin
    EraseTreapName(Root^.Right, Key);
  end
  else
  begin
    Temp := Root;
    Root := MergeTreapName(Root^.Left, Root^.Right);
    Dispose(Temp);
  end;
end;

procedure ClearTreapName(var Root: PTreapNameNode);
begin
  if Root <> nil then
  begin
    ClearTreapName(Root^.Left);
    ClearTreapName(Root^.Right);
    Dispose(Root);
    Root := nil;
  end;
end;

end.
