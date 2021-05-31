unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdUDPClient, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPServer, Card, StdCtrls, ExtCtrls, IdSocketHandle;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Card1: TCard;
    UDPS: TIdUDPServer;
    UDPC: TIdUDPClient;
    procedure UDPSUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Card1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  count,temp: integer;
  tempst: TCardSuit;

implementation

{$R *.dfm}

procedure TForm1.UDPSUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var k: integer;
    z,s: String;
begin
    k:=AData.Size; setlength( s,k );
    AData.Read( s[1],k );

    z:=copy(s,1,2);
    if z='SH' then begin
      if strtoint( copy(s,3,1) )=0 then
        Card1.Value:=strtoint( copy(s,4,1) )
      else
        Card1.Value:=strtoint( copy(s,3,2) );

      if strtoint( copy(s,5,1) )=1 then
        Card1.Suit:=Spades
      else if strtoint( copy(s,5,1) )=2 then
        Card1.Suit:=Hearts
      else if strtoint( copy(s,5,1) )=3 then
        Card1.Suit:=Diamonds
      else if strtoint( copy(s,5,1) )=4 then
        Card1.Suit:=Clubs;
    end;


    if z='NT' then begin
      if strtoint( copy(s,3,1) )=0 then
        temp:=strtoint( copy(s,4,1) )
      else
        temp:=strtoint( copy(s,3,2) );

      if strtoint( copy(s,5,1) )=1 then
        tempst:=Spades
      else if strtoint( copy(s,5,1) )=2 then
        tempst:=Hearts
      else if strtoint( copy(s,5,1) )=3 then
        tempst:=Diamonds
      else if strtoint( copy(s,5,1) )=4 then
        tempst:=Clubs;


    end;

    if z='ED' then
      button1.Enabled:=false;

    if z='CT' then begin
      label1.Caption:=copy(s,3,2);
      count:=strtoint( copy(s,3,2) );
    end;

    if z='AW' then
      label1.Caption:='YOU LOSE';
    if z='AL' then
      label1.Caption:='YOU WIN';

    if z='AG' then begin
      button1.Enabled:=true;
      label1.Caption:='Again';
      Card1.ShowDeck:=true;
    end;

    if z='OP' then
      card1.ShowDeck:=false;

    if z='BT' then
      Card1.Enabled:=true;



end;


    



procedure TForm1.FormCreate(Sender: TObject);
begin
    label1.Caption:='Ready...';
    Card1.ShowDeck:=true;
    Card1.Enabled:=false;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    if Card1.Value=count then begin
      label1.Caption:='YOU WIN';
      button1.Enabled:=false;
      UDPC.Send('ED');
      UDPC.Send('BW');
    end
    else begin
      label1.Caption:='YOU LOSE';
      button1.Enabled:=false;
      UDPC.Send('ED');
      UDPC.Send('BL');
    end;
end;

procedure TForm1.Card1Click(Sender: TObject);
begin
    Card1.Value:=temp;
    Card1.Suit:=tempst;

    UDPC.Send('TT');

    if count<13 then
      count:=count+1
    else if count=13 then
      count:=1;

    label1.Caption:=inttostr(count);
    UDPC.Send('CT'+inttostr(count));

    Card1.Enabled:=false;
    UDPC.Send('AT');
end;

end.
