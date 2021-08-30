unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, TAGraph, TASeries, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Clear_All2: TButton;
    Clear_All1: TButton;
    RunECG: TButton;
    RunSinus: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart4: TChart;
    Chart4LineSeries2: TLineSeries;
    Chart4LineSeries3: TLineSeries;
    ECG: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit12: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ListBox3: TListBox;
    ListBox4: TListBox;
    PageControl1: TPageControl;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    OpenDialog1: TOpenDialog;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Sinusoidal: TTabSheet;
    procedure Clear_All1Click(Sender: TObject);
    procedure Clear_All2Click(Sender: TObject);
    procedure RunSinusClick(Sender: TObject);
    procedure RunECGClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    function sinyal_sinus (a,b,c,d: extended):extended;
  private

  public

  end;

var
  Form1: TForm1;
  jmlh_data, i, j, n, p, q, n_data, xy, frek_s, amp, frek : integer;
  sinyal, t_hold, bpm, y_max, fs, jarak : extended;
  sinus_1, sinus_2, a_cor, c_cor, x, yr, xr, noise, delay, gain: array [0..10000] of extended;
  file_Ecg : TextFile;

implementation

{$R *.lfm}

{ TForm1 }
function TForm1.sinyal_sinus(a,b,c,d: extended):extended;
begin
  sinyal := a*sin((2*pi*b*(d/c)));
  result := sinyal;
end;

procedure TForm1.RunSinusClick(Sender: TObject);
begin
  frek_s := strtoint(Edit1.Text);
  n_data := strtoint(Edit2.Text);
  amp    := strtoint(Edit3.Text);
  frek   := strtoint(Edit4.Text);

  {if RadioButton2.Checked = true then //plot sinus1 dan sinus2
  begin
    Chart4LineSeries2.Clear;
    Chart4LineSeries3.Clear;
    for i:=0 to n_data-1 do
    begin
      //noise  [i] := randg(rata2,std);
      sinus_1[i] := random + sinyal_sinus(amp,frek,frek_s,i);
      sinus_2[i] := random + q*sinyal_sinus(amp,frek,frek_s,i);
      delay  [i] := sinus_2[i-p];
      Chart4LineSeries2.AddXY(i,sinus_1[i]);
      Chart4LineSeries3.AddXY(i,delay[i]);
    end;
  end;}

  if RadioButton3.Checked = true then  //cross correlation
  begin
    Chart3LineSeries1.Clear;
    for i:=0 to n_data-1 do
    begin
      sinus_1[i] := 0;
      sinus_2[i] := 0;
    end;

    for i:=0 to n_data-1 do
    begin
      sinus_1[i]   := random +   sinyal_sinus(amp,frek,frek_s,i);
      sinus_2[i+p] := random + q*sinyal_sinus(amp,frek,frek_s,i-p);
    end;

    for i:=0 to n_data-1 do
    begin
      c_cor[i] := 0;
      for j:=0 to n_data-1 do
          c_cor[i] := c_cor[i] + (sinus_1[j]*sinus_2[j+i]);
      Chart3LineSeries1.AddXY(i,c_cor[i]/n_data);
    end;

    y_max := 0;
    xy    := 0;

    for i:=0 to n_data-1 do //mencari peak tertinggi
    begin
      if y_max < c_cor[i] then
      begin
        y_max := c_cor[i];
        xy    := i;
      end;
      Edit6.Text := floattostr(y_max/n_data);
      Edit12.Text:= inttostr  (xy);
    end;
  end;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject); //ubahan delay
begin
  Chart4LineSeries3.Clear;
  p := ScrollBar1.Position*10;
  ScrollBar1.Min     := 1;
  ScrollBar1.Max     := strtoint(Edit2.Text) div 10;
  Label7.Caption     := inttostr(p);

  for i:=0 to n_data do
    sinus_2[-i] := sinus_2[0];

  for i:=0 to n_data do
    delay[i] := 0;

  for i:=0 to n_data-1 do
  begin
    delay[i]:= sinus_2[i-p];
    Chart4LineSeries3.AddXY(i,delay[i]);
  end;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject); //ubahan gain
begin
  Chart4LineSeries3.Clear;
  ScrollBar2.Min     := 1;
  ScrollBar2.Max     := 100;
  Label13.Caption    := inttostr(ScrollBar2.Position);
  q := ScrollBar2.Position;

  for i:=p to n_data do
  begin
    gain[i] := noise[i-p] + q*sinyal_sinus(amp,frek,frek_s,i-p);
    Chart4LineSeries3.AddXY(i,gain[i]);
  end;
end;

procedure TForm1.RunECGClick(Sender: TObject);
begin
  fs := 1/0.002;
  if RadioButton4.Checked = true then
  begin
    Chart1LineSeries1.Clear;
    if OpenDialog1.Execute then
    begin
      jmlh_data := 0;
      AssignFile(file_Ecg,OpenDialog1.FileName);
      reset(file_Ecg);
      while not Eof (file_Ecg) do
      begin
        jmlh_data := jmlh_data + 1;
        ReadLn(file_Ecg,n,x[n]);
      end;
      closefile(file_Ecg);
    end;

    for j:=0 to jmlh_data-1 do
      Chart1LineSeries1.AddXY(j,x[j]);
  end;

  if RadioButton1.Checked = true then //autocorrelation
  begin
    Chart2LineSeries1.Clear;
    for i:=0 to jmlh_data-1 do
    begin
      a_cor[i] := 0;
      for j:=0 to jmlh_data-1-i do
      begin
        a_cor[i] := a_cor[i] + (x[j]*x[i+j]/jmlh_data);
      end;
      Chart2LineSeries1.AddXY(i,a_cor[i]);
      listbox4.Items.Add(floattostr(a_cor[i]));
      listbox3.Items.Add(inttostr(i));
    end;
  end;

  if RadioButton5.Checked = true then // Find periode
  begin
    y_max := 0;
    xy := 0;

    for i:=0 to jmlh_data-1 do
    begin
      if y_max < a_cor[i] then
      begin
        y_max := a_cor[i];
        xy := i;
      end;
    end;

    t_hold := y_max*sqrt(2)/4;
    Edit5.Text := floattostrf (t_hold,ffnumber,3,2);

    //j := 0;
    for i:=0 to jmlh_data-1 do
    begin
      if a_cor[i] > strtofloat(Edit5.Text) then
      begin
        if (a_cor[i]>a_cor[i-1]) and (a_cor[i]>a_cor[i+1]) then
        begin
          yr[i] := a_cor[i];
          xr[i] := i;
          Edit7.Text := floattostr(xr[i]-xr[i-1]);
          //j := j + 1;
        end;
      end;
    end;
  end;
end;

procedure TForm1.Clear_All1Click(Sender: TObject);
begin
  Chart3LineSeries1.Clear;
  Chart4LineSeries2.Clear;
  Chart4LineSeries3.Clear;
  ScrollBar1.Position:=1;
  ScrollBar2.Position:=ScrollBar2.Min;
  Edit6.Clear;
  Edit12.Clear;
end;

procedure TForm1.Clear_All2Click(Sender: TObject);
begin
  Edit5.Clear;
  Edit7.Clear;
  ListBox3.Clear;
  ListBox4.Clear;
  Chart1LineSeries1.Clear;
  Chart2LineSeries1.Clear;
end;

end.

