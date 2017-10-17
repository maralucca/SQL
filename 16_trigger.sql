drop table tb_cliente
Create table tb_cliente
(
codigo int identity(1,1),
nome varchar(10),
email varchar(100)
)
go
Create trigger tr_ins_cliente on tb_cliente
for insert, update
as
begin
	declare @email int
	if (select email = charindex('@', email) from inserted) = 0
	--if @email = 0
	begin
		raiserror ('email inválido', 16,10)
		rollback
	end
end
go	
-- Ordem de restrições Constraint PK, Unique, Check e Trigger
Insert into tb_cliente values ('anderson', 'anduol.com.br')
Insert into tb_cliente values ('anderson', 'and@uol.com.br')
Insert into tb_cliente values ('maria', 'maria@uol.com.br')
Insert into tb_cliente values ('marcelo', 'marcelo@uol.com.br')
go
update tb_cliente set email = 'marceluol.com.br' where codigo = 3
go


