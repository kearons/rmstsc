unit uFrmSetPwd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmSetPwd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TButton;
    btnCancle: TButton;
    cbSame: TCheckBox;
    edtSoftPwd: TEdit;
    edtExportPwd: TEdit;
    procedure cbSameClick(Sender: TObject);
    procedure edtSoftPwdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSetPwd: TFrmSetPwd;

implementation

{$R *.dfm}

procedure TFrmSetPwd.cbSameClick(Sender: TObject);
begin
  edtExportPwd.Enabled:= not cbSame.Checked;
  if cbSame.Checked then
  begin
    edtExportPwd.Text:=edtSoftPwd.Text;
  end;
end;

procedure TFrmSetPwd.edtSoftPwdChange(Sender: TObject);
begin
  if cbSame.Checked then
    edtExportPwd.Text:=edtSoftPwd.Text;
end;

end.
