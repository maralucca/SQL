CREATE FUNCTION DBO.FN_saldo (@conta VARCHAR(10))    
RETURNS money
AS 
BEGIN    
	Declare @saldo money
	select @saldo = saldo from tb_conta where conta = @conta
	RETURN @saldo
END
go

declare @conta char(10)
select @conta = '1000-1'
SELECT DBO.FN_saldo (@conta) AS SALDO

-- Criando uma função que retorna uma tabela
CREATE FUNCTION DBO.FN_conta_saldo (@conta VARCHAR(10))    
RETURNS @tb_saldo table
(
	codigo int,
	conta varchar(10),
	saldo money
)
AS 
BEGIN    
	Declare @saldo money
	insert into @tb_saldo
	select * from tb_saldo_cliente where conta = @conta
	RETURN 
END
go
-- Executando a função
select * from dbo.FN_conta_saldo('1000-1')
