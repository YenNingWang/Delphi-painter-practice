unit drawing01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Im: TImage;
    rg: TRadioGroup;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    cd: TColorDialog;
    MainMenu1: TMainMenu;
    file1: TMenuItem;
    LoadFromFile1: TMenuItem;
    oFile1: TMenuItem;
    Clear1: TMenuItem;
    SD: TSaveDialog;
    OD: TOpenDialog;
    UDPC: TIdUDPClient;
    ListBox1: TListBox;
    Timer1: TTimer;
    ReSend1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ImMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure rgClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure oFile1Click(Sender: TObject);
    procedure LoadFromFile1Click(Sender: TObject);
    procedure ImMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; cv:Tcanvas;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    im.Picture.Bitmap.Width:=im.Width;
    im.Picture.Bitmap.Height:=im.height;
    cv:=im.picture.bitmap.canvas;
end;

procedure TForm1.ImMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var sx,sy:string;
begin
    if ssleft in shift then
    begin
        cv.LineTo(x,y);
        if UDPC.Active=true then
        begin
          sx:=format('%.5d',[x]);
          sy:=format('%.5d',[y]);
          UDPC.Send('LI'+sx+sy);
        end;
    end;
end;

procedure TForm1.rgClick(Sender: TObject);
begin
    UDPC.send('WD'+format('%.2d',[cv.Pen.Width]));
    cv.Pen.Width:=rg.ItemIndex+1;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
    cv.Pen.color:=panel2.color;
    UDPC.Send('CR'+format('%.10d',[cv.Pen.Color]));
    listbox1.items.add( 'CR'+format('%.10d',[cv.Pen.Color]));
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
    cv.Pen.color:=panel3.color;
    UDPC.Send('CR'+format('%.10d',[cv.Pen.Color]));
    listbox1.items.add( 'CR'+format('%.10d',[cv.Pen.Color]));
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
    cv.Pen.color:=panel4.color;
    UDPC.Send('CR'+format('%.10d',[cv.Pen.Color]));
    listbox1.items.add( 'CR'+format('%.10d',[cv.Pen.Color]));
end;

procedure TForm1.Panel7Click(Sender: TObject);
begin
    if cd.execute=true then
    begin
        panel7.Color:=cd.color;
        cv.Pen.Color:=cd.color;
        UDPC.Send('CR'+format('%.10d',[cv.Pen.Color]));
        listbox1.items.add( 'CR'+format('%.10d',[cv.Pen.Color]));
    end;
    UDPC.Send('CR'+format('%.10d',[cv.Pen.Color]));

end;

procedure TForm1.Clear1Click(Sender: TObject);
var pc: integer;
begin
    pc:=cv.Pen.Color;
    cv.Pen.color:=$ffffff;
    cv.Brush.Color:=$ffffff;
    cv.Rectangle(0,0,im.Width,im.Height);
    cv.Pen.Color:=pc;
end;

procedure TForm1.oFile1Click(Sender: TObject);
begin
    sd.FileName:='*.bmp';
    if SD.Execute=true then
    begin
        im.Picture.Bitmap.SaveToFile(sd.FileName);
    end;
end;

procedure TForm1.LoadFromFile1Click(Sender: TObject);
begin
    OD.FileName:='*.bmp';
    if OD.Execute=true then
    begin
        im.Picture.Bitmap.loadfromFile(sd.FileName);
    end;
end;

procedure TForm1.ImMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var sx,sy:string;
begin
    if ssleft in shift then
    begin
        cv.MoveTo(x,y);
        if UDPC.Active=true then
        begin
            sx:=format('%.5d',[x]);
            sy:=format('%.5d',[y]);
            UDPC.Send('MO'+sx+sy);
        end;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var k, i: integer;
begin
    k:=listbox1.Items.count;
    for i:=0 to k-1 do
    begin
        UDPC.send( listbox1.items[i]);
        sleep(100);
        end;
        timer1.enabled:=false;
end;

end.
