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
    pnCreateObject: TPanel;
    btnCreateShop: TButton;
    btnCreateWarehouse: TButton;
    btnCreateCancel: TButton;
    spMapPoint: TShape;
    procedure imgMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCreateCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMainForm: TfrMainForm;

implementation

{$R *.dfm}


procedure TfrMainForm.btnCreateCancelClick(Sender: TObject);
begin
  pnCreateObject.Visible := false;
  spMapPoint.Visible := false;
end;

procedure TfrMainForm.imgMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pnCreateObject.top := Y-pnCreateObject.Height;
  pnCreateObject.left := X;
  pnCreateObject.Visible := true;

  spMapPoint.top := Y - spMapPoint.Height shr 1;
  spMapPoint.left := X - spMapPoint.Width shr 1;
  spMapPoint.Visible := true;

end;

end.
