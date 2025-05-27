{
  EDITEL - Screen Editor and Generator for GnuCobol
  by Mauricio V. Vieira

  Version 1.0 - Nov/2023
}
Uses CRT, DOS;

Type
  layout_tela = Array[1..24,1..80] of Char;
  layout_cor = Array [1..24,1..80, 1..2] of Integer;

Var
  cor_atual, cor_fundo : integer;
  tela: layout_tela;
  tela_cores: layout_cor;
  tecla: char;
  opcao_cor: char;
  linha: integer;
  coluna: integer;
  chave80: boolean;
  arquivo: text;
  caracter : char;
  nome_arq : string;
  i,j: integer;

Function UpperCase(palavra : string): string;
Begin
  For i := 1 to length(palavra) Do
    palavra[i]:=Upcase(palavra[i]);
  UpperCase := palavra;
End;

Procedure Rodape(linha : string);
Begin
  TextColor(Black);
  TextBackground(White);
  For i := 1 to (80 - length(linha) - 1) Do
    linha:=linha + ' ';
  GotoXY(1,25);
  Write(linha);

  Textbackground(Black);
  TextColor(White);
End;

Procedure Menu_Rodape;
Begin
  GotoXY(1,25);
  Textbackground(LightGray);
  TextColor(Red);
  Write('ESC');
  TextColor(Black);
  Write('-Exit ');
  TextColor(Red);
  Write('F1');
  TextColor(Black);
  Write('-Help ');
  TextColor(Red);
  Write('F2');
  TextColor(Black);
  Write('-Save ');
  TextColor(Red);
  Write('F3');
  TextColor(Black);
  Write('-Open ');
  TextColor(Red);
  Write('F4');
  TextColor(Black);
  Write('-Save As ');
  TextColor(Red);
  Write('F5');
  TextColor(Black);
  Write('-.CPY ');
  TextColor(Red);
  Write('F6');
  TextColor(Black);
  Write('-Clear ');
  TextColor(Red);
  Write('F7');
  TextColor(Black);
  Write('-FCol ');
  TextColor(Red);
  Write('F8');
  TextColor(Black);
  Write('-BCol   ');
  TextColor(White);
  GotoXY(80,25);
  Write('');
  GotoXY(1,25);
  Textbackground(Black);
End;

Function Definir_Cor (tipo: char) : integer;
Var cor_atual : integer;
Begin
  GotoXY(1,25);
  TextColor(Black);
  Write('             ');
  Textbackground(White);
  Write('F1');
  Textbackground(Black);
  TextColor(Blue);
  Write(' F2 ');
  TextColor(Green);
  Write('F3 ');
  TextColor(Cyan);
  Write('F4 ');
  TextColor(Red);
  Write('F5 ');
  TextColor(Magenta);
  Write('F6 ');
  TextColor(Brown);
  Write('F7 ');
  TextColor(White);
  Write('F8 ');

  TextColor(White);
  Textbackground(Black);
  Write(' => Select ');
  If tipo = 'B' Then Write('Background ')
                Else Write('Foreground ');
  Write('Color               ');
  opcao_cor:=Readkey;

  { Teclas de F1 a F8 definem a cor desejada }
  Case opcao_cor of
    #0 : Begin { Teclas de Funcao }
           opcao_cor:=ReadKey;
           Case opcao_cor of
             #59 : cor_atual:=Black;
             #60 : cor_atual:=Blue;
             #61 : cor_atual:=Green;
             #62 : cor_atual:=Cyan;
             #63 : cor_atual:=Red;
             #64 : cor_atual:=Magenta;
             #65 : cor_atual:=Brown;
             #66 : cor_atual:=White;
           End;
        End;
  End;

  Definir_Cor := cor_atual;
  Menu_Rodape;
End;

Procedure Carrega_Tela;
Begin
  For i := 1 to 24 Do
    For j := 1 to 80 Do
      Begin
        GotoXY(j,i);
        Textcolor(tela_cores[i,j,1]);
        Textbackground(tela_cores[i,j,2]);
        Write(tela[i,j]);
      End;
End;

Procedure Limpar_Tela;
Begin
  For linha := 1 to 24 Do
    For coluna := 1 to 80 Do
      Begin
        tela[linha,coluna] := ' ';
        tela_cores[linha,coluna,1]:=White;
        tela_cores[linha,coluna,2]:=Black;
      End;
  Linha:=1;
  Coluna:=1;
  Carrega_Tela;
  cor_atual:=White;
  cor_fundo:=Black;
  Menu_Rodape;
End;

Procedure Ajuda;
Begin
  TextColor(Yellow);
  TextBackground(Blue);
  GotoXY(10,3);
  Write('+-------------------------------------------------------------+');
  GotoXY(10,4);
  Write('|                                                             |');
  GotoXY(10,5);
  Write('|       EEEEEEE  DDDDDDD   I  TTTTTTT  EEEEEEE  L     v1.0    |');
  GotoXY(10,6);
  Write('|       E        D     D   I     T     E        L             |');
  GotoXY(10,7);
  Write('|       EEEEE    D      D  I     T     EEEEE    L             |');
  GotoXY(10,8);
  Write('|       E        D     D   I     T     E        L             |');
  GotoXY(10,9);
  Write('|       EEEEEEE  DDDDDDD   I     T     EEEEEEE  LLLLLLL       |');
  GotoXY(10,10);
  Write('|                                                             |');
  GotoXY(10,11);
  Write('+-------------------------------------------------------------+');
  GotoXY(10,12);
  Write('| Use the arrow keys to move the cursor and type in the       |');
  GotoXY(10,13);
  Write('| characters as in an word processor app. <Delete> key to     |');
  GotoXY(10,14);
  Write('| erase. <Enter> will move the cursor to the next line        |');
  GotoXY(10,15);
  Write('| To create an input field in the Screen Section area, put    |');
  GotoXY(10,16);
  Write('| it between brackets [] and fill it up with the desired mask |');
  GotoXY(10,17);
  Write('| Once you are finished, hit <F5> to generate the .CPY        |');
  GotoXY(10,18);
  Write('| file at the very same directory your .SCR file is. Include  |');
  GotoXY(10,19);
  Write('| this .CPY file using the COPY command in your COBOL program |');
  GotoXY(10,20);
  Write('+-------------------------------------------------------------+');

  Readkey;
  Textbackground(Black);
  TextColor(White);
  Carrega_tela;
  Menu_Rodape;
End;

Procedure Ler_Arquivo;
Var numero,status : integer;
    nome_velho, i_s : string;
Begin
  { Carregando para a matriz a tela gravada }
  nome_velho:=nome_arq;
  GetDir(0,i_s);
  i_s := 'Directory: ' + i_s + ' Filename: *.SCR => ';
  Rodape(i_s);
  GotoXY(Length(i_s) + 1,25);
  TextColor(Blue);
  TextBackground(LightGray);
  Readln(nome_arq);
  nome_arq := UpperCase(nome_arq);
  Textbackground(Black);
  TextColor(White);
  Clrscr;
  GotoXY(1,25);

  If Length(nome_arq) > 0 Then
  Begin
    {$I-}
    Assign(arquivo,nome_arq + '.SCR');
    Reset(arquivo);
    {$I+}
    If IOResult = 0 Then
    Begin
      For i := 1 to 24 Do
        For j := 1 to 80 Do
          Begin
            Readln(arquivo,caracter);
            tela[i,j] := caracter;
            Readln(arquivo,i_s);
            Val(i_s,numero,status);
            tela_cores[i,j,1]:=numero;
            Readln(arquivo,i_s);
            Val(i_s,numero,status);
            tela_cores[i,j,2]:=numero;
          End;
      Close(arquivo);
    End
    Else
    Begin
      Rodape('Error in filename - could NOT read !');
      nome_arq:=nome_velho;
      Delay(1500);
    End;
  End;

  Carrega_tela;
  Menu_Rodape;
End;

Procedure Salvar_Arquivo(novo: boolean);
Var nome: string;
    i_s: string;
Begin
  { Faz a logica do F4 para pegar o novo nome => Save As }
  If (novo) or (nome_arq = '') Then
  Begin
    GetDir(0,i_s);
    i_s := 'Directory: ' + i_s + ' Filename: *.SCR => ';
    Rodape(i_s);
    GotoXY(Length(i_s) + 1,25);
    Textcolor(Blue);
    TextBackground(LightGray);
    Readln(nome);
    GotoXY(1,25);
    nome:=UpperCase(nome);
    Textbackground(Black);
    TextColor(White);
    if (Length(nome) > 0) and (Length(nome) <= 8) Then nome_arq := nome;
  End;

  Carrega_tela;

  { Faz a logica do F2 e F4 }
  If (nome_arq <> '') and (nome <> '') Then
  Begin
    {$I-}
    Assign(arquivo,nome_arq + '.SCR');
    Rewrite(arquivo);
    {$I+}
    If IOResult = 0 Then
    Begin
      { Grava a tela }
      For i := 1 to 24 Do
        For j := 1 to 80 Do
          Begin
            Writeln(arquivo,tela[i,j]);
            Str(tela_cores[i,j,1],i_s);
            Writeln(arquivo,i_s);
            Str(tela_cores[i,j,2],i_s);
            Writeln(arquivo,i_s);
          End;
      Close(arquivo);

      GetDir(0,i_s);
      i_s :=  i_s + '\' + nome_arq + '.SCR';
      Rodape('File ' + i_s + ' was successfully saved !');
      Delay(1500);
    End
    Else
    Begin
      Rodape('Error - could NOT write file !');
      Delay(1500);
    End;
  End;

  Menu_Rodape;
End;

Function Trim(palavra: string): string;
Var i : integer;
    p_nova: string;
Begin
  p_nova:='';
  If Length(palavra) > 0 then
    For i:= 1 to Length(palavra) Do
      If palavra[i] <> ' ' Then p_nova:= p_nova + palavra[i];
  Trim:=p_nova;
End;

Function RTrim(palavra: string): string;
Var i,j : integer;
    p_nova: string;
    final: boolean;
Begin
  final := false;
  i:= Length(palavra);

  While (i > 0) and (not final) Do
    If palavra[i] <> ' ' Then final:=true
                         Else i := i - 1;

  If i = 0 Then
     p_nova := palavra
  Else
    Begin
      p_nova := '';
      For j:=1 to i Do
        p_nova := p_nova + palavra[j];
    End;

  RTrim:= p_nova;
End;

Function LTrim(palavra: string): string;
Var i,j : integer;
    p_nova: string;
    final: boolean;
Begin
  final := false;
  i:= 1;

  While (i <= Length(palavra)) and (not final) Do
    If palavra[i] <> ' ' Then final:=true
                         Else i := i + 1;

  If i >= Length(palavra) Then
     p_nova := palavra
  Else
    Begin
      p_nova := '';
      For j:=i to Length(palavra) Do
        p_nova := p_nova + palavra[j];
    End;

  LTrim:= p_nova;
End;

Function So_tem(palavra: string;caracter: char): boolean;
Var i : integer;
Begin
  So_tem := true;
  If Length(palavra) > 0 then
  Begin
    For i:=1 to Length(palavra) Do
      If palavra[i] <> caracter then So_tem := false
  End;
End;

Function Converte_Cor(cor: integer): integer;
Begin
  { Converte o codigo de cor do Turbo Pascal para o COBOL }
  Case Cor of
    White     : Converte_Cor := 7;
    Red       : Converte_Cor := 4;
    Green     : Converte_Cor := 2;
    Cyan      : Converte_Cor := 3;
    Blue      : Converte_Cor := 1;
    Brown     : Converte_Cor := 6;
    Magenta   : Converte_Cor := 5;
    Black     : Converte_Cor := 0;
  End;
End;

Procedure Grava_trecho_SCR (trecho : string; posicao_inicio: integer; c_a: integer;c_f: integer);
Var linha_saida, i_s: string;
Begin
  If So_tem(trecho,trecho[1]) Then
  Begin
    Str(Length(trecho),i_s);
    linha_saida:='           05  FILLER PIC X(' + i_s + ') ';
    linha_saida:= linha_saida + 'VALUE ALL "' + trecho[1] + '" ';
  End
  Else
  Begin
    linha_saida:='           05  VALUE "';

    { Checa se ha espacos a esquerda e corrige coluna inicial caso sim }
    If Length(LTrim(trecho)) < Length(trecho) Then
    Begin
      posicao_inicio := posicao_inicio + Length(trecho) - Length(Ltrim(trecho));
      trecho := LTrim(trecho);
    End;

    linha_saida:= linha_saida + RTrim(trecho) + '"';
  End;

  Writeln(arquivo,linha_saida);
  Str(i,i_s);
  linha_saida:= '               LINE ' + i_s + ' COLUMN ';
  Str(posicao_inicio,i_s);
  linha_saida:= linha_saida + i_s + ' ';
  c_f := Converte_Cor(c_f);
  Str(c_f,i_s);
  linha_saida:= linha_saida + 'BACKGROUND-COLOR ' + i_s + ' ';
  c_a := Converte_Cor(c_a);
  Str(c_a,i_s);
  linha_saida:= linha_saida + 'FOREGROUND-COLOR ' + i_s + '.';
  Writeln(arquivo,linha_saida);
End;

Procedure Gerar_Screen_Section;
Var
   contador_s, linha_saida, mascara, i_s, trecho : string;
   c_a, c_f, tamanho, posicao_inicio, k, contador : integer;
   tanocampo : boolean;
   Year, Month, Day, Wday, Hour, Min, Sec, HSec : word;
Begin
    Assign(arquivo,nome_arq + '.CPY');
    Rewrite(arquivo);

    { Checa se ha campos de entrada ou se e' so' visualizacao }
    contador := 0;
    For i := 1 to 24 Do
      For j := 1 to 80 Do
        If tela[i,j]='[' Then contador := contador + 1;

    { Grava Cabecalho }
    GetDate(Year,Month, Day, Wday);
    GetTime(Hour, Min, Sec, HSec);
    Str(Month, i_s);
    trecho := i_s + '/';
    Str(Day, i_s);
    trecho := trecho + i_s + '/';
    Str(Year, i_s);
    trecho := trecho + i_s + ' ';
    Str(Hour,i_s);
    trecho := trecho + i_s + ':';
    Str(Min,i_s);
    trecho := trecho + i_s + ':';
    Str(Sec,i_s);
    trecho := trecho + i_s;
    Writeln(arquivo,'      **************************************************************');
    Writeln(arquivo,'      *     File: '+ nome_arq + '.CPY');
    Writeln(arquivo,'      *     Creation Date/Time: '+ trecho);
    Writeln(arquivo,'      * ------------------------------------------------------------');
    Writeln(arquivo,'      *     Screen Created and Code Generated with EDITEL');
    Writeln(arquivo,'      *     Developed by Mauricio Valadao Vieira in 2023');
    Writeln(arquivo,'      *     This is a FREE software with NO licensing fee or charge');
    Writeln(arquivo,'      **************************************************************');
    Writeln(arquivo,'      *');

    { Se houver campos de entrada, cria-los na WORKING-STORAGE SECTION }
    If contador > 0 Then
    Begin
      Writeln(arquivo,'       WORKING-STORAGE SECTION.');
      Writeln(arquivo,'       01  ' + nome_arq + '-SCR-FIELDS.');

      { Faz a varredura de linhas e colunas em busca de campos de ENTRADA }
      k := 1;
      tanocampo := false;
      For i := 1 to 24 Do
        For j := 1 to 80 Do
          Case tela[i,j] Of
            '[' : Begin
                    tamanho := 0;
                    tanocampo := true;
                    mascara := '';
                  End;
            ']' : Begin
                    if tanocampo Then
                    Begin
                      Str(k, contador_s);
                      if k < 10 Then contador_s := '0' + contador_s;

                      linha_saida := '           05  ' + nome_arq + '-SCR-F-' + contador_s + '    PIC ';
                      If (so_tem(mascara,'X')) or (so_tem(mascara,'9')) Then
                      Begin
                        If so_tem(mascara,'X') Then mascara := 'X'
                                               Else mascara := '9';
                        linha_saida := linha_saida + mascara + '(';
                        Str(tamanho, contador_s);
                        if tamanho < 10 Then contador_s := '0' + contador_s;
                        linha_saida :=  linha_saida + contador_s + ').';
                      End
                      Else
                        linha_saida := linha_saida + mascara + '.';

                      Writeln(arquivo,linha_saida);
                      tanocampo := false;
                      k := k + 1;
                    End
                    Else
                    Begin
                      Rodape('There is a field which does not have a closing bracket ! => ]');
                      Delay(1500);
                    End;
                  End;
            Else Begin
                   If tanocampo Then
                   Begin
                     mascara := mascara + Upcase(tela[i,j]);
                     tamanho := tamanho + 1;
                   End;
                 End;
          End;
    End;

    { Comeca a gerar a SCREEN SECTION }
    Writeln(arquivo,'      *');
    Writeln(arquivo,'       SCREEN SECTION.');
    Writeln(arquivo,'       01  ' + nome_arq + '-SCR.');
    Writeln(arquivo,'           05  VALUE " " BLANK SCREEN LINE 1 COLUMN 1.');

    { Grava primeiro os trechos que NAO sao campos de entrada }
    For i := 1 to 24 Do
    Begin
      trecho := '';
      posicao_inicio := 1;
      tanocampo:= false;

      For j:= 1 to 80 Do
      Begin
        Case tela[i,j] Of
          '[': Begin
                 tanocampo := true;
                 If Trim(trecho) <> ''
                    Then Grava_trecho_SCR(trecho,posicao_inicio, c_a, c_f)
                    Else If (Length(trecho) > 0) and (tela_cores[i,j-1, 2] <> Black)
                            Then Grava_trecho_SCR(trecho,posicao_inicio, c_a, c_f);
                 trecho := '';
               End;
          ']': Begin
                 tanocampo := false;
                 posicao_inicio := j + 1;
                 trecho := '';
               End;
          Else
               If Not tanocampo then
               Begin
                 trecho := trecho + tela[i,j];
                 c_a := tela_cores[i,j,1];
                 c_f := tela_cores[i,j,2];

                 { Se a cor vai mudar no proximo caracter, grava o trecho }
                 If (j < 80) And
                    ((tela_cores[i,j,1] <> tela_cores[i,j + 1,1]) Or
                    (tela_cores[i,j,2] <> tela_cores[i,j + 1,2])) Then
                    Begin
                      Grava_trecho_SCR(trecho,posicao_inicio,c_a,c_f);
                      trecho := '';
                      tanocampo := false;
                      posicao_inicio := j + 1;
                    End;
               End;
        End;

        { Se chegou no limite de 40 caracteres ou no final da linha, grava }
        if (Length(trecho) = 40) Or (j = 80) Then
        Begin
          If Trim(trecho) <> ''
             Then Grava_trecho_SCR(trecho,posicao_inicio,c_a,c_f)
             Else If (Length(trecho) > 0) and (tela_cores[i,j-1, 2] <> Black)
                     Then Grava_trecho_SCR(trecho,posicao_inicio, c_a, c_f);

          posicao_inicio := j + 1;
          trecho := '';
          tanocampo := false;
        End;
      End;
    End;

    { Grava agora a parte de campos de ENTRADA caso EXISTAM }
    If contador > 0 Then
    Begin
      { Faz a varredura de linhas e colunas em busca de campos de ENTRADA }
      k := 1;
      tanocampo := false;
      For i := 1 to 24 Do
        For j := 1 to 80 Do
          Case tela[i,j] Of
            '[' : Begin
                    tamanho := 0;
                    tanocampo := true;
                    posicao_inicio := j;
                    mascara := '';
                  End;
            ']' : Begin
                    if tanocampo Then
                    Begin
                      Str(k, contador_s);
                      if k < 10 Then contador_s := '0' + contador_s;
                      linha_saida := '           05  ' + nome_arq + '-SCR-I-' + contador_s + ' LINE ';
                      Str(i, contador_s);
                      linha_saida := linha_saida + contador_s + ' COLUMN ';
                      Str(posicao_inicio, contador_s);
                      linha_saida := linha_saida + contador_s + ' PIC ';

                      If (so_tem(mascara,'X')) or (so_tem(mascara,'9')) Then
                      Begin
                        If so_tem(mascara,'X') Then mascara := 'X'
                                               Else mascara := '9';
                        linha_saida := linha_saida + mascara + '(';
                        Str(tamanho, contador_s);
                        if tamanho < 10 Then contador_s := '0' + contador_s;
                        linha_saida :=  linha_saida + contador_s + ') ';
                      End
                      Else
                        linha_saida := linha_saida + mascara;
                      Writeln(arquivo,linha_saida);

                      linha_saida := '               REVERSE-VIDEO AUTO-SKIP TO ';
                      Str(k, contador_s);
                      If k < 10 Then contador_s := '0' + contador_s;
                      linha_saida := linha_saida + nome_arq + '-SCR-F-' + contador_s +'.';
                      Writeln(arquivo,linha_saida);

                      tanocampo := false;
                      k := k + 1;
                    End
                    Else
                    Begin
                      Rodape('There is a field which does not have a closing bracket ! => ]');
                      Delay(1500);
                    End;
                  End;
            Else Begin
                   If tanocampo Then
                   Begin
                     tamanho := tamanho + 1;
                     mascara := mascara + Upcase(tela[i,j]);
                   End;
                 End;
          End;
    End;

    { Geracao bem sucedida }
    Close(arquivo);

    GetDir(0,i_s);
    i_s :=  i_s + '\' + nome_arq + '.CPY';

    Rodape(i_s + ' file was successfully generated !');
    Delay(2000);
    Menu_Rodape;
End;

Begin
  cor_atual:=White;
  cor_fundo := Black;
  nome_arq:= '';
  chave80:=false;
  Clrscr;
  Limpar_Tela;

  Repeat
    If linha < 1 Then linha := 1;
    If coluna < 1 Then coluna := 1;
    If linha > 24 Then linha := 24;
    If coluna > 80 Then coluna := 80;
    GotoXY(coluna,linha);

    tecla := Readkey;
    Case tecla of
      #0 : Begin { Setas e Teclas de Funcao }
             tecla:=ReadKey;
             Case Tecla of
               #75 : coluna:=coluna - 1;     { Seta Esquerda }
               #77 : coluna:=coluna + 1;     { Seta Direita }
               #72 : linha:=linha - 1;       { Seta Cima }
               #80 : linha:=linha + 1;       { Seta Baixo }
               #59 : Ajuda;                  { F1 => Help }
               #60 : Salvar_Arquivo(false);  { F2 => Salvar Arquivo }
               #61 : Ler_Arquivo;            { F3 => Ler Arquivo }
               #62 : Salvar_Arquivo(true);   { F4 => Salvar Como }
               #63 : Begin                   { F5 => Gerar Screen Section }
                       If nome_arq = '' Then
                       Begin
                         Rodape('Please SAVE the file first !');
                         Delay(1200);
                         Menu_Rodape;
                       End
                       Else Gerar_Screen_Section;
                     End;
               #64 : Begin                   { F6 => Zerar a tela }
                       Rodape('Confirm Clear Screen ? (Y/N)');
                       tecla := Readkey;
                       If Upcase(tecla)='Y' Then Limpar_Tela;
                       Menu_Rodape;
                     End;
               #65 : cor_atual:=Definir_Cor('F'); { F7 => muda cor da letra }
               #66 : cor_fundo:=Definir_Cor('B'); { F8 => muda cor de fundo }
                { Else Writeln(Ord(tecla)); { Reabilitar se quiser saber codigos de tecla novos }
             End;
           End;
      #8  : Begin  { Delete }
              If (coluna = 80) and (not chave80) Then chave80 := true
              Else
              Begin
                  coluna := coluna - 1;
                  GotoXY(coluna,linha);
                  chave80 := false;
              End;

              Write(' ');
              tela[linha,coluna]:= ' ';
              tela_cores[linha,coluna,1]:=cor_atual;
              tela_cores[linha,coluna,2]:=Black;
            End;
      #27 : Begin { Escape => Sair }
              Rodape('Confirm exit ? (Y/N)');
              tecla := Readkey;
              If Upcase(tecla)='Y' Then tecla := #27
                                   Else tecla := #13;
              Menu_Rodape;
            End;
      #13 : Begin { Enter }
              coluna := 1;
              linha := linha + 1;
            End;
        Else
          Begin
             TextColor(cor_atual);
             TextBackground(cor_fundo);
             Write(tecla);
             tela[linha,coluna] := tecla;
             tela_cores[linha,coluna,1]:=cor_atual;
             tela_cores[linha,coluna,2]:=cor_fundo;
             coluna := coluna + 1;
          End;
    End
  Until tecla = #27; {Sair com ESC}

  Clrscr;
End.

