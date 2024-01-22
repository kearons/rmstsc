unit uFrmSetup;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmSetup = class(TForm)
    btnOk: TButton;
    btnCancle: TButton;
    OpenDlg: TOpenDialog;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtPuttyPath: TEdit;
    btnSelectPuttyPath: TButton;
    btnSelectWinSCPPath: TButton;
    edtWinSCPPath: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    edtRadminPath: TEdit;
    btnSelectRadminPath: TButton;
    Label9: TLabel;
    edtVNCPath: TEdit;
    btnSelectVNCPath: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edtConnTime: TEdit;
    Label6: TLabel;
    edtUserWait: TEdit;
    Label7: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    cbPlayVoice: TCheckBox;
    cbViewStyle: TCheckBox;
    cbSmooth: TCheckBox;
    Label10: TLabel;
    rbIsAdmin: TRadioButton;
    rbIsConsole: TRadioButton;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    edtDomainList: TEdit;
    procedure btnSelectPuttyPathClick(Sender: TObject);
    procedure btnSelectWinSCPPathClick(Sender: TObject);
    procedure btnSelectRadminPathClick(Sender: TObject);
    procedure btnSelectVNCPathClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSetup: TFrmSetup;

implementation
uses
  uFrmMain;

{$R *.dfm}

procedure TFrmSetup.btnOkClick(Sender: TObject);
begin
  with  frmMain do
  begin
    SetGobalValue('PuttyPath',edtPuttyPath.Text);
    SetGobalValue('WinSCPPath',edtWinSCPPath.Text);
    SetGobalValue('RadminPath',edtRadminPath.Text);
    SetGobalValue('VNCPath',edtVNCPath.Text);
    SetGobalValue('DomainList',edtDomainList.Text);
    SetGobalValue('telnetConnTime',edtConnTime.Text);
    SetGobalValue('userTime',edtUserWait.Text);

    SetGobalValue('telnetConnTime',edtConnTime.Text);
    SetGobalValue('userTime',edtUserWait.Text);

    SetGobalValue('PlayVoice',BoolToStr(cbPlayVoice.Checked,True));
    SetGobalValue('ViewStyle',BoolToStr(cbViewStyle.Checked,True));
    SetGobalValue('Smooth',BoolToStr(cbSmooth.Checked,True));
    SetGobalValue('isAdmin',BoolToStr(rbIsAdmin.Checked,True));

    DomainList.CommaText:=edtDomainList.Text;
  end;
end;

procedure TFrmSetup.btnSelectPuttyPathClick(Sender: TObject);
begin
  OpenDlg.Title:='请选择Putty路径';
  if OpenDlg.Execute then
    edtPuttyPath.Text:=OpenDlg.FileName;
end;

procedure TFrmSetup.btnSelectRadminPathClick(Sender: TObject);
begin
 OpenDlg.Title:='请选择Radmin路径';
  if OpenDlg.Execute then
    edtRadminPath.Text:=OpenDlg.FileName;
end;

procedure TFrmSetup.btnSelectVNCPathClick(Sender: TObject);
begin
  OpenDlg.Title:='请选择VNC路径';
  if OpenDlg.Execute then
    edtVNCPath.Text:=OpenDlg.FileName;
end;

procedure TFrmSetup.btnSelectWinSCPPathClick(Sender: TObject);
begin
  OpenDlg.Title:='请选择WinSCP路径';
  if OpenDlg.Execute then
    edtWinSCPPath.Text:=OpenDlg.FileName;
end;

procedure TFrmSetup.FormShow(Sender: TObject);
begin
  edtPuttyPath.Text:=frmMain.GetGobalValue('PuttyPath');
  edtWinSCPPath.Text:=frmMain.GetGobalValue('WinSCPPath');
  edtRadminPath.Text:=frmMain.GetGobalValue('RadminPath');
  edtVNCPath.Text:=frmMain.GetGobalValue('VNCPath');

  edtDomainList.Text:=frmMain.GetGobalValue('DomainList');

  edtConnTime.Text:=frmMain.GetGobalValue('telnetConnTime','1500');
  edtUserWait.Text:=frmMain.GetGobalValue('userTime','500');

  cbPlayVoice.Checked:=frmMain.GetGobalValue('PlayVoice','False')='True';
  cbViewStyle.Checked:=frmMain.GetGobalValue('ViewStyle','True')='True';
  cbSmooth.Checked:=frmMain.GetGobalValue('Smooth','True')='True';
  rbIsAdmin.Checked:= frmMain.GetGobalValue('isAdmin','True')='True';

  rbIsConsole.Checked:=not rbIsAdmin.Checked;
end;

end.
