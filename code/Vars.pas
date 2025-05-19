unit Vars;

interface

Uses Vcl.Graphics, System.Generics.Collections, Types;

var
  //ArrowsUnit
  Arrows: TList<PArrow>;

  //GetKeys
  shopKey: integer = 1;
  warehouseKey: integer = 1;
  curShipmentID: integer = 1;

  //Hash
  p: integer = 47;
  m: integer = 40009;
  pows: array[0..255] of integer;

  //MainUnit
  Saved: boolean;

const
  //MainUnitColors
  shopColor = clHighlight;
  warehouseColor = clMaroon;

  //ObjectMask
  mask = 1 shl 30;
implementation

end.
