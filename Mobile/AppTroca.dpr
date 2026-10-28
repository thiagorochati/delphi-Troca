program AppTroca;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  UFrmPrincipal in 'UFrmPrincipal.pas' {Form1},
  UFrameTroca in 'UFrameTroca.pas' {FrameTroca: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
