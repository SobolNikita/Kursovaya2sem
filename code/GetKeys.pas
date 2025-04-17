unit GetKeys;

interface

  function getShopKey: integer;
  function getWarehouseKey: integer;
  var shopKey: integer = 1;
      warehouseKey: integer = 1;
implementation

function getShopKey: integer;
begin
  Result := shopKey;
  shopKey := shopKey + 1;
end;

function getWarehouseKey: integer;
begin
  Result := warehouseKey;
  warehouseKey := warehouseKey + 1;
end;

end.
