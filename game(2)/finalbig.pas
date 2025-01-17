unit finalbig;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdUDPServer, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, StdCtrls, ExtCtrls, Card,IdSocketHandle;

type
  TPoke = record
    val, color: integer;
    back: boolean;
    end;
  TForm1 = class(TForm)
    Edit1: TEdit;
    Card1: TCard;
    Card2: TCard;
    Button1: TButton;
    ListBox1: TListBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Button4: TButton;
    UDPC: TIdUDPClient;
    UDPS: TIdUDPServer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure UDPSUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PCard: array[0..51] of TPoke;
  Clr: array[0..3] of TCardSuit;
  Poke: array[0..1] of TCard;
  isR,EisR:boolean;
  getC:integer;
  cardcnt:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i,j,k: integer;
begin
for i := 0 to combobox1.Items.Capacity -1 do
    begin
        UDPC.Host := combobox1.Items[i];
        UDPC.Send('Game Start!');
    end;

    Randomize;
    for i:=0 to 51 do
    begin
      repeat
        PCard[i].val := Random(13)+1;
        PCard[i].color := Random(4);
        k:=0;
            for j:=0 to i-1 do
            begin
                if(PCard[i].val=PCard[j].val)and(PCard[i].color=PCard[j].color) then
                begin
                    k:=1;
                    break;
                end;
            end;
      until k=0;
      for j:=0 to combobox1.Items.Capacity-1 do
      begin
          if combobox1.Items[j] = Edit1.Text then
          begin
              continue;
          end;
          UDPC.Host:=combobox1.Items[j];
      end;
      UDPC.Send('val:'+inttostr(Pcard[i].val)+'clr:'+inttostr(pcard[i].color));
  end;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
     combobox1.Items.Add(Edit2.Text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
      combobox1.DeleteSelected;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //if isr=true and Eisr=true then
    begin
        UDPC.send('card'+inttostr(getC));
        isr := false;
        EisR := false;
    end;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
    UDPC.Host := ComboBox1.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Poke[0] := card1; poke[1]:=card2;
    Clr[0]:=Spades;  Clr[1]:=Hearts; Clr[2]:=Diamonds; Clr[3]:=Clubs;
    isR:=false; cardcnt:=0;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
         getC:=strtoint(edit2.Text);
         poke[0].Value := pcard[getC].val;
         poke[0].Suit := clr[pcard[getC].color];
         listbox1.items.insert(0,'你選擇了第'+inttostr(getC)+'張牌');
         UDPC.Send('Enemy選擇了第'+inttostr(getC)+'張牌');
         udpc.Send('ready');
         isR:=true;
    end;
end;

procedure TForm1.UDPSUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
  var i,k: integer;
  s:string;
begin
k := AData.Size;
      setlength(s, k);
      AData.Read(s[1], k);
      if(copy(s,1,4)='card') then
      begin
          i:=strtoint(copy(s,5,k-4));
          poke[1].Value:=pcard[strtoint(copy(s,5,k-4))].val;
          poke[1].Suit:=clr[pcard[strtoint(copy(s,5,k-4))].color];
          if(poke[0].value > poke[1].value)then
          begin
              listbox1.items.insert(0,'You Win');
              UDPC.send('You Lose');
          end
          else if (poke[0].value < poke[1].value) then
          begin
              listbox1.items.insert(0,'You Lose');
              UDPC.send('You Win');
          end
          else if(poke[0].value = poke[1].value) then
          begin
              if pcard[i].color < pcard[strtoint(copy(s,5,k-4))].color then
              begin
                  listbox1.items.insert(0,'You Win');
                  UDPC.send('You Lose');
              end
              else if pcard[i].color > pcard[strtoint(copy(s,5,k-4))].color then
              begin
                  listbox1.items.insert(0,'You Lose');
                  UDPC.send('You Win');
              end
              else if pcard[i].color = pcard[strtoint(copy(s,5,k-4))].color then
              begin
                  listbox1.items.insert(0,'Draw');
                  UDPC.send('Draw');
              end;
          end;
      end
      else if copy(s,1,5)='ready' then
      begin
          EisR:=true;
      end
      else if copy(s,1,5)='Enemy' then
      begin
          listbox1.Items.Insert(0,s);
      end
      else if copy(s,1,3)='val' then
      begin
          PCard[cardcnt].val := strtoint(copy(s,5,pos('c',s)-5));
          PCard[cardcnt].color := strtoint(copy(s,pos('c',s)+4,1));
          cardcnt:=cardcnt+1;
      end
      else if copy(s,1,4)='Game' then
      begin
          Button1.Visible:=false;
          listbox1.Items.Insert(0,'遊戲開始!');
      end;
end;

end.
