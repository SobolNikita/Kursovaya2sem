program Project1;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {frMainForm},
  CartesianTree in 'CartesianTree.pas',
  Validation in 'Validation.pas',
  GetKeys in 'GetKeys.pas',
  CartesianTreeByName in 'CartesianTreeByName.pas',
  Hash in 'Hash.pas',
  Messages in 'Messages.pas',
  Filter in 'Filter.pas',
  CartesianTreeItem in 'CartesianTreeItem.pas',
  TableUnit in 'TableUnit.pas' {frTableForm},
  ShipmentsTableUnit in 'ShipmentsTableUnit.pas' {frShipmentsTable},
  shipments in 'shipments.pas',
  SelectShipmentsUnit in 'SelectShipmentsUnit.pas' {frSelectShipments},
  BalanceUnit in 'BalanceUnit.pas' {frBalance},
  ArrowsUnit in 'ArrowsUnit.pas',
  Types in 'Types.pas',
  Vars in 'Vars.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrMainForm, frMainForm);
  Application.CreateForm(TfrTableForm, frTableForm);
  Application.CreateForm(TfrShipmentsTable, frShipmentsTable);
  Application.CreateForm(TfrSelectShipments, frSelectShipments);
  Application.CreateForm(TfrBalance, frBalance);
  Application.Run;
end.
