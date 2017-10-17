drop table tb_saldo_cliente
go
Create table tb_saldo_cliente
(codigo int identity(1,1), conta char(10), saldo money)
go
insert tb_saldo_cliente values ('1000-1', 1000.00)
insert tb_saldo_cliente values ('5610-3', 1000.00)
insert tb_saldo_cliente values ('8787-6', 1000.00)
go
--drop Procedure proc_lancamento
--exec sp_addmessage 1500001, 10, 'Conta inexistente!', @replace = 'replace'
--exec sp_addmessage 1500002, 10, 'Saldo insuficiente!', @replace = 'replace'
--exec sp_addmessage 1500003, 10, 'Tipo de operação inválida!', @replace = 'replace'

alter Procedure proc_lancamento
(@codcli as char(5), @conta as char(10), @nome varchar(50), @data datetime, @valor money, @tipo_operacao char(1))
As
Begin
	Declare @saldo money, @conta1 char(10)
	select @conta1 = conta from tb_saldo_cliente where conta = @conta
	if @conta1 is null
	begin
		raiserror(1500001, 10, 10)
		return
	end
	--select @saldo = saldo from tb_saldo_cliente where conta = @conta
	SELECT @saldo = DBO.FN_saldo (@conta)
	if @tipo_operacao = 'D'
	begin
		Select @saldo = @saldo - @valor
	end
	else
	begin
		Select @saldo = @saldo + @valor
	end
	if @saldo < 0
	begin
		raiserror('Saldo insuficiente!', 10, 10)
		return
	end
	update tb_saldo_cliente set saldo = @saldo where conta = @conta
End
go
--exec proc_lancamento '12345', '8787-6', 'Anderson', '20130619', 120.00, 'D'
exec proc_lancamento '12345', '0787-6', 'Anderson', '20130619', 120.00, 'D'
go
--exec proc_lancamento '12345', '1000-1', 'Pedro', '20130619', 160.00, 'C'
--exec proc_lancamento '12345', '1000-1', 'Pedro', '20130619', 16000.00, 'c'
exec proc_lancamento '12345', '1000-1', 'Pedro', '20130619', 16000.00, 'd'
go
select * from tb_saldo_cliente
go