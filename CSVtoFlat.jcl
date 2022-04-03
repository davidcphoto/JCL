//STPDEL02 EXEC PGM=IDCAMS,COND=(0,NE)
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
           DELETE  WKD.D.FCONVERT.FLAT            PURGE
           DELETE  WKD.D.FCONVERT.FLAT.RCCD6501   PURGE
           SET MAXCC = 0
//*        ------------------------------------------------------------
//STEM0402 EXEC PROC=DSORT,COND=(0,NE)
//SYSPRINT DD SYSOUT=*
//SORTIN   DD *
1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16
12000;RE001;123;2017-12-31;9999-12-31;2017-12-31;WQK182;WQK182;JCLIN;;
13000;;;;;;;;;HTIMEST;;;100.00;21000,50;
//*
//SORTOUT  DD DD DSN=WKD.D.FCONVERT.FLAT,
//            DISP=(NEW,CATLG),SPACE=(CYL,(10,10),RLSE),
//            DCB=(RECFM=FB,LRECL=125)
//SYSIN    DD *
  OPTION   COPY
  OUTFIL   PARSE=(%01=(ENDBEFR=C';',FIXLEN=06),
                  %02=(ENDBEFR=C';',FIXLEN=05),
                  %03=(ENDBEFR=C';',FIXLEN=03),
                  %04=(ENDBEFR=C';',FIXLEN=10),
                  %05=(ENDBEFR=C';',FIXLEN=10),
                  %06=(ENDBEFR=C';',FIXLEN=10),
                  %07=(ENDBEFR=C';',FIXLEN=05),
                  %08=(ENDBEFR=C';',FIXLEN=05),
                  %09=(ENDBEFR=C';',FIXLEN=08),
                  %10=(ENDBEFR=C';',FIXLEN=26),
                  %11=(ENDBEFR=C';',FIXLEN=01),
                  %12=(ENDBEFR=C';',FIXLEN=01),
                  %13=(ENDBEFR=C';',FIXLEN=15),
                  %14=(ENDBEFR=C';',FIXLEN=15),
                  %15=(ENDBEFR=C';',FIXLEN=01),
                  %16=(ENDBEFR=C';',FIXLEN=03)),
           BUILD=(%01,
                  %02,
                  %03,
                  %04,
                  %05,
                  %06,
                  %07,
                  %08,
                  %09,
                  %10,
                  %11,
                  %12,
                  %13,UFF,M11,ZD,TO=PD,LENGTH(8),
                  %14,UFF,M11,LENGTH=15,
                  %15,
                  %16)
  OUTREC FIELDS=(1,88,89,15,ZD,TO=PD,LENGTH(8))
//*
//STEM0402 EXEC PROC=PSORT,COND=(0,NE)
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DISP=SHR,DSN=WKD.D.FCONVERT.FLAT
//SORTOUT  DD DD DSN=WKD.D.FCONVERT.FLAT.RCCD6501,
//            DISP=(NEW,CATLG),SPACE=(CYL,(10,10),RLSE),
//            DCB=(RECFM=FB,LRECL=125)
//SYSIN    DD *
  OUTREC   FIELDS=(1,6,ZD,TO=PD,LENGTH(4),
                   7,84,
                   91,15,ZD,TO=PD,LENGTH(8),
                   106,15,ZD,TO=PD,LENGTH(8),
                   121,4)
//*