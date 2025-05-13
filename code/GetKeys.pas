unit GetKeys;

interface

  uses Vars;

  function getShopKey: integer;
  function getWarehouseKey: integer;

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
