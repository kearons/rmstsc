object FrmServerInfo: TFrmServerInfo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #28155#21152#26381#21153#22120
  ClientHeight = 348
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 334
    Height = 331
    TabOrder = 0
    object Label1: TLabel
      Left = 23
      Top = 47
      Width = 60
      Height = 16
      Caption = #20027#26426#21517#65306
    end
    object Label2: TLabel
      Left = 22
      Top = 78
      Width = 61
      Height = 16
      Caption = 'IP/'#22495#21517#65306
    end
    object Label3: TLabel
      Left = 38
      Top = 108
      Width = 45
      Height = 16
      Caption = #31471#21475#65306
    end
    object Label4: TLabel
      Left = 8
      Top = 139
      Width = 75
      Height = 16
      Caption = #30331#24405#24080#21495#65306
    end
    object Label5: TLabel
      Left = 8
      Top = 170
      Width = 75
      Height = 16
      Caption = #30331#24405#23494#30721#65306
    end
    object Label6: TLabel
      Left = 38
      Top = 201
      Width = 45
      Height = 16
      Caption = #22791#27880#65306
    end
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 75
      Height = 16
      Caption = #20027#26426#31867#22411#65306
    end
    object btnSave: TButton
      Left = 80
      Top = 288
      Width = 75
      Height = 25
      Caption = #28155#21152
      ModalResult = 1
      TabOrder = 7
      OnClick = btnSaveClick
    end
    object btnCancle: TButton
      Left = 192
      Top = 288
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 8
    end
    object dbedHostName: TDBEdit
      Left = 89
      Top = 44
      Width = 164
      Height = 24
      DataField = 'host_name'
      DataSource = DataSource1
      TabOrder = 1
    end
    object dbedHostIP: TDBEdit
      Left = 89
      Top = 75
      Width = 164
      Height = 24
      DataField = 'host_ip'
      DataSource = DataSource1
      TabOrder = 2
    end
    object dbedUserName: TDBEdit
      Left = 89
      Top = 136
      Width = 164
      Height = 24
      DataField = 'user_name'
      DataSource = DataSource1
      TabOrder = 4
    end
    object dbMemo: TDBMemo
      Left = 89
      Top = 201
      Width = 232
      Height = 74
      DataField = 'remark'
      DataSource = DataSource1
      TabOrder = 6
    end
    object dbedHostPort: TDBEdit
      Left = 89
      Top = 105
      Width = 164
      Height = 24
      DataField = 'host_port'
      DataSource = DataSource1
      TabOrder = 3
    end
    object cbHostType: TDBComboBox
      Left = 89
      Top = 13
      Width = 164
      Height = 24
      Style = csDropDownList
      DataField = 'host_type'
      DataSource = DataSource1
      Items.Strings = (
        'RDP'
        'SSH'
        'Telnet'
        'VNC'
        'Radmin'
        'FTP'
        'SFTP'
        'SCP'
        'HTTP'
        'HTTPS')
      TabOrder = 0
      OnChange = cbHostTypeChange
    end
    object edtPassword: TEdit
      Left = 89
      Top = 167
      Width = 164
      Height = 24
      PasswordChar = '*'
      TabOrder = 5
    end
  end
  object DataSource1: TDataSource
    Left = 288
    Top = 184
  end
end
