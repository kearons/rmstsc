program rmstsc;

{ 关闭RTTI反射机制减少EXE文件尺寸 }
{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  uFrmServerInfo in 'uFrmServerInfo.pas' {FrmServerInfo},
  Vcl.Themes,
  Windows,
  Vcl.Styles,
  uFrmSetPwd in 'uFrmSetPwd.pas' {FrmSetPwd},
  uFrmSetup in 'uFrmSetup.pas' {FrmSetup},
  CommonFunc in 'Extend\CommonFunc.pas',
  RdpCrypt in 'Extend\RdpCrypt.pas',
  DBTree in 'Extend\DBTree.pas';

{$R *.res}
//静态加载SwitchToThisWindow
procedure SwitchToThisWindow(hWnd:Thandle;fAltTab:boolean);stdcall;external 'User32.dll';

var
  Hwnd:THandle;
begin
  Hwnd:=CreateMutex(nil,false,'rmstsc');
  if WaitForSingleObject(Hwnd,0)<>wait_TimeOut then
  begin
    ReportMemoryLeaksOnShutdown := Boolean(DebugHook);
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    TStyleManager.TrySetStyle('Iceberg Classico');
    Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
  end
  else begin
    Application.MessageBox(PChar('程序已经在运行了！'), '提示', mb_ok + MB_ICONWARNING);
    Application.Terminate;

  end;
end.
