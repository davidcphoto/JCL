//STEPNAME  EXEC PGM=SORT,REGION=0M                    
//SORTIN   DD *
0123456789                          
//SYSIN    DD  *                                            
    SORT FIELDS=COPY 
    OUREC FIELDS=(1,10,ZD,TO=PD,LENGTH(6)       
//SORTOUT  DD  SYSOUT=*                       
//SYSPRINT DD SYSOUT=*                                      
//SYSUDUMP DD SYSOUT=*                                      
//SYSOUT   DD SYSOUT=*