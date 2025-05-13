unit Filter;

interface

  uses Types, Vars;

  procedure InitFilter(var resObj: TFilter);
  procedure CreateFilter(var resObj: TFilter; const objType: integer; const objStreet: string;
                         const house, building,
                         capacityFrom, capacityTo,
                         usedCapacityFrom, usedCapacityTo: integer);
  procedure ApplyFilter(const root: PTreapNode; const filter: TFilter);

implementation

procedure createFilter(var resObj: TFilter; const objType: integer; const objStreet: string;
                         const house, building,
                         capacityFrom, capacityTo,
                         usedCapacityFrom, usedCapacityTo: integer);
//objType = 0 (00b): none, 1(01b): shop, 2(10b): warehouse, 3(11b): both
begin
  resObj.buildingType := objType;
  resObj.street := shortString(objStreet);
  resObj.house := house;
  resObj.building := building;
  resObj.capacityFrom := capacityFrom;
  resObj.capacityTo := capacityTo;
  resObj.usedCapacityFrom := usedCapacityFrom;
  resObj.usedCapacityTo := usedCapacityTo;
end;

procedure InitFilter(var resObj: TFilter);
begin
  resObj.buildingType := 3;
  resObj.street := '';
  resObj.house := -1;
  resObj.building := -1;
  resObj.capacityFrom := -1;
  resObj.capacityTo := -1;
  resObj.usedCapacityFrom := -1;
  resObj.usedCapacityTo := -1;
end;

procedure ApplyFilter(const root: PTreapNode; const filter: TFilter);
var
  curType: integer;
  show: boolean;
begin
  if root <> nil then
  begin
    show := true;

    if (root^.Data^.Key and mask) <> 0 then
      curType := 1
    else
      curType := 2;

    if (curType and filter.buildingType) = 0 then
      show := false;
    if True then

    if (Length(filter.street) > 0) and (filter.street <> root^.Data^.street) then
      show := false;

    if (filter.house <> -1) and (filter.house <> root^.Data^.house) then
      show := false;

    if (filter.building <> -1) and (filter.building <> root^.Data^.building) then
      show := false;

    if (filter.capacityFrom <> -1) and (filter.capacityFrom > root^.Data^.capacity) then
      show := false;

    if (filter.capacityTo <> -1) and (filter.capacityTo < root^.Data^.capacity) then
      show := false;

    if (filter.usedCapacityFrom <> -1) and (filter.usedCapacityFrom > root^.Data^.usedCapacity) then
      show := false;

    if (filter.usedCapacityTo <> -1) and (filter.usedCapacityTo < root^.Data^.usedCapacity) then
      show := false;

    if not show then
      root^.Data^.shape.Visible := false
    else
      root^.Data^.shape.Visible := true;

    if root^.Left <> nil then
      ApplyFilter(root^.Left, filter);
    if root^.Right <> nil then
      ApplyFilter(root^.Right, filter);
  end;

end;

end.
