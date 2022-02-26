unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, ImgList, StdCtrls, ComCtrls, MPlayer, jpeg,
  sSkinManager,MMSystem;

type
  TForm2 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    ScrollBar1: TScrollBar;
    Image1: TImage;
    ListBox1: TListBox;
    sSkinManager1: TsSkinManager;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 begin
  OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
  Timer1.Enabled:=false;
  MediaPlayer1.filename:=OpenDialog1.FileName;
  MediaPlayer1.Open;
  ScrollBar1.max:=MediaPlayer1.TrackLength[2];
  Timer1.Enabled:=true;
  ListBox1.Items.Add(OpenDialog1.FileName);
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  sndPlaySound('D:\002-Al-Baqarah.mp3',
  SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
//  stop Lagu
  sndPlaySound(nil,0);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
 form1.show;
 form2.Hide;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 form2.windowstate:=wsmaximized;
 scrollbar1.Enabled:=false;
 Label1.Parent:=ScrollBar1;
 label1.Left:=Round(ScrollBar1.Width/2);
 label1.Top:=0;

 with Button4 do
  begin
    Top:=20;
    Left:=1150;
    height:=100;
    width:=200;
 end;

 with mediaplayer1 do
  begin
    width:=500;
    top:=500;
    left:=425;
  end;

 with listbox1 do
  begin
    Width:=800;
    top:=100;
    Left:=280;
    height:=350;
  end;

 with image1 do
  begin
    stretch:=true;
    top:=0;
    left:=0;
    width:=screen.Width;
    height:=screen.Height;
  end;

  with scrollbar1 do
    begin
      top:=600;
      left:=180;
      width:=1000;
      height:=30;
    end;
end;

procedure TForm2.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
  if Button = btStop then
    begin
        mediaplayer1.Position:=0;
        ScrollBar1.Position:=0;
    end
  else if Button = btStep then
    begin
      if ((MediaPlayer1.Position+5000)<=MediaPlayer1.Length) then
        MediaPlayer1.Position:=MediaPlayer1.Position+5000
      else
        begin
          MediaPlayer1.Position:=0;
          ScrollBar1.Position:=0;
        end
      end
  else if button = btBack then
    begin
      if ((MediaPlayer1.Position-5000)>0) then
        MediaPlayer1.Position:=MediaPlayer1.Position-5000
      else
        MediaPlayer1.Position:=0;
     MediaPlayer1.Play;
    end;
end;
procedure TForm2.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  MediaPlayer1.Position:=ScrollBar1.Position;
  MediaPlayer1.play;
end;


procedure TForm2.Timer1Timer(Sender: TObject);
begin
 ScrollBar1.Position:=MediaPlayer1.Position;
 label1.Caption:=FormatFloat('0#.##',(ScrollBar1.Position/ScrollBar1.max)*100)+' %';

 if MediaPlayer1.Position=ScrollBar1.Max then
  MediaPlayer1.Stop;

end;

end.
