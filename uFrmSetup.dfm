object FrmSetup: TFrmSetup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #31995#32479#35774#32622
  ClientHeight = 412
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    512
    412)
  PixelsPerInch = 96
  TextHeight = 14
  object btnOk: TButton
    Left = 157
    Top = 377
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #30830#23450
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancle: TButton
    Left = 285
    Top = 377
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #21462#28040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 489
    Height = 158
    Caption = #36335#24452
    TabOrder = 2
    DesignSize = (
      489
      158)
    object Label2: TLabel
      Left = 25
      Top = 25
      Width = 73
      Height = 16
      Caption = 'Putty'#36335#24452#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 60
      Width = 90
      Height = 16
      Caption = 'WinSCP'#36335#24452#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 94
      Width = 88
      Height = 16
      Caption = 'Radmin'#36335#24452#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 28
      Top = 127
      Width = 69
      Height = 16
      Caption = 'VNC'#36335#24452#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPuttyPath: TEdit
      Left = 97
      Top = 22
      Width = 349
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'ssh/telnet'#20351#29992'putty,'#31354#21017#20026#24403#21069#31243#24207#36335#24452
    end
    object btnSelectPuttyPath: TButton
      Left = 446
      Top = 22
      Width = 36
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36873#25321
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSelectPuttyPathClick
    end
    object btnSelectWinSCPPath: TButton
      Left = 446
      Top = 55
      Width = 36
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36873#25321
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSelectWinSCPPathClick
    end
    object edtWinSCPPath: TEdit
      Left = 97
      Top = 55
      Width = 349
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TextHint = 'scp/sftp/ftp/http/http'#20351#29992'WinSCP,'#31354#21017#20026#24403#21069#31243#24207#36335#24452
    end
    object edtRadminPath: TEdit
      Left = 97
      Top = 89
      Width = 349
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TextHint = #31354#21017#20026#24403#21069#31243#24207#36335#24452
    end
    object btnSelectRadminPath: TButton
      Left = 446
      Top = 89
      Width = 36
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36873#25321
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnSelectRadminPathClick
    end
    object edtVNCPath: TEdit
      Left = 97
      Top = 122
      Width = 349
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      TextHint = #31354#21017#20026#24403#21069#31243#24207#36335#24452
    end
    object btnSelectVNCPath: TButton
      Left = 446
      Top = 122
      Width = 36
      Height = 28
      Anchors = [akTop, akRight]
      Caption = #36873#25321
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnSelectVNCPathClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 168
    Width = 489
    Height = 58
    Caption = 'Telnet'#36873#39033
    TabOrder = 3
    DesignSize = (
      489
      58)
    object Label4: TLabel
      Left = 22
      Top = 29
      Width = 75
      Height = 16
      Caption = #36830#25509#31561#24453#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 450
      Top = 29
      Width = 30
      Height = 16
      Anchors = [akTop, akRight]
      Caption = #27627#31186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 205
      Top = 29
      Width = 30
      Height = 16
      Anchors = [akTop, akRight]
      Caption = #27627#31186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 257
      Top = 29
      Width = 90
      Height = 16
      Caption = #29992#25143#21517#31561#24453#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtConnTime: TEdit
      Left = 97
      Top = 26
      Width = 100
      Height = 24
      Hint = 'telnet'#36830#25509#31561#24453#26102#38388
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'telnet'#36830#25509#31561#24453#26102#38388
    end
    object edtUserWait: TEdit
      Left = 345
      Top = 26
      Width = 100
      Height = 24
      Hint = 'telnet'#36755#20837#29992#25143#21517#21518#31561#24453#26102#38388
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 'telnet'#36755#20837#29992#25143#21517#21518#31561#24453#26102#38388
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 232
    Width = 489
    Height = 66
    Caption = #36828#31243#26700#38754#36873#39033
    TabOrder = 4
    object Label10: TLabel
      Left = 319
      Top = 31
      Width = 75
      Height = 16
      Caption = #36830#25509#27169#24335#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbPlayVoice: TCheckBox
      Left = 22
      Top = 29
      Width = 98
      Height = 17
      Caption = #25773#25918#36828#31243#22768#38899
      TabOrder = 0
    end
    object cbViewStyle: TCheckBox
      Left = 132
      Top = 29
      Width = 78
      Height = 17
      Caption = #35270#35273#26679#24335
      TabOrder = 1
    end
    object cbSmooth: TCheckBox
      Left = 230
      Top = 29
      Width = 98
      Height = 17
      Caption = #23383#20307#24179#28369
      TabOrder = 2
    end
    object rbIsAdmin: TRadioButton
      Left = 402
      Top = 18
      Width = 73
      Height = 17
      Caption = 'Admin'
      TabOrder = 3
    end
    object rbIsConsole: TRadioButton
      Left = 402
      Top = 41
      Width = 72
      Height = 17
      Caption = 'Console'
      TabOrder = 4
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 304
    Width = 489
    Height = 61
    Caption = #20854#23427#36873#39033
    TabOrder = 5
    object Label1: TLabel
      Left = 23
      Top = 27
      Width = 75
      Height = 16
      Caption = #22495#21517#35299#26512#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtDomainList: TEdit
      Left = 97
      Top = 23
      Width = 379
      Height = 24
      Hint = 
        #26377#20123#30465#30340#21160#24577#22495#21517#20250#35299#26512#25104'127.0.0.1'#65292#22914'ap.sudo.cc'#20250#35299#26512#25104'127.0.0.1'#12290#13#10#22312#36825#35774#32622#22495#21517#23383#31526#20018#21518'('#22914'sud' +
        'o.cc)'#65292#20250#20808#23558#21253#21547#36825#20123#23383#31526#20018#30340#22495#21517#35299#26512#25104'IP'#20877#36830#25509'('#22914#23558'ap.sudo.cc'#35299#26512#25104'IP)'#12290
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = #22495#21517#29992#36887#21495#38548#24320#65292#22914'sudo.cc,vicp.net'
    end
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.exe'
    Filter = #25991#20214'(*.exe)|*.exe'
    Title = #35831#36873#25321#35201#23548#20837#30340#25991#20214
    Left = 455
    Top = 425
  end
end
