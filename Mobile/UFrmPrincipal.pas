unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.TabControl, FMX.StdCtrls,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout1: TLayout;
    Layout2: TLayout;
    VertScrollBoxTroca: TVertScrollBox;
    Rectangle1: TRectangle;
    Image1: TImage;
    Edit1: TEdit;
    Label1: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaTroca; //Ctrl + Shift + C
    procedure ConfiguraComponente(vRota: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UFrameTroca;

{ TForm1 }

procedure TForm1.AtualizaTroca;
var
  i : integer;
  Frame : TFrameTroca;

  Json : String;
  ArrayDados : TJsonArray;
begin
  ConfiguraComponente('troca');
  RestRequest1.Method := rmGET;

  RestRequest1.Execute;

  if not RestRequest1.Response.StatusCode = 200 then
    Exit;

  VertScrollBoxTroca.BeginUpdate;

  //Limpando todos os itens do VertScrollBox
  for i := VertScrollBoxTroca.Content.ChildrenCount - 1 downto 0 do
    if VertScrollBoxTroca.Content.Children[i] is TFrame then
      TFrame(VertScrollBoxTroca.Content.Children[i]).DisposeOf;

  json := RestRequest1.Response.JSONValue.ToString;

  ArrayDados := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0)
   as TJSONArray;

  for I := 0 to ArrayDados.Size - 1 do
  begin
    Frame := TFrameTroca.Create(nil);

    Frame.LbTitulo.Text  := ArrayDados.Get(i).GetValue<string>('titulo', '');
    Frame.LbTipo.Text    := ArrayDados.Get(i).GetValue<string>('nomecategoria', '');
    Frame.LbStatus.Text  := ArrayDados.Get(i).GetValue<string>('nomecondicao', '');
    Frame.LbNome.Text    := ArrayDados.Get(i).GetValue<string>('nomeusuario', '');
    Frame.LbCidade.Text  := ArrayDados.Get(i).GetValue<string>('cidade', '') + ' /' + ArrayDados.Get(i).GetValue<string>('estado', '');

    Frame.RecInteresse.TagString := ArrayDados.Get(i).GetValue<string>('idTroca', '');

    Frame.Align := TAlignLayout.Top;

    VertScrollBoxTroca.AddObject(Frame);
  end;

  VertScrollBoxTroca.EndUpdate;
end;

procedure TForm1.ConfiguraComponente(vRota: String);
var
  UrlServidor: String;
begin
  //HTTPBasicAuthenticator1.Username := 'admin';
  //HTTPBasicAuthenticator1.Password := 'admin';

  UrlServidor := 'http://localhost:9000/' + vRota;

  RESTClient1.BaseURL := UrlServidor;

  RestRequest1.Body.ClearBody;
  RestRequest1.Params.Clear;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  AtualizaTroca;
end;

end.
