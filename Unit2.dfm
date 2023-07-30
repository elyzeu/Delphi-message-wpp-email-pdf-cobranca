object DataModule2: TDataModule2
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\nsc\nsc.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 64
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_4_0\WOW64\fbclient.dll'
    Left = 176
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 296
    Top = 56
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 408
    Top = 80
  end
  object qconNp: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from NP'
      ''
      '')
    Left = 80
    Top = 272
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = qconNp
    Left = 112
    Top = 344
  end
  object DSConsulta: TDataSource
    AutoEdit = False
    DataSet = qconNp
    Left = 168
    Top = 200
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    MasterSource = DSConsulta
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'NP'
    Left = 224
    Top = 200
    object FDTable1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object FDTable1NUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 14
    end
    object FDTable1ID_NF: TIntegerField
      FieldName = 'ID_NF'
      Origin = 'ID_NF'
    end
    object FDTable1NCUPOM: TStringField
      FieldName = 'NCUPOM'
      Origin = 'NCUPOM'
      Size = 10
    end
    object FDTable1ID_PED: TIntegerField
      FieldName = 'ID_PED'
      Origin = 'ID_PED'
    end
    object FDTable1ID_LOC: TIntegerField
      FieldName = 'ID_LOC'
      Origin = 'ID_LOC'
    end
    object FDTable1GRUPO_FAT: TIntegerField
      FieldName = 'GRUPO_FAT'
      Origin = 'GRUPO_FAT'
    end
    object FDTable1GRUPO_DOC: TStringField
      FieldName = 'GRUPO_DOC'
      Origin = 'GRUPO_DOC'
      Size = 10
    end
    object FDTable1PARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
    end
    object FDTable1PARCELAT: TIntegerField
      FieldName = 'PARCELAT'
      Origin = 'PARCELAT'
    end
    object FDTable1CODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDTable1NOMCLI: TStringField
      FieldName = 'NOMCLI'
      Origin = 'NOMCLI'
      Size = 60
    end
    object FDTable1PAGAV: TStringField
      FieldName = 'PAGAV'
      Origin = 'PAGAV'
    end
    object FDTable1DATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = 'DATEMI'
    end
    object FDTable1PRAZO: TSmallintField
      FieldName = 'PRAZO'
      Origin = 'PRAZO'
    end
    object FDTable1DATVENC: TDateField
      FieldName = 'DATVENC'
      Origin = 'DATVENC'
    end
    object FDTable1VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object FDTable1VALREC: TFMTBCDField
      FieldName = 'VALREC'
      Origin = 'VALREC'
      Precision = 18
      Size = 2
    end
    object FDTable1SALDO: TFMTBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
      Size = 2
    end
    object FDTable1CODVEN: TIntegerField
      FieldName = 'CODVEN'
      Origin = 'CODVEN'
    end
    object FDTable1CODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = 'CODUSU'
    end
    object FDTable1PGT: TStringField
      FieldName = 'PGT'
      Origin = 'PGT'
      Size = 5
    end
    object FDTable1HORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object FDTable1JUROS: TFMTBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      Precision = 18
      Size = 2
    end
    object FDTable1DESCONTOS: TFMTBCDField
      FieldName = 'DESCONTOS'
      Origin = 'DESCONTOS'
      Precision = 18
      Size = 2
    end
    object FDTable1DATREC: TDateField
      FieldName = 'DATREC'
      Origin = 'DATREC'
    end
    object FDTable1HORAEMISSAO: TSQLTimeStampField
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
    end
    object FDTable1HORABAIXA: TSQLTimeStampField
      FieldName = 'HORABAIXA'
      Origin = 'HORABAIXA'
    end
    object FDTable1DIASA: TIntegerField
      FieldName = 'DIASA'
      Origin = 'DIASA'
    end
    object FDTable1TS: TStringField
      FieldName = 'TS'
      Origin = 'TS'
      FixedChar = True
      Size = 1
    end
    object FDTable1STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object FDTable1MARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 5
    end
    object FDTable1TIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'TIPO_DOC'
    end
    object FDTable1STATUS_REMESSA: TSmallintField
      FieldName = 'STATUS_REMESSA'
      Origin = 'STATUS_REMESSA'
    end
    object FDTable1ID_CONTASBANCO: TIntegerField
      FieldName = 'ID_CONTASBANCO'
      Origin = 'ID_CONTASBANCO'
    end
    object FDTable1ID_OPERACAO: TIntegerField
      FieldName = 'ID_OPERACAO'
      Origin = 'ID_OPERACAO'
    end
    object FDTable1NOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'NOSSONUMERO'
    end
    object FDTable1ACEITE: TStringField
      FieldName = 'ACEITE'
      Origin = 'ACEITE'
      Size = 1
    end
    object FDTable1JUROSMES: TCurrencyField
      FieldName = 'JUROSMES'
      Origin = 'JUROSMES'
    end
    object FDTable1VRJUROSDIA: TFMTBCDField
      FieldName = 'VRJUROSDIA'
      Origin = 'VRJUROSDIA'
      Precision = 18
      Size = 2
    end
    object FDTable1DATA_REMESSA: TSQLTimeStampField
      FieldName = 'DATA_REMESSA'
      Origin = 'DATA_REMESSA'
    end
    object FDTable1NOSSONUMERO_DIG: TStringField
      FieldName = 'NOSSONUMERO_DIG'
      Origin = 'NOSSONUMERO_DIG'
      Size = 1
    end
    object FDTable1LINHADIGITAVEL: TStringField
      FieldName = 'LINHADIGITAVEL'
      Origin = 'LINHADIGITAVEL'
      Size = 50
    end
    object FDTable1LINHADIGITAVEL_DIG: TSmallintField
      FieldName = 'LINHADIGITAVEL_DIG'
      Origin = 'LINHADIGITAVEL_DIG'
    end
    object FDTable1VR_CUSTO_PARC: TFMTBCDField
      FieldName = 'VR_CUSTO_PARC'
      Origin = 'VR_CUSTO_PARC'
      Precision = 18
      Size = 2
    end
    object FDTable1VR_TOTAL_COMPRA: TFMTBCDField
      FieldName = 'VR_TOTAL_COMPRA'
      Origin = 'VR_TOTAL_COMPRA'
      Precision = 18
      Size = 2
    end
    object FDTable1CUSTO_BOL: TFMTBCDField
      FieldName = 'CUSTO_BOL'
      Origin = 'CUSTO_BOL'
      Precision = 18
      Size = 2
    end
    object FDTable1DATA_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_ATUALIZACAO'
      Origin = 'DATA_ATUALIZACAO'
    end
    object FDTable1ID_REM: TIntegerField
      FieldName = 'ID_REM'
      Origin = 'ID_REM'
    end
    object FDTable1ID_CONDPGT: TIntegerField
      FieldName = 'ID_CONDPGT'
      Origin = 'ID_CONDPGT'
    end
    object FDTable1PERC_MULTA: TCurrencyField
      FieldName = 'PERC_MULTA'
      Origin = 'PERC_MULTA'
    end
    object FDTable1VR_MULTA: TFMTBCDField
      FieldName = 'VR_MULTA'
      Origin = 'VR_MULTA'
      Precision = 18
      Size = 2
    end
    object FDTable1ID_MOVCX: TIntegerField
      FieldName = 'ID_MOVCX'
      Origin = 'ID_MOVCX'
    end
    object FDTable1ID_TEF_ADM: TIntegerField
      FieldName = 'ID_TEF_ADM'
      Origin = 'ID_TEF_ADM'
    end
    object FDTable1ID_INSTRUCAO: TIntegerField
      FieldName = 'ID_INSTRUCAO'
      Origin = 'ID_INSTRUCAO'
    end
    object FDTable1SERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'SERIE'
    end
    object FDTable1TIPO_ENTREGA: TSmallintField
      FieldName = 'TIPO_ENTREGA'
      Origin = 'TIPO_ENTREGA'
    end
    object FDTable1VR_MULTA_DIA: TFMTBCDField
      FieldName = 'VR_MULTA_DIA'
      Origin = 'VR_MULTA_DIA'
      Precision = 18
      Size = 2
    end
    object FDTable1BOL_REG: TSmallintField
      FieldName = 'BOL_REG'
      Origin = 'BOL_REG'
    end
    object FDTable1DIAS_REG: TSmallintField
      FieldName = 'DIAS_REG'
      Origin = 'DIAS_REG'
    end
    object FDTable1VR_DESC_VENC: TFMTBCDField
      FieldName = 'VR_DESC_VENC'
      Origin = 'VR_DESC_VENC'
      Precision = 18
      Size = 2
    end
    object FDTable1TEF_INTEGRADO: TSmallintField
      FieldName = 'TEF_INTEGRADO'
      Origin = 'TEF_INTEGRADO'
    end
    object FDTable1ID_TEF_BAND: TIntegerField
      FieldName = 'ID_TEF_BAND'
      Origin = 'ID_TEF_BAND'
    end
    object FDTable1TEF_CODAUT: TStringField
      FieldName = 'TEF_CODAUT'
      Origin = 'TEF_CODAUT'
    end
    object FDTable1EMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
    object FDTable1TELEFONE: TFMTBCDField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Precision = 18
      Size = 2
    end
    object FDTable1BOLETO: TStringField
      FieldName = 'BOLETO'
      Origin = 'BOLETO'
      Size = 500
    end
  end
end
