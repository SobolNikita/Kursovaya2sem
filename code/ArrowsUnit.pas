unit ArrowsUnit;

interface
uses CartesianTree, System.Generics.Collections, System.Types;

procedure AddArrow(FromLoc, ToLoc: PLocation);
procedure RemoveArrow(Arrow: PArrow);
function IsPointNearLine(P, A, B: TPoint; Tolerance: Integer): Boolean;

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

  if FromLoc^.OutgoingArrows = nil then
    FromLoc^.OutgoingArrows := TList<PArrow>.Create;
  if ToLoc^.IncomingArrows = nil then
    ToLoc^.IncomingArrows := TList<PArrow>.Create;

  FromLoc^.OutgoingArrows.Add(NewArrow);
  ToLoc^.IncomingArrows.Add(NewArrow);
end;

function IsPointNearLine(P, A, B: TPoint; Tolerance: Integer): Boolean;
var
  dx, dy, numerator, denominator: Double;
begin
  dx := B.X - A.X;
  dy := B.Y - A.Y;
  numerator := Abs(dy * P.X - dx * P.Y + B.X * A.Y - B.Y * A.X);
  denominator := Sqrt(dx * dx + dy * dy);
  Result := (numerator / denominator) <= Tolerance;
end;

procedure RemoveArrow(Arrow: PArrow);
begin
  Arrow^.FromLoc^.OutgoingArrows.Remove(Arrow);
  Arrow^.ToLoc^.IncomingArrows.Remove(Arrow);
  Arrows.Remove(Arrow);
  Dispose(Arrow);
end;

end.
