unit ArrowsUnit;

interface
uses CartesianTree, System.Generics.Collections, System.Types, shipments;

procedure AddArrow(var Shipment: PShipment);
procedure RemoveArrow(var arrowsList: TList<PArrow>; var Arrow: PArrow);
function IsPointNearLine(P, A, B: TPoint; Tolerance: Integer): Boolean;

var
  Arrows: TList<PArrow>;

implementation

procedure AddArrow(var Shipment: PShipment);
var
  NewArrow: PArrow;
begin
  NewArrow := New(PArrow);
  NewArrow^.shipment := Shipment;
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
begin
  dx := B.X - A.X;
  dy := B.Y - A.Y;
  numerator := Abs(dy * P.X - dx * P.Y + B.X * A.Y - B.Y * A.X);
  denominator := Sqrt(dx * dx + dy * dy);
  Result := (numerator / denominator) <= Tolerance;
end;

procedure RemoveArrow(var arrowsList: TList<PArrow>; var Arrow: PArrow);
begin
  Arrow^.Shipment^.SourceID^.OutgoingArrows.Remove(Arrow);
  Arrow^.Shipment^.DestinationID^.IncomingArrows.Remove(Arrow);
  Arrows.Remove(Arrow);
  Dispose(Arrow);
end;

end.
