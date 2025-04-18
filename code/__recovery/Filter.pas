unit Filter;

interface

  type


  TFilter = record
    buildingType: integer;
    //objType = 0 (00b): none, 1(01b): shop, 2(10b): warehouse, 3(11b): both

    street: string[255];

    house, building,
    capacityFrom, capacityTo,
    usedCapacityFrom, usedCapacityTo: integer;
  end;

  procedure InitFilter(var resObj: TFilter);
  procedure CreateFilter(var resObj: TFilter; const objType: integer; const objStreet: string;
                         const house, building,
                         capacityFrom, capacityTo,
                         usedCapacityFrom, usedCapacityTo: integer);

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

end.
