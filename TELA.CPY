      **************************************************************
      *     File: TELA.CPY
      *     Creation Date/Time: 12/8/2023 11:52:25
      * ------------------------------------------------------------
      *     Screen Created and Code Generated with EDITEL
      *     Developed by Mauricio Valadao Vieira in 2023
      *     This is a FREE software with NO licensing fee or charge
      **************************************************************
      *
       WORKING-STORAGE SECTION.
       01  TELA-SCR-FIELDS.
           05  TELA-SCR-F-01    PIC X(06).
           05  TELA-SCR-F-02    PIC X(66).
           05  TELA-SCR-F-03    PIC X(66).
           05  TELA-SCR-F-04    PIC X(66).
           05  TELA-SCR-F-05    PIC X(38).
           05  TELA-SCR-F-06    PIC 9(08).
           05  TELA-SCR-F-07    PIC X(30).
           05  TELA-SCR-F-08    PIC 9(02).
           05  TELA-SCR-F-09    PIC 9999999V99.
           05  TELA-SCR-F-10    PIC 9(08).
           05  TELA-SCR-F-11    PIC X(01).
           05  TELA-SCR-F-12    PIC X(01).
           05  TELA-SCR-F-13    PIC X(01).
           05  TELA-SCR-F-14    PIC X(55).
           05  TELA-SCR-F-15    PIC X(73).
      *
       SCREEN SECTION.
       01  TELA-SCR.
           05  VALUE " " BLANK SCREEN LINE 1 COLUMN 1.
           05  FILLER PIC X(40) VALUE ALL "=" 
               LINE 1 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "=" 
               LINE 1 COLUMN 41 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "A test for the EDITEL Program"
               LINE 2 COLUMN 1 BACKGROUND-COLOR 5 FOREGROUND-COLOR 7.
           05  FILLER PIC X(14) VALUE ALL " " 
               LINE 2 COLUMN 30 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "(C) 2023 by Mauricio Valadao Vieira"
               LINE 2 COLUMN 44 BACKGROUND-COLOR 0 FOREGROUND-COLOR 3.
           05  FILLER PIC X(40) VALUE ALL "=" 
               LINE 3 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "=" 
               LINE 3 COLUMN 41 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Customer ID:"
               LINE 4 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Name.......:"
               LINE 5 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 3.
           05  FILLER PIC X(40) VALUE ALL "-" 
               LINE 6 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "-" 
               LINE 6 COLUMN 41 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Address 1..:"
               LINE 7 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Address 2..:"
               LINE 8 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "City.......:"
               LINE 9 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Zip Code:"
               LINE 9 COLUMN 57 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Country....:"
               LINE 10 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(32) VALUE ALL "-" 
               LINE 11 COLUMN 1 BACKGROUND-COLOR 6 FOREGROUND-COLOR 7.
           05  FILLER PIC X(1) VALUE ALL " " 
               LINE 11 COLUMN 33 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Personal Data"
               LINE 11 COLUMN 34 BACKGROUND-COLOR 0 FOREGROUND-COLOR 3.
           05  FILLER PIC X(1) VALUE ALL " " 
               LINE 11 COLUMN 47 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(33) VALUE ALL "-" 
               LINE 11 COLUMN 48 BACKGROUND-COLOR 6 FOREGROUND-COLOR 7.
           05  VALUE "# of Children:"
               LINE 13 COLUMN 7 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Salary.......:"
               LINE 14 COLUMN 7 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Date of Birth:"
               LINE 15 COLUMN 7 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Current Level of Satisfaction with"
               LINE 17 COLUMN 7 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "EDITEL:  High"
               LINE 17 COLUMN 42 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Med"
               LINE 17 COLUMN 60 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Low"
               LINE 17 COLUMN 68 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Comments.....:"
               LINE 19 COLUMN 7 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "-" 
               LINE 20 COLUMN 1 BACKGROUND-COLOR 6 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "-" 
               LINE 20 COLUMN 41 BACKGROUND-COLOR 6 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "=" 
               LINE 23 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  FILLER PIC X(40) VALUE ALL "=" 
               LINE 23 COLUMN 41 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  VALUE "Msg:"
               LINE 24 COLUMN 1 BACKGROUND-COLOR 0 FOREGROUND-COLOR 7.
           05  TELA-SCR-I-01 LINE 4 COLUMN 13 PIC X(06) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-01.
           05  TELA-SCR-I-02 LINE 5 COLUMN 13 PIC X(66) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-02.
           05  TELA-SCR-I-03 LINE 7 COLUMN 13 PIC X(66) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-03.
           05  TELA-SCR-I-04 LINE 8 COLUMN 13 PIC X(66) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-04.
           05  TELA-SCR-I-05 LINE 9 COLUMN 13 PIC X(38) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-05.
           05  TELA-SCR-I-06 LINE 9 COLUMN 66 PIC 9(08) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-06.
           05  TELA-SCR-I-07 LINE 10 COLUMN 13 PIC X(30) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-07.
           05  TELA-SCR-I-08 LINE 13 COLUMN 21 PIC 9(02) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-08.
           05  TELA-SCR-I-09 LINE 14 COLUMN 21 PIC 9999999V99
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-09.
           05  TELA-SCR-I-10 LINE 15 COLUMN 21 PIC 9(08) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-10.
           05  TELA-SCR-I-11 LINE 17 COLUMN 56 PIC X(01) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-11.
           05  TELA-SCR-I-12 LINE 17 COLUMN 64 PIC X(01) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-12.
           05  TELA-SCR-I-13 LINE 17 COLUMN 72 PIC X(01) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-13.
           05  TELA-SCR-I-14 LINE 19 COLUMN 21 PIC X(55) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-14.
           05  TELA-SCR-I-15 LINE 24 COLUMN 6 PIC X(73) 
               REVERSE-VIDEO AUTO-SKIP TO TELA-SCR-F-15.
