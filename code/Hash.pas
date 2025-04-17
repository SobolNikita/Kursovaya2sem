unit Hash;

interface

  procedure initHash(const userP, userM: integer);
  function getHash(const str: string): integer;

  var
    p: integer = 47;
    m: integer = 40009;
    pows: array[0..255] of integer;

implementation

  procedure initHash(const userP, userM: integer);
  var
    i: integer;
  begin
    p := userP;
    m := userM;
    pows[0] := 1;
    for i := 1 to High(pows) do
    begin
      pows[i] := pows[i-1] * p;
      pows[i] := pows[i] mod m;
    end;

  end;

  function getHash(const str: string): integer;
var
  i: Integer;
  begin
    Result := 0;
    for i := Low(str) to High(str) do
    begin
      Result := Result + ord(str[i]) * pows[i];
      Result := Result mod m;
    end;
  end;

end.
