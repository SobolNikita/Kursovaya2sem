unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, System.UITypes, System.Types, Vcl.Menus, Vcl.NumberBox,
  CartesianTreeByName, CartesianTreeItem, Validation,
  GetKeys, Hash, Messages, Filter, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.Grids,
  TableUnit, ShipmentsTableUnit, shipments, BalanceUnit, SelectShipmentsUnit,
  ArrowsUnit, CartesianTree,
  System.Generics.Collections,
  Types, Vars;

type

  TfrMainForm = class(TForm)
    pnFilter: TPanel;
    btnFilter: TButton;
    pnMapWrap: TPanel;
    pnCreateSelect: TPanel;
    btnCreateSelectShop: TButton;
    btnCreateSelectWarehouse: TButton;
    btnCreateSelectCancel: TButton;
    spMapPoint: TShape;
    pnCreateObj: TPanel;
    lbCreateObjName: TLabel;
    edCreateObjName: TEdit;
    lbCreateObjStreet: TLabel;
    edCreateObjStreet: TEdit;
    lbCreateObjHouse: TLabel;
    edCreateObjHouse: TEdit;
    btnCreateObjConfirm: TButton;
    btnCreateObjCancel: TButton;
    lbCreateObjBuilding: TLabel;
    edCreateObjBuilding: TEdit;
    edCreateObjCapacity: TEdit;
    lbCreateObjCapacity: TLabel;
    pnSelectObject: TPanel;
    btnSelectObjEdit: TButton;
    btnSelectObjDelete: TButton;
    btnSelectObjCancel: TButton;
    pnEditObj: TPanel;
    lbEditObjName: TLabel;
    lbEditObjStreet: TLabel;
    lbEditObjHouse: TLabel;
    lbEditObjBuilding: TLabel;
    lbEditObjCapacity: TLabel;
    edEditObjName: TEdit;
    edEditObjStreet: TEdit;
    edEditObjHouse: TEdit;
    btnEditObjConfirm: TButton;
    btnEditObjCancel: TButton;
    edEditObjBuilding: TEdit;
    edEditObjCapacity: TEdit;
    pnObjectInfo: TPanel;
    lbObjInfoName: TLabel;
    lbObjInfoStreet: TLabel;
    lbObjInfoHouse: TLabel;
    lbObjInfoBuilding: TLabel;
    lbObjInfoCapacity: TLabel;
    lbObjInfoNameVal: TLabel;
    lbObjInfoStreetVal: TLabel;
    lbObjInfoHouseVal: TLabel;
    lbObjInfoBuildingVal: TLabel;
    lbObjInfoCapacityVal: TLabel;
    lbObjInfoTitle: TLabel;
    lbObjInfoUsedCapacity: TLabel;
    lbObjInfoUsedCapacityVal: TLabel;
    MainMenu1: TMainMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    pnHints: TPanel;
    lbHints: TLabel;
    pnFilterParams: TPanel;
    btnFilterDefault: TButton;
    btnFilterCancel: TButton;
    pnFilterButtons: TPanel;
    btnFilterConfirm: TButton;
    lbFilterStreet: TLabel;
    lbFilterHouse: TLabel;
    lbFilterBuilding: TLabel;
    lbFilterCapacityFrom: TLabel;
    lbFilterCapacityTo: TLabel;
    lbFilterType: TLabel;
    cbFilterTypeWarehouse: TCheckBox;
    pnFilterParamsType: TPanel;
    pnFilterParamsStreet: TPanel;
    edFilterStreetVal: TEdit;
    pnFilterParamsHouse: TPanel;
    edFilterHouseVal: TEdit;
    pnFilterParamsBuilding: TPanel;
    edFilterBuildingVal: TEdit;
    pnFilterParamsCapacity: TPanel;
    edFilterCapacityFromVal: TEdit;
    edFilterCapacityToVal: TEdit;
    pnFilterParamsUsedCapacity: TPanel;
    lbFilterUsedCapacityFrom: TLabel;
    lbFilterUsedCapacityTo: TLabel;
    edFilterUsedCapacityFromVal: TEdit;
    edFilterUsedCapacityToVal: TEdit;
    cbFilterTypeShop: TCheckBox;
    pnCreateShipment: TPanel;
    lbCreateShipment: TLabel;
    lbObjInfoId: TLabel;
    lbObjInfoIdVal: TLabel;
    lbCreateShipmentName: TLabel;
    N12: TMenuItem;
    N13: TMenuItem;
    lbCreateShipmentSenderName: TLabel;
    lbCreateShipmentDestName: TLabel;
    lbCreateShipmentItemName: TLabel;
    lbCreateShipmentCnt: TLabel;
    lbCreateShipmentSenderID: TLabel;
    lbCreateShipmentDestID: TLabel;
    lbCreateShipmentItemID: TLabel;
    edCreateShipmentSenderName: TEdit;
    edCreateShipmentSenderID: TEdit;
    edCreateShipmentDestName: TEdit;
    edCreateShipmentDestID: TEdit;
    edCreateShipmentItemName: TEdit;
    edCreateShipmentItemID: TEdit;
    edCreateShipmentCnt: TEdit;
    edCreateShipmentName: TEdit;
    btnCreateShipmentCancel: TButton;
    btnCreateShipmentConfirm: TButton;
    lbCreateShipmentSenderType: TLabel;
    rbCreateShipmentSenderShop: TRadioButton;
    rbCreateShipmentSenderWarehouse: TRadioButton;
    rbCreateShipmentDestShop: TRadioButton;
    rbCreateShipmentDestWarehouse: TRadioButton;
    lbCreateShipmentDestType: TLabel;
    pnCreateShipmentSenderType: TPanel;
    pnCreateShipmentDestType: TPanel;
    pnAddItem: TPanel;
    pnAddItemType: TPanel;
    rbAddItemTypeShop: TRadioButton;
    rbAddItemTypeWarehouse: TRadioButton;
    lbAddItemType: TLabel;
    lbAddItemName: TLabel;
    edAddItemName: TEdit;
    lbAddItemDestName: TLabel;
    edAddItemDestName: TEdit;
    lbAddItemDestID: TLabel;
    edAddItemDestID: TEdit;
    lbAddItemVol: TLabel;
    lbAddItemCnt: TLabel;
    edAddItemVol: TEdit;
    edAddItemCnt: TEdit;
    btnAddItemCancel: TButton;
    btnAddItemConfirm: TButton;
    lbAddItemCategory: TLabel;
    edAddItemCategory: TEdit;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N14: TMenuItem;
    btnSelectObjItemList: TButton;
    N15: TMenuItem;
    N16: TMenuItem;
    pbMap: TPaintBox;
    pnArrowInfo: TPanel;
    lbArrowInfoShipmentName: TLabel;
    lbArrowInfoSenderType: TLabel;
    lbArrowInfoSenderNameVal: TLabel;
    lbArrowInfoSenderName: TLabel;
    lbArrowInfoDestTypeVal: TLabel;
    lbArrowInfoSenderID: TLabel;
    lbArrowInfoSenderIDVal: TLabel;
    lbArrowInfoDestName: TLabel;
    lbArrowInfoSenderTypeVal: TLabel;
    lbArrowInfoDestType: TLabel;
    lbArrowInfoDestNameVal: TLabel;
    lbArrowInfoDestID: TLabel;
    lbArrowInfoDestIDVal: TLabel;
    lbArrowInfoItemID: TLabel;
    lbArrowInfoItemIDVal: TLabel;
    lbArrowInfoItemName: TLabel;
    lbArrowInfoItemNameVal: TLabel;
    lbArrowInfoItemCnt: TLabel;
    lbArrowInfoItemCntVal: TLabel;
    lbArrowInfoItemVol: TLabel;
    lbArrowInfoItemVolVal: TLabel;
    lbAddItem: TLabel;


    procedure createNewObj(var newObj: PLocation; const isShop: boolean);

    procedure imgMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure updateID(const editID: TEdit;
                             const isShopRadio: TRadioButton;
                             const editName: TEdit);
    procedure updateName(const editID: TEdit;
                                     const isShopRadio: TRadioButton;
                                     const editName: TEdit);

    procedure btnCreateSelectCancelClick(Sender: TObject);
    procedure btnCreateObjCancelClick(Sender: TObject);
    procedure btnCreateSelectClick(Sender: TObject);
    procedure btnCreateObjConfirmClick(Sender: TObject);

    procedure OnClickValidateLength(Sender: TObject);
    procedure OnClickValidateLetters(Sender: TObject);
    procedure OnClickvalidateAll(Sender: TObject);

    procedure createShop(Sender: TObject);
    procedure createWarehouse(Sender: TObject);

    function validateCreateObj: boolean;
    function validateEditObj: boolean;
    function validateNumberFromText(const curText: string): integer;
    function validateAddItem: boolean;
    function validateCreateSipment: boolean;

    procedure FormCreate(Sender: TObject);

    procedure hideAllPanels;
    procedure showPanel(const panel: TPanel; const x, y: integer);
    procedure resetPnCreateObj;
    procedure resetPnEditObj;

    procedure pnSelectObjectShow(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnObjectInfoShow(Sender: TObject);
    procedure pnObjectInfoHide(Sender: TObject);

    procedure setFilterPanel;

    function cntFilteredItems: integer;

    procedure btnSelectObjDeleteClick(Sender: TObject);
    procedure btnSelectObjCancelClick(Sender: TObject);
    procedure btnSelectObjEditClick(Sender: TObject);
    procedure btnEditObjConfirmClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnFilterCancelClick(Sender: TObject);
    procedure btnFilterDefaultClick(Sender: TObject);
    procedure btnFilterConfirmClick(Sender: TObject);
    procedure edFilterCapacityToValExit(Sender: TObject);
    procedure edFilterCapacityToValChange(Sender: TObject);
    procedure edFilterUsedCapacityToValChange(Sender: TObject);
    procedure edFilterUsedCapacityToValExit(Sender: TObject);
    procedure edFilterCapacityFromValChange(Sender: TObject);
    procedure edFilterUsedCapacityFromValChange(Sender: TObject);
    procedure edFilterCapacityFromValExit(Sender: TObject);
    procedure edFilterUsedCapacityFromValExit(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure btnCreateShipmentCancelClick(Sender: TObject);
    procedure edCreateShipmentSenderIDExit(Sender: TObject);
    procedure rbCreateShipmentSenderWarehouseClick(Sender: TObject);
    procedure rbCreateShipmentSenderShopClick(Sender: TObject);
    procedure edCreateShipmentDestIDExit(Sender: TObject);
    procedure rbCreateShipmentDestWarehouseClick(Sender: TObject);
    procedure rbCreateShipmentDestShopClick(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure edCreateShipmentSenderNameExit(Sender: TObject);
    procedure edCreateShipmentDestNameExit(Sender: TObject);
    procedure edAddItemDestNameExit(Sender: TObject);
    procedure edAddItemDestIDExit(Sender: TObject);
    procedure rbAddItemTypeShopClick(Sender: TObject);
    procedure rbAddItemTypeWarehouseClick(Sender: TObject);
    procedure btnAddItemCancelClick(Sender: TObject);
    procedure btnAddItemConfirmClick(Sender: TObject);
    procedure edAddItemNameExit(Sender: TObject);
    procedure edAddItemVolExit(Sender: TObject);
    procedure edAddItemCntExit(Sender: TObject);
    procedure ClearAddItem;
    procedure btnCreateShipmentConfirmClick(Sender: TObject);
    procedure ClearCreateShipment;
    procedure edCreateShipmentItemNameExit(Sender: TObject);
    procedure edCreateShipmentItemIDExit(Sender: TObject);
    procedure N3Click(Sender: TObject);

    procedure btnSelectObjItemListClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure btnEditObjCancelClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure pbMapPaint(Sender: TObject);
    procedure pbMapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);

    procedure showArrowInfo(var arrow: PArrow; const x, y: integer);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCreateShipmentSenderIDChange(Sender: TObject);
    procedure edCreateShipmentDestIDChange(Sender: TObject);
    procedure edCreateShipmentItemIDChange(Sender: TObject);
    procedure edCreateShipmentCntChange(Sender: TObject);
    procedure edCreateObjHouseChange(Sender: TObject);
    procedure edCreateObjBuildingChange(Sender: TObject);
    procedure edCreateObjCapacityChange(Sender: TObject);
    procedure edFilterHouseValChange(Sender: TObject);
    procedure edFilterBuildingValChange(Sender: TObject);
    procedure edEditObjHouseChange(Sender: TObject);
    procedure edEditObjBuildingChange(Sender: TObject);
    procedure edEditObjCapacityChange(Sender: TObject);
    procedure edAddItemDestIDChange(Sender: TObject);
    procedure edAddItemVolChange(Sender: TObject);
    procedure edAddItemCntChange(Sender: TObject);
    procedure edCreateShipmentNameExit(Sender: TObject);
    procedure edFilterStreetValExit(Sender: TObject);
    procedure edAddItemCategoryExit(Sender: TObject);
    procedure edCreateShipmentNameChange(Sender: TObject);
    procedure edCreateShipmentSenderNameChange(Sender: TObject);
    procedure edCreateShipmentDestNameChange(Sender: TObject);
    procedure edCreateShipmentItemNameChange(Sender: TObject);
    procedure edCreateObjNameChange(Sender: TObject);
    procedure edCreateObjStreetChange(Sender: TObject);
    procedure edEditObjNameChange(Sender: TObject);
    procedure edEditObjStreetChange(Sender: TObject);
    procedure edAddItemNameChange(Sender: TObject);
    procedure edAddItemCategoryChange(Sender: TObject);
    procedure edAddItemDestNameChange(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
    xPos, yPos: integer;
    shops, warehouses: PTreapNode;
    shopsNames, warehousesNames: PTreapNameNode;
    filter: TFilter;
    shipments: PShipment;


    function getSiz(const curNode: PTreapNode): integer;
    procedure writeObjData(const curFile: TextFile; const curObj: PTreapNode);
    function getItemsSiz(const curItem: PTreapItemNode): integer;
    procedure WriteItemData(const curFile: TextFile;
      const curObj: PTreapItemNode);
    procedure createNewObjFile(const fil: textFile);
    procedure ClearAllData(var shops, warehouses: PTreapNode;
      var shipments: PShipment; var shopsNames, warehousesNames: PTreapNameNode;
      var Arrows: TList<PArrow>);

  public
    { Public declarations }

  end;

var
  frMainForm: TfrMainForm;
  frTableForm: TfrTableForm;
  frShipmentTableForm: TfrShipmentsTable;
  frBalanceForm: TfrBalance;
  frSelectShipments: TfrSelectShipments;
  startWidth, startHeight: integer;
implementation

{$R *.dfm}
procedure TfrMainForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_EX_COMPOSITED;
end;

procedure TfrMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Saved then
    if getConfirmation('Подтверждение', 'Сохранить изменения?') then
    begin
      Save1Click(self);
    end;
  Action := caFree;
end;

procedure TfrMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
  Saved := true;
  startWidth := frMainForm.ClientWidth;
  startHeight := frMainForm.ClientHeight;
  Arrows := TList<PArrow>.Create;
  curShipmentID := 1;
  shopKey := 1;
  warehouseKey := 1;
  InitFilter(filter);
  InitTree(shops);
  InitTree(wareHouses);
  InitTreeName(shopsNames);
  InitTreeName(warehousesNames);
  InitHash(47, 40009);
  shipments := nil;
end;

procedure TfrMainForm.FormDestroy(Sender: TObject);
begin
   ClearAllData(shops, warehouses, shipments, shopsNames, warehousesNames, Arrows);
end;

procedure TfrMainForm.FormResize(Sender: TObject);
begin
  frMainForm.ClientHeight := startHeight;
  frMainForm.ClientWidth := startWidth;
end;

procedure TfrMainForm.ClearAddItem;
begin
  edAddItemName.Color := clWindow;
  edAddItemName.Text := '';
  edAddItemCategory.Text := '';
  edAddItemDestName.Text := '';
  edAddItemDestID.Text := '';
  edAddItemVol.Color := clWindow;
  edAddItemVol.Text := '';
  edAddItemCnt.Color := clWindow;
  edAddItemCnt.Text := '';
  rbAddItemTypeShop.Checked := true;
  rbAddItemTypeWarehouse.Checked := false;
end;

procedure TfrMainForm.ClearCreateShipment;
begin
  edCreateShipmentCnt.color := clWindow;
  edCreateShipmentName.Text := '';
  edCreateShipmentSenderName.Text := '';
  edCreateShipmentSenderID.Text := '';
  edCreateShipmentDestName.Text := '';
  edCreateShipmentDestID.Text := '';
  edCreateShipmentItemName.Text := '';
  edCreateShipmentItemID.Text := '';
  edCreateShipmentCnt.Text := '';

  rbCreateShipmentDestShop.Checked := true;
  rbCreateShipmentDestWarehouse.Checked := false;
  rbCreateShipmentSenderShop.Checked := false;
  rbCreateShipmentSenderWarehouse.Checked := true;
end;

procedure TfrMainForm.updateID(const editID: TEdit;
                                     const isShopRadio: TRadioButton;
                                     const editName: TEdit);
var
  node: PTreapNameNode;
begin
  //editName.text := '';

  if isShopRadio.Checked then
  begin
    node := FindTreapName(shopsNames, gethash(editName.text));
    if node <> nil then
      editID.text := intToStr(node^.Data^.ID xor mask)
    else
      editID.text := '';
  end
  else
  begin
    node := FindTreapName(warehousesNames, gethash(editName.text));
    if node <> nil then
      editID.text := intToStr(node^.Data^.ID)
    else
      editID.text := '';
  end;
end;

procedure TfrMainForm.updateName(const editID: TEdit;
                                     const isShopRadio: TRadioButton;
                                     const editName: TEdit);
var
  node: PTreapNode;
begin
  //editID.text := '';
  if Length(editID.Text) > 0 then
  begin
    if isShopRadio.Checked then
      node := FindTreap(shops, strToInt(editID.Text) or mask)
    else
      node := FindTreap(warehouses, strToInt(editID.Text));
    if node <> nil then
        editName.text := string(node^.Data^.name)
    else
        editName.text := '';
  end;
end;


procedure TfrMainForm.rbAddItemTypeShopClick(Sender: TObject);
begin
  if Length(edAddItemDestName.Text) > 0 then
    updateID(edAddItemDestID,
             rbAddItemTypeShop,
             edAddItemDestName)
  else
    updateName(edAddItemDestID,
             rbAddItemTypeShop,
             edAddItemDestName)
end;

procedure TfrMainForm.rbAddItemTypeWarehouseClick(Sender: TObject);
begin
  if Length(edAddItemDestName.Text) > 0 then
    updateID(edAddItemDestID,
             rbAddItemTypeShop,
             edAddItemDestName)
  else
    updateName(edAddItemDestID,
             rbAddItemTypeShop,
             edAddItemDestName)
end;

procedure TfrMainForm.rbCreateShipmentDestShopClick(Sender: TObject);
begin
  if Length(edCreateShipmentDestName.Text) > 0 then
    updateID(edCreateShipmentDestID,
             rbCreateShipmentDestShop,
             edCreateShipmentDestName)
  else
    updateName(edCreateShipmentDestID,
             rbCreateShipmentDestShop,
             edCreateShipmentDestName)
end;

procedure TfrMainForm.rbCreateShipmentDestWarehouseClick(Sender: TObject);
begin
  if Length(edCreateShipmentDestName.Text) > 0 then
    updateID(edCreateShipmentDestID,
             rbCreateShipmentDestShop,
             edCreateShipmentDestName)
  else
    updateName(edCreateShipmentDestID,
             rbCreateShipmentDestShop,
             edCreateShipmentDestName)
end;

procedure TfrMainForm.rbCreateShipmentSenderShopClick(Sender: TObject);
begin
  if Length(edCreateShipmentSenderName.Text) > 0 then
    updateID(edCreateShipmentSenderID,
             rbCreateShipmentSenderShop,
             edCreateShipmentSenderName)
  else
    updateName(edCreateShipmentSenderID,
             rbCreateShipmentSenderShop,
             edCreateShipmentSenderName);
  edCreateShipmentItemNameExit(self);
end;

procedure TfrMainForm.rbCreateShipmentSenderWarehouseClick(Sender: TObject);
begin
  if Length(edCreateShipmentSenderName.Text) > 0 then
    updateID(edCreateShipmentSenderID,
             rbCreateShipmentSenderShop,
             edCreateShipmentSenderName)
  else
    updateName(edCreateShipmentSenderID,
             rbCreateShipmentSenderShop,
             edCreateShipmentSenderName);
  edCreateShipmentItemNameExit(self);
end;

procedure TfrMainForm.resetPnCreateObj;
begin
  edCreateObjName.Text := '';
  edCreateObjStreet.Text := '';
  edCreateObjHouse.Text := '';
  edCreateObjBuilding.Text := '';
  edCreateObjCapacity.Text := '';
end;

procedure TfrMainForm.resetPnEditObj;
begin
  edEditObjName.Text := '';
  edEditObjStreet.Text := '';
  edEditObjHouse.Text := '';
  edEditObjBuilding.Text := '';
  edEditObjCapacity.Text := '';
end;

function TfrMainForm.getSiz(const curNode: PTreapNode) : integer;
begin
  if curNode = nil then
    Result := 0
  else
  begin
    Result := 1 + getSiz(curNode^.Left) + getSiz(curNode^.Right);
  end;
end;

function TfrMainForm.getItemsSiz(const curItem: PTreapItemNode): integer;
begin
  if curItem = nil then
    Result := 0
  else
  begin
    Result := 1 + getItemsSiz(curItem^.Left) + getItemsSiz(curItem^.Right);
  end;
end;

procedure TfrMainForm.WriteItemData(const curFile: TextFile; const curObj: PTreapItemNode);
begin
  if curObj <> nil then
  begin
    writeln(curFile, curObj^.Data^.name);
    writeln(curFile, curObj^.Data^.category);
    writeln(curFile, curObj^.Data^.Volume);
    writeln(curFile, curObj^.Data^.Count);
    writeln(curFile, curObj^.Data^.Key);
    writeln(curFile, curObj^.Data^.needToSend);
    WriteItemData(curFile, curObj^.Left);
    WriteItemData(curFile, curObj^.Right);
  end;
end;

procedure TfrMainForm.writeObjData(const curFile: TextFile; const curObj: PTreapNode);
begin
  if curObj <> nil then
  begin
    writeln(curFile, curObj^.Data^.name);
    writeln(curFile, curObj^.Data^.street);
    writeln(curFile, curObj^.Data^.house);
    writeln(curFile, curObj^.Data^.building);
    writeln(curFile, curObj^.Data^.capacity);
    writeln(curFile, curObj^.Data^.usedCapacity);
    writeln(curFile, curObj^.Data^.shipmentCapacity);
    writeln(curFile, curObj^.Data^.Key);
    writeln(curFile, curObj^.Data^.X);
    writeln(curFile, curObj^.Data^.Y);
    writeln(curFile, getItemsSiz(curObj^.Data^.Items));
    WriteItemData(curFile, curObj^.Data^.Items);
    writeObjData(curFile, curObj^.Left);
    writeObjData(curFile, curObj^.Right);
  end;
end;

procedure TfrMainForm.Save1Click(Sender: TObject);
var
  shopsFile, warehousesFile, shipmentsFile: TextFile;
  curObject: PTreapNode;
  curShip: PShipment;
  siz: integer;
begin
  if getconfirmation('Подтверждение действия', 'Сохранить данные?') then
  begin
    Saved := true;

    AssignFile(shopsFile, 'shops.txt');
    Rewrite(shopsFile);
    curObject := shops;
    writeln(shopsFile, getSiz(shops));
    writeObjData(shopsFile, curObject);
    CloseFile(shopsFile);

    AssignFile(warehousesFile, 'warehouses.txt');
    Rewrite(warehousesFile);
    curObject := warehouses;
    writeln(warehousesFile, getSiz(warehouses));
    writeObjData(warehousesFile, curObject);
    CloseFile(warehousesFile);

    AssignFile(shipmentsFile, 'shipments.txt');
    Rewrite(shipmentsFile);
    curShip := shipments;
    siz := 0;
    while curShip <> nil do
    begin
      Inc(siz);
      curShip := curShip^.next;
    end;
    writeln(shipmentsFile, siz);
    curShip := shipments;
    while curShip <> nil do
    begin
      writeln(shipmentsFile, curShip^.ShipmentName);
      writeln(shipmentsFile, curShip^.ID);
      writeln(shipmentsFile, curShip^.SourceID^.Key);
      writeln(shipmentsFile, curShip^.DestinationID^.Key);
      writeln(shipmentsFile, curShip^.ProductName);
      writeln(shipmentsFile, curShip^.Count);
      curShip := curShip^.next;
    end;
    CloseFile(shipmentsFile);
    showMessage('Успешно', 'Успешно сохранено');
  end;
end;

procedure TfrMainForm.showArrowInfo(var arrow: PArrow; const x, y: integer);
var
  curItem: PTreapItemNode;
begin
  lbArrowInfoShipmentName.Caption := arrow^.shipment^.ShipmentName;

  if (arrow^.shipment^.SourceID^.key and mask) <> 0 then
  begin
    lbArrowInfoSenderTypeVal.Caption := 'Магазин' ;
    lbArrowInfoSenderIDVal.Caption := intToStr(arrow^.shipment^.SourceID^.Key xor mask);
  end
  else
  begin
    lbArrowInfoSenderTypeVal.Caption := 'Склад';
    lbArrowInfoSenderIDVal.Caption := intToStr(arrow^.shipment^.SourceID^.Key);
  end;
  lbArrowInfoSenderNameVal.Caption := string(arrow^.shipment^.SourceID^.name);

  if (arrow^.shipment^.DestinationID^.key and mask) <> 0 then
  begin
    lbArrowInfoDestTypeVal.Caption := 'Магазин' ;
    lbArrowInfoDestIDVal.Caption := intToStr(arrow^.shipment^.DestinationID^.Key xor mask);
  end
  else
  begin
    lbArrowInfoDestTypeVal.Caption := 'Склад';
    lbArrowInfoDestIDVal.Caption := intToStr(arrow^.shipment^.DestinationID^.Key);
  end;
  lbArrowInfoDestNameVal.Caption := string(arrow^.shipment^.DestinationID^.name);

  lbArrowInfoItemNameVal.Caption := arrow^.shipment^.ShipmentName;
  lbArrowInfoItemIDVal.Caption := intToStr(arrow^.shipment^.ID);
  lbArrowInfoItemCntVal.Caption := intToStr(arrow^.shipment^.Count);
  curItem := FindTreapItem(arrow^.shipment^.SourceID^.Items, getHash(arrow^.shipment^.ProductName));
  lbArrowInfoItemVolVal.Caption := intToStr(arrow^.shipment^.Count * curItem^.Data^.Volume);
  showPanel(pnArrowInfo, x, y);
end;

procedure TfrMainForm.showPanel(const panel: TPanel; const x, y: integer);
begin
  //check y pos
  panel.top := y;
  if Y >= panel.height then
    panel.top := panel.top - panel.height;

  //check x pos
  panel.left := x;
  if X + panel.width > pbMap.width then
    panel.left := panel.left - panel.width;

  panel.visible := true;
end;

procedure TfrMainForm.hideAllPanels;
begin
  pnCreateObj.Visible := false;
  pnCreateSelect.Visible := false;
  pnSelectObject.Visible := false;
  pnEditObj.Visible := false;
  pnFilterParams.Visible := false;
  pnCreateShipment.Visible := false;
  pnAddItem.Visible := false;
  pnArrowInfo.Visible := false;
end;

procedure TfrMainForm.btnSelectObjCancelClick(Sender: TObject);
begin
  pnSelectObject.Visible := false;
end;

procedure TfrMainForm.btnSelectObjEditClick(Sender: TObject);
var
  curNode: PTreapNode;
begin
  hideAllPanels;

  pnEditObj.tag := pnSelectObject.tag;

  if (pnSelectObject.tag and mask) <> 0 then
  begin
    //shop
    curNode := FindTreap(shops, pnSelectObject.tag);
  end
  else
  begin
    //warehouse
    curNode := FindTreap(warehouses, pnSelectObject.tag);
  end;

  showPanel(pnEditObj,
            curNode^.Data^.shape.left + (curNode^.Data^.shape.Width shr 1),
            curNode^.Data^.shape.top + (curNode^.Data^.shape.Height shr 1)
            );

  edEditObjName.Text := string(curNode^.Data^.name);
  edEditObjStreet.Text := string(curNode^.Data^.street);
  edEditObjHouse.Text := intToStr(curNode^.Data^.house);
  if curNode^.Data^.building <> -1 then
    edEditObjBuilding.Text := intToStr(curNode^.Data^.building);
  edEditObjCapacity.Text := intToStr(curNode^.Data^.capacity);
end;


procedure TfrMainForm.btnSelectObjItemListClick(Sender: TObject);
var
  curNode: PTreapNode;
begin
  frtableForm := TfrTableForm.Create(Application);
  if (pnSelectObject.tag and mask) <> 0 then
  begin
    //shop
    curNode := FindTreap(shops, pnSelectObject.tag);
  end
  else
  begin
    //warehouse
    curNode := FindTreap(warehouses, pnSelectObject.tag);
  end;
  frtableForm.Location := curNode^.Data;
  frtableForm.LoadData;
  pnSelectObject.Visible := false;
  frtableForm.ShowModal;
end;

procedure TfrMainForm.btnSelectObjDeleteClick(Sender: TObject);
var
  curNode: PTreapNode;
begin
  if getconfirmation('Подтверждение действия', 'Вы подтверждаете действие?') then
  begin
    hideAllPanels;
    if (pnSelectObject.tag and mask) <> 0 then
    begin
      //shop
      curNode := FindTreap(shops, pnSelectObject.tag);
      if (curNode^.Data^.OutgoingArrows.count = 0)
          and (curNode^.Data^.IncomingArrows.count = 0) then
      begin
        FreeAndNil(curNode^.Data^.shape);
        EraseTreap(shops, pnSelectObject.tag);
        EraseTreapName(shopsNames, getHash(string(curNode^.Data^.name)));
        Saved := false;
        showMessage('Успешно', 'Магазин был удалён');
      end
      else
      begin
        showMessage('Ошибка', 'Невозможно удалить. Есть отгрузки, связанные с этим магазином!');
      end;
    end
    else
    begin
      //warehouse
      curNode := FindTreap(warehouses, pnSelectObject.tag);
      if (curNode^.Data^.OutgoingArrows.count = 0)
          and (curNode^.Data^.IncomingArrows.count = 0) then
      begin
        FreeAndNil(curNode^.Data^.shape);
        EraseTreap(warehouses, pnSelectObject.tag);
        Saved := false;
        EraseTreapName(warehousesNames, getHash(string(curNode^.Data^.name)));
        showMessage('Успешно', 'Склад был удалён');
      end
      else
      begin
        showMessage('Ошибка', 'Невозможно удалить. Есть отгрузки, связанные с этим складом!');
      end;
    end;
  end;
end;



procedure TfrMainForm.pnSelectObjectShow(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
begin
  hideAllPanels;
  spMapPoint.Visible := false;
  pnObjectInfo.Visible := false;

  X := (Sender as TShape).left + ((Sender as TShape).width shr 1);
  Y := (Sender as TShape).top + ((Sender as TShape).height shr 1);
  showPanel(pnSelectObject, X, Y);

  pnSelectObject.tag := (Sender as TShape).tag;
end;

procedure TfrMainForm.pnObjectInfoShow(Sender: TObject);
var
  curNode: PTreapNode;
begin

  pnArrowInfo.Visible := false;
  if ((Sender as TShape).tag and mask) <> 0 then
  begin
    //shop
    curNode := FindTreap(shops, (Sender as TShape).tag);
    lbObjInfoTitle.Caption := 'Магазин';
    lbObjInfoIdVal.Caption := intToStr(curNode^.Data^.Key xor mask);
  end
  else
  begin
    //warehouse
    curNode := FindTreap(warehouses, (Sender as TShape).tag);
    lbObjInfoTitle.Caption := 'Склад';
    lbObjInfoIdVal.Caption := intToStr(curNode^.Data^.Key);
  end;

  lbObjInfoNameVal.Caption := string(curNode^.Data^.name);
  lbObjInfoStreetVal.Caption := string(curNode^.Data^.street);
  lbObjInfoHouseVal.Caption := intToStr(curNode^.Data^.House);

  if curNode^.Data^.Building <> -1 then
    lbObjInfoBuildingVal.Caption := intToStr(curNode^.Data^.Building)
  else
    lbObjInfoBuildingVal.Caption := 'Отсутствует';
  lbObjInfoCapacityVal.Caption := intToStr(curNode^.Data^.Capacity);
  lbObjInfoUsedCapacityVal.Caption := intToStr(curNode^.Data^.UsedCapacity);
  showPanel(pnObjectInfo,
            (Sender as TShape).left + ((Sender as TShape).width shr 1),
            (Sender as TShape).top + ((Sender as TShape).height shr 1)
           );
end;


procedure TfrMainForm.pbMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  i: Integer;
  Arrow: PArrow;
  Pt: TPoint;
  nearLine: PArrow;
begin
  Pt := Point(X, Y);
  nearLine := nil;
  i := Arrows.Count - 1;
  while (i >= 0) and (nearLine = nil) do
  begin
    Arrow := Arrows[i];
    if Arrow^.Visible and IsPointNearLine(Pt, Point(Arrow^.Shipment^.SourceID^.X, Arrow^.Shipment^.SourceID^.Y),
                          Point(Arrow^.Shipment^.DestinationID^.X, Arrow^.Shipment^.DestinationID^.Y), 5) then
    begin
      Screen.Cursor := crHandPoint;
      nearLine := Arrow;
    end;
    Dec(i);
  end;
  if nearLine = nil then
  begin
    Screen.Cursor := crDefault;
    pnArrowInfo.Visible := false;
  end
  else
  begin
    showArrowInfo(nearLine, X, Y);
  end;
end;

procedure TfrMainForm.pbMapPaint(Sender: TObject);
var
  Background: TBitmap;
  i: Integer;
  Arrow: PArrow;
  FromPt, ToPt: TPoint;
begin
  Background := TBitmap.Create;
  try
    Background.LoadFromFile('map.bmp');
    pbMap.Canvas.StretchDraw(pbMap.ClientRect, Background);

    pbMap.Canvas.Pen.Color := clBlack;
    pbMap.Canvas.Pen.Width := 2;
    for i := 0 to Arrows.Count - 1 do
    begin
      Arrow := Arrows[i];
      FromPt := Point(Arrow^.Shipment^.SourceID^.X, Arrow^.Shipment^.SourceID^.Y);
      ToPt := Point(Arrow^.Shipment^.DestinationID^.X, Arrow^.Shipment^.DestinationID^.Y);
      if Arrow^.Shipment^.SourceID^.shape.Visible and Arrow^.Shipment^.DestinationID^.shape.Visible then
      begin
        Arrow^.Visible := true;
        pbMap.Canvas.MoveTo(FromPt.X, FromPt.Y);
        pbMap.Canvas.LineTo(ToPt.X, ToPt.Y);
      end
      else
      begin
        Arrow^.Visible := false;
      end;
    end;
  finally
    Background.Free;
  end;
end;

procedure TfrMainForm.pnObjectInfoHide(Sender: TObject);
begin
  pnObjectInfo.Visible := false;
end;


procedure TfrMainForm.createNewObj(var newObj: PLocation; const isShop: boolean);
begin
  New(newObj);
  newObj^.Items := nil;
  newObj^.name := shortString(edCreateObjName.Text);
  newObj^.street := shortString(edCreateObjStreet.Text);
  newObj^.house := strToInt(edCreateObjHouse.Text);
  newObj^.building := -1;
  if Length(edCreateObjBuilding.Text) > 0 then
    newObj^.building := strToInt(edCreateObjBuilding.Text);
  newObj^.capacity := strToInt(edCreateObjCapacity.Text);
  newObj^.usedCapacity := 0;
  newObj^.shipmentCapacity := 0;

  newObj^.X := xPos;
  newObj^.Y := yPos;

  //shape
  newObj^.shape := TShape.Create(self);
  newObj^.shape.Parent := spMapPoint.Parent;

  newObj^.shape.Width := spMapPoint.Width;
  newObj^.shape.Height := spMapPoint.Height;

  newObj^.shape.Left := xPos - newObj^.shape.width shr 1;
  newObj^.shape.Top := yPos - newObj^.shape.height shr 1;


  newObj^.shape.Shape := stCircle;

  newObj^.shape.Cursor := crHandPoint;

  if isShop then
  begin
    newObj^.key := getShopKey or mask;
    newObj^.shape.Brush.Color := shopColor;
  end
  else
  begin
    newObj^.key := getWarehouseKey;
    newObj^.shape.Brush.Color := warehouseColor;
  end;

  newObj^.shape.Tag := newObj^.key;

  newObj^.OutgoingArrows := TList<PArrow>.Create;
  newObj^.IncomingArrows := TList<PArrow>.Create;

  newObj^.shape.onMouseUp := pnSelectObjectShow;
  newObj^.shape.OnMouseEnter := pnObjectInfoShow;
  newObj^.shape.OnMouseLeave := pnObjectInfoHide;

  newObj^.shape.Visible := true;
  newObj^.shape.BringToFront;
  //endshape

end;


procedure TfrMainForm.createShop(Sender: TObject);
var
  newObj: PLocation;
  NewNode: PTreapNode;
  NewNameNode: PTreapNameNode;
begin
  createNewObj(newObj, true);

  NewNode := CreateNewNode(newObj);

  InsertTreap(shops, NewNode);

  NewNameNode := CreateNewNameNode(string(newObj^.name), newObj^.Key);
  InsertTreapName(shopsNames, NewNameNode);
end;

procedure TfrMainForm.createWarehouse(Sender: TObject);
var
  newObj: PLocation;
  NewNode: PTreapNode;
  NewNameNode: PTreapNameNode;
begin
  createNewObj(newObj, false);
  NewNode := CreateNewNode(newObj);
  InsertTreap(warehouses, NewNode);

  NewNameNode := CreateNewNameNode(string(newObj^.name), newObj^.Key);
  InsertTreapName(warehousesNames, NewNameNode);
end;


procedure TfrMainForm.edAddItemCategoryChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edAddItemCategoryExit(Sender: TObject);
begin
  (Sender as TEdit).Text := Trim((Sender as TEdit).Text);
end;

procedure TfrMainForm.edAddItemCntChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edAddItemCntExit(Sender: TObject);
begin
  if validateLength(edAddItemCnt) then
    (Sender as TEdit).color := clWindow
end;

procedure TfrMainForm.edAddItemDestIDChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edAddItemDestIDExit(Sender: TObject);
begin
  updateName(edAddItemDestID,
           rbAddItemTypeShop,
           edAddItemDestName);
end;

procedure TfrMainForm.edAddItemDestNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edAddItemDestNameExit(Sender: TObject);
begin
  edAddItemDestName.Text := Trim(edAddItemDestName.Text);
  updateID(edAddItemDestID,
           rbAddItemTypeShop,
           edAddItemDestName);
end;


procedure TfrMainForm.edAddItemNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edAddItemNameExit(Sender: TObject);
begin
  edAddItemName.Text := Trim(edAddItemName.Text);
  if validateLength(edAddItemName) then
    (Sender as TEdit).color := clWindow
end;

procedure TfrMainForm.edAddItemVolChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edAddItemVolExit(Sender: TObject);
begin
  if validateLength(edAddItemVol) then
    (Sender as TEdit).color := clWindow
end;




procedure TfrMainForm.edCreateObjBuildingChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edCreateObjCapacityChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edCreateObjHouseChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edCreateObjNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edCreateObjStreetChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edCreateShipmentCntChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;


procedure TfrMainForm.edCreateShipmentDestIDChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edCreateShipmentDestIDExit(Sender: TObject);
begin
  updateName(edCreateShipmentDestID,
             rbCreateShipmentDestShop,
             edCreateShipmentDestName);
end;


procedure TfrMainForm.edCreateShipmentDestNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edCreateShipmentDestNameExit(Sender: TObject);
begin
  edCreateShipmentDestName.Text := Trim(edCreateShipmentDestName.Text);
  updateID(edCreateShipmentDestID,
           rbCreateShipmentDestShop,
           edCreateShipmentDestName);
end;

procedure TfrMainForm.edCreateShipmentItemIDChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edCreateShipmentItemIDExit(Sender: TObject);
var
  senderNode: PTreapNode;
  itemNode: PTreapItemNode;
begin
  if Length(edCreateShipmentSenderID.Text) > 0 then
    begin
    if rbCreateShipmentSenderShop.Checked then
      senderNode := FindTreap(shops, strToInt(edCreateShipmentSenderID.Text) or mask)
    else
      senderNode := FindTreap(warehouses, strToInt(edCreateShipmentSenderID.Text));
    itemNode := nil;
    if (Length(edCreateShipmentItemID.Text) > 0) and (senderNode <> nil) then
      itemNode := FindTreapItem(senderNode^.Data^.Items, strToInt(edCreateShipmentItemID.Text));
    if itemNode <> nil then
      edCreateShipmentItemName.Text := string(itemNode^.Data^.name)
    else
      edCreateShipmentItemName.Text := '';
  end
  else
  begin
    edCreateShipmentItemName.Text := '';
  end;
end;


procedure TfrMainForm.edCreateShipmentItemNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edCreateShipmentItemNameExit(Sender: TObject);
var
  senderNode: PTreapNode;
  itemNode: PTreapItemNode;
begin
  edCreateShipmentItemName.Text := Trim(edCreateShipmentItemName.Text);
  if Length(edCreateShipmentSenderID.Text) > 0 then
  begin
    if rbCreateShipmentSenderShop.Checked then
      senderNode := FindTreap(shops, strToInt(edCreateShipmentSenderID.Text) or mask)
    else
      senderNode := FindTreap(warehouses, strToInt(edCreateShipmentSenderID.Text));
  itemNode := nil;
  if senderNode <> nil then
    itemNode := FindTreapItem(senderNode^.Data^.Items, getHash(edCreateShipmentItemName.Text));
  if itemNode <> nil then
    edCreateShipmentItemID.Text := intToStr(getHash(edCreateShipmentItemName.Text))
  else
    edCreateShipmentItemID.Text := '';
  end
  else
  begin
    edCreateShipmentItemID.Text := '';
  end;
end;

procedure TfrMainForm.edCreateShipmentNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edCreateShipmentNameExit(Sender: TObject);
begin
  edCreateShipmentName.Text := Trim(edCreateShipmentName.Text);
end;

procedure TfrMainForm.edCreateShipmentSenderIDChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edCreateShipmentSenderIDExit(Sender: TObject);
begin
  updateName(edCreateShipmentSenderID,
                   rbCreateShipmentSenderShop,
                   edCreateShipmentSenderName);
  edCreateShipmentItemNameExit(self);
end;


procedure TfrMainForm.edCreateShipmentSenderNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edCreateShipmentSenderNameExit(Sender: TObject);
begin
  edCreateShipmentSenderName.Text := Trim(edCreateShipmentSenderName.Text);
  updateID(edCreateShipmentSenderID,
           rbCreateShipmentSenderShop,
           edCreateShipmentSenderName);
  edCreateShipmentItemNameExit(self);
end;

procedure TfrMainForm.edEditObjBuildingChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edEditObjCapacityChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edEditObjHouseChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edEditObjNameChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edEditObjStreetChange(Sender: TObject);
begin
  validateLengthLess70(Sender);
end;

procedure TfrMainForm.edFilterBuildingValChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edFilterCapacityFromValChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
  if validateFromTo(edFilterCapacityFromVal, edFilterCapacityToVal) then
    edFilterCapacityToVal.color := clWindow;
end;

procedure TfrMainForm.edFilterCapacityFromValExit(Sender: TObject);
begin
  if not validateFromTo(edFilterCapacityFromVal, edFilterCapacityToVal) then
    edFilterCapacityToVal.color := clRed;
end;

procedure TfrMainForm.edFilterCapacityToValChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
  if validateFromTo(edFilterCapacityFromVal, edFilterCapacityToVal) then
    edFilterCapacityToVal.color := clWindow;
end;

procedure TfrMainForm.edFilterCapacityToValExit(Sender: TObject);
begin
  if not validateFromTo(edFilterCapacityFromVal, edFilterCapacityToVal) then
    edFilterCapacityToVal.color := clRed;
end;

procedure TfrMainForm.edFilterHouseValChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
end;

procedure TfrMainForm.edFilterStreetValExit(Sender: TObject);
begin
  edFilterStreetVal.Text := Trim(edFilterStreetVal.Text);
end;

procedure TfrMainForm.edFilterUsedCapacityFromValChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
  if validateFromTo(edFilterUsedCapacityFromVal, edFilterUsedCapacityToVal) then
    edFilterUsedCapacityToVal.color := clWindow;
end;

procedure TfrMainForm.edFilterUsedCapacityFromValExit(Sender: TObject);
begin
  if not validateFromTo(edFilterUsedCapacityFromVal, edFilterUsedCapacityToVal) then
    edFilterUsedCapacityToVal.color := clRed;
end;

procedure TfrMainForm.edFilterUsedCapacityToValChange(Sender: TObject);
begin
  validateIntegerInput(Sender);
  if validateFromTo(edFilterUsedCapacityFromVal, edFilterUsedCapacityToVal) then
    edFilterUsedCapacityToVal.color := clWindow;
end;

procedure TfrMainForm.edFilterUsedCapacityToValExit(Sender: TObject);
begin
  if not validateFromTo(edFilterUsedCapacityFromVal, edFilterUsedCapacityToVal) then
    edFilterUsedCapacityToVal.color := clRed;
end;


procedure TfrMainForm.OnClickValidateLetters(Sender: TObject);
begin
  validateLengthLess70(Sender);
  if validateLetters(Sender) then
  begin
    (Sender as TEdit).color := clWindow;
  end;
end;

procedure TfrMainForm.createNewObjFile(const fil: textFile);
var
  i, j, cntObj, cntItems: integer;
  newObj: PLocation;
  curItem: PItem;
  NewNode: PTreapNode;
  NewNameNode: PTreapNameNode;
  newItemNode: PTreapItemNode;
begin
      readln(fil, cntObj);
      for i := 1 to cntObj do
      begin
        newObj := new(PLocation);
        newObj^.Items := nil;
        readln(fil, newObj^.name);
        readln(fil, newObj^.street);
        readln(fil, newObj^.house);
        readln(fil, newObj^.building);
        readln(fil, newObj^.capacity);
        readln(fil, newObj^.usedCapacity);
        readln(fil, newObj^.shipmentCapacity);
        readln(fil, newObj^.key);
        readln(fil, newObj^.x);
        readln(fil, newObj^.y);
        readln(fil, cntItems);
        newObj^.shape := TShape.Create(self);

        newObj^.shape.Parent := spMapPoint.Parent;
        newObj^.shape.Width := spMapPoint.Width;
        newObj^.shape.Height := spMapPoint.Height;

        newObj^.shape.Left := newObj^.x - newObj^.shape.width shr 1;
        newObj^.shape.Top := newObj^.y - newObj^.shape.height shr 1;


        newObj^.shape.Shape := stCircle;

        newObj^.shape.Cursor := crHandPoint;
        
        if (newObj^.Key and mask) = 0 then
        begin
          if newObj^.Key >= warehouseKey then
            warehouseKey := newObj^.Key + 1;
          newObj^.shape.Brush.Color := warehouseColor;
        end
        else
        begin
          if (newObj^.Key xor mask) >= shopKey then
            shopKey := (newObj^.Key xor mask) + 1;
          newObj^.shape.Brush.Color := shopColor;
        end;

        newObj^.shape.Tag := newObj^.key;

        newObj^.OutgoingArrows := TList<PArrow>.Create;
        newObj^.IncomingArrows := TList<PArrow>.Create;

        newObj^.shape.onMouseUp := pnSelectObjectShow;
        newObj^.shape.OnMouseEnter := pnObjectInfoShow;
        newObj^.shape.OnMouseLeave := pnObjectInfoHide;

        newObj^.shape.Visible := true;
        newObj^.shape.BringToFront;
        for j := 1 to cntItems do
        begin
          curItem := new(PItem);
          readln(fil, curItem^.name);
          readln(fil, curItem^.category);
          readln(fil, curItem^.Volume);
          readln(fil, curItem^.Count);
          readln(fil, curItem^.Key);
          readln(fil, curItem^.needToSend);
          newItemNode := CreateNewItemNode(curItem);
          InsertTreapItem(newObj^.Items, newItemNode);
        end;
        if (newObj^.Key and mask) <> 0 then
        begin
          NewNode := CreateNewNode(newObj);
          InsertTreap(shops, NewNode);

          NewNameNode := CreateNewNameNode(string(newObj^.name), newObj^.Key);
          InsertTreapName(shopsNames, NewNameNode);
        end
        else
        begin
          NewNode := CreateNewNode(newObj);
          InsertTreap(warehouses, NewNode);

          NewNameNode := CreateNewNameNode(string(newObj^.name), newObj^.Key);
          InsertTreapName(warehousesNames, NewNameNode);
        end;
      end;
end;

procedure TfrMainForm.ClearAllData(var shops, warehouses: PTreapNode;
                                   var shipments: PShipment;
                                   var shopsNames, warehousesNames: PTreapNameNode;
                                   var Arrows: TList<PArrow>);
begin
  ClearTreap(shops);
  ClearTreap(warehouses);
  ClearShipments(shipments);
  ClearTreapName(shopsNames);
  ClearTreapName(warehousesNames);
  Arrows.Free;
end;

procedure TfrMainForm.Open1Click(Sender: TObject);
var
  shopsFile, warehousesFile, shipmentsFile: textFile;
  cntShipments, i, sourceKey, destKey: integer;
  curShipment: PShipment;
begin
  if not FileExists('warehouses.txt')
     or not FileExists('shops.txt')
     or not FileExists('shipments.txt') then
  begin
    showMessage('Ошибка', 'Ошибка загрузки. Одного/нексокльких файлов не существует!');
  end
  else
  begin
    if getconfirmation('Подтверждение действия', 'Вы подтверждаете действие?') then
    begin
      curShipmentID := 1;
      shopKey := 1;
      warehouseKey := 1;

      ClearAllData(shops, warehouses, shipments, shopsNames, warehousesNames, Arrows);

      shops := nil;
      warehouses := nil;
      shipments := nil;
      shopsNames := nil;
      warehousesNames := nil;
      AssignFile(warehousesFile, 'warehouses.txt');
      Reset(warehousesFile);
      createNewObjFile(warehousesFile);
      CloseFile(warehousesFile);

      AssignFile(shopsFile, 'shops.txt');
      Reset(shopsFile);
      createNewObjFile(shopsFile);
      CloseFile(shopsFile);

      AssignFile(shipmentsFile, 'shipments.txt');
      Reset(shipmentsFile);
      readln(shipmentsFile, cntShipments);
      curShipmentID := cntShipments + 1;

      Arrows := TList<PArrow>.Create;

      for i := 1 to cntShipments do
      begin
        curShipment := new(PShipment);
        readln(shipmentsFile, curShipment^.ShipmentName);
        readln(shipmentsFile, curShipment^.ID);
        readln(shipmentsFile, sourceKey);
        readln(shipmentsFile, destKey);
        if (sourceKey and mask) <> 0 then
          curShipment^.SourceID := FindTreap(shops, sourceKey).Data
        else
          curShipment^.SourceID := FindTreap(warehouses, sourceKey).Data;

        if (destKey and mask) <> 0 then
          curShipment^.DestinationID := FindTreap(shops, destKey).Data
        else
          curShipment^.DestinationID := FindTreap(warehouses, destKey).Data;

        AddArrow(Arrows, curShipment);
        pbMap.Invalidate;

        readln(shipmentsFile, curShipment^.ProductName);
        readln(shipmentsFile, curShipment^.Count);
        curShipment^.next := shipments;
        shipments := curShipment;
      end;
      CloseFile(shipmentsFile);
      spMapPoint.Parent.Invalidate;
      showMessage('Успешно', 'Данные успешно загружены');
    end;
  end;
end;

function TfrMainForm.validateNumberFromText(const curText: string): integer;
begin
  if Length(curText) > 0 then
    Result := strToInt(curText)
  else
    Result := -1;
end;

procedure TfrMainForm.OnClickValidateLength(Sender: TObject);
begin
  edCreateObjName.Text := Trim(edCreateObjName.Text);
  edEditObjName.Text := Trim(edEditObjName.Text);

  if validateLength(Sender) then
    (Sender as TEdit).color := clWindow;
end;

procedure TfrMainForm.OnClickvalidateAll(Sender: TObject);
begin
  edCreateObjStreet.Text := Trim(edCreateObjStreet.Text);
  edEditObjStreet.Text := trim(edEditObjStreet.Text);

  if (validateLength(Sender)) and (validateLetters(Sender)) then
  begin
    (Sender as TEdit).color := clWindow;
  end;
end;

function TfrMainForm.validateCreateObj: boolean;
begin
  Result := validateLength(edCreateObjName);

  Result := validateLength(edCreateObjStreet) and Result;

  Result := validateLetters(edCreateObjStreet) and Result;

  Result := validateLength(edCreateObjHouse) and Result;

  Result := validateLength(edCreateObjCapacity) and Result;
end;

function TfrMainForm.validateEditObj: boolean;
begin
  Result := validateLength(edEditObjName);

  Result := validateLength(edEditObjStreet) and Result;

  Result := validateLetters(edEditObjStreet) and Result;

  Result := validateLength(edEditObjHouse) and Result;

  Result := validateLength(edEditObjCapacity) and Result;
end;

function TfrMainForm.validateAddItem: Boolean;
var
  node: PTreapNode;
  itemNode, senderItemNode: PTreapItemNode;
  category: string;
  shipmentCapacity: integer;
  curShip: PShipment;
begin
  Result := true;
  Result := validateLength(edAddItemName) and Result;
  Result := validateLength(edAddItemVol) and Result;
  Result := validateLength(edAddItemCnt) and Result;
  if (Length(edAddItemDestName.Text) = 0) or (Length(edAddItemDestID.Text) = 0) then
  begin
    showMessage('Ошибка', 'Получателя с таким названием/ID не существует!');
    Result := false;
  end;

  if Result then
  begin
    if rbAddItemTypeShop.Checked then
      node := FindTreap(shops, strToInt(edAddItemDestID.Text) or mask)
    else
      node := FindTreap(warehouses, strToInt(edAddItemDestID.Text));

    itemNode := FindTreapItem(node^.Data^.Items, getHash(edAddItemName.Text));
    if itemNode <> nil then
    begin
      if strToInt(edAddItemVol.Text) <> itemNode^.Data^.Volume then
      begin
        Result := false;
        showMessage('Ошибка', 'Товар уже существует в магазине,'
                    + ' но объем за единицу товара отличается!'
                    + ' Объем уже существующего товара: '
                    + intToStr(itemNode^.Data^.Volume));
      end;
      if edAddItemCategory.Text <> string(itemNode^.Data^.category) then
      begin
        if Length(edAddItemCategory.Text) = 0 then
          category := 'Отсутствует'
        else
          category := edAddItemCategory.Text;
        Result := false;
        showMessage('Ошибка', 'Товар уже существует в магазине,'
                    + ' но категория отличается!'
                    + ' Категория уже существующего товара: '
                    + category);
      end
    end;

    curShip := Shipments;
    shipmentCapacity := 0;
    while curShip <> nil do
    begin
      if curShip^.DestinationID = node^.Data then
      begin
        senderItemNode := FindTreapItem(curShip^.SourceID^.Items, getHash(curShip^.ProductName));
        shipmentCapacity := shipmentCapacity + curShip^.Count
                            * senderItemNode^.Data^.Volume;
      end;
      curShip := curShip^.next;
    end;

    if Result and
      (node^.Data^.usedCapacity
       + strToInt(edAddItemCnt.Text) * strToInt(edAddItemVol.Text)
       + shipmentCapacity
       > node^.Data^.capacity) then
    begin
      Result := false;
      showMessage('Ошибка', 'У получателя недостаточно свободного места!'
                 + ' Свободное место: '
                 + intToStr(node^.Data^.capacity - node^.Data^.usedCapacity)
                 + ' у.е. Из них '
                 + intToStr(node^.Data^.shipmentCapacity)
                 + ' зарезервировано под отгрузку');
    end;

  end;
end;

function TfrMainForm.validateCreateSipment: boolean;
var
  senderNode, destNode: PTreapNode;
  curItem, senderItemNode, destItemNode: PTreapItemNode;
begin
  Result := true;

  if (Length(edCreateShipmentSenderName.Text) = 0)
     or (Length(edCreateShipmentSenderID.Text) = 0) then
  begin
    showMessage('Ошибка', 'Отправителя с таким названием/ID не существует!');
    Result := false;
  end;

  if Result and ((Length(edCreateShipmentDestName.Text) = 0)
     or (Length(edCreateShipmentDestID.Text) = 0)) then
  begin
    showMessage('Ошибка', 'Получателя с таким названием/ID не существует!');
    Result := false;
  end;

  if Result and ((Length(edCreateShipmentItemName.Text) = 0)
     or (Length(edCreateShipmentItemID.Text) = 0)) then
  begin
    showMessage('Ошибка', 'Товара с таким названием/артикулом не существует!');
    Result := false;
  end;

  if Result and (edCreateShipmentDestID.Text = edCreateShipmentSenderID.Text)
  and ((rbCreateShipmentSenderWarehouse.Checked and rbCreateShipmentDestWarehouse.checked)
  or (not rbCreateShipmentSenderWarehouse.Checked and not rbCreateShipmentDestWarehouse.checked)) then
  begin
    showMessage('Ошибка', 'Отправитель и получатель не должны совпадать!');
    Result := false;
  end;

  senderNode := nil;
  if Result then
  begin
    if rbCreateShipmentSenderShop.Checked then
      senderNode := FindTreap(shops, strToInt(edCreateShipmentSenderID.Text) or mask)
    else
      senderNode := FindTreap(warehouses, strToInt(edCreateShipmentSenderID.Text));

    curItem := FindTreapItem(senderNode^.Data^.Items, strToInt(edCreateShipmentItemID.Text));
    if curItem^.Data^.Count - curItem^.Data^.needToSend
      < strToInt(edCreateShipmentCnt.Text) then
    begin
      showMessage('Ошибка', 'У отправителя недостаточное количество товара!');
      Result := false;
    end;
  end;

  destNode := nil;

  if (senderNode <> nil) and Result then
  begin
    if rbCreateShipmentDestShop.Checked then
      destNode := FindTreap(shops, strToInt(edCreateShipmentDestID.Text) or mask)
    else
      destNode := FindTreap(warehouses, strToInt(edCreateShipmentDestID.Text));

    if destNode^.Data^.usedCapacity + destNode^.Data^.shipmentCapacity
       + strToInt(edCreateShipmentCnt.Text) * FindTreapItem(senderNode^.Data^.Items, strToInt(edCreateShipmentItemID.Text))^.Data^.Volume
       > destNode^.Data^.capacity then
    begin
      showMessage('Ошибка', 'У получателя не хватает места!');
      Result := false;
    end;
  end;

  if Result and (senderNode <> nil) and (destNode <> nil) then
  begin
    senderItemNode := nil;
    destItemNode := nil;
    if Length(edCreateShipmentItemID.Text) > 0 then
    begin
      senderItemNode := FindTreapItem(senderNode^.Data^.Items, strToInt(edCreateShipmentItemID.Text));
      destItemNode := FindTreapItem(destNode^.Data^.Items, strToInt(edCreateShipmentItemID.Text));
    end;
    if (senderItemNode <> nil) and (destItemNode <> nil) then
    begin
      if senderItemNode^.Data^.category <> destItemNode^.Data^.category then
      begin
        showMessage('Ошибка', 'Категории текущего товара у данных объектов не совпадают!');
        Result := false;
      end;
      if Result and (senderItemNode^.Data^.Volume <> destItemNode^.Data^.Volume) then
      begin
        showMessage('Ошибка', 'Объемы единицы текущего товара у данных объектов не совпадают!');
        Result := false;
      end;
    end;
  end;
  Result := validateLength(edCreateShipmentCnt) and Result;
end;

procedure TfrMainForm.btnCreateSelectClick(Sender: TObject);
begin
  hideAllPanels;

  pnCreateObj.BringToFront;

  edCreateObjName.color := clWindow;
  edCreateObjStreet.color := clWindow;
  edCreateObjHouse.color := clWindow;
  edCreateObjCapacity.color := clWindow;

  //check y pos
  pnCreateObj.top := yPos;
  if yPos >= pnCreateObj.height then
    pnCreateObj.top := pnCreateObj.top - pnCreateObj.height;

  //check x pos
  pnCreateObj.left := xPos;
  if xPos + pnCreateObj.width > pbMap.width then
    pnCreateObj.left := pnCreateObj.left - pnCreateObj.width;

  pnCreateObj.tag := (Sender as TButton).tag;  //tag=1 - shop, tag=2 - Warehouse
  pnCreateObj.visible := true;
end;


procedure TfrMainForm.btnCreateShipmentCancelClick(Sender: TObject);
begin
  pnCreateShipment.Visible := false;
  ClearCreateShipment;
end;

procedure TfrMainForm.btnCreateShipmentConfirmClick(Sender: TObject);
var
  newShipment: PShipment;
  curItem: PTreapItemNode;
  senderNode: PTreapNode;
begin
  if validateCreateSipment then
  begin
    newShipment := new(PShipment);
    if rbCreateShipmentSenderShop.Checked then
      senderNode := FindTreap(shops, strToInt(edCreateShipmentSenderID.Text) or mask)
    else
      senderNode := FindTreap(warehouses, strToInt(edCreateShipmentSenderID.Text));
    curItem := FindTreapItem(senderNode^.Data^.Items, strToInt(edCreateShipmentItemID.Text));
    Inc(curItem^.Data^.needToSend, strToInt(edCreateShipmentCnt.Text));
    if rbCreateShipmentSenderShop.Checked then
      newShipment^.SourceID := FindTreap(shops, strToInt(edCreateShipmentSenderID.Text) or mask)^.Data
    else
      newShipment^.SourceID := FindTreap(warehouses, strToInt(edCreateShipmentSenderID.Text))^.Data;

    if rbCreateShipmentDestShop.Checked then
      newShipment^.DestinationID := FindTreap(shops, strToInt(edCreateShipmentDestID.Text) or mask)^.Data
    else
      newShipment^.DestinationID := FindTreap(warehouses, strToInt(edCreateShipmentDestID.Text))^.Data;

    newShipment^.ID := curShipmentId;
    Inc(curShipmentId);
    newShipment^.ShipmentName := edCreateShipmentName.Text;
    newShipment^.ProductName := edCreateShipmentItemName.Text;
    newShipment^.Count := strToInt(edCreateShipmentCnt.Text);
    newShipment^.next := shipments;
    shipments := newShipment;
    pnCreateShipment.Visible := false;
    ClearCreateShipment;
    AddArrow(Arrows, newShipment);

    Inc(newShipment^.DestinationID^.shipmentCapacity, newShipment^.Count
        * curItem^.Data^.Volume);

    Saved := false;

    pbMap.Invalidate;
  end;

end;

procedure TfrMainForm.btnEditObjCancelClick(Sender: TObject);
begin
  pnEditObj.Visible := false;
end;

procedure TfrMainForm.btnEditObjConfirmClick(Sender: TObject);
var
  curNode: PTreapNode;
begin
  if (pnEditObj.tag and mask) <> 0 then
  begin
    //shop
    curNode := FindTreap(shops, pnSelectObject.tag);
  end
  else
  begin
    //warehouse
    curNode := FindTreap(warehouses, pnSelectObject.tag);
  end;

  if validateEditObj then
  begin
    if strToInt(edEditObjCapacity.Text) < curNode^.Data^.usedCapacity
                                          + curNode^.Data^.shipmentCapacity then
    begin
      showMessage('Ошибка', 'Новая вместимость не позволяет вместить существующие товары!');
    end
    else if getconfirmation('Подтверждение действия', 'Вы подтверждаете действие?') then
    begin
      edEditObjName.Text := trim(edEditObjName.Text);
      edEditObjStreet.Text := trim(edEditObjStreet.Text);

      curNode^.Data^.name := shortString(edEditObjName.Text);
      curNode^.Data^.street := shortString(edEditObjStreet.Text);
      curNode^.Data^.house := strToInt(edEditObjHouse.Text);
      curNode^.Data^.building := -1;
      if Length(edEditObjBuilding.Text) > 0 then
        curNode^.Data^.building := strToInt(edEditObjBuilding.Text);
      curNode^.Data^.capacity := strToInt(edEditObjCapacity.Text);

      edEditObjName.Text := '';
      edEditObjStreet.Text := '';
      edEditObjHouse.Text := '';
      edEditObjBuilding.Text := '';
      edEditObjCapacity.Text := '';
      hideAllPanels;

      Saved := false;
    end;
  end;
end;

procedure TfrMainForm.setFilterPanel;
begin
  edFilterStreetVal.Text := '';
  edFilterHouseVal.Text := '';
  edFilterBuildingVal.Text := '';
  edFilterCapacityFromVal.Text := '';
  edFilterCapacityToVal.Text := '';
  edFilterUsedCapacityFromVal.Text := '';
  edFilterUsedCapacityToVal.Text := '';

  cbFilterTypeShop.Checked := true;
  cbFilterTypeWarehouse.Checked := true;
end;

procedure TfrMainForm.btnFilterCancelClick(Sender: TObject);
begin
  pnFilterParams.Visible := false;
end;

procedure TfrMainForm.btnFilterClick(Sender: TObject);
begin
  hideAllPanels;
  spMapPoint.Visible := false;

  cbFilterTypeShop.Checked := false;
  cbFilterTypeWarehouse.Checked := false;
  edFilterStreetVal.Text := '';
  edFilterHouseVal.Text := '';
  edFilterBuildingVal.Text := '';
  edFilterCapacityFromVal.Text := '';
  edFilterCapacityToVal.Text := '';
  edFilterUsedCapacityFromVal.Text := '';
  edFilterUsedCapacityToVal.Text := '';

  if (filter.buildingType and 1) <> 0 then
    cbFilterTypeShop.Checked := true;
  if (filter.buildingType and 2) <> 0 then
    cbFilterTypeWarehouse.Checked := true;
  if Length(filter.street) > 0 then
    edFilterStreetVal.Text := string(filter.street);
  if filter.house <> -1 then
    edFilterHouseVal.Text := intToStr(filter.house);
  if filter.building <> -1 then
    edFilterBuildingVal.Text := intToStr(filter.building);
  if filter.capacityFrom <> -1 then
    edFilterCapacityFromVal.Text := intToStr(filter.capacityFrom);
  if filter.capacityTo <> -1 then
    edFilterCapacityToVal.Text := intToStr(filter.capacityTo);
  if filter.usedCapacityFrom <> -1 then
    edFilterUsedCapacityFromVal.Text := intToStr(filter.usedCapacityFrom);
  if filter.usedCapacityTo <> -1 then
    edFilterUsedCapacityToVal.Text := intToStr(filter.usedCapacityTo);
  pnFilterParams.left := (pnMapWrap.width - pnFilterParams.width) shr 1;
  pnFilterParams.top := (pnMapWrap.height - pnFilterParams.height) shr 1;
  pnFilterParams.Visible := true;
end;

function TfrMainForm.cntFilteredItems: integer;
begin
  Result := 0;
  if not cbFilterTypeShop.Checked then
    Inc(Result);
  if not cbFilterTypeWarehouse.Checked then
    Inc(Result);
  if Length(edFilterStreetVal.Text) > 0 then
    Inc(Result);
  if Length(edFilterHouseVal.Text) > 0 then
    Inc(Result);
  if Length(edFilterBuildingVal.Text) > 0 then
    Inc(Result);
  if Length(edFilterCapacityFromVal.Text) > 0 then
    Inc(Result);
  if Length(edFilterCapacityToVal.Text) > 0 then
    Inc(Result);
  if Length(edFilterUsedCapacityFromVal.Text) > 0 then
    Inc(Result);
  if Length(edFilterUsedCapacityToVal.Text) > 0 then
    Inc(Result);
end;

procedure TfrMainForm.btnFilterConfirmClick(Sender: TObject);
var
  cntFilter: integer;
  objType: integer;
begin
  if (validateLetters(edFilterStreetVal))
     and ((validateFromTo(edFilterCapacityFromVal, edFilterCapacityToVal))
     and (validateFromTo(edFilterUsedCapacityFromVal, edFilterUsedCapacityToVal)))
  then
  begin
    cntFilter := cntFilteredItems;
    objType := 0;
    if cbFilterTypeShop.checked then
      objType := objType or 1;
    if cbFilterTypeWarehouse.checked then
      objType := objType or 2;

    //передать -1 в числовое поле, если пусто
    createFilter(filter, objType,
                 edFilterStreetVal.text,
                 validateNumberFromText(edFilterHouseVal.Text),
                 validateNumberFromText(edFilterBuildingVal.Text),
                 validateNumberFromText(edFilterCapacityFromVal.Text),
                 validateNumberFromText(edFilterCapacityToVal.Text),
                 validateNumberFromText(edFilterUsedCapacityFromVal.Text),
                 validateNumberFromText(edFilterUsedCapacityToVal.Text)
                 );
    ApplyFilter(shops, filter);
    ApplyFilter(warehouses, filter);
    pbMap.Invalidate;
    if cntFilter <> 0 then
      btnFilter.Caption := 'Фильтр (' + intToStr(cntFilter) + ')'
    else
      btnFilter.Caption := 'Фильтр';
    hideAllPanels;
  end;
end;

procedure TfrMainForm.btnFilterDefaultClick(Sender: TObject);
begin
  setFilterPanel;
end;

procedure TfrMainForm.btnCreateObjConfirmClick(Sender: TObject);
begin
  if validateCreateObj then
  begin
    if (
        (pnCreateObj.tag = 1) and (FindTreapName(shopsNames, getHash(edCreateObjName.Text)) <> nil)
        or
        (pnCreateObj.tag = 2) and (FindTreapName(warehousesNames, getHash(edCreateObjName.Text)) <> nil)
    ) then
    begin
      if pnCreateObj.tag = 1 then
      begin
        showMessage('Ошибка', 'Магазин с таким именем уже существует');
      end
      else
      begin
        showMessage('Ошибка', 'Склад с таким именем уже существует');
      end;
    end
    else
    begin
      edCreateObjName.Text := trim(edCreateObjName.Text);
      edCreateObjStreet.Text := trim(edCreateObjStreet.Text);

      if pnCreateObj.tag = 1 then
      begin
        //create shop
        createShop(Sender);
        Saved := false;
      end
      else if pnCreateObj.tag = 2 then
      begin
        //create warehouse
        createWarehouse(Sender);
        Saved := false;
      end
      else
      begin
        //error
      end;
      resetPnCreateObj;
      hideAllPanels;
      spMapPoint.visible := false;

      ApplyFilter(shops, filter);
      ApplyFilter(warehouses, filter);
      pbMap.Invalidate;
    end;
  end;
end;

procedure TfrMainForm.btnCreateSelectCancelClick(Sender: TObject);
begin
  pnCreateSelect.Visible := false;
  spMapPoint.visible := false;
end;


procedure TfrMainForm.btnAddItemCancelClick(Sender: TObject);
begin
  pnAddItem.Visible := false;
  ClearAddItem;
end;

procedure TfrMainForm.btnAddItemConfirmClick(Sender: TObject);
var
  node: PTreapNode;
  newItem: PItem;
  itemNode, newItemNode: PTreapItemNode;
begin
  if validateAddItem then
  begin
    if rbAddItemTypeShop.Checked then
      node := FindTreap(shops, strToInt(edAddItemDestID.Text) or mask)
    else
      node := FindTreap(warehouses, strToInt(edAddItemDestID.Text));

    itemNode := FindTreapItem(node^.Data^.Items, getHash(edAddItemName.Text));

    if itemNode <> nil then
      itemNode^.Data^.Count := itemNode^.Data^.Count + strToInt(edAddItemCnt.Text)
    else
    begin
      newItem := new(PItem);
      newItem^.name := shortString(edAddItemName.Text);
      newItem^.needToSend := 0;
      newItem^.category := shortString(edAddItemCategory.Text);
      newItem^.Volume := strToInt(edAddItemVol.Text);
      newItem^.Count := strToInt(edAddItemCnt.Text);
      newItem^.Key := getHash(string(newItem^.name));

      newItemNode := CreateNewItemNode(newItem);
      InsertTreapItem(node^.Data^.Items, newItemNode);
    end;

    node^.Data^.usedCapacity := node^.Data^.usedCapacity +
                                strToInt(edAddItemCnt.Text)
                                * strToInt(edAddItemVol.Text);
    pnAddItem.Visible := false;
    Saved := false;
    ClearAddItem;
  end;
end;

procedure TfrMainForm.btnCreateObjCancelClick(Sender: TObject);
begin
  pnCreateObj.Visible := false;
  edCreateObjName.Text := '';
  edCreateObjStreet.Text := '';
  edCreateObjHouse.Text := '';
  edCreateObjBuilding.Text := '';
  edCreateObjCapacity.Text := '';
  spMapPoint.visible := false;
end;


procedure TfrMainForm.imgMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  hideAllPanels;
  resetPnCreateObj;
  resetPnEditObj;

  xPos := X;
  yPos := Y;
  pnCreateSelect.BringToFront;
  showPanel(pnCreateSelect, xPos, yPos);

  //print green point
  spMapPoint.top := Y - spMapPoint.height shr 1;
  spMapPoint.left := X - spMapPoint.width shr 1;
  spMapPoint.BringToFront;
  spMapPoint.visible := true;
end;


procedure TfrMainForm.N11Click(Sender: TObject);
begin
  hideAllPanels;

  pnCreateShipment.left := (pnMapWrap.width - pnCreateShipment.width) shr 1;
  pnCreateShipment.top := (pnMapWrap.height - pnCreateShipment.height) shr 1;

  rbCreateShipmentSenderWarehouse.Checked := true;
  rbCreateShipmentDestShop.Checked := true;

  spMapPoint.visible := false;
  pnCreateShipment.Visible := true;
end;

procedure TfrMainForm.N13Click(Sender: TObject);
begin
  hideAllPanels;
  spMapPoint.Visible := false;
  pnAddItem.Visible := true;
  pnAddItem.Left := (pnMapWrap.Width - pnAddItem.Width) shr 1;
  pnAddItem.Top := (pnMapWrap.Height - pnAddItem.Height) shr 1;
end;


procedure TfrMainForm.N14Click(Sender: TObject);
begin
  frSelectShipments := TfrSelectShipments.Create(Application);
  frSelectShipments.LoadData(@shipments);
  frSelectShipments.ShowModal;
  pbMap.Invalidate;
end;

procedure TfrMainForm.N16Click(Sender: TObject);
begin
  frShipmentTableForm := TfrShipmentsTable.Create(Application);
  frShipmentTableForm.LoadData(shipments);
  frShipmentTableForm.ShowModal;
end;

procedure TfrMainForm.N3Click(Sender: TObject);
var
  curShipment, prev: PShipment;
  allDone: boolean;
begin
  allDone := true;
  if getconfirmation('Подтверждение действия', 'Вы подтверждаете действие?') then
  begin
    curShipment := shipments;
    while curShipment <> nil do
    begin
      allDone := doShipment(curShipment) and allDone;
      prev := curShipment;
      curShipment := curShipment^.next;
      Dispose(prev);
    end;
    pbMap.Invalidate;
    if not allDone then
      ShowMessage('Ошибка', 'Произошла ошибка!')
    else
      showMessage('Успешно', 'Все отгрузки выполнены');
    shipments := nil;
  end;
end;



procedure TfrMainForm.N6Click(Sender: TObject);
begin
  frBalanceForm := TfrBalance.Create(Application);
  frBalanceForm.SetData(shops, warehouses);
  frBalanceForm.ShowModal;
end;

end.
