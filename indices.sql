-- Visualizando  a estrutura de uma tabela
exec sp_help cliente
go
-- Create um índice em na tabele tb_cliente
CREATE NONCLUSTERED INDEX IDX_conta
    ON dbo.conta (codcli, conta);
GO
-- Visualizando os índices de uma tabela
EXEC sp_helpindex cliente
go
-- Visualizando as estatísticas de uma tabela
dbcc showcontig(conta)
-- Atualizando as estatísticas de um índice com FillFactor = 80
DBCC DBREINDEX (conta, IDX_conta,80) 
				WITH NO_INFOMSGS
-- Atualizando as estatísticas de uma tabela  com FillFactor = 80
DBCC DBREINDEX (conta, '', 80) 
				WITH NO_INFOMSGS
-- Checando a integridade de uma tabela
DBCC checktable(cliente)
go
-- Checando a integridade de um banco de dados
DBCC checkdb(cursosql_2016)
go
-- Atualizando as estatísticas de uma tabela
Update statistics cliente
-- Recompilando uma procedure com as novas estatísticas
exec sp_recompile proc_lancamento
go












