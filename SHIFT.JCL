//STAM301A EXEC PNG=SORT,COND=(0,NE)
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DISP=SHR,DSN=&FINPUT
//SORTOUT  DD DSN=&FILE,
//            DISP=(NEW,CATLG),SPACE=(TRK,(1,1),RLSE),
//            DCB=(RECFM=FB,LRECL=80)
//* 
//SYSIN    DD *
  SORT     FIELDS=COPY
  INREC    PARSE=(%01=(ENDBEFR=C'_',FIXLEN=02),
                  %02=(ENDBEFR=C'_',FIXLEN=10),
                  %03=(ENDBEFR=C'_',FIXLEN=10),
                  %04=(ENDBEFR=C' ',FIXLEN=10)),
           BUILD=(%01,C'_',
                  %02,C'_',
                  %03,UFF,M11,LENGTH(10),C'_',
                  %04)
  OUTREC   FIELDS=(1,14,(15,10,ZD,ADD,+1),25,11,SQZ=(SHIFT=LEFT),80X)
//*        -----------------------------------------------------------
//STAM301B EXEC PROC=QSORT,MBR=STAM301B,COND=(0,NE)
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DISP=SHR,DSN=&FILE
//*
//SORTOUT  DD DSN=&FOUTPUT,
//            DISP=(NEW,CATLG),SPACE=(TRK,(1,1),RLSE),
//            DCB=(RECFM=FB,LRECL=80)
//*
//SYSIN    DD *
  OPTION   COPY
  OUTREC   FIELDS=(1,80,SQZ=(SHIFT=LEFT))
//*