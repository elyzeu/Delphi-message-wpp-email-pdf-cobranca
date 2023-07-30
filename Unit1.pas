unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.StdCtrls, IdSMTP, IdMessage, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, Vcl.ExtCtrls, unit2, IdHTTP, System.NetEncoding, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    ButtonEnviarEmail: TButton;
    IdHTTP1: TIdHTTP;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure ButtonEnviarEmailClick(Sender: TObject);
    procedure ButtonEnviarWhatsAppClick(Sender: TObject);
    function VerificarRegistrosDataEspecifica: Boolean;
    procedure EnviarEmail(const Nome, Email: string);
    procedure EnviarMensagemWhatsApp(const Nome, Telefone: string);
    procedure EnviarBoletoWhatsApp(const Nome, Telefone: string);

  private
    { Declarações privadas }
  public
    { Declarações públicas }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.ButtonEnviarEmailClick(Sender: TObject);
var
  NomeDevedor, EmailDevedor: string;
begin
  // Verifica se tem dados com a data
  if VerificarRegistrosDataEspecifica then
  begin
    // Percorre todos os registros com a data de vencimento especificada
    with DataModule2.qconNp do
    begin
      First;
      while not EOF do
      begin
      //pega o nome do cliente e email
        NomeDevedor := FieldByName('NOMCLI').AsString;
        EmailDevedor := FieldByName('EMAIL').AsString;
        //Passa eles como parametro para a função
        EnviarEmail(NomeDevedor, EmailDevedor);
        // Move para o próximo registro
        Next;
      end;
    end;

    ShowMessage('E-mails enviados para todos os devedores com a data de vencimento especificada.');
  end
  else
    ShowMessage('Nenhum registro encontrado com a data especificada.');
end;

procedure TForm1.ButtonEnviarWhatsAppClick(Sender: TObject);
var
  NomeDevedor, TelefoneDevedor: string;
begin
  // Verifica se tem registro com a data
  if VerificarRegistrosDataEspecifica then
  begin
    // Percorre todos os registros com a data de vencimento definida
    with DataModule2.qconNp do
    begin
      First;
      while not EOF do
      begin
      //campos a ser pego
        NomeDevedor := FieldByName('NOMCLI').AsString;
        TelefoneDevedor := FieldByName('TELEFONE').AsString;
        //EnviarMensagemWhatsApp(NomeDevedor, TelefoneDevedor);
          EnviarBoletoWhatsApp(NomeDevedor, TelefoneDevedor);
        // Move para o próximo registro
        Next;
      end;
    end;

    ShowMessage('Mensagens enviadas para todos os devedores com a data de vencimento especificada.');
  end
  else
    ShowMessage('Nenhum registro encontrado com a data especificada.');
end;

function TForm1.VerificarRegistrosDataEspecifica: Boolean;
var
  DataAtual: TDate;
begin
  DataAtual := Date;
  with DataModule2.qconNp do
  begin
    Close;
    SQL.Clear;
    // Usando um parâmetro no sql
    SQL.Add('SELECT * FROM Np WHERE datvenc = :DataAtual');
    // Passa a data diretamente como parâmetro
    ParamByName('DataAtual').AsDate := DataAtual;
    Open;




    // Retorna verdadeiro se existirem registro senao retorna falso
    Result := not IsEmpty;
  end;
end;

procedure TForm1.EnviarEmail(const Nome, Email: string);
var
  IdMessage: TIdMessage;
  DataAtual: TDate;
  Mensagem: string;
begin
  DataAtual := Date;
  IdMessage := TIdMessage.Create(nil);
  try
    IdSMTP1.Host := 'smtp.gmail.com';
    IdSMTP1.Port := 587;
    //e-mail remetente aqui
    IdSMTP1.Username := 'email';
    //Senha App Gmail
    IdSMTP1.Password :=  'senha de app do gmail';
    IdSMTP1.UseTLS := utUseExplicitTLS;

    // Usar o handler SSL/TLS
    IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;

   // o e-mail remetente aqui
    IdMessage.From.Address := 'email';
    IdMessage.Recipients.Add.Address := Email;
    IdMessage.Subject := 'Aviso de Vencimento';
    Mensagem := 'Olá ' + Nome +
      ', estamos enviando este e-mail para lembrar que sua nota promissória '+
      'com data de vencimento: ' + FormatDateTime('dd/mm/yyyy', DataAtual) + ' vence hoje!';
    IdMessage.Body.Text := Mensagem;
    IdSMTP1.Connect;
    // Vincula o DBGrid ao TDataSource
  DBGrid1.DataSource := DataModule2.DataSource1;
    try
      IdSMTP1.Send(IdMessage);
     // ShowMessage('E-mail enviado para ' + Nome + ' (' + Email + ').');

    except
      on E: Exception do
        ShowMessage('Erro ao enviar o e-mail: ' + E.Message);
    end;
  finally
    IdSMTP1.Disconnect;
    IdMessage.Free;
  end;
end;

procedure TForm1.EnviarBoletoWhatsApp(const Nome, Telefone: string);
var
  IdHTTP: TIdHTTP;
  Params: TStringList;
  BoletoPath: string;
  BoletoStream: TMemoryStream;
  BoletoBytes: TBytes;
  BoletoBase64: string;
begin
  // Verifica se o campo 'boleto' não está vazio
  if not DataModule2.qconNp.FieldByName('boleto').IsNull then
  begin
    // Obtém o caminho do boleto a partir do campo 'boleto' do dataset
    BoletoPath := DataModule2.qconNp.FieldByName('boleto').AsString;

    // Verifica se o arquivo existe no disco
    if FileExists(BoletoPath) then
    begin
      // Carrega o arquivo PDF do boleto em um TBytesStream
      BoletoStream := TMemoryStream.Create;
      try
        BoletoStream.LoadFromFile(BoletoPath);

        // Obtém o tamanho do arquivo para ajustar o tamanho do array de bytes
        SetLength(BoletoBytes, BoletoStream.Size);

        // Lê os dados do TMemoryStream para o array de bytes
        BoletoStream.ReadBuffer(BoletoBytes[0], BoletoStream.Size);
      finally
        BoletoStream.Free;
      end;

      // Codifica o array de bytes do boleto em formato Base64
      BoletoBase64 := TNetEncoding.Base64.EncodeBytesToString(BoletoBytes);

      IdHTTP := TIdHTTP.Create(nil);
      Params := TStringList.Create;
      try
        // Configurar o cabeçalho Content-Type da solicitação
        IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';

        // Adicionar os parâmetros da solicitação
        Params.Add('apikey=');
        Params.Add('phone_number=');
        Params.Add('contact_phone_number=' + Telefone);
        Params.Add('message_custom_id=yowsoftwareid');
        Params.Add('message_type=document'); // Define o tipo da mensagem como "document" para enviar o boleto
        Params.Add('message_caption=my caption'); // Adiciona a legenda da imagem
        Params.Add('message_body_mimetype=application/pdf'); // Define o tipo MIME do boleto (PDF)
        Params.Add('message_body_filename=cv.pdf'); // Define o nome do arquivo PDF
       Params.Add('message_body='+boletoBase64);
                     DBGrid2.DataSource := DataModule2.DataSource1;
        try
          // Configura o manipulador SSL/TLS para o componente IdHTTP
          IdHTTP.IOHandler := IdSSLIOHandlerSocketOpenSSL1;

          // URL da API de WhatsApp
          IdHTTP.Post('https://app.whatsgw.com.br/api/WhatsGw/Send', Params);

          // Futuro: adaptar essa URL de acordo com a API específica usada.
          // ShowMessage('Boleto enviado via WhatsApp para ' + Nome + ' (' + Telefone + ').');
          // tratar a resposta da API, se for preciso.
        except
          on E: Exception do
            ShowMessage('Erro ao enviar o boleto via WhatsApp: ' + E.Message);
        end;
      finally
        Params.Free;
        IdHTTP.Free;
      end;
    end
    else
      ShowMessage('Arquivo do boleto não encontrado no disco.');
  end
  else
    ShowMessage('Caminho do boleto não especificado no banco de dados.');
end;





procedure TForm1.EnviarMensagemWhatsApp(const Nome, Telefone: string);
var
  IdHTTP: TIdHTTP;
  Params: TStringList;
  Response: string;
begin
  IdHTTP := TIdHTTP.Create(nil);
  Params := TStringList.Create;
  try
    // Configurar os parâmetros da solicitação para a API de WhatsApp (supondo que você tenha uma API externa para isso)
    Params.Add('apikey=');
    Params.Add('phone_number=');
     Params.Add('contact_phone_number=' + Telefone);
     Params.Add('message_custom_id=189551476');
      Params.Add('message_type=text');
    Params.Add('message_body=Olá ' + Nome + ', lembramos que sua nota promissória vence hoje!');
    Params.Add('check_status=1');
    Params.Add('schedule=2021/04/01 21:00:00');
    Params.Add('message_to_group=0');
     // Vincula o DBGrid ao TDataSource
  DBGrid2.DataSource := DataModule2.DataSource1;

     // Configurar o manipulador SSL/TLS para o componente IdHTTP1
    IdHTTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    try
      //URL da API de WhatsApp
      IdHTTP.Post('https://app.whatsgw.com.br/api/WhatsGw/Send', Params);
      //Futuro: adaptar essa URL de acordo com a API específica usada.
     // ShowMessage('Mensagem enviada via WhatsApp para ' + Nome + ' (' + Telefone + ').');
      // tratar a resposta da API, se for preciso.

    except
      on E: Exception do
        ShowMessage('Erro ao enviar a mensagem via WhatsApp: ' + E.Message);
    end;
  finally
    Params.Free;
    IdHTTP.Free;
  end;
end;

end.


