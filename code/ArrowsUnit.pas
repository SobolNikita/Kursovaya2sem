unit ArrowsUnit;

interface
uses System.Generics.Collections, System.Types, Types, Vars;

procedure AddArrow(var Arrows: TList<PArrow>; var Shipment: PShipment);
procedure RemoveArrow(var arrowsList: TList<PArrow>; var Arrow: PArrow);
function IsPointNearLine(P, A, B: TPoint; Tolerance: Integer): Boolean;



implementation

procedure AddArrow(var Arrows: TList<PArrow>; var Shipment: PShipment);
var
  NewArrow: PArrow;
begin
  NewArrow := New(PArrow);
  NewArrow^.shipment := Shipment;
  if NewArrow^.shipment^.SourceID^.shape.Visible
    and NewArrow^.shipment^.DestinationID^.shape.Visible then
    NewArrow^.Visible := true
  else
    NewArrow^.Visible := false;

  Arrows.Add(NewArrow);

  if Shipment^.SourceID^.OutgoingArrows = nil then
    Shipment^.SourceID^.OutgoingArrows := TList<PArrow>.Create;
  if Shipment^.DestinationID^.IncomingArrows = nil then
    Shipment^.DestinationID^.IncomingArrows := TList<PArrow>.Create;

  Shipment^.SourceID^.OutgoingArrows.Add(NewArrow);
  Shipment^.DestinationID^.IncomingArrows.Add(NewArrow);
end;

function IsPointNearLine(P, A, B: TPoint; Tolerance: Integer): Boolean;
var
  dx, dy, numerator, denominator: Double;
  maxx, maxy, minx, miny: integer;
begin
  Result := true;

  maxx := A.X;
  minx := A.X;
  maxy := A.Y;
  minY := A.Y;

  if B.X > maxx then
    maxx := B.X;

  if B.X < minx then
    minx := B.X;

  if B.Y > maxy then
    maxy := B.Y;

  if B.Y < miny then
   miny  := B.Y;

  Result := Result and (P.X >= minx) and (P.X <= maxx) and (P.Y >= miny) and (P.Y <= maxy);

  dx := B.X - A.X;
  dy := B.Y - A.Y;
  numerator := Abs(dy * P.X - dx * P.Y + B.X * A.Y - B.Y * A.X);
  denominator := Sqrt(dx * dx + dy * dy);
  Result := Result and ((numerator / denominator) <= Tolerance);
end;

procedure RemoveArrow(var arrowsList: TList<PArrow>; var Arrow: PArrow);
begin
  Arrow^.Shipment^.SourceID^.OutgoingArrows.Remove(Arrow);
  Arrow^.Shipment^.DestinationID^.IncomingArrows.Remove(Arrow);
  Arrows.Remove(Arrow);
  Dispose(Arrow);
end;

end.
