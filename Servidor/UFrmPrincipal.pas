unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FMX.Controls.Presentation, FMX.StdCtrls,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  Horse,
  Horse.Jhonson,
  DataSet.Serialize,
  System.JSON;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    Button1: TButton;
    QDados: TFDQuery;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDConnection1.Connected := True;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  THorse.Use(Jhonson());

  THorse.Get('/troca',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      ArrayDados : TJsonArray;
      SQL : String;
    begin
      SQL := 'select t.id_troca, ' +
             '       t.titulo, ' +
             '       t.descricao, ' +
             '       t.id_categoria, ' +
             '       c.nome as nome_categoria, ' +
             '       t.id_condicao, ' +
             '       o.nome as nome_condicao, ' +
             '       t.data, ' +
             '       (select count(*) from troca_foto f where f.id_troca = t.id_troca) qtd_foto ' +
             'from troca t join categoria c on t.id_categoria = c.id_categoria ' +
             '           join condicao o on t.id_condicao = o.id_condicao ' +
             'order by t.data desc, titulo';

      QDados.Close;
      QDados.SQL.Clear;
      QDados.SQL.Add(SQL);
      QDados.Open;

      ArrayDados := QDados.ToJSONArray();
      res.Send<TJSONArray>(ArrayDados);
    end);

  THorse.Listen(9000);
end;

end.
