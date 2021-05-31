unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Card, StdCtrls, ExtCtrls, IdUDPServer, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPClient, IdSocketHandle;

type
  TForm1 = class(TForm)
    Card1: TCard;
    Card2: TCard;
    Card3: TCard;
    Card4: TCard;
    Card5: TCard;
    Card6: TCard;
    Card7: TCard;
    Card8: TCard;
    Card9: TCard;
    Card10: TCard;
    Card11: TCard;
    Card12: TCard;
    Card13: TCard;
    Card14: TCard;
    Card15: TCard;
    Card16: TCard;
    Card17: TCard;
    Card18: TCard;
    Card19: TCard;
    Card20: TCard;
    Card21: TCard;
    Card22: TCard;
    Card23: TCard;
    Card24: TCard;
    Card25: TCard;
    Card26: TCard;
    Card27: TCard;
    Card28: TCard;
    Card29: TCard;
    Card30: TCard;
    Card31: TCard;
    Card32: TCard;
    Card33: TCard;
    Card34: TCard;
    Card35: TCard;
    Card36: TCard;
    Card37: TCard;
    Card38: TCard;
    Card39: TCard;
    Card40: TCard;
    Card41: TCard;
    Card42: TCard;
    Card43: TCard;
    Card44: TCard;
    Card45: TCard;
    Card46: TCard;
    Card47: TCard;
    Card48: TCard;
    Card49: TCard;
    Card50: TCard;
    Card51: TCard;
    Card52: TCard;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Button3: TButton;
    UDPC: TIdUDPClient;
    UDPS: TIdUDPServer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Card1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure UDPSUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Poke: array[1..52] of TCard;
  count,tt: integer;
  ttt: TCardSuit;
  shit: boolean;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var l, a, x, temp, i: integer;
    tempst: TCardSuit;
begin
  Randomize;
    for l:=52 downto 1 do     //¬~µP
    begin
      a:=Random(l)+1;

      temp:=Poke[a].Value;
      tempst:=Poke[a].Suit;

      Poke[a].Value:=Poke[l].Value;
      Poke[a].Suit:=Poke[l].Suit;

      Poke[l].Value:=temp;
      Poke[l].Suit:=tempst;

      if Poke[l].Suit = Spades then
        x:=1
      else if Poke[l].Suit = Hearts then
        x:=2
      else if Poke[l].Suit = Diamonds then
        x:=3
      else if Poke[l].Suit = Clubs then
        x:=4;


    {if UDPC.Active = true then
    Begin
      v := format('%.2d%.2d%d',[l,Poke[l].Value,x]);
      UDPC.Send( 'VA'+v );
    end;}
    end;

    Poke[1].Enabled:=true;
    button1.Enabled:=false;
    button3.Enabled:=true;
    count:=0;
    button2.Enabled:=true;
    shit:=false;



end;

procedure TForm1.FormCreate(Sender: TObject);
var j, k, m, n :integer;
begin
    Poke[1]:=card1;
    Poke[2]:=card2;
    Poke[3]:=card3;
    Poke[4]:=card4;
    Poke[5]:=card5;
    Poke[6]:=card6;
    Poke[7]:=card7;
    Poke[8]:=card8;
    Poke[9]:=card9;
    Poke[10]:=card10;
    Poke[11]:=card11;
    Poke[12]:=card12;
    Poke[13]:=Card13;
    Poke[14]:=Card14;
    Poke[15]:=Card15;
    Poke[16]:=Card16;
    Poke[17]:=Card17;
    Poke[18]:=Card18;
    Poke[19]:=Card19;
    Poke[20]:=Card20;
    Poke[21]:=Card21;
    Poke[22]:=Card22;
    Poke[23]:=Card23;
    Poke[24]:=Card24;
    Poke[25]:=Card25;
    Poke[26]:=Card26;
    Poke[27]:=Card27;
    Poke[28]:=Card28;
    Poke[29]:=Card29;
    Poke[30]:=Card30;
    Poke[31]:=Card31;
    Poke[32]:=Card32;
    Poke[33]:=Card33;
    Poke[34]:=Card34;
    Poke[35]:=Card35;
    Poke[36]:=Card36;
    Poke[37]:=Card37;
    Poke[38]:=Card38;
    Poke[39]:=Card39;
    Poke[40]:=Card40;
    Poke[41]:=Card41;
    Poke[42]:=Card42;
    Poke[43]:=Card43;
    Poke[44]:=Card44;
    Poke[45]:=Card45;
    Poke[46]:=Card46;
    Poke[47]:=Card47;
    Poke[48]:=Card48;
    Poke[49]:=Card49;
    Poke[50]:=Card50;
    Poke[51]:=Card51;
    Poke[52]:=Card52;


    for j:=1 to 13 do
    begin
      Poke[j].Suit:=Spades;
      Poke[j].Value:=j;
    end;

    for k:=14 to 26 do
    begin
      Poke[k].Suit:=Hearts;
      Poke[k].Value:=k-13;
    end;

    for m:=27 to 39 do
    begin
      Poke[m].Suit:=Diamonds;
      Poke[m].Value:=m-26;
    end;

    for n:=40 to 52 do
    begin
      Poke[n].Suit:=Clubs;
      Poke[n].Value:=n-39;
    end;

    label1.Caption:='Ready...';
    count:=0;
    Poke[1].ShowDeck:=true;
    Poke[1].Enabled:=false;

end;

procedure TForm1.Card1Click(Sender: TObject);
var i,j,k,x,y: integer;
    a,b: String;
begin
    Poke[1].ShowDeck:=false;
    UDPC.Send('OP');

    if shit = false then begin
      for i:=1 to 51 do Begin
        Poke[i].Value:=Poke[i+1].Value;
        Poke[i].Suit:=Poke[i+1].Suit;
      end;
    end
    else begin
      for j:=1 to 51 do Begin
        Poke[j].Value:=Poke[j+1].Value;
        Poke[j].Suit:=Poke[j+1].Suit;
      end;
      for k:=1 to 51 do Begin
        Poke[k].Value:=Poke[k+1].Value;
        Poke[k].Suit:=Poke[k+1].Suit;
      end;
    end;
    shit:=false;



      if Poke[1].Suit = Spades then
        x:=1
       else if Poke[1].Suit = Hearts then
        x:=2
       else if Poke[1].Suit = Diamonds then
        x:=3
       else if Poke[1].Suit = Clubs then
        x:=4;

      if Poke[2].Suit = Spades then
        y:=1
      else if Poke[2].Suit = Hearts then
        y:=2
       else if Poke[2].Suit = Diamonds then
        y:=3
      else if Poke[2].Suit = Clubs then
        y:=4;

    if UDPC.Active = true then Begin
      a := format('%.2d%d',[Poke[1].Value,x]);
      UDPC.Send( 'SH'+a );
    end;

    if UDPC.Active = true then Begin
      b := format('%.2d%d',[Poke[2].Value,y]);
      UDPC.Send( 'NT'+b );
    end;


    if count<13 then
      count:=count+1
    else if count=13 then
      count:=1;

    label1.Caption:=inttostr(count);
    UDPC.Send('CT'+inttostr(count));

    Card1.Enabled:=false;
    UDPC.Send('BT');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if Poke[1].Value=count then begin
      label1.Caption:='YOU WIN';
      button2.Enabled:=false;
      UDPC.Send('ED');
      UDPC.Send('AW');
    end
    else begin
      label1.Caption:='YOU LOSE';
      button2.Enabled:=false;
      UDPC.Send('ED');
      UDPC.Send('AL')
    end;


end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    button1.Enabled:=true;
    button3.Enabled:=false;
    Poke[1].ShowDeck:=true;
    label1.Caption:='Again';
    button2.Enabled:=true;
    UDPC.Send('AG');
end;

procedure TForm1.UDPSUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var k,i: integer;
    z,s: String;
begin
    k:=AData.Size; setlength( s,k );
    AData.Read( s[1],k );

    z:=copy(s,1,2);
    if z='CT' then begin
      label1.Caption:=copy(s,3,2);
      count:=strtoint( copy(s,3,2) );
    end;


    if z='ED' then
      button2.Enabled:=false;

    if z='BW' then
      label1.Caption:='YOU LOSE';
    if z='BL' then
      label1.Caption:='YOU WIN';

    if z='AT' then begin
      Poke[1].Enabled:=true;
      shit:=true;
    end;

    if z='TT' then begin
      for i:=1 to 51 do Begin
        Poke[i].Value:=Poke[i+1].Value;
        Poke[i].Suit:=Poke[i+1].Suit;
      end;
    end;



end;

end.
