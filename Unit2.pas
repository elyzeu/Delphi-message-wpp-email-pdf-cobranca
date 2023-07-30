unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTransaction1: TFDTransaction;
    qconNp: TFDQuery;
    DataSource1: TDataSource;
    DSConsulta: TDataSource;
    FDTable1: TFDTable;
    FDTable1ID: TIntegerField;
    FDTable1NUMERO: TStringField;
    FDTable1ID_NF: TIntegerField;
    FDTable1NCUPOM: TStringField;
    FDTable1ID_PED: TIntegerField;
    FDTable1ID_LOC: TIntegerField;
    FDTable1GRUPO_FAT: TIntegerField;
    FDTable1GRUPO_DOC: TStringField;
    FDTable1PARCELA: TIntegerField;
    FDTable1PARCELAT: TIntegerField;
    FDTable1CODCLI: TIntegerField;
    FDTable1NOMCLI: TStringField;
    FDTable1PAGAV: TStringField;
    FDTable1DATEMI: TDateField;
    FDTable1PRAZO: TSmallintField;
    FDTable1DATVENC: TDateField;
    FDTable1VALOR: TFMTBCDField;
    FDTable1VALREC: TFMTBCDField;
    FDTable1SALDO: TFMTBCDField;
    FDTable1CODVEN: TIntegerField;
    FDTable1CODUSU: TIntegerField;
    FDTable1PGT: TStringField;
    FDTable1HORA: TTimeField;
    FDTable1JUROS: TFMTBCDField;
    FDTable1DESCONTOS: TFMTBCDField;
    FDTable1DATREC: TDateField;
    FDTable1HORAEMISSAO: TSQLTimeStampField;
    FDTable1HORABAIXA: TSQLTimeStampField;
    FDTable1DIASA: TIntegerField;
    FDTable1TS: TStringField;
    FDTable1STATUS: TStringField;
    FDTable1MARCA: TStringField;
    FDTable1TIPO_DOC: TSmallintField;
    FDTable1STATUS_REMESSA: TSmallintField;
    FDTable1ID_CONTASBANCO: TIntegerField;
    FDTable1ID_OPERACAO: TIntegerField;
    FDTable1NOSSONUMERO: TStringField;
    FDTable1ACEITE: TStringField;
    FDTable1JUROSMES: TCurrencyField;
    FDTable1VRJUROSDIA: TFMTBCDField;
    FDTable1DATA_REMESSA: TSQLTimeStampField;
    FDTable1NOSSONUMERO_DIG: TStringField;
    FDTable1LINHADIGITAVEL: TStringField;
    FDTable1LINHADIGITAVEL_DIG: TSmallintField;
    FDTable1VR_CUSTO_PARC: TFMTBCDField;
    FDTable1VR_TOTAL_COMPRA: TFMTBCDField;
    FDTable1CUSTO_BOL: TFMTBCDField;
    FDTable1DATA_ATUALIZACAO: TSQLTimeStampField;
    FDTable1ID_REM: TIntegerField;
    FDTable1ID_CONDPGT: TIntegerField;
    FDTable1PERC_MULTA: TCurrencyField;
    FDTable1VR_MULTA: TFMTBCDField;
    FDTable1ID_MOVCX: TIntegerField;
    FDTable1ID_TEF_ADM: TIntegerField;
    FDTable1ID_INSTRUCAO: TIntegerField;
    FDTable1SERIE: TIntegerField;
    FDTable1TIPO_ENTREGA: TSmallintField;
    FDTable1VR_MULTA_DIA: TFMTBCDField;
    FDTable1BOL_REG: TSmallintField;
    FDTable1DIAS_REG: TSmallintField;
    FDTable1VR_DESC_VENC: TFMTBCDField;
    FDTable1TEF_INTEGRADO: TSmallintField;
    FDTable1ID_TEF_BAND: TIntegerField;
    FDTable1TEF_CODAUT: TStringField;
    FDTable1EMAIL: TStringField;
    FDTable1TELEFONE: TFMTBCDField;
    FDTable1BOLETO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDataModule2.Create(AOwner: TComponent);
begin
  inherited;
  // Definir a consulta SQL no TFDQuery


  // Outras configurações do FDQuery, se necessário
end;

end.

