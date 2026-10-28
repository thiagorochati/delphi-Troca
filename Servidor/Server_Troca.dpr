program Server_Troca;

uses
  System.StartUpCopy,
  FMX.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
