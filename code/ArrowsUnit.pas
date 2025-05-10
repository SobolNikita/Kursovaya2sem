unit ArrowsUnit;

interface
uses CartesianTree, System.Generics.Collections;

procedure AddArrow(FromLoc, ToLoc: PLocation);
procedure RemoveArrow(Arrow: PArrow);

var
  Arrows: TList<PArrow>;

implementation

procedure AddArrow(FromLoc, ToLoc: PLocation);
var
  NewArrow: PArrow;
begin
  New(NewArrow);
  NewArrow^.FromLoc := FromLoc;
  NewArrow^.ToLoc := ToLoc;
  Arrows.Add(NewArrow);
  FromLoc^.OutgoingArrows.Add(NewArrow);
  ToLoc^.IncomingArrows.Add(NewArrow);
end;

procedure RemoveArrow(Arrow: PArrow);
begin
  Arrow^.FromLoc^.OutgoingArrows.Remove(Arrow);
  Arrow^.ToLoc^.IncomingArrows.Remove(Arrow);
  Arrows.Remove(Arrow);
  Dispose(Arrow);
end;

end.
