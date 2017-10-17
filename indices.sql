-- Visualizando  a estrutura de uma tabela
exec sp_help cliente
go
-- Create um �ndice em na tabele tb_cliente
CREATE NONCLUSTERED INDEX IDX_conta
    ON dbo.conta (codcli, conta);
GO
-- Visualizando os �ndices de uma tabela
EXEC sp_helpindex cliente
go
-- Visualizando as estat�sticas de uma tabela
dbcc showcontig(conta)
-- Atualizando as estat�sticas de um �ndice com FillFactor = 80
DBCC DBREINDEX (conta, IDX_conta,80) 
				WITH NO_INFOMSGS
-- Atualizando as estat�sticas de uma tabela  com FillFactor = 80
DBCC DBREINDEX (conta, '', 80) 
				WITH NO_INFOMSGS
-- Checando a integridade de uma tabela
DBCC checktable(cliente)
go
-- Checando a integridade de um banco de dados
DBCC checkdb(cursosql_2016)
go
-- Atualizando as estat�sticas de uma tabela
Update statistics cliente
-- Recompilando uma procedure com as novas estat�sticas
exec sp_recompile proc_lancamento
go












