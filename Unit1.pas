unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 form1.windowstate:=wsmaximized;

 label1.top:=200;
 label1.left:=550;

 label3.top:=100;
 label3.left:=515;

 with image1 do
  begin
    stretch:=true;
    top:=0;
    left:=0;
    width:=screen.Width;
    height:=screen.Height;
  end;

 with button1 do
  begin
    top:=600;
    left:=160;
    width:=200;
    height:=80;
  end;

 with button2 do
  begin
    top:=600;
    left:=440;
    width:=200;
    height:=80;
  end;

 with button3 do
  begin
    top:=600;
    left:=720;
    width:=200;
    height:=80;
  end;

 with button4 do
  begin
    top:=600;
    left:=990;
    width:=200;
    height:=80;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
//var
//  currenttime:TDateTime;
//  alarmtime:tdatetime;
begin
 label1.Caption:=TimeToStr(now);
 label2.Caption:=
 FormatDateTime('"Tanggal :"dd/mm/yy',now);//+chr(10) +
// FormatDateTime('"Pukul :"hh:nn:ss',now);
 label2.Refresh;
// if (date>lastdateexecuted) then
// begin
//    currenttime:=time;
//    alarmtime:=time;
//    alarmtime:=encodetime(9,30,30,0);
// if currenttime>= alarmtime then
// begin
//    lastdateexecutef:=date;
// end;
// end;
 end;





end.
