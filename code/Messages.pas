unit Messages;

interface
uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

function getConfirmation: boolean;
procedure showError(const text: string);

implementation

function getConfirmation: boolean;
var
  Dlg: TForm;
  i: integer;
begin
  Dlg := CreateMessageDialog('Вы подтверждаете действие?',
                             mtConfirmation, [mbYes, mbNo]);
  try
    Dlg.Caption := 'Подтверждение действия';
    for i := 0 to Dlg.ComponentCount - 1 do
    begin
      if Dlg.Components[i] is TButton then
      begin
        with TButton(Dlg.Components[i]) do
        begin
          if ModalResult = mrYes then
            Caption := 'Да'
          else if ModalResult = mrNo then
            Caption := 'Нет';
        end;
      end;
    end;
    Result := Dlg.ShowModal = mrYes;
  finally
    Dlg.Free;
  end;
end;

procedure showError(const text: string);
var
  Dlg: TForm;
  i: integer;
begin
  Dlg := CreateMessageDialog(text,
                             mtConfirmation, [mbYes]);
  Dlg.Caption := 'Ошибка';
  for i := 0 to Dlg.ComponentCount - 1 do
  begin
    if Dlg.Components[i] is TButton then
    begin
      with TButton(Dlg.Components[i]) do
      begin
        if ModalResult = mrYes then
          Caption := 'Ок'
      end;
    end;
  end;
  if ((Dlg.ShowModal = mrYes) or true) then
    Dlg.Free;
  end;
end.
