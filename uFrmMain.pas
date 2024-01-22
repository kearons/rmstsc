unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, ClipBrd,EncdDecd,
  Vcl.ComCtrls, Vcl.ActnList, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Comp.Client,
  Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Phys.SQLite, FireDAC.Comp.Script,
  EhLibFireDAC, ToolCtrlsEh,
  GridsEh, DBGridEh,
  FireDAC.Comp.DataSet, System.Actions, DBGridEhGrouping, DBGridEhToolCtrls,
  DynVarsEh, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.ImageList, Vcl.ImgList, EhLibVCL, DBAxisGridsEh, Vcl.Imaging.pngimage;

const
  InputBoxMessage = WM_USER + 200;

type
  TfrmMain = class(TForm)
    StatusBar1: TStatusBar;
    Image1: TImage;
    Ds: TDataSource;
    ActionList1: TActionList;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    ActConn: TAction;
    ActAdd: TAction;
    ActEdit: TAction;
    ActDelete: TAction;
    TrayIcon1: TTrayIcon;
    PopupTray: TPopupMenu;
    N13: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ActExport: TAction;
    OpenDlg: TOpenDialog;
    ActImport: TAction;
    SaveDlg: TSaveDialog;
    Panel3: TPanel;
    PnlLeft: TPanel;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    pmTree: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N14: TMenuItem;
    ActAddGroup: TAction;
    ActAddSubGroup: TAction;
    ActDelGroup: TAction;
    ActReName: TAction;
    FDConn: TFDConnection;
    FDSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDSQLiteSecurity: TFDSQLiteSecurity;
    FDScript: TFDScript;
    FDServers: TFDQuery;
    FDGroup: TFDQuery;
    FDGlobal: TFDQuery;
    ActSetSoftPwd: TAction;
    pmGrid: TPopupMenu;
    ActCopy: TAction;
    N9: TMenuItem;
    ActFile: TAction;
    N7: TMenuItem;
    ActSetup: TAction;
    DataViewGrid: TDBGridEh;
    Panel5: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    cbDisk: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cbFBL: TComboBox;
    cbAll: TCheckBox;
    ActFind: TAction;
    ActSetLocal: TAction;
    ActSet: TAction;
    pnlMstsc: TPanel;
    pnlNps: TPanel;
    cbShowWallpaper: TCheckBox;
    GroupBox3: TGroupBox;
    cbRadminFullScreen: TCheckBox;
    cbRadminMode: TComboBox;
    Label3: TLabel;
    N19: TMenuItem;
    ActUP: TAction;
    ActDown: TAction;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    ActCopyToBase64: TAction;
    ActParseFromBase64: TAction;
    DBText1: TDBText;
    cbFBL2: TComboBox;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cdsServerNewRecord(DataSet: TDataSet);
    procedure ActConnExecute(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDeleteExecute(Sender: TObject);
    procedure ActConnUpdate(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure ActExportExecute(Sender: TObject);
    procedure ActImportExecute(Sender: TObject);
    procedure cbFBLChange(Sender: TObject);
    procedure cbFBL2Change(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
    procedure cbDiskClick(Sender: TObject);
    procedure TreeView1Deletion(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure ActAddGroupExecute(Sender: TObject);
    procedure ActAddSubGroupExecute(Sender: TObject);
    procedure ActDelGroupExecute(Sender: TObject);
    procedure ActReNameExecute(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FDGroupAfterScroll(DataSet: TDataSet);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure ActCopyExecute(Sender: TObject);
    procedure ActSetSoftPwdExecute(Sender: TObject);
    procedure ActSetSoftPwdUpdate(Sender: TObject);
    procedure ActExportUpdate(Sender: TObject);
    procedure ActImportUpdate(Sender: TObject);
    procedure ActAddGroupUpdate(Sender: TObject);
    procedure ActFileUpdate(Sender: TObject);
    procedure ActSetupExecute(Sender: TObject);
    procedure ActSetupUpdate(Sender: TObject);
    procedure ActFileExecute(Sender: TObject);
    procedure pmGridPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataViewGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ActEditUpdate(Sender: TObject);
    procedure ActFindExecute(Sender: TObject);
    procedure cbShowWallpaperClick(Sender: TObject);
    procedure cbRadminFullScreenClick(Sender: TObject);
    procedure ActUPExecute(Sender: TObject);
    procedure ActUPUpdate(Sender: TObject);
    procedure ActDownExecute(Sender: TObject);
    procedure ActDownUpdate(Sender: TObject);
    procedure ActCopyToBase64Execute(Sender: TObject);
    procedure ActParseFromBase64Execute(Sender: TObject);
    procedure DataViewGridDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DataViewGridDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DataViewGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DataViewGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    TryCount:Integer;
    dbFilePath:string;
    isLogin:Boolean;
    procedure OnMinsize(var msg: twmsyscommand); message wm_syscommand;
    //�����������*�Ŵ���
    procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
    procedure GlobalExceptionHandler(Sender: TObject; E: Exception);
    procedure IniFormControl;
    procedure MstscConnect;
    procedure RadminConnect;
    procedure VNCConnect;
    procedure SSHConnect;
    procedure TelnetConnect;
    procedure FTPConnect;
  public
    { Public declarations }
    DomainList:TStrings;
    function GetGobalValue(paramName:string; defaultValue:string=''):string;
    procedure SetGobalValue(paramName:string; Value:string);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uFrmServerInfo,RdpCrypt,DBTree, uFrmSetup,
  CommonFunc, Winapi.ShellAPI, uFrmSetPwd;

{$R *.dfm}

var
   SGC : TGridCoord;
   isLeftDown: Boolean;

procedure TfrmMain.OnMinsize(var msg: twmsyscommand);
begin
  if msg.CmdType = SC_MINIMIZE then
  begin
    Hide();
    msg.CmdType := SC_DEFAULT;
  end;
  inherited;
end;

procedure TfrmMain.pmGridPopup(Sender: TObject);
begin
  N7.Visible:= UpperCase(FDServers.FieldByName('host_type').AsString)='SSH';
  N19.Visible:= UpperCase(FDServers.FieldByName('host_type').AsString)='RADMIN';
end;


procedure TfrmMain.SetGobalValue(paramName, Value: string);
begin
   if FDGlobal.Locate('param_name',paramName,[]) then
   begin
     FDGlobal.Edit;
     FDGlobal.FieldByName('param_value').AsString:=Value;
     FDGlobal.Post;
   end
   else begin
     FDGlobal.Append;
     FDGlobal.FieldByName('param_name').AsString:= paramName;
     FDGlobal.FieldByName('param_value').AsString:= Value;
     FDGlobal.Post;
   end;
end;


procedure TfrmMain.ActAddExecute(Sender: TObject);
begin
  if not Assigned(FrmServerInfo) then
     FrmServerInfo:=TFrmServerInfo.Create(self);
   FrmServerInfo.Caption:='��ӷ�����';
   FrmServerInfo.btnSave.Caption:='���';
   FrmServerInfo.DataSource1.DataSet:=FDServers;
   FrmServerInfo.edtPassword.Text:='';
   FDServers.Insert;
   if FrmServerInfo.ShowModal=mrOk then
     FDServers.Post
   else
     FDServers.Cancel;
end;

procedure TfrmMain.ActAddGroupExecute(Sender: TObject);
begin
  addnode(FDGroup, treeview1);
end;

procedure TfrmMain.ActAddGroupUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:= PNodeInfo(TreeView1.Selected.Data)^.PID<>0;
end;

procedure TfrmMain.ActAddSubGroupExecute(Sender: TObject);
begin
  addchildnode(FDGroup, treeview1);
end;


procedure TfrmMain.ActConnUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=isLogin and FDServers.Active and (FDServers.RecordCount>0);
end;

procedure TfrmMain.ActCopyExecute(Sender: TObject);
var
  GroupID,host_port:Integer;
  host_type,host_name,host_ip,user_name,user_pwd,remark:string;
begin
  with FDServers do
  begin
    GroupID:=FieldByName('GroupID').AsInteger;
    host_type:=FieldByName('host_type').AsString;
    host_port:=FieldByName('host_port').AsInteger;
    host_name:=FieldByName('host_name').AsString;
    host_ip:=FieldByName('host_ip').AsString;
    user_name:=FieldByName('user_name').AsString;
    user_pwd:=FieldByName('user_pwd').AsString;
    remark:=FieldByName('remark').AsString;

    if not Assigned(FrmServerInfo) then
       FrmServerInfo:=TFrmServerInfo.Create(self);
    FrmServerInfo.Caption:='��ӷ�����';
    FrmServerInfo.btnSave.Caption:='���';
    FrmServerInfo.DataSource1.DataSet:=FDServers;
    FDServers.Insert;
    FieldByName('GroupID').AsInteger:=GroupID;
    FieldByName('host_type').AsString:=host_type;
    FieldByName('host_port').AsInteger:=host_port;
    FieldByName('host_name').AsString:=host_name+' ����';
    FieldByName('host_ip').AsString:=host_ip;
    FieldByName('user_name').AsString:=user_name;
    FieldByName('user_pwd').AsString:=user_pwd;
    FieldByName('remark').AsString:=remark;
    if FrmServerInfo.ShowModal=mrOk then
      FDServers.Post
    else
      FDServers.Cancel;
  end;
end;

procedure TfrmMain.ActCopyToBase64Execute(Sender: TObject);
var
  I:Integer;
  oldBookmark:TBookmark;
  HostList:TStrings;
  HostInfo,EncySr:string;
begin
  if FDServers.Active and (FDServers.RecordCount>0) then
  begin
    FDServers.DisableControls;
    oldBookmark:= FDServers.Bookmark;
    HostList:=TStringList.Create;
    try
      if dgMultiSelect in DataViewGrid.Options then
      begin
        for I := 0 to DataViewGrid.SelectedRows.Count-1 do
        begin
          FDServers.GotoBookmark(DataViewGrid.SelectedRows[i]);
          HostInfo:='host_port='+FDServers.FieldByName('host_port').AsString
                  +'&host_name='+FDServers.FieldByName('host_name').AsString+'&host_ip='+FDServers.FieldByName('host_ip').AsString
                  +'&user_name='+FDServers.FieldByName('user_name').AsString+'&user_pwd='+FDServers.FieldByName('user_pwd').AsString
                  +'&remark='+FDServers.FieldByName('remark').AsString;
          //ת����base64
          EncySr:= EncodeString(HostInfo).Replace(sLineBreak, '', [rfReplaceAll]);
          //���ܣ��������Ҫ��ע�͵�
//          EncySr:=EncryptString(EncySr);
          HostList.Add(FDServers.FieldByName('host_type').AsString+'://'+EncySr);
          Clipboard.AsText:=HostList.Text;
        end;
      end
      else begin
        HostInfo:='host_port='+FDServers.FieldByName('host_port').AsString
                  +'&host_name='+FDServers.FieldByName('host_name').AsString+'&host_ip='+FDServers.FieldByName('host_ip').AsString
                  +'&user_name='+FDServers.FieldByName('user_name').AsString+'&user_pwd='+FDServers.FieldByName('user_pwd').AsString
                  +'&remark='+FDServers.FieldByName('remark').AsString;
        //ת����base64
        EncySr:= EncodeString(HostInfo).Replace(sLineBreak, '', [rfReplaceAll]);
        //���ܣ��������Ҫ��ע�͵�
//        EncySr:=EncryptString(EncySr);
        Clipboard.AsText:=FDServers.FieldByName('host_type').AsString+'://'+EncySr;
      end;
    finally
      FDServers.GotoBookmark(oldBookmark);
      FDServers.EnableControls;
      HostList.Free;
    end;
  end;
end;

procedure TfrmMain.ActParseFromBase64Execute(Sender: TObject);
var
  I:Integer;
  HostList,HostInfo:TStrings;
  TempStr:string;
begin
  TempStr:=Clipboard.AsText;
  if TempStr<>'' then
  begin
    HostList:=TStringList.Create;
    HostInfo:=TStringList.Create;
    try
       HostList.Text:=TempStr;
       for I := 0 to HostList.Count-1 do
       begin
         if pos('://',HostList[i])<1 then Continue; //��ʽ���������
         TempStr:=Copy(HostList[i],pos('://',HostList[i])+3);
         //�������ʱ���ܣ�����Ҫ����
//         TempStr:=UnEncryptString(TempStr);
         TempStr:=DecodeString(TempStr);
         HostInfo.Delimiter := '&';
         HostInfo.DelimitedText := TempStr;
         try
           FDServers.Insert;
           FDServers.FieldByName('host_name').AsString:=HostInfo.Values['host_name'];
           FDServers.FieldByName('host_type').AsString:=Copy(HostList[i],0,pos('://',HostList[i])-1);
           FDServers.FieldByName('host_ip').AsString:=HostInfo.Values['host_ip'];
           FDServers.FieldByName('host_port').AsString:=HostInfo.Values['host_port'];
           FDServers.FieldByName('user_name').AsString:=HostInfo.Values['user_name'];
           FDServers.FieldByName('user_pwd').AsString:=HostInfo.Values['user_pwd'];
           FDServers.FieldByName('remark').AsString:=HostInfo.Values['remark'];
           FDServers.Post;
         except
           //���Դ���ĸ�ʽ
         end;
       end;
    finally
      HostList.Free;
      HostInfo.Free;
    end;
  end;

end;

procedure TfrmMain.ActDeleteExecute(Sender: TObject);
begin
  if FDServers.Active and (FDServers.RecordCount>0) then
  begin
    if DialogQuestion('ȷ��Ҫɾ��ѡ��ļ�¼��') then
    begin
      if dgMultiSelect in DataViewGrid.Options then
        DataViewGrid.SelectedRows.Delete
      else
        FDServers.Delete;
    end;
  end;
end;

procedure TfrmMain.ActDelGroupExecute(Sender: TObject);
var
  pid:Integer;
  CurrNode, vNode:TTreeNode;
begin
  //������ɾ����Ŀ¼
  if PNodeInfo(TreeView1.Selected.Data)^.ID=0 then Exit;
  if FDServers.Active and (FDServers.RecordCount>0) then
  begin
    if DialogQuestion('ɾ�������������������ǰ�������һ�����顣'+#13#10+'ȷ��Ҫɾ����ǰ������') then
    begin
      CurrNode:= TreeView1.Selected;
      pid:=PNodeInfo(CurrNode.Data)^.PID;
      //�ѵ�ǰ�ڵ���������������һ���ڵ�
      FDServers.First;
      while not FDServers.Eof do
      begin
         FDServers.Edit;
         FDServers.FieldByName('GroupID').AsInteger:=pid;
         FDServers.Post;
      end;

      //�ݹ������ӽڵ�
      vNode:=CurrNode.getFirstChild;
      if vNode<>nil then
      begin
        if FDGroup.Locate('ID',PNodeInfo(vNode.Data)^.ID,[]) then //ָ���ƶ�����ǰ�ڵ�
        begin
          While vNode<>nil do
          begin
            FDServers.First;
            while not FDServers.Eof do
            begin
               FDServers.Edit;
               FDServers.FieldByName('GroupID').AsInteger:=pid;
               FDServers.Post;
            end;
            vNode:=CurrNode.GetNextChild(vNode);
          end;
        end;
      end;
      DelTree(FDGroup, TreeView1);
    end;
  end
  else
     DelTree(FDGroup, TreeView1);
end;

//����
procedure TfrmMain.ActDownExecute(Sender: TObject);
var
  OldID:Integer;
  OldOrder,NewOrder:Integer;
begin
  FDServers.DisableControls;
  try
    OldOrder:=FDServers.FieldByName('orderby').AsInteger;
    OldID:=FDServers.FieldByName('id').AsInteger;

    FDServers.Next;
    if FDServers.Eof then Exit;
    NewOrder:=FDServers.FieldByName('orderby').AsInteger;
    FDServers.Edit;
    FDServers.FieldByName('orderby').AsInteger:=OldOrder;
    FDServers.Post;
    if FDServers.Locate('id',OldID,[]) then
    begin
      FDServers.Edit;
      FDServers.FieldByName('orderby').AsInteger:=NewOrder;
      FDServers.Post;
    end;
  finally
    FDServers.EnableControls;
  end;
end;


procedure TfrmMain.ActDownUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=isLogin and FDServers.Active and (FDServers.RecordCount>0) and not FDServers.Eof;
end;

procedure TfrmMain.ActEditExecute(Sender: TObject);
begin
  if not Assigned(FrmServerInfo) then
     FrmServerInfo:=TFrmServerInfo.Create(self);
   FrmServerInfo.Caption:='�޸ķ�����';
   FrmServerInfo.btnSave.Caption:='�޸�';
   FrmServerInfo.DataSource1.DataSet:=FDServers;
   FrmServerInfo.edtPassword.Text:=FDServers.FieldByName('user_pwd').AsString;
   FDServers.edit;
   if FrmServerInfo.ShowModal=mrOk then
     FDServers.Post
   else
     FDServers.Cancel;
end;

procedure TfrmMain.ActEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=isLogin and FDServers.Active and (FDServers.RecordCount>0)
   and (DataViewGrid.SelectedRows.Count<=1);
end;

//����
procedure TfrmMain.ActExportExecute(Sender: TObject);
var
  gmark:TBookmark;
  pGroupName,GroupName,DataStr: String;
  ALst: TStringList;
  pwd:string;
begin
  if GetGobalValue('ExportPwd')<>'' then
  begin
    PostMessage(Handle, InputBoxMessage, 0, 0);
    if InputQuery('������֤','����������',pwd) then
    begin
      if GetGobalValue('ExportPwd')<>pwd then
      begin
         DialogError('������������ԣ� ');
         exit;
      end;
    end
    else exit;
  end;

  if SaveDlg.Execute then
  begin
    ALst:=TStringList.Create;
    try
      FDGroup.AfterScroll:=nil;
      FDGroup.DisableControls;
      gmark:=FDGroup.GetBookmark;
      ALst.Add('�ϼ�����,��������,��������,������,ip/����,�˿�,�ʺ�,����,˳��,��ע');
      with FDServers do
      begin
        First;
        while not Eof do
        begin
          GroupName:='';
          if FDGroup.Locate('ID',FieldByName('GroupId').AsInteger,[]) then
          begin
            GroupName:=FDGroup.FieldByName('Caption').AsString;
            if FDGroup.Locate('ID',FDGroup.FieldByName('pid').AsString,[]) then
              pGroupName:=FDGroup.FieldByName('Caption').AsString;
          end;
          DataStr:=pGroupName+','+GroupName+','+FieldByName('host_type').AsString+','+FieldByName('host_name').AsString+','+FieldByName('host_ip').AsString+','
            +FieldByName('host_port').AsString+','+FieldByName('user_name').AsString+','+FieldByName('user_pwd').AsString
            +','+FieldByName('remark').AsString;
          ALst.Add(DataStr);
          Next;
        end;
      end;
      ALst.SaveToFile(SaveDlg.FileName);
      DialogInformation('�ļ�������'+SaveDlg.FileName);
    finally
      FDGroup.AfterScroll:=FDGroupAfterScroll;
      FDGroup.GotoBookmark(gmark);
      FDGroup.EnableControls;
      ALst.Free;
    end;
  end;
end;

procedure TfrmMain.ActExportUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:= isLogin and FDServers.Active and (FDServers.RecordCount>0);
end;

//linux�ļ�����
procedure TfrmMain.ActFileExecute(Sender: TObject);
var
  param,WinSCPPath,IP:string;
  I:Integer;
begin
  WinSCPPath:=ExtractFileDir(Application.ExeName)+'\WinSCP.exe'; //Ĭ��ȡ��ǰĿ¼
  if not FileExists(WinSCPPath) then WinSCPPath:=GetGobalValue('WinSCPPath'); //����ȡָ����Ŀ¼
  if FileExists(WinSCPPath) then
  begin
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;

    param:=FDServers.FieldByName('user_name').AsString+':'+FDServers.FieldByName('user_pwd').AsString+'@'+IP+':'+FDServers.FieldByName('host_port').AsString;
    ShellExecute(0, 'open', PChar(WinSCPPath),PChar(param), nil, SW_SHOW);
  end
  else begin
    DialogWarning('��ָ��WinSCP.exe·���� ');
    Exit
  end;
end;

procedure TfrmMain.ActFileUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=isLogin and FDServers.Active and (FDServers.RecordCount>0) and (FDServers.FieldByName('host_type').AsString='SSH');
end;

procedure TfrmMain.ActFindExecute(Sender: TObject);
begin
  DataViewGrid.SearchPanel.Enabled:=not DataViewGrid.SearchPanel.Enabled;
end;

//����
procedure TfrmMain.ActImportExecute(Sender: TObject);
var
  ALst,ARecord: TStringList;
  gmark:TBookmark;
  ErrorList,Temp: String;
  i,port:Integer;
  ATreeNode:TTreeNode;
begin
   if OpenDlg.Execute then
   begin
     ALst:=TStringList.Create;
     ARecord:=TStringList.Create;
     try
       FDGroup.AfterScroll:=nil;
       FDGroup.DisableControls;
       gmark:=FDGroup.GetBookmark;
       ALst.LoadFromFile(OpenDlg.FileName);
       ErrorList:='';

       for i := 0 to ALst.Count-1 do
       begin
         //�����ո���ֶ�
         ARecord.CommaText:=StringReplace(ALst[i],' ','~',[rfReplaceAll]);
         //У��
         if i=0 then  //������
         begin
           if ARecord.Count<9  then
           begin
             DialogError('��ʽ�����밴�����ĸ�ʽ���룡');
             Break;
             Exit;
           end;
           Continue;
         end;
         //�������͡���������IP���˿ڡ��ʺŲ���Ϊ��
         if (ARecord[2]='') or (ARecord[3]='') or (ARecord[4]='') or (ARecord[5]='') or ((UpperCase(ARecord[2])<>'TELNET') and (UpperCase(ARecord[2])<>'VNC') and (ARecord[6]='')) then
         begin
           ErrorList:=ErrorList+','+i.ToString;
           Continue
         end;
         //��Ч�Ķ˿�
         if not TryStrToInt(ARecord[5],port) then
         begin
           if i=1 then
             ErrorList:=i.ToString
           else
             ErrorList:=ErrorList+','+i.ToString;
           Continue
         end;
         ATreeNode:=MakeGroup(FDGroup,TreeView1,StringReplace(ARecord[0],'~',' ',[rfReplaceAll]),StringReplace(ARecord[1],'~',' ',[rfReplaceAll]));

         FDServers.Append;
         FDServers.FieldByName('groupid').AsInteger:=PNodeInfo(ATreeNode.Data)^.ID;
         FDServers.FieldByName('host_type').AsString:=ARecord[2];
         FDServers.FieldByName('host_name').AsString:=StringReplace(ARecord[3],'~',' ',[rfReplaceAll]);
         FDServers.FieldByName('host_ip').AsString:=ARecord[4];
         FDServers.FieldByName('host_port').AsInteger:=port;
         FDServers.FieldByName('user_name').AsString:=ARecord[6];
         FDServers.FieldByName('user_pwd').AsString:=StringReplace(ARecord[7],'~',' ',[rfReplaceAll]);
         //��ע�����ж���
         Temp:=Copy(ALst[i],Length(ARecord[0]+','+ARecord[1]+','+ARecord[2]+','+ARecord[3]+','+ARecord[4]+','+ARecord[5]+','+ARecord[6]+','+ARecord[7]+',')+1,Length(ALst[i]));
         Temp:=StringReplace(Temp,'~',' ',[rfReplaceAll]);
         FDServers.FieldByName('remark').AsString:=Temp;

         FDServers.Post;
       end;
       if ErrorList='' then
         DialogInformation('����ɹ���')
       else
         DialogError('��'+ErrorList+'�е���ʧ�ܣ�');
     finally
       FDGroup.AfterScroll:=FDGroupAfterScroll;
       FDGroup.GotoBookmark(gmark);
       FDGroup.EnableControls;
       ALst.Free;
       ARecord.Free;
     end;
   end;
end;

procedure TfrmMain.ActImportUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=isLogin;
end;

procedure TfrmMain.ActReNameExecute(Sender: TObject);
begin
  treeview1.Selected.EditText;
end;

procedure TfrmMain.ActSetSoftPwdExecute(Sender: TObject);
var
  Spwd,Epwd,pwd:string;
  isChecked:boolean;
begin
  Spwd:=GetGobalValue('SoftPwd');
  Epwd:=GetGobalValue('ExportPwd');
  if (Spwd<>'') or (Epwd<>'') then  //���������򵼳����룬����Ҫ����ԭ�����������
  begin
    PostMessage(Handle, InputBoxMessage, 0, 0);
    if InputQuery('������֤','����������',pwd) then
    begin
      if Spwd<>'' then   //�����������룬�����������
      begin
        if Spwd<>pwd then
        begin
           DialogError('������������ԣ� ');
           exit;
        end;
      end
      else if Epwd<>'' then   //����������Ϊ�գ��е������룬���䵼������
      begin
        if Epwd<>pwd then
        begin
           DialogError('������������ԣ� ');
           exit;
        end;
      end;
    end
    else exit;
  end;

  if not Assigned(FrmSetPwd) then
    FrmSetPwd:=TFrmSetPwd.Create(Self);
  FrmSetPwd.edtSoftPwd.Text:=GetGobalValue('SoftPwd');
  FrmSetPwd.edtExportPwd.Text:=GetGobalValue('ExportPwd');
  isChecked:=StrToBool(GetGobalValue('IsSamePwd'));
  FrmSetPwd.cbSame.Checked:=isChecked;
  if FrmSetPwd.ShowModal=mrOk then
  begin
    SetGobalValue('SoftPwd',FrmSetPwd.edtSoftPwd.Text);
    SetGobalValue('ExportPwd',FrmSetPwd.edtExportPwd.Text);
    SetGobalValue('IsSamePwd',BoolToStr(FrmSetPwd.cbSame.Checked));
  end;
end;

procedure TfrmMain.ActSetSoftPwdUpdate(Sender: TObject);
begin
   TAction(Sender).Enabled:=isLogin;
end;

procedure TfrmMain.ActSetupExecute(Sender: TObject);
begin
  if not Assigned(FrmSetup) then
    FrmSetup:=TFrmSetup.Create(Self);

  FrmSetup.ShowModal;
end;

procedure TfrmMain.ActSetupUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=isLogin;
end;

procedure TfrmMain.ActUPExecute(Sender: TObject); //���ƣ��Ե�orderby��ֵ
var
  OldID:Integer;
  OldOrder,NewOrder:Integer;
begin
  FDServers.DisableControls;
  try
    OldOrder:=FDServers.FieldByName('orderby').AsInteger;
    OldID:=FDServers.FieldByName('id').AsInteger;

    FDServers.Prior;
    if FDServers.Bof then Exit;
    NewOrder:=FDServers.FieldByName('orderby').AsInteger;
    FDServers.Edit;
    FDServers.FieldByName('orderby').AsInteger:=OldOrder;
    FDServers.Post;
    if FDServers.Locate('id',OldID,[]) then
    begin
      FDServers.Edit;
      FDServers.FieldByName('orderby').AsInteger:=NewOrder;
      FDServers.Post;
    end;
  finally
    FDServers.EnableControls;
  end;
end;

procedure TfrmMain.ActUPUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=FDServers.Active and (FDServers.RecordCount>0) and not FDServers.Bof;
end;

procedure TfrmMain.cbAllClick(Sender: TObject);
begin
  SetGobalValue('FullScreen',BoolToStr(cbAll.Checked, True));
  cbFBL.Enabled:= not cbAll.Checked;
  cbFBL2.Enabled:= not cbAll.Checked;
end;

procedure TfrmMain.cbDiskClick(Sender: TObject);
begin
  SetGobalValue('ConnDisk',BoolToStr(cbDisk.Checked, True));
end;

procedure TfrmMain.cbFBLChange(Sender: TObject);
begin
  SetGobalValue('PPI',IntToStr(cbFBL.ItemIndex));
  cbFBL.Enabled:= not cbAll.Checked;
end;

procedure TfrmMain.cbFBL2Change(Sender: TObject);
begin
  SetGobalValue('Scale',IntToStr(cbFBL2.ItemIndex));
  cbFBL.Enabled:= not cbAll.Checked;
end;

procedure TfrmMain.cbRadminFullScreenClick(Sender: TObject);
begin
  SetGobalValue('RadminFullScreen',BoolToStr(cbRadminFullScreen.Checked, True));
end;

procedure TfrmMain.cbShowWallpaperClick(Sender: TObject);
begin
  SetGobalValue('ShowWallpaper',BoolToStr(cbShowWallpaper.Checked, True));
end;

procedure TfrmMain.FDGroupAfterScroll(DataSet: TDataSet);
begin
  if DataSet.FieldByName('pid').AsInteger=0 then
  begin
    FDServers.Filter:='';
    FDServers.Filtered:=False;
  end
  else begin
    FDServers.Filter:='GroupId='+DataSet.FieldByName('id').AsString;
    FDServers.Filtered:=True;
  end;

end;

procedure TfrmMain.cdsServerNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('host_name').AsString:='������';
   DataSet.FieldByName('host_type').AsString:='RDP';
   DataSet.FieldByName('host_ip').AsString:='127.0.0.1';
   DataSet.FieldByName('host_port').AsString:='3389';
   DataSet.FieldByName('user_name').AsString:='administrator';
   DataSet.FieldByName('GroupId').AsInteger:=FDGroup.FieldByName('id').AsInteger;
   DataSet.FieldByName('orderby').AsInteger:=FDConn.GetLastAutoGenValue('Servers');
end;

procedure TfrmMain.DataViewGridDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  DG : TDBGridEh;
  GC : TGridCoord;
  lastOrderby, i, MoveRecCount : Integer;
begin
  DG := Sender as TDBGridEh;
  //��ǰ������µĵ�Ԫ��
  GC := DG.MouseCoord(X,Y);
  with DG.DataSource.DataSet do
  begin
    DisableControls;
    try
    MoveRecCount := GC.Y-DG.Row;   //Ҫ�ƶ�������
    if MoveRecCount>0 then         //������
    begin
       for I := 0 to Abs(MoveRecCount)-1 do
         ActDown.Execute;
    end
    else if (MoveRecCount<0) then
    begin                          //��ǰ��
       for I := 0 to Abs(MoveRecCount)-1 do
         ActUP.Execute;
    end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmMain.DataViewGridDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  GC : TGridCoord;
begin
  GC := (Sender as TDBGridEh).MouseCoord(X,Y);
  Accept := Source is TDBGridEh and (GC.X > 0) and (GC.Y > 0);
end;

procedure TfrmMain.DataViewGridGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if DataViewGrid.SumList.RecNo mod 2 = 1 then
  begin
    Background := clWhite
  end
  else
  begin
    Background := $00FFDDDD;
  end;
end;

procedure TfrmMain.DataViewGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
//  DG : TDBGridEh;
begin
//  if button=mbLeft then  //�������
//  begin
//    DG := Sender as TDBGridEh;
//    SGC := DG.MouseCoord(X,Y);
//    if (SGC.X > 0) and (SGC.Y > 0) then
//      (Sender as TDBGridEh).BeginDrag(False)
//  end;
end;

procedure TfrmMain.DataViewGridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  DG : TDBGridEh;
begin
  if ssLeft in Shift then  //�������
  begin
    DG := Sender as TDBGridEh;
    SGC := DG.MouseCoord(X,Y);
    if (SGC.X > 0) and (SGC.Y > 0) then
      (Sender as TDBGridEh).BeginDrag(False)
  end;
end;


procedure TfrmMain.FormCreate(Sender: TObject);
var
  ScriptList:TStrings;
begin
  Application.OnException := GlobalExceptionHandler;
  isLogin:=False;
  TryCount:=0;

  dbFilePath:=ExtractFileDir(Application.ExeName) +'\setup.sdb';
  if not FileExists(dbFilePath) then
  begin
    ScriptList:=TStringList.Create;
    try
       //�������ݿ�
      FDConn.Connected := False;
      FDConn.Params.Clear;
      FDConn.Params.DriverID := 'SQLite';
      FDConn.Params.Database := dbFilePath;
      FDConn.Connected := True;
      //��ʼ�����ݿ�
      //���������
      ScriptList.Add('create table Groups ('
                    +'  id integer PRIMARY KEY autoincrement,'
                    +'  caption varchar (50),'
                    +'  pid integer'
                    +');');
      ScriptList.Add('insert into Groups (caption,pid) values (''��Ŀ¼'',0);');
      //������������
      ScriptList.Add('create table Servers('
                    +'  id integer PRIMARY KEY autoincrement,'
                    +'  host_type varchar (20),'      //V3�汾���Ӵ��ֶ�
                    +'  GroupID integer,'
                    +'  host_name varchar (50),'
                    +'  host_ip varchar (50),'
                    +'  host_port integer,'
                    +'  user_name varchar (50),'
                    +'  user_pwd varchar (50),'
                    +'  remark varchar (300),'
                    +'  orderby integer default 1'
                    +');');
      //����ȫ�ֲ�����
      ScriptList.Add('create table Global('
                    +'  id integer PRIMARY KEY autoincrement,'
                    +'  param_name varchar (50),'
                    +'  param_value varchar (200)'
                    +');');
      ScriptList.Add('insert into Global (param_name,param_value) values (''isAdmin'',''True'');');      //��¼��ʽ
      ScriptList.Add('insert into Global (param_name,param_value) values (''ConnDisk'',''False'');');    //���ӱ��ش���
      ScriptList.Add('insert into Global (param_name,param_value) values (''ShowWallpaper'',''False'');'); //���汳��
      ScriptList.Add('insert into Global (param_name,param_value) values (''FullScreen'',''False'');');  //�Ƿ�ȫ��
      ScriptList.Add('insert into Global (param_name,param_value) values (''RadminFullScreen'',''False'');');  //�Ƿ�ȫ��
      ScriptList.Add('insert into Global (param_name,param_value) values (''PPI'',''8'');');             //�ֱ���
      ScriptList.Add('insert into Global (param_name,param_value) values (''ExportPwd'','''');');        //��������
      ScriptList.Add('insert into Global (param_name,param_value) values (''SoftPwd'','''');');          //�������
      ScriptList.Add('insert into Global (param_name,param_value) values (''IsSamePwd'',''False'');');   //���������Ƿ���ͬ
      ScriptList.Add('insert into Global (param_name,param_value) values (''MultiSelect'',''False'');'); //Grid�ɶ�ѡ
      FDScript.ExecuteScript(ScriptList);
      //�������ݿ�
      FDConn.Connected := False;
      FDSQLiteSecurity.Database := dbFilePath;
      FDSQLiteSecurity.Password := 'aes-256:rmstsc2020';
      FDSQLiteSecurity.SetPassword;
    finally
      ScriptList.Free;
    end;
  end;
  FDConn.Params.Database := dbFilePath;
  FDConn.Params.Values['Encrypt'] := 'aes-256';
  FDConn.Params.Password := 'rmstsc2020';
  FDConn.Connected := True;
  //ȫ�ֲ�����
  FDGlobal.Close;
  FDGlobal.Open('select * from Global');
  //�����
  FDGroup.Open('select * from Groups');
  MakeTree(FDGroup,TreeView1);

  //��������
  FDServers.Open('select * from Servers');

  //��ʼ������
  IniFormControl;
end;

procedure TfrmMain.IniFormControl;
var
  i:Integer;
begin
  //����ߺͿ�
  if GetGobalValue('Width')<>'' then
    Self.Width:=StrToInt(GetGobalValue('Width'));
  if GetGobalValue('Height')<>'' then
    Self.Height:=StrToInt(GetGobalValue('Height'));
  //��߷�����
  if GetGobalValue('PnlLefWidth')<>'' then
    PnlLeft.Width:=StrToInt(GetGobalValue('PnlLefWidth'));

  //���Ӳ���
  cbDisk.Checked:=GetGobalValue('ConnDisk')='True';
  cbShowWallpaper.Checked:=GetGobalValue('ShowWallpaper','False')='True';
  cbAll.Checked:=GetGobalValue('FullScreen','False')='True';
  cbRadminFullScreen.Checked:=GetGobalValue('RadminFullScreen','False')='True';

  cbFBL.ItemIndex:= StrToInt(GetGobalValue('PPI'));
  cbFBL2.ItemIndex:=StrToInt(GetGobalValue('Scale', '2'));
  //���ݱ���Ⱥ�λ��
  for I := 0 to DataViewGrid.Columns.Count-1 do
  begin
    //�п�
    if GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Width')<>'' then
      DataViewGrid.Columns[i].Width:=StrToInt(GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Width'));
    //��λ��
    if GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Index')<>'' then
      DataViewGrid.Columns[i].Index:=StrToInt(GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Index'));
  end;
  //��ȡҪ�����Ķ�̬�����б�
  DomainList:=TStringlist.Create;
  DomainList.CommaText:=GetGobalValue('DomainList');
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i:Integer;
begin
  //��¼����λ��
  SetGobalValue('Width',IntToStr(Self.Width));
  SetGobalValue('Height',IntToStr(Self.Height));

  SetGobalValue('PnlLefWidth',IntToStr(PnlLeft.Width));
  //�������ݱ���Ⱥ�λ��
  for I := 0 to DataViewGrid.Columns.Count-1 do
  begin
    //�п�
    SetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Width',IntToStr(DataViewGrid.Columns[i].Width));
    //��λ��
    SetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Index',IntToStr(DataViewGrid.Columns[i].Index));
  end;
  DomainList.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  pwd:string;
  label TryAgain;
begin
  if GetGobalValue('SoftPwd')<>'' then
  begin
    if not isLogin then
    begin
      TryAgain:
      PostMessage(Handle, InputBoxMessage, 0, 0);
      if InputQuery('������֤','����������',pwd) then
      begin
        if GetGobalValue('SoftPwd')<>pwd then
        begin
           inc(TryCount);
           if TryCount>=3 then
           begin
             DialogError('������󳬹�3�Σ������˳���');
             Close;
           end
           else
             DialogError('������������ԣ� ');
           goto TryAgain;
        end
        else isLogin:=True;
      end
      else Close;
    end;
  end
  else isLogin:=True;  //δ��������
end;

function TfrmMain.GetGobalValue(paramName: string; defaultValue:string=''): string;
begin
  Result:='';
  if FDGlobal.Locate('param_name',paramName,[]) then
   begin
     Result:=FDGlobal.FieldByName('param_value').AsString;
     if Result='' then
       Result:=defaultValue;
   end
   else begin
      FDGlobal.Insert;
      FDGlobal.FieldByName('param_name').AsString:= paramName;
      FDGlobal.FieldByName('param_value').AsString:= defaultValue;
      FDGlobal.Post;
   end;
end;

procedure TfrmMain.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

procedure TfrmMain.N13Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  self.Show;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  self.Hide;
end;

procedure TfrmMain.TrayIcon1Click(Sender: TObject);
begin
  Visible := not Visible;
end;

procedure TfrmMain.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  FDGroup.Locate('id',PNodeInfo(node.Data)^.ID,[]);
end;

procedure TfrmMain.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
  Dispose(PNodeInfo(Node.data));
end;

procedure TfrmMain.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
   AnItem: TTreeNode;
   i:Integer;
begin
   with Sender as TTreeView do
   begin
     AnItem := GetNodeAt(X, Y);
     with Source as TDBGridEh do
     begin
       for I := 0 to SelectedRows.Count-1 do
       begin
         FDServers.GotoBookmark(SelectedRows.Items[i]);
         FDServers.Edit;
         FDServers.FieldByName('GroupID').AsInteger:= PNodeInfo(AnItem.Data)^.ID;
         FDServers.Post;
       end;
     end;
     AnItem.Expand(True);
   end;
end;

procedure TfrmMain.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TDBGridEh;
end;

procedure TfrmMain.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: string);
begin
  FDGroup.Edit;
  FDGroup.FieldByName('caption').AsString := S;
  FDGroup.post;
end;

procedure TfrmMain.TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  if mbRight = Button then with TTreeView(Sender) do
  begin
    Node := GetNodeAt(X, Y);
    if Node <> nil then
    begin
      Selected := Node;
      Selected.Focused := True;
    end;
  end;
end;

procedure TfrmMain.GlobalExceptionHandler(Sender: TObject; E: Exception);
begin
  //
end;

procedure TfrmMain.ActConnExecute(Sender: TObject);
begin
  DataViewGrid.EndDrag(false);
  TreeView1.EndDrag(false);
  if not FDServers.Active or (FDServers.RecordCount=0) then
    Exit;

  if FDServers.FieldByName('host_type').AsString='RDP' then
    MstscConnect
  else if FDServers.FieldByName('host_type').AsString='VNC' then
    VNCConnect
  else if UpperCase(FDServers.FieldByName('host_type').AsString)='RADMIN' then
    RadminConnect
  else if UpperCase(FDServers.FieldByName('host_type').AsString)='TELNET' then
    TelnetConnect
  else if UpperCase(FDServers.FieldByName('host_type').AsString)='SSH' then
    SSHConnect
  else if (UpperCase(FDServers.FieldByName('host_type').AsString)='FTP')
    or (UpperCase(FDServers.FieldByName('host_type').AsString)='SFTP')
    or (UpperCase(FDServers.FieldByName('host_type').AsString)='SCP')
    or (UpperCase(FDServers.FieldByName('host_type').AsString)='HTTP')
    or (UpperCase(FDServers.FieldByName('host_type').AsString)='HTTPS') then
    FTPConnect;
end;


procedure TfrmMain.MstscConnect;
  procedure ConnToServer(var rdpList:TStrings; var FileList:TStrings);
  var
    param:string;
    rdpFilePath,IP:string;
    i,w,h,capWidth,barWidth:Integer;
    TrayWnd: HWnd; //���������
    Rec    : TRect;
    rdpWnd : HWND; //rdp���
    rdpMnu : HMENU;
    WaitedTime:Cardinal;
    im, iz : integer;
    curMosPoint: TPoint;
    R, RL: TRect;
    title: array[0..254] of Char;
  begin
    rdpList.Clear;
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;
    //rdp��������https://www.cnblogs.com/fox2013/p/3903624.html
    if cbFBL.ItemIndex=cbFBL.Items.Count-1 then  //�������
    begin
      //��ǰ���Էֱ���
      w:=GetSystemMetrics(SM_CXSCREEN);
      h:=GetSystemMetrics(SM_CYSCREEN);
      //���ڱ���߶�
      capWidth:=GetSystemMetrics(SM_CYCAPTION);
      TrayWnd := FindWindow('Shell_TrayWnd',nil);
      GetWindowRect(TrayWnd, Rec);
      //�������߶�
      barWidth:= Rec.Bottom -Rec.Top;
      //��
      rdpList.Add('desktopwidth:i:'+IntToStr(w));
      //��
      rdpList.Add('desktopheight:i:'+IntToStr(h-capWidth-barWidth));
    end
    else begin
      //��
      rdpList.Add('desktopwidth:i:'+trim(copy(cbFBL.Text,1,Pos('x',cbFBL.Text)-1)));
      //��
      rdpList.Add('desktopheight:i:'+trim(copy(cbFBL.Text,Pos('x',cbFBL.Text)+1)));
    end;

    //��ɫλ
    rdpList.Add('session bpp:i:32');
    // Ĭ��
    rdpList.Add('winposstr:s:2,3,0,0,900,700');
    //�����ݴ��䵽�ͻ��˼����ʱ�Ƿ�����ݽ���ѹ�� 0������ѹ�� 1 ����ѹ��
    rdpList.Add('compression:i:1');
    //����Alt-TAB�������� - 0���ڱ��ؼ������Ӧ�� Windows ��ϼ� - 1���Խ�ʱ����Զ�̼������Ӧ�� Windows ��ϼ� - 2������ȫ��ģʽ�£���Զ�̼������Ӧ�� Windows ��ϼ�
    rdpList.Add('keyboardhook:i:1');
//    rdpList.Add('authentication level:i:0');
    //ճ��
    rdpList.Add('redirectclipboard:i:1');
    //�Ƿ��Զ����Ӵ���������
    rdpList.Add('redirectdrives:i:1');
    //PnP���弴���豸
    rdpList.Add('devicestoredirect:s:');
    //�Ƿ��Զ����Ӵ�ӡ��
    rdpList.Add('redirectprinters:i:0');
    //�Ƿ��Զ�����COM���п�
    rdpList.Add('redirectcomports:i:0');
    //�Ƿ��Զ��������ܿ�
    rdpList.Add('redirectsmartcards:i:0');
    //ȫ��ģʽʱ�Ƿ���ʾ������ 0������������ 1����������
    rdpList.Add('displayconnectionbar:i:1');
    //�ڶϿ����Ӻ��Ƿ��Զ�������������
    rdpList.Add('autoreconnection enabled:i:1');
    //��
    rdpList.Add('domain:s:');
    //RDP��������ʱ�Ƿ��Զ���������  ��·�����ļ���
    rdpList.Add('alternate shell:s:');
    //RDP��������ʱ�Զ�������Ӧ�ó������ڵ��ļ���λ�ó� ��·�����ļ���
    rdpList.Add('shell working directory:s:');
    //���ļ����ϵ���λ��ʱ�Ƿ���ʾ�ļ�������
    rdpList.Add('disable full window drag:i:1');
    //��¼��Զ�̼����ʱ�˵��ʹ��ڵ���ʾ��ʽ 0����˵��ʹ��ڶ���  1������˵��ʹ��ڶ���
    rdpList.Add('disable menu anims:i:1');
    //�Ƿ���������  0�������� 1����������
    rdpList.Add('disable themes:i:0 ');
    //
    rdpList.Add('disable cursor setting:i:0');

    //�Ƿ�λͼ�����ڱ��ؼ������
    rdpList.Add('bitmapcachepersistenable:i:1');
    rdpList.Add('authentication level:i:0');
    rdpList.Add('prompt for credentials:i:0');
    rdpList.Add('promptcredentialonce:i:1');
    //rdpList.Add('desktopscalefactor:i:500');

    // ���ӵ�ַ
    rdpList.Add('full address:s:'+IP+':'+FDServers.FieldByName('host_port').AsString);
    //�û���
    rdpList.Add('username:s:'+FDServers.FieldByName('user_name').AsString);
    //RDP�����������
    if FDServers.FieldByName('user_pwd').AsString<>'' then
      rdpList.Add('password 51:b:'+CryptRDPPassword(FDServers.FieldByName('user_pwd').AsString));

    //ȫ��ģʽ
    if cbAll.Checked then
    begin
       rdpList.Add('screen mode id:i:0') ;
       //ѡ��-��ʾ-���ҵ����м���������Զ�̻Ự����ѡʱǿ��ȫ�������÷ֱ�����Ч����ѡʱֵΪ1
       rdpList.Add('Use Multimon:i:1');
    end
    else rdpList.Add('screen mode id:i:1');
    //��������  0�ڿͻ��˼�����ϲ������� 1����������ϲ������� 2����������
    if GetGobalValue('PlayVoice')='True' then rdpList.Add('audiomode:i:0')
    else rdpList.Add('audiomode:i:2');
    //���ӱ���Ӳ�� *��ʾ���з���
    if cbDisk.Checked then rdpList.Add('drivestoredirect:s:*')
    else rdpList.Add('drivestoredirect:s:');
    //�Ƿ���ʾ���汳��
    if cbShowWallpaper.Checked then rdpList.Add('disable wallpaper:i:0')
    else rdpList.Add('disable wallpaper:i:1');
    //�ֶ�ƽ��
    if GetGobalValue('Smooth')='True' then  rdpList.Add('allow font smoothing:i:1')
    else rdpList.Add('allow font smoothing:i:0');
    //�Ӿ���ʽ
    if GetGobalValue('ViewStyle')='False' then  rdpList.Add('disable themes:i:1')
    else rdpList.Add('disable themes:i:0');

    rdpFilePath:=StringReplace(FDServers.FieldByName('host_name').AsString,' ','',[rfReplaceAll])+'.rdp';
    rdpList.SaveToFile(rdpFilePath);
    if GetGobalValue('isAdmin')='True' then
      Param:='/admin'
    else
      param:='/console';
    param:=param+' '+rdpFilePath;
    //����windows�Դ���mstsc����
    rdpWnd := ShellExecute(0, 'open', PChar('mstsc.exe'),PChar(param), nil, SW_SHOW);
    {ִ�гɹ��᷵��Ӧ�ó�����; ������ֵ <= 32, ��ʾִ�д���}
    if (rdpWnd > 32) and (not cbAll.Checked) and (cbFBL2.Text <> '100%') then
    begin
      TThread.CreateAnonymousThread(     //�������̣߳���ֹUI��ס
      procedure
      begin
        WaitedTime:=0;
        while (WaitedTime < 7000) do  //������7��
        begin
            rdpWnd:=FindWindowEx(rdpWnd, 0, 'TscShellContainerClass', nil);
            if rdpWnd<>0 then
            begin
              GetWindowText(rdpWnd, @title, SizeOf(title));
              if Pos(IP, title) > 1 then
              begin
                rdpMnu:=GetSystemMenu(rdpWnd, false);
                rdpMnu:=GetSubMenu(rdpMnu, 7);
                SleepEx(1000,False);
                PostMessage(rdpWnd, WM_SYSCOMMAND, GetMenuItemID(rdpMnu, cbFBL2.ItemIndex), 0);
              end;
            end;
            SleepEx(200,False);
            Inc(WaitedTime,200);
        end;
      end).Start;

    end;

    FileList.Add(rdpFilePath);
  end;

var
  rdpList,FileList:TStrings;
  i:Integer;
begin

  try
    rdpList:=TStringList.Create;
    FileList:=TStringList.Create;
    FDServers.DisableControls;
    if DataViewGrid.SelectedRows.Count>1 then
    begin
      for I := 0 to DataViewGrid.SelectedRows.Count-1 do
      begin
          //��ת����Ӧ��������
         FDServers.GotoBookmark(DataViewGrid.SelectedRows.Items[i]);
         ConnToServer(rdpList,FileList);
         sleep(50);
      end;
    end
    else
      ConnToServer(rdpList,FileList)
  finally
     FDServers.EnableControls;
     Application.ProcessMessages;
     //����mstsc��ɺ�1.5����ɾ���ļ�����������ٶ������ӳ�ɾ��ʱ��ɵ���
     Delay(1500);
     for i := 0 to FileList.Count-1 do
     begin
       if FileExists(FileList[i]) then
          DeleteFile(FileList[i]);
     end;
     rdpList.Free;
     FileList.Free;
  end;
end;


procedure TfrmMain.VNCConnect;
  procedure ConnToVNCServer;
   var
    param:string;
    VNCPath,IP:string;
    i:Integer;
  begin
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;

    VNCPath:=ExtractFileDir(Application.ExeName)+'\vnc.exe'; //Ĭ��ȡ��ǰĿ¼
    if not FileExists(VNCPath) then VNCPath:=GetGobalValue('VNCPath'); //����ȡָ����Ŀ¼
    if FileExists(VNCPath) then
    begin
      param:=Format('%s:%d /password %s',[IP,FDServers.FieldByName('host_port').AsInteger,FDServers.FieldByName('user_pwd').AsString]);
      ShellExecute(0, 'open', PChar(VNCPath),PChar(param), nil, SW_SHOW);
    end
    else begin
      DialogWarning('��ָ��vnc.exe·���� ');
      Exit
    end;
  end;
var
  i:Integer;
begin
  if not FDServers.Active or (FDServers.RecordCount=0) then
    Exit;
  try
    FDServers.DisableControls;
    if DataViewGrid.SelectedRows.Count>1 then
    begin
      for I := 0 to DataViewGrid.SelectedRows.Count-1 do
      begin
          //��ת����Ӧ��������
         FDServers.GotoBookmark(DataViewGrid.SelectedRows.Items[i]);
         ConnToVNCServer;
         sleep(50);
      end;
    end
    else
      ConnToVNCServer;
  finally
     FDServers.EnableControls;
     Application.ProcessMessages;
  end;
end;

procedure TfrmMain.RadminConnect;
  procedure ConnToRadminServer;
  const
    RadminMode : Array[0..3] of string=('','/noinput','/file','/telnet');
  var
    param:string;
    RadminPath, IP, ExeTitle, ExeTitle2:string;
    i:Integer;
    hCurrentWindow,UserHandle,PwdHandle, PwdHandle2: hWnd;
    WaitedTime:Cardinal;
  begin
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;

    RadminPath:=ExtractFileDir(Application.ExeName)+'\Radmin.exe';             //Ĭ��ȡ��ǰĿ¼
    if not FileExists(RadminPath) then RadminPath:=GetGobalValue('RadminPath'); //����ȡָ����Ŀ¼
    if FileExists(RadminPath) then
    begin
      param:=Format('/connect:%s:%d %s',[IP,FDServers.FieldByName('host_port').AsInteger,RadminMode[cbRadminMode.ItemIndex]]);
      if cbRadminFullScreen.Checked then
         param:=param+ ' /fullscreen';
      ShellExecute(0, 'open', PChar(RadminPath),PChar(param), nil, SW_SHOW);

      //���ҵ������� Radmin v3.4
      ExeTitle:='Radmin ��ȫ��: '+  FDServers.FieldByName('host_ip').AsString;
      //���ҵ������� Radmin v2.2
      ExeTitle2:='Enter password for '+  FDServers.FieldByName('host_ip').AsString;
      WaitedTime:=0;
      hCurrentWindow:=0;
      while (WaitedTime < 7000) do  //������7��
      begin
         hCurrentWindow := FindWindow(nil,PChar(ExeTitle));
         if hCurrentWindow<>0 then
           Break;
         hCurrentWindow := FindWindow(nil,PChar(ExeTitle2));
         if hCurrentWindow<>0 then
           Break;
         SleepEx(50,False);
         Inc(WaitedTime,50);
         Application.ProcessMessages;
      end;
      if hCurrentWindow=0 then
      begin
      	exit;
      end;

      //��ȡ�ʺ����������(�����ľ������ͨ��Spy4Win��ȡ)
      //Radmin v3.4���û������������
      UserHandle:=GetDlgItem(hCurrentWindow,2047);    //0x7ff
      PwdHandle:=GetDlgItem(hCurrentWindow,2048);     //0x800
      //Radmin v2.2���������
      PwdHandle2:=GetDlgItem(hCurrentWindow,1048);     //0x418
      if UserHandle<>0 then
        SendMessage(UserHandle,WM_SETTEXT,255,Integer(PChar(FDServers.FieldByName('user_name').AsString)));
      if PwdHandle<>0 then
        SendMessage(PwdHandle,WM_SETTEXT,255,Integer(PChar(FDServers.FieldByName('user_pwd').AsString)));
      if PwdHandle2<>0 then
        SendMessage(PwdHandle2,WM_SETTEXT,255,Integer(PChar(FDServers.FieldByName('user_pwd').AsString)));
      //�س�
      PostMessage(hCurrentWindow,WM_KEYDOWN,VK_RETURN,0);
    end
    else begin
      DialogWarning('��ָ��Radmin.exe·���� ');
      Exit
    end;
  end;
var
  i:Integer;
begin
  if not FDServers.Active or (FDServers.RecordCount=0) then
    Exit;
  try
    FDServers.DisableControls;
    if DataViewGrid.SelectedRows.Count>1 then
    begin
      for I := 0 to DataViewGrid.SelectedRows.Count-1 do
      begin
          //��ת����Ӧ��������
         FDServers.GotoBookmark(DataViewGrid.SelectedRows.Items[i]);
         ConnToRadminServer;
         sleep(50);
      end;
    end
    else
      ConnToRadminServer;
  finally
     FDServers.EnableControls;
     Application.ProcessMessages;
  end;
end;

//��֧����������
procedure TfrmMain.TelnetConnect;
  procedure ConnToTelnetServer;
  var
    param:string;
    PuttyPath,IP:string;
    i,telnetConnTime,userTime:Integer;
  begin
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;

    PuttyPath:=ExtractFileDir(Application.ExeName)+'\putty.exe'; //Ĭ��ȡ��ǰĿ¼
    if not FileExists(PuttyPath) then
      PuttyPath:=GetGobalValue('PuttyPath'); //����ȡָ����Ŀ¼
    if not FileExists(PuttyPath) then
    begin
      DialogWarning('��ָ��putty.exe·���� ');
      Exit
    end;

    //���ⲿ����
    param:=' telnet://'+IP+':'+FDServers.FieldByName('host_port').AsString+'';
    ShellExecute(0, 'open', PChar(PuttyPath),PChar(param), nil, SW_SHOW);

    //Ĭ��ֵ
    telnetConnTime:=1500;
    userTime:=500;

    if GetGobalValue('telnetConnTime')<>'' then
       telnetConnTime:=StrToInt(GetGobalValue('telnetConnTime'));

    if GetGobalValue('userTime')<>'' then
       userTime:=StrToInt(GetGobalValue('userTime'));

    //�ȴ�����ʱ��
    Delay(telnetConnTime);

    //����û�����putty��
    if FDServers.FieldByName('user_name').AsString<>'' then
       TypeStringToTarget(FDServers.FieldByName('user_name').AsString,userTime);

    //������뵽putty��
    if FDServers.FieldByName('user_pwd').AsString<>'' then
       TypeStringToTarget(FDServers.FieldByName('user_pwd').AsString);

  end;
//var
//  i:Integer;
begin
  try
    FDServers.DisableControls;
//    if DataViewGrid.SelectedRows.Count>1 then
//    begin
//      for I := 0 to DataViewGrid.SelectedRows.Count-1 do
//      begin
//          //��ת����Ӧ��������
//         FDServers.GotoBookmark(DataViewGrid.SelectedRows.Items[i]);
//         ConnToTelnetServer;
//         sleep(50);
//      end;
//    end
//    else
      ConnToTelnetServer;
  finally
     FDServers.EnableControls;
     Application.ProcessMessages;
  end;
end;

procedure TfrmMain.SSHConnect;
  procedure ConnToSSHServer;
  var
    param:string;
    PuttyPath,IP:string;
    i:Integer;
  begin
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;

    PuttyPath:=ExtractFileDir(Application.ExeName)+'\putty.exe'; //Ĭ��ȡ��ǰĿ¼
    if not FileExists(PuttyPath) then PuttyPath:=GetGobalValue('PuttyPath'); //����ȡָ����Ŀ¼
    if FileExists(PuttyPath) then
    begin
      param:=' -ssh -l '+FDServers.FieldByName('user_name').AsString+' -pw '+FDServers.FieldByName('user_pwd').AsString+'  -P '+FDServers.FieldByName('host_port').AsString+' '+IP;
      ShellExecute(0, 'open', PChar(PuttyPath),PChar(param), nil, SW_SHOW);
    end
    else begin
      DialogWarning('��ָ��putty.exe·���� ');
      Exit
    end;
  end;
var
  i:Integer;
begin
  if not FDServers.Active or (FDServers.RecordCount=0) then
    Exit;
  try
    FDServers.DisableControls;
    if DataViewGrid.SelectedRows.Count>1 then
    begin
      for I := 0 to DataViewGrid.SelectedRows.Count-1 do
      begin
          //��ת����Ӧ��������
         FDServers.GotoBookmark(DataViewGrid.SelectedRows.Items[i]);
         ConnToSSHServer;
         sleep(50);
      end;
    end
    else
      ConnToSSHServer;
  finally
     FDServers.EnableControls;
     Application.ProcessMessages;
  end;
end;

procedure TfrmMain.FTPConnect;
  procedure ConnToFTPServer;
   var
    param:string;
    WinSCPPath,IP:string;
    i:Integer;
  begin
    IP:=FDServers.FieldByName('host_ip').AsString;
    for I := 0 to DomainList.Count-1 do
    begin
      if Pos(DomainList[i],IP)>0 then
      begin
        IP:=GetIpBydomain(FDServers.FieldByName('host_ip').AsString);
        Break;
      end;
    end;

    WinSCPPath:=ExtractFileDir(Application.ExeName)+'\WinSCP.exe'; //Ĭ��ȡ��ǰĿ¼
    if not FileExists(WinSCPPath) then WinSCPPath:=GetGobalValue('WinSCPPath'); //����ȡָ����Ŀ¼
    if FileExists(WinSCPPath) then
    begin
      param:=LowerCase(FDServers.FieldByName('host_type').AsString)+':'+FDServers.FieldByName('user_name').AsString+':'+FDServers.FieldByName('user_pwd').AsString+'@'+IP+':'+FDServers.FieldByName('host_port').AsString;
      ShellExecute(0, 'open', PChar(WinSCPPath),PChar(param), nil, SW_SHOW);
    end
    else begin
      DialogWarning('��ָ��WinSCP.exe·���� ');
      Exit
    end;
  end;
var
  i:Integer;
begin
  if not FDServers.Active or (FDServers.RecordCount=0) then
    Exit;
  try
    FDServers.DisableControls;
    if DataViewGrid.SelectedRows.Count>1 then
    begin
      for I := 0 to DataViewGrid.SelectedRows.Count-1 do
      begin
          //��ת����Ӧ��������
         FDServers.GotoBookmark(DataViewGrid.SelectedRows.Items[i]);
         ConnToFTPServer;
         sleep(50);
      end;
    end
    else
      ConnToFTPServer;
  finally
     FDServers.EnableControls;
     Application.ProcessMessages;
  end;
end;

end.
