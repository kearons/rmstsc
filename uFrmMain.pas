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
    //输入密码框用*号代替
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
   FrmServerInfo.Caption:='添加服务器';
   FrmServerInfo.btnSave.Caption:='添加';
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
    FrmServerInfo.Caption:='添加服务器';
    FrmServerInfo.btnSave.Caption:='添加';
    FrmServerInfo.DataSource1.DataSet:=FDServers;
    FDServers.Insert;
    FieldByName('GroupID').AsInteger:=GroupID;
    FieldByName('host_type').AsString:=host_type;
    FieldByName('host_port').AsInteger:=host_port;
    FieldByName('host_name').AsString:=host_name+' 复制';
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
          //转换成base64
          EncySr:= EncodeString(HostInfo).Replace(sLineBreak, '', [rfReplaceAll]);
          //加密，如果不需要可注释掉
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
        //转换成base64
        EncySr:= EncodeString(HostInfo).Replace(sLineBreak, '', [rfReplaceAll]);
        //加密，如果不需要可注释掉
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
         if pos('://',HostList[i])<1 then Continue; //格式不对则忽略
         TempStr:=Copy(HostList[i],pos('://',HostList[i])+3);
         //如果复制时加密，则需要解密
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
           //忽略错误的格式
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
    if DialogQuestion('确定要删除选择的记录吗？') then
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
  //不允许删除根目录
  if PNodeInfo(TreeView1.Selected.Data)^.ID=0 then Exit;
  if FDServers.Active and (FDServers.RecordCount>0) then
  begin
    if DialogQuestion('删除分组后，主机将移至当前分组的上一级分组。'+#13#10+'确定要删除当前分组吗') then
    begin
      CurrNode:= TreeView1.Selected;
      pid:=PNodeInfo(CurrNode.Data)^.PID;
      //把当前节点的主机，变更到上一级节点
      FDServers.First;
      while not FDServers.Eof do
      begin
         FDServers.Edit;
         FDServers.FieldByName('GroupID').AsInteger:=pid;
         FDServers.Post;
      end;

      //递归所有子节点
      vNode:=CurrNode.getFirstChild;
      if vNode<>nil then
      begin
        if FDGroup.Locate('ID',PNodeInfo(vNode.Data)^.ID,[]) then //指针移动到当前节点
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

//下移
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
   FrmServerInfo.Caption:='修改服务器';
   FrmServerInfo.btnSave.Caption:='修改';
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

//导出
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
    if InputQuery('密码验证','请输入密码',pwd) then
    begin
      if GetGobalValue('ExportPwd')<>pwd then
      begin
         DialogError('密码错误，请重试！ ');
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
      ALst.Add('上级分组,分组名称,主机类型,主机名,ip/域名,端口,帐号,密码,顺序,备注');
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
      DialogInformation('文件保存至'+SaveDlg.FileName);
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

//linux文件管理
procedure TfrmMain.ActFileExecute(Sender: TObject);
var
  param,WinSCPPath,IP:string;
  I:Integer;
begin
  WinSCPPath:=ExtractFileDir(Application.ExeName)+'\WinSCP.exe'; //默认取当前目录
  if not FileExists(WinSCPPath) then WinSCPPath:=GetGobalValue('WinSCPPath'); //否则取指定的目录
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
    DialogWarning('请指定WinSCP.exe路径！ ');
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

//导入
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
         //处理含空格的字段
         ARecord.CommaText:=StringReplace(ALst[i],' ','~',[rfReplaceAll]);
         //校验
         if i=0 then  //标题栏
         begin
           if ARecord.Count<9  then
           begin
             DialogError('格式错误，请按导出的格式导入！');
             Break;
             Exit;
           end;
           Continue;
         end;
         //主机类型、主机名、IP、端口、帐号不能为空
         if (ARecord[2]='') or (ARecord[3]='') or (ARecord[4]='') or (ARecord[5]='') or ((UpperCase(ARecord[2])<>'TELNET') and (UpperCase(ARecord[2])<>'VNC') and (ARecord[6]='')) then
         begin
           ErrorList:=ErrorList+','+i.ToString;
           Continue
         end;
         //无效的端口
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
         //备注可能有逗号
         Temp:=Copy(ALst[i],Length(ARecord[0]+','+ARecord[1]+','+ARecord[2]+','+ARecord[3]+','+ARecord[4]+','+ARecord[5]+','+ARecord[6]+','+ARecord[7]+',')+1,Length(ALst[i]));
         Temp:=StringReplace(Temp,'~',' ',[rfReplaceAll]);
         FDServers.FieldByName('remark').AsString:=Temp;

         FDServers.Post;
       end;
       if ErrorList='' then
         DialogInformation('导入成功！')
       else
         DialogError('第'+ErrorList+'行导入失败！');
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
  if (Spwd<>'') or (Epwd<>'') then  //有软件密码或导出密码，则需要输入原密码才能设置
  begin
    PostMessage(Handle, InputBoxMessage, 0, 0);
    if InputQuery('密码验证','请输入密码',pwd) then
    begin
      if Spwd<>'' then   //如果有软件密码，则输软件密码
      begin
        if Spwd<>pwd then
        begin
           DialogError('密码错误，请重试！ ');
           exit;
        end;
      end
      else if Epwd<>'' then   //如果软件密码为空，有导出密码，则输导出密码
      begin
        if Epwd<>pwd then
        begin
           DialogError('密码错误，请重试！ ');
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

procedure TfrmMain.ActUPExecute(Sender: TObject); //上移，对调orderby的值
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
   DataSet.FieldByName('host_name').AsString:='服务器';
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
  //当前鼠标光标下的单元格
  GC := DG.MouseCoord(X,Y);
  with DG.DataSource.DataSet do
  begin
    DisableControls;
    try
    MoveRecCount := GC.Y-DG.Row;   //要移动的行数
    if MoveRecCount>0 then         //往后移
    begin
       for I := 0 to Abs(MoveRecCount)-1 do
         ActDown.Execute;
    end
    else if (MoveRecCount<0) then
    begin                          //往前移
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
//  if button=mbLeft then  //左键按下
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
  if ssLeft in Shift then  //左键按下
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
       //创建数据库
      FDConn.Connected := False;
      FDConn.Params.Clear;
      FDConn.Params.DriverID := 'SQLite';
      FDConn.Params.Database := dbFilePath;
      FDConn.Connected := True;
      //初始化数据库
      //创建分组表
      ScriptList.Add('create table Groups ('
                    +'  id integer PRIMARY KEY autoincrement,'
                    +'  caption varchar (50),'
                    +'  pid integer'
                    +');');
      ScriptList.Add('insert into Groups (caption,pid) values (''根目录'',0);');
      //创建服务器表
      ScriptList.Add('create table Servers('
                    +'  id integer PRIMARY KEY autoincrement,'
                    +'  host_type varchar (20),'      //V3版本增加此字段
                    +'  GroupID integer,'
                    +'  host_name varchar (50),'
                    +'  host_ip varchar (50),'
                    +'  host_port integer,'
                    +'  user_name varchar (50),'
                    +'  user_pwd varchar (50),'
                    +'  remark varchar (300),'
                    +'  orderby integer default 1'
                    +');');
      //创建全局参数表
      ScriptList.Add('create table Global('
                    +'  id integer PRIMARY KEY autoincrement,'
                    +'  param_name varchar (50),'
                    +'  param_value varchar (200)'
                    +');');
      ScriptList.Add('insert into Global (param_name,param_value) values (''isAdmin'',''True'');');      //登录方式
      ScriptList.Add('insert into Global (param_name,param_value) values (''ConnDisk'',''False'');');    //连接本地磁盘
      ScriptList.Add('insert into Global (param_name,param_value) values (''ShowWallpaper'',''False'');'); //桌面背景
      ScriptList.Add('insert into Global (param_name,param_value) values (''FullScreen'',''False'');');  //是否全屏
      ScriptList.Add('insert into Global (param_name,param_value) values (''RadminFullScreen'',''False'');');  //是否全屏
      ScriptList.Add('insert into Global (param_name,param_value) values (''PPI'',''8'');');             //分辨率
      ScriptList.Add('insert into Global (param_name,param_value) values (''ExportPwd'','''');');        //导出密码
      ScriptList.Add('insert into Global (param_name,param_value) values (''SoftPwd'','''');');          //软件密码
      ScriptList.Add('insert into Global (param_name,param_value) values (''IsSamePwd'',''False'');');   //两个密码是否相同
      ScriptList.Add('insert into Global (param_name,param_value) values (''MultiSelect'',''False'');'); //Grid可多选
      FDScript.ExecuteScript(ScriptList);
      //加密数据库
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
  //全局参数表
  FDGlobal.Close;
  FDGlobal.Open('select * from Global');
  //分组表
  FDGroup.Open('select * from Groups');
  MakeTree(FDGroup,TreeView1);

  //服务器表
  FDServers.Open('select * from Servers');

  //初始化界面
  IniFormControl;
end;

procedure TfrmMain.IniFormControl;
var
  i:Integer;
begin
  //软件高和宽
  if GetGobalValue('Width')<>'' then
    Self.Width:=StrToInt(GetGobalValue('Width'));
  if GetGobalValue('Height')<>'' then
    Self.Height:=StrToInt(GetGobalValue('Height'));
  //左边分组宽度
  if GetGobalValue('PnlLefWidth')<>'' then
    PnlLeft.Width:=StrToInt(GetGobalValue('PnlLefWidth'));

  //连接参数
  cbDisk.Checked:=GetGobalValue('ConnDisk')='True';
  cbShowWallpaper.Checked:=GetGobalValue('ShowWallpaper','False')='True';
  cbAll.Checked:=GetGobalValue('FullScreen','False')='True';
  cbRadminFullScreen.Checked:=GetGobalValue('RadminFullScreen','False')='True';

  cbFBL.ItemIndex:= StrToInt(GetGobalValue('PPI'));
  cbFBL2.ItemIndex:=StrToInt(GetGobalValue('Scale', '2'));
  //数据表格宽度和位置
  for I := 0 to DataViewGrid.Columns.Count-1 do
  begin
    //列宽
    if GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Width')<>'' then
      DataViewGrid.Columns[i].Width:=StrToInt(GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Width'));
    //列位置
    if GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Index')<>'' then
      DataViewGrid.Columns[i].Index:=StrToInt(GetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Index'));
  end;
  //获取要解析的动态域名列表
  DomainList:=TStringlist.Create;
  DomainList.CommaText:=GetGobalValue('DomainList');
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i:Integer;
begin
  //记录最后的位置
  SetGobalValue('Width',IntToStr(Self.Width));
  SetGobalValue('Height',IntToStr(Self.Height));

  SetGobalValue('PnlLefWidth',IntToStr(PnlLeft.Width));
  //保存数据表格宽度和位置
  for I := 0 to DataViewGrid.Columns.Count-1 do
  begin
    //列宽
    SetGobalValue('DataViewGrid.'+DataViewGrid.Columns[i].FieldName+'.Width',IntToStr(DataViewGrid.Columns[i].Width));
    //列位置
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
      if InputQuery('密码验证','请输入密码',pwd) then
      begin
        if GetGobalValue('SoftPwd')<>pwd then
        begin
           inc(TryCount);
           if TryCount>=3 then
           begin
             DialogError('密码错误超过3次，程序将退出！');
             Close;
           end
           else
             DialogError('密码错误，请重试！ ');
           goto TryAgain;
        end
        else isLogin:=True;
      end
      else Close;
    end;
  end
  else isLogin:=True;  //未设置密码
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
    TrayWnd: HWnd; //任务栏句柄
    Rec    : TRect;
    rdpWnd : HWND; //rdp句柄
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
    //rdp参数详解见https://www.cnblogs.com/fox2013/p/3903624.html
    if cbFBL.ItemIndex=cbFBL.Items.Count-1 then  //窗口最大化
    begin
      //当前电脑分辨率
      w:=GetSystemMetrics(SM_CXSCREEN);
      h:=GetSystemMetrics(SM_CYSCREEN);
      //窗口标题高度
      capWidth:=GetSystemMetrics(SM_CYCAPTION);
      TrayWnd := FindWindow('Shell_TrayWnd',nil);
      GetWindowRect(TrayWnd, Rec);
      //任务栏高度
      barWidth:= Rec.Bottom -Rec.Top;
      //宽
      rdpList.Add('desktopwidth:i:'+IntToStr(w));
      //高
      rdpList.Add('desktopheight:i:'+IntToStr(h-capWidth-barWidth));
    end
    else begin
      //宽
      rdpList.Add('desktopwidth:i:'+trim(copy(cbFBL.Text,1,Pos('x',cbFBL.Text)-1)));
      //高
      rdpList.Add('desktopheight:i:'+trim(copy(cbFBL.Text,Pos('x',cbFBL.Text)+1)));
    end;

    //颜色位
    rdpList.Add('session bpp:i:32');
    // 默认
    rdpList.Add('winposstr:s:2,3,0,0,900,700');
    //将数据传输到客户端计算机时是否对数据进行压缩 0不进行压缩 1 进行压缩
    rdpList.Add('compression:i:1');
    //设置Alt-TAB键的作用 - 0：在本地计算机上应用 Windows 组合键 - 1：对焦时，在远程计算机上应用 Windows 组合键 - 2：仅在全屏模式下，在远程计算机上应用 Windows 组合键
    rdpList.Add('keyboardhook:i:1');
//    rdpList.Add('authentication level:i:0');
    //粘贴
    rdpList.Add('redirectclipboard:i:1');
    //是否自动连接磁盘驱动器
    rdpList.Add('redirectdrives:i:1');
    //PnP即插即用设备
    rdpList.Add('devicestoredirect:s:');
    //是否自动连接打印机
    rdpList.Add('redirectprinters:i:0');
    //是否自动连接COM串行口
    rdpList.Add('redirectcomports:i:0');
    //是否自动连接智能卡
    rdpList.Add('redirectsmartcards:i:0');
    //全屏模式时是否显示连接栏 0连接栏不出现 1连接栏出现
    rdpList.Add('displayconnectionbar:i:1');
    //在断开连接后是否自动尝试重新连接
    rdpList.Add('autoreconnection enabled:i:1');
    //域
    rdpList.Add('domain:s:');
    //RDP进行连接时是否自动启动程序  序路径和文件名
    rdpList.Add('alternate shell:s:');
    //RDP进行连接时自动启动的应用程序所在的文件夹位置程 序路径和文件名
    rdpList.Add('shell working directory:s:');
    //将文件夹拖到新位置时是否显示文件夹内容
    rdpList.Add('disable full window drag:i:1');
    //登录到远程计算机时菜单和窗口的显示方式 0允许菜单和窗口动画  1不允许菜单和窗口动画
    rdpList.Add('disable menu anims:i:1');
    //是否允许主题  0允许主题 1不允许主题
    rdpList.Add('disable themes:i:0 ');
    //
    rdpList.Add('disable cursor setting:i:0');

    //是否将位图缓存在本地计算机上
    rdpList.Add('bitmapcachepersistenable:i:1');
    rdpList.Add('authentication level:i:0');
    rdpList.Add('prompt for credentials:i:0');
    rdpList.Add('promptcredentialonce:i:1');
    //rdpList.Add('desktopscalefactor:i:500');

    // 连接地址
    rdpList.Add('full address:s:'+IP+':'+FDServers.FieldByName('host_port').AsString);
    //用户名
    rdpList.Add('username:s:'+FDServers.FieldByName('user_name').AsString);
    //RDP密码加密数据
    if FDServers.FieldByName('user_pwd').AsString<>'' then
      rdpList.Add('password 51:b:'+CryptRDPPassword(FDServers.FieldByName('user_pwd').AsString));

    //全屏模式
    if cbAll.Checked then
    begin
       rdpList.Add('screen mode id:i:0') ;
       //选项-显示-将我的所有监视器用于远程会话。勾选时强制全屏，设置分辨率无效。勾选时值为1
       rdpList.Add('Use Multimon:i:1');
    end
    else rdpList.Add('screen mode id:i:1');
    //声音设置  0在客户端计算机上播放声音 1在主计算机上播放声音 2不播放声音
    if GetGobalValue('PlayVoice')='True' then rdpList.Add('audiomode:i:0')
    else rdpList.Add('audiomode:i:2');
    //连接本地硬盘 *表示所有分区
    if cbDisk.Checked then rdpList.Add('drivestoredirect:s:*')
    else rdpList.Add('drivestoredirect:s:');
    //是否显示桌面背景
    if cbShowWallpaper.Checked then rdpList.Add('disable wallpaper:i:0')
    else rdpList.Add('disable wallpaper:i:1');
    //字段平滑
    if GetGobalValue('Smooth')='True' then  rdpList.Add('allow font smoothing:i:1')
    else rdpList.Add('allow font smoothing:i:0');
    //视觉样式
    if GetGobalValue('ViewStyle')='False' then  rdpList.Add('disable themes:i:1')
    else rdpList.Add('disable themes:i:0');

    rdpFilePath:=StringReplace(FDServers.FieldByName('host_name').AsString,' ','',[rfReplaceAll])+'.rdp';
    rdpList.SaveToFile(rdpFilePath);
    if GetGobalValue('isAdmin')='True' then
      Param:='/admin'
    else
      param:='/console';
    param:=param+' '+rdpFilePath;
    //调用windows自带的mstsc命令
    rdpWnd := ShellExecute(0, 'open', PChar('mstsc.exe'),PChar(param), nil, SW_SHOW);
    {执行成功会返回应用程序句柄; 如果这个值 <= 32, 表示执行错误}
    if (rdpWnd > 32) and (not cbAll.Checked) and (cbFBL2.Text <> '100%') then
    begin
      TThread.CreateAnonymousThread(     //开启子线程，防止UI卡住
      procedure
      begin
        WaitedTime:=0;
        while (WaitedTime < 7000) do  //不超过7秒
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
          //跳转到对应的数据行
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
     //调用mstsc完成后1.5秒再删除文件，如果电脑速度慢，延迟删除时间可调大
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

    VNCPath:=ExtractFileDir(Application.ExeName)+'\vnc.exe'; //默认取当前目录
    if not FileExists(VNCPath) then VNCPath:=GetGobalValue('VNCPath'); //否则取指定的目录
    if FileExists(VNCPath) then
    begin
      param:=Format('%s:%d /password %s',[IP,FDServers.FieldByName('host_port').AsInteger,FDServers.FieldByName('user_pwd').AsString]);
      ShellExecute(0, 'open', PChar(VNCPath),PChar(param), nil, SW_SHOW);
    end
    else begin
      DialogWarning('请指定vnc.exe路径！ ');
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
          //跳转到对应的数据行
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

    RadminPath:=ExtractFileDir(Application.ExeName)+'\Radmin.exe';             //默认取当前目录
    if not FileExists(RadminPath) then RadminPath:=GetGobalValue('RadminPath'); //否则取指定的目录
    if FileExists(RadminPath) then
    begin
      param:=Format('/connect:%s:%d %s',[IP,FDServers.FieldByName('host_port').AsInteger,RadminMode[cbRadminMode.ItemIndex]]);
      if cbRadminFullScreen.Checked then
         param:=param+ ' /fullscreen';
      ShellExecute(0, 'open', PChar(RadminPath),PChar(param), nil, SW_SHOW);

      //查找弹出窗口 Radmin v3.4
      ExeTitle:='Radmin 安全性: '+  FDServers.FieldByName('host_ip').AsString;
      //查找弹出窗口 Radmin v2.2
      ExeTitle2:='Enter password for '+  FDServers.FieldByName('host_ip').AsString;
      WaitedTime:=0;
      hCurrentWindow:=0;
      while (WaitedTime < 7000) do  //不超过7秒
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

      //获取帐号密码输入框(输入框的句柄，可通过Spy4Win读取)
      //Radmin v3.4的用户名、密码框句柄
      UserHandle:=GetDlgItem(hCurrentWindow,2047);    //0x7ff
      PwdHandle:=GetDlgItem(hCurrentWindow,2048);     //0x800
      //Radmin v2.2的密码框句柄
      PwdHandle2:=GetDlgItem(hCurrentWindow,1048);     //0x418
      if UserHandle<>0 then
        SendMessage(UserHandle,WM_SETTEXT,255,Integer(PChar(FDServers.FieldByName('user_name').AsString)));
      if PwdHandle<>0 then
        SendMessage(PwdHandle,WM_SETTEXT,255,Integer(PChar(FDServers.FieldByName('user_pwd').AsString)));
      if PwdHandle2<>0 then
        SendMessage(PwdHandle2,WM_SETTEXT,255,Integer(PChar(FDServers.FieldByName('user_pwd').AsString)));
      //回车
      PostMessage(hCurrentWindow,WM_KEYDOWN,VK_RETURN,0);
    end
    else begin
      DialogWarning('请指定Radmin.exe路径！ ');
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
          //跳转到对应的数据行
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

//不支持批量连接
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

    PuttyPath:=ExtractFileDir(Application.ExeName)+'\putty.exe'; //默认取当前目录
    if not FileExists(PuttyPath) then
      PuttyPath:=GetGobalValue('PuttyPath'); //否则取指定的目录
    if not FileExists(PuttyPath) then
    begin
      DialogWarning('请指定putty.exe路径！ ');
      Exit
    end;

    //打开外部程序
    param:=' telnet://'+IP+':'+FDServers.FieldByName('host_port').AsString+'';
    ShellExecute(0, 'open', PChar(PuttyPath),PChar(param), nil, SW_SHOW);

    //默认值
    telnetConnTime:=1500;
    userTime:=500;

    if GetGobalValue('telnetConnTime')<>'' then
       telnetConnTime:=StrToInt(GetGobalValue('telnetConnTime'));

    if GetGobalValue('userTime')<>'' then
       userTime:=StrToInt(GetGobalValue('userTime'));

    //等待连接时间
    Delay(telnetConnTime);

    //输出用户名到putty上
    if FDServers.FieldByName('user_name').AsString<>'' then
       TypeStringToTarget(FDServers.FieldByName('user_name').AsString,userTime);

    //输出密码到putty上
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
//          //跳转到对应的数据行
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

    PuttyPath:=ExtractFileDir(Application.ExeName)+'\putty.exe'; //默认取当前目录
    if not FileExists(PuttyPath) then PuttyPath:=GetGobalValue('PuttyPath'); //否则取指定的目录
    if FileExists(PuttyPath) then
    begin
      param:=' -ssh -l '+FDServers.FieldByName('user_name').AsString+' -pw '+FDServers.FieldByName('user_pwd').AsString+'  -P '+FDServers.FieldByName('host_port').AsString+' '+IP;
      ShellExecute(0, 'open', PChar(PuttyPath),PChar(param), nil, SW_SHOW);
    end
    else begin
      DialogWarning('请指定putty.exe路径！ ');
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
          //跳转到对应的数据行
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

    WinSCPPath:=ExtractFileDir(Application.ExeName)+'\WinSCP.exe'; //默认取当前目录
    if not FileExists(WinSCPPath) then WinSCPPath:=GetGobalValue('WinSCPPath'); //否则取指定的目录
    if FileExists(WinSCPPath) then
    begin
      param:=LowerCase(FDServers.FieldByName('host_type').AsString)+':'+FDServers.FieldByName('user_name').AsString+':'+FDServers.FieldByName('user_pwd').AsString+'@'+IP+':'+FDServers.FieldByName('host_port').AsString;
      ShellExecute(0, 'open', PChar(WinSCPPath),PChar(param), nil, SW_SHOW);
    end
    else begin
      DialogWarning('请指定WinSCP.exe路径！ ');
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
          //跳转到对应的数据行
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
