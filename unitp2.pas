unit unitp2;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Process,Dos;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  filename: string;
  s : ansistring;
  execparms : string;
  home : string;
implementation


{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
  home := GetEnv('HOME');
  filename := OpenDialog1.Filename;
  // ShowMessage(filename);
  execparms := home + 'deliv_note/' + Edit2.Text + ' ' + Edit1.Text + ' ' + filename ;
  if not RunCommand('/bin/bash',['-c', home + '/deliv_note/' + Edit2.Text + ' ' + Edit1.Text + ' ' + filename],s) then
    Showmessage(s);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
     // Edit2.Text := IntToStr(ListBox1.Itemindex);
    Edit2.Text := ListBox1.Items[ListBox1.Itemindex];
end;



end.

