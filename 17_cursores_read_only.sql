--Declarando as variávies do cursor
DECLARE @bco_id int, @bco_name nvarchar(50), 
@message varchar(20), @message1 varchar(50)
--Declarando o Cursor com o Select
DECLARE bco_cursor CURSOR FOR 
SELECT database_ID, Name
FROM sys.databases 
order by name
-- Abrindo o curso
OPEN bco_cursor
-- Posiciono no primeiro registro
FETCH NEXT FROM bco_cursor 
INTO @bco_id, @bco_name
-- Percorrendo o cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT ' '
    SELECT @message = '----- ID: ' + 
        convert(char(3), @bco_id)
    SELECT @message1 = '----- banco: ' + 
        @bco_name
    PRINT @message + @message1
    IF @@FETCH_STATUS <> 0 
        PRINT '         <<None>>'     

	FETCH NEXT FROM bco_cursor 
	INTO @bco_id, @bco_name
END 
-- Fechando o cursor
CLOSE bco_cursor;
-- Desalocando o cursor da memória
DEALLOCATE bco_cursor;
