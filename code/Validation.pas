unit Validation;

interface
  uses SysUtils, Vcl.Graphics, Vcl.StdCtrls;

  function validateLength(Sender: TObject): boolean;
  function validateLetters(Sender: TObject): boolean;
  function validateAll(Sender: TObject): boolean;
  var a: integer = 5;
implementation

function validateAll(Sender: TObject): boolean;
begin
  Result := validateLength(Sender);
  Result := validateLetters(Sender) and Result;
end;

function validateLetters(Sender: TObject): boolean;
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
          (lowerCase((Sender as TEdit).Text[i]) > 'ÿ')
          or (lowerCase((Sender as TEdit).Text[i]) < 'à'))
         )
       ) then
    begin
      (Sender as TEdit).color := clRed;
      Result := false;
    end;
  end;
end;

function validateLength(Sender: TObject): boolean;
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

end.
