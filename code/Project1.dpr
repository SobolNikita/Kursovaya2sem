program Project1;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {frMainForm},
  CartesianTree in 'CartesianTree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrMainForm, frMainForm);
  Application.Run;
end.
