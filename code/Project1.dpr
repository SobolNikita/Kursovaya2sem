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
  Filter in 'Filter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrMainForm, frMainForm);
  Application.Run;
end.
