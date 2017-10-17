drop table tb_cliente
Create table tb_cliente
(
codigo int identity(1,1),
nome varchar(10),
email varchar(100)
)
go

drop table tb_log
create table tb_log
(
usuario varchar(50),
data_hora varchar(50),
email_anterior varchar(100),
email_atual varchar(100),
)
go
alter trigger tr_ins_cliente on tb_cliente
for insert, update
as
begin
	declare @email int, @email1 varchar(100)
	if (select email = charindex('@', email) from inserted) = 0
	--if @email = 0
	begin
		raiserror ('email inválido', 16,10)
		rollback
	end
	select @email1 = email from inserted
	insert into tb_log values
		(CURRENT_USER, CURRENT_TIMESTAMP, '', @email1)
end
go	
-- Ordem de restrições Constraint PK, Unique, Check e Trigger
Insert into tb_cliente values ('anderson', 'anduol.com.br')
Insert into tb_cliente values ('anderson', 'and@uol.com.br')
Insert into tb_cliente values ('maria', 'maria@uol.com.br')
Insert into tb_cliente values ('marcelo', 'marcelo@uol.com.br')
Insert into tb_cliente values ('Teo', 'teo@uol.com.br')
Insert into tb_cliente values ('Marcio', 'Marcio@uol.com.br')
go
update tb_cliente set email = 'marcelouol.com.br' where codigo = 3
go
select getdate(), CURRENT_USER, CURRENT_TIMESTAMP
CURRENT_TRANSACTION_ID, , IDENT_CURRENT
go
select * from tb_log