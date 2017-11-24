
sqlcmd -S NOTE-MARA -d CUBO  -Q "set nocount on;  SELECT * FROM [ARQ].[ANALITICO]" -o MyOutput.csv -s";"

findstr /v /i /c:"-"  MyOutput.csv >newfile.csv



sqlcmd -S NOTE-MARA -d CUBO :XML ON -Q "set nocount on;   SELECT WONUM, NOTA_CUBO,ESTEIRA_CUBO  FROM STAGE.ARQ_CUBO  FOR JSON PATH, root ('MONTHLY')" : XML ON -o MyOutput.JS -s";"
