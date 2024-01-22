unit uFrmServerInfo;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Winapi.Windows, Winapi.Messages,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Vcl.ExtCtrls;

type
  //�����ǺŲ鿴��
  TEdit = Class(Vcl.StdCtrls.TEdit)
  private
    Display:Boolean;
    procedure WMGetText(var Message: TMessage); message WM_GETTEXT;
  end;

  TFrmServerInfo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSave: TButton;
    btnCancle: TButton;
    DataSource1: TDataSource;
    dbedHostName: TDBEdit;
    dbedHostIP: TDBEdit;
    dbedUserName: TDBEdit;
    dbMemo: TDBMemo;
    dbedHostPort: TDBEdit;
    Label7: TLabel;
    cbHostType: TDBComboBox;
    edtPassword: TEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure cbHostTypeChange(Sender: TObject);
  private
    { Private declarations }
    //�������γ���Ϣ
//    procedure WMDeviceChange(var Msg: TMessage); message WM_DEVICECHANGE;
  public
    { Public declarations }
  end;

var
  FrmServerInfo: TFrmServerInfo;

implementation


{$R *.dfm}

{ TEdit }
procedure TEdit.WMGetText(var Message: TMessage);
begin
    if Display then inherited;
end;


{ TFrmServerInfo }

procedure TFrmServerInfo.btnSaveClick(Sender: TObject);
var
  port:Integer;
begin
  if dbedHostName.Text='' then
  begin
    ShowMessage('����������Ϊ�գ�');
    dbedHostName.SetFocus;
    ModalResult:=mrNone;
  end;
  if dbedHostIP.Text='' then
  begin
    ShowMessage('IP/��������Ϊ�գ�');
    dbedHostIP.SetFocus;
    ModalResult:=mrNone;
  end;
  if dbedHostPort.Text='' then
  begin
    ShowMessage('�˿ڲ���Ϊ�գ�');
    dbedHostPort.SetFocus;
    ModalResult:=mrNone;
  end;
  if not TryStrToInt(dbedHostPort.Text,port) then
  begin
    ShowMessage('��Ч�Ķ˿ڣ�');
    dbedHostPort.SetFocus;
    ModalResult:=mrNone;
  end;
  if not (cbHostType.ItemIndex in [2,3])then   //telnet��vnc�������û�����¼
  begin
    if dbedUserName.Text='' then
    begin
      ShowMessage('��¼�ʺŲ���Ϊ�գ�');
      dbedUserName.SetFocus;
      ModalResult:=mrNone;
    end;
  end;
  edtPassword.Display := True;
  DataSource1.DataSet.FieldByName('user_pwd').AsString:=Trim(edtPassword.Text);
  edtPassword.Display := False;
end;

procedure TFrmServerInfo.cbHostTypeChange(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsInsert] then
  begin
    case cbHostType.ItemIndex of
      0:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=3389;
         DataSource1.DataSet.FieldByName('user_name').AsString:='administrator';
      end;
      1:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=22;
         DataSource1.DataSet.FieldByName('user_name').AsString:='root';
      end;
      2:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=23;
         DataSource1.DataSet.FieldByName('user_name').AsString:='admin';
      end;
      3:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=5900;
         DataSource1.DataSet.FieldByName('user_name').AsString:='';
      end;
      4:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=4899;
         DataSource1.DataSet.FieldByName('user_name').AsString:='admin';
      end;
      5:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=21;
         DataSource1.DataSet.FieldByName('user_name').AsString:='ftp';
      end;
      6,7:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=22;
         DataSource1.DataSet.FieldByName('user_name').AsString:='root';
      end;
      8:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=80;
         DataSource1.DataSet.FieldByName('user_name').AsString:='WebDAV';
      end;
      9:begin
         DataSource1.DataSet.FieldByName('host_port').AsInteger:=443;
         DataSource1.DataSet.FieldByName('user_name').AsString:='WebDAV';
      end;
//      10:begin
//        //�ܿ�
//      end;
    end;
  end;
end;

//��Ͷ����γ�ʱ�����´����б�
//procedure TFrmServerInfo.WMDeviceChange(var Msg: TMessage);
//var
//  reg: TRegistry;
//  ts: TStrings;
//  i: integer;
//begin
//  case Msg.WParam of
//    32768,32772:  //�������Ͱγ�'
//      begin
//        //  ComboBox1.Items.Clear;
//        reg := TRegistry.Create;
//        try
//          reg.RootKey := HKEY_LOCAL_MACHINE;
//          reg.OpenKey('hardware\devicemap\serialcomm', False);
//          ts := TStringList.Create;
//          reg.GetValueNames(ts);
//
//          for i := 0 to ts.Count - 1 do
//          begin
//      //      ComboBox1.Items.Add(reg.ReadString(ts.Strings[i]));
//          end;
//        finally
//          ts.Free;
//          reg.CloseKey;
//          reg.Free;
//        end;
//      end;
//  end;
//end;

end.
