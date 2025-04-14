unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  TLocationType = (ltStorage, ltShop);

  TLocation = record
    Name, street: string;
    house, building, capacity: integer;
    ID, X, Y: Integer;
  end;
  PLocation = ^TLocation;

  TShipment = record
    SourceID: Integer;       // ID склада
    DestinationID: Integer;  // ID магазина
    ProductID: integer;
    Quantity: Integer;
    DepartureTime: TDateTime;
  end;
  PShipment = ^TShipment;

  PTreapNode = ^TTreapNode;
  TTreapNode = record
    Data: PLocation;
    Left, Right: PTreapNode;
    Priority: Integer;
  end;

  TfrMainForm = class(TForm)
    pnNav: TPanel;
    btnNavMap: TButton;
    btnNavBalance: TButton;
    btnNavOrders: TButton;
    bntNavDelivery: TButton;
    btnNavAnalytics: TButton;
    pnMapWrap: TPanel;
    imgMap: TImage;
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

    //tree
    procedure InitTree;
    procedure Insert(var Root: PTreapNode; NewData: PLocation);
    procedure Split(Root: PTreapNode; Key: Integer; var L, R: PTreapNode);
    procedure Delete(var Root: PTreapNode; ID: Integer);
    procedure FreeTree(var Root: PTreapNode);

    function CreateNode(NewData: PLocation): PTreapNode;
    function Merge(L, R: PTreapNode): PTreapNode;
    function Find(Root: PTreapNode; ID: Integer): PLocation;
    //endtree

    procedure imgMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCreateSelectCancelClick(Sender: TObject);
    procedure btnCreateObjCancelClick(Sender: TObject);
    procedure callPnCreateObj(Sender: TObject);
    procedure btnCreateObjConfirmClick(Sender: TObject);


    function validateLength(Sender: TObject): boolean;
    function validateLetters(Sender: TObject): boolean;
    function validateAll(Sender: TObject): boolean;

    procedure OnClickValidateLength(Sender: TObject);
    procedure OnClickValidateLetters(Sender: TObject);
    procedure OnClickvalidateAll(Sender: TObject);

    procedure createShop(Sender: TObject);
    procedure createWarehouse(Sender: TObject);

    function validateCreateObj: boolean;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    xPos, yPos: integer;
    root: PTreapNode;
  public
    { Public declarations }
  end;

var
  frMainForm: TfrMainForm;

implementation

{$R *.dfm}

//tree
  procedure TfrMainForm.InitTree;
  begin
    root := nil;
  end;

  function TfrMainForm.Find(Root: PTreapNode; ID: Integer): PLocation;
  begin
    if Root = nil then
      Result := nil
    else if Root^.Data^.ID = ID then
      Result := Root^.Data
    else if ID < Root^.Data^.ID then
      Result := Find(Root^.Left, ID)
    else
      Result := Find(Root^.Right, ID);
  end;

  function TfrMainForm.CreateNode(NewData: PLocation): PTreapNode;
  begin
    New(Result);
    Result^.Data := NewData;
    Result^.Left := nil;
    Result^.Right := nil;
    repeat
      Result^.Priority := Random(MaxInt); // Генерация приоритета
    until Find(Root, NewData^.ID) <> nil;
  end;

  procedure TfrMainForm.Split(Root: PTreapNode; Key: Integer; var L, R: PTreapNode);
  begin
    if Root = nil then
    begin
      L := nil;
      R := nil;
    end
    else if Root^.Data^.ID < Key then
    begin
      Split(Root^.Right, Key, Root^.Right, R);
      L := Root;
    end
    else
    begin
      Split(Root^.Left, Key, L, Root^.Left);
      R := Root;
    end;
  end;

  function TfrMainForm.Merge(L, R: PTreapNode): PTreapNode;
  begin
    if (L = nil) then
      Result := R
    else if (R = nil) then
      Result := L
    else
    begin
      if L^.Priority > R^.Priority then
      begin
        L^.Right := Merge(L^.Right, R);
        Result := L;
      end
      else
      begin
        R^.Left := Merge(L, R^.Left);
        Result := R;
      end;
    end;
  end;

  procedure TfrMainForm.Insert(var Root: PTreapNode; NewData: PLocation);
  var
    L, R: PTreapNode;
  begin
    Split(Root, NewData^.ID, L, R);
    Root := Merge(Merge(L, CreateNode(NewData)), R);
  end;

  procedure TfrMainForm.Delete(var Root: PTreapNode; ID: Integer);
  var
    L, M, R: PTreapNode;
  begin
    Split(Root, ID, L, R);
    Split(R, ID + 1, M, R);
    if (M <> nil) and (M^.Data^.ID = ID) then
      Dispose(M);
    Root := Merge(L, R);
  end;

  procedure TfrMainForm.FreeTree(var Root: PTreapNode);
  begin
    if Root <> nil then
    begin
      FreeTree(Root^.Left);
      FreeTree(Root^.Right);
      Dispose(Root);
      Root := nil;
    end;
  end;
//end tree


procedure TfrMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
end;


procedure TfrMainForm.createShop(Sender: TObject);
var
  newObj: PLocation;
begin

end;

procedure TfrMainForm.createWarehouse(Sender: TObject);
var
  newObj: PLocation;
begin

end;

function TfrMainForm.validateAll(Sender: TObject): boolean;
begin
  Result := validateLength(Sender);
  Result := validateLetters(Sender) and Result;
end;

function TfrMainForm.validateLetters(Sender: TObject): boolean;
var
  i:integer;
begin
  Result := true;
  for i := Low((Sender as TEdit).Text) to High((Sender as TEdit).Text) do
  begin
    if (((Sender as TEdit).Text[i] <> ' ')
       and
         (
         (
          (lowerCase((Sender as TEdit).Text[i]) > 'z')
          or (lowerCase((Sender as TEdit).Text[i]) < 'a')
         )
         and
         (
          (lowerCase((Sender as TEdit).Text[i]) > 'я')
          or (lowerCase((Sender as TEdit).Text[i]) < 'а'))
         )
       ) then
    begin
      (Sender as TEdit).color := clRed;
      Result := false;
    end;
  end;
end;

function TfrMainForm.validateLength(Sender: TObject): boolean;
begin
  Result := true;
  (Sender as TEdit).Text := trimLeft((Sender as TEdit).Text);
  (Sender as TEdit).SelStart := Length((Sender as TEdit).Text);
  if Length((Sender as TEdit).Text) = 0 then
  begin
    (Sender as TEdit).color := clRed;
    Result := false;
  end;
end;

procedure TfrMainForm.OnClickValidateLetters(Sender: TObject);
begin
  if validateLetters(Sender) then
  begin
    (Sender as TEdit).color := clWindow;
  end;
end;

procedure TfrMainForm.OnClickValidateLength(Sender: TObject);
begin

  if validateLength(Sender) then
  begin
    (Sender as TEdit).color := clWindow;
  end;

end;

procedure TfrMainForm.OnClickvalidateAll(Sender: TObject);
begin
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

procedure TfrMainForm.callPnCreateObj(Sender: TObject);
begin
  pnCreateSelect.visible := false;

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
  if xPos + pnCreateObj.width > imgMap.width then
    pnCreateObj.left := pnCreateObj.left - pnCreateObj.width;

  pnCreateObj.tag := (Sender as TButton).tag;  //tag=1 - shop, tag=2 - Warehouse
  pnCreateObj.visible := true;
end;

procedure TfrMainForm.btnCreateObjConfirmClick(Sender: TObject);
begin
  if validateCreateObj then
  begin
    edCreateObjName.Text := trim(edCreateObjName.Text);
    edCreateObjStreet.Text := trim(edCreateObjStreet.Text);

    if (Sender as TButton).tag = 1 then
    begin
      //create shop
      createShop(Sender);
    end
    else if (Sender as TButton).tag = 2 then
    begin
      //create warehouse
      createWarehouse(Sender);
    end
    else
    begin
      //error
    end;
    edCreateObjName.Text := '';
    edCreateObjStreet.Text := '';
    edCreateObjHouse.Text := '';
    edCreateObjBuilding.Text := '';
    edCreateObjCapacity.Text := '';
    pnCreateObj.visible := false;
    spMapPoint.visible := false;
  end
  else
  begin

  end;
end;

procedure TfrMainForm.btnCreateSelectCancelClick(Sender: TObject);
begin
  pnCreateSelect.visible := false;
  spMapPoint.visible := false;
end;

procedure TfrMainForm.btnCreateObjCancelClick(Sender: TObject);
begin
  edCreateObjName.Text := '';
  edCreateObjStreet.Text := '';
  edCreateObjHouse.Text := '';
  edCreateObjBuilding.Text := '';
  edCreateObjCapacity.Text := '';
  pnCreateObj.visible := false;
  spMapPoint.visible := false;
end;


procedure TfrMainForm.imgMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  pnCreateObj.Visible := false;

  xPos := X;
  yPos := Y;

  //check y pos
  pnCreateSelect.top := Y;
  if Y >= pnCreateSelect.height then
    pnCreateSelect.top := pnCreateSelect.top - pnCreateSelect.height;

  //check x pos
  pnCreateSelect.left := X;
  if X + pnCreateSelect.width > imgMap.width then
    pnCreateSelect.left := pnCreateSelect.left - pnCreateSelect.width;

  pnCreateSelect.visible := true;

  //print green point
  spMapPoint.top := Y - spMapPoint.height shr 1;
  spMapPoint.left := X - spMapPoint.width shr 1;
  spMapPoint.visible := true;
end;

end.
