unit Validation;

interface
  uses SysUtils, Vcl.Graphics, Vcl.StdCtrls, messages;

  function validateLength(Sender: TObject): boolean;
  function validateLetters(Sender: TObject): boolean;
  function validateAll(Sender: TObject): boolean;
  function validateFromTo(const firstField, secondField: TObject): boolean;
  procedure validateIntegerInput(Sender: TObject);
  procedure validateLengthLess70(Sender: TObject);

implementation

procedure validateLengthLess70(Sender: TObject);
var
  newString: string;
begin
  if Length((Sender as TEdit).Text) > 70 then
  begin
    newString := (Sender as TEdit).Text;
    Delete(newString, Length(newString), 1);
    (Sender as TEdit).Text := newString;
    showMessage('Внимание!', 'Длина строки должна быть не более 70 символов!');
  end;
end;

function validateAll(Sender: TObject): boolean;
begin
  Result := validateLength(Sender);
  Result := validateLetters(Sender) and Result;
end;

procedure validateIntegerInput(Sender: TObject);
var
  newString: string;
  i: integer;
begin
  // test 0
  if (Length((Sender as TEdit).Text) > 0) and ((Sender as TEdit).Text <> '0') then
  begin
    i := Low((Sender as TEdit).Text);
    while (i <= High((Sender as TEdit).Text)) and ((Sender as TEdit).Text[i] = '0') do
      Inc(i);
    if i > High((Sender as TEdit).Text) then
      newString := '0'
    else
    begin
      newString := '';
      while (i <= High((Sender as TEdit).Text)) and (Length(newString) < 10) do
      begin
        newString := newString + (Sender as TEdit).Text[i];
        Inc(i);
      end;

      if (Length(newString) < 10) or ((Length(newString) = 10)
                                       and (newString < intToStr(MaxInt))) then
      begin
        //pass
      end
      else
        Delete(newString, Length(newString), 1);
    end;

    if newString <> (Sender as TEdit).Text then
    begin
      showMessage('Внимание!', 'Число должно быть меньше 2147483647 и не содержать лидирующих нулей!');
      (Sender as TEdit).Text := newString;
    end;

  end;
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
         ((
         (
          (lowerCase((Sender as TEdit).Text[i]) > 'z')
          or (lowerCase((Sender as TEdit).Text[i]) < 'a')
         )
         and
         (
          ((Sender as TEdit).Text[i] > 'я')
          or ((Sender as TEdit).Text[i] < 'а'))
         ))
         and
         ((Sender as TEdit).Text[i] <> 'ё')
         and
         ((Sender as TEdit).Text[i] <> 'Ё')
         and
         (
          ((Sender as TEdit).Text[i] > 'Я')
          or ((Sender as TEdit).Text[i] < 'А')
         )
         and
         (
          ((Sender as TEdit).Text[i] > '9')
          or ((Sender as TEdit).Text[i] < '0')
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
  end
end;

function validateFromTo(const firstField, secondField: TObject): boolean;
begin
  Result := true;
  if (((Length((firstField as TEdit).Text) > 0) and (Length((secondField as TEdit).Text) > 0))
       and (strToInt((firstField as TEdit).text) > strToInt((secondField as TEdit).text)))
  then
    Result := false;
end;

end.
