unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  TfrMainForm = class(TForm)
    pnNav: TPanel;
    btnNavMap: TButton;
    btnNavBalance: TButton;
    btnNavOrders: TButton;
    bntNavDelivery: TButton;
    btnNavAnalytics: TButton;
    pnMapWrap: TPanel;
    imgMap: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMainForm: TfrMainForm;

implementation

{$R *.dfm}

end.
