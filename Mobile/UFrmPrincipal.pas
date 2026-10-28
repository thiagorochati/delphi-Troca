unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.TabControl, FMX.StdCtrls;

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
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaTroca; //Ctrl + Shift + C
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
begin
  VertScrollBoxTroca.BeginUpdate;

  //Limpando todos os itens do VertScrollBox
  for i := VertScrollBoxTroca.Content.ChildrenCount - 1 downto 0 do
    if VertScrollBoxTroca.Content.Children[i] is TFrame then
      TFrame(VertScrollBoxTroca.Content.Children[i]).DisposeOf;

  for I := 0 to 10 do
    begin
      Frame := TFrameTroca.Create(nil);
      Frame.Align := TAlignLayout.Top;
      VertScrollBoxTroca.AddObject(Frame);
    end;

    VertScrollBoxTroca.EndUpdate;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  AtualizaTroca;
end;

end.
