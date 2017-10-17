USE [CursoSQL_2016]
GO

INSERT INTO [dbo].[cliente]
           ([Codigo],[nome],[endereco],[bairro],[cidade],[estado],[cep],[fone],[cpf])
     VALUES
    (1, 'Anderson', 'Av. Paulista, 967', 'Cerqueira cesar', 'São Paulo', 'SP', '12345-098', '1234-0987', '12345678909')
GO
INSERT INTO [dbo].[cliente]
           ([Codigo],[nome],[endereco],[bairro],[cidade],[estado],[cep],[fone],[cpf])
     VALUES
    (2, 'Jose', 'Av. Paulista, 967', 'Cerqueira cesar', 'São Paulo', 'SP', '12345-098', '1234-0987', '9999999999')
GO
INSERT INTO [dbo].[cliente]
           ([Codigo],[nome],[endereco],[bairro],[cidade],[estado],[cep],[fone],[cpf])
     VALUES
    (3, 'Maria', 'Av. Paulista, 967', 'Cerqueira cesar', 'São Paulo', 'SP', '12345-123', '1234-0987', '111111111111')
GO
INSERT INTO [dbo].[cliente]
           ([Codigo],[nome],[endereco],[bairro],[cidade],[estado],[cep],[cpf])
     VALUES
    (4, 'Pedro', 'Av. Paulista, 967', 'Cerqueira cesar', 'São Paulo', 'SP', '12345-123', '2222222222')
GO
USE [CursoSQL_2016]
GO

INSERT INTO [dbo].[conta]
           ([conta],[codcli],[saldo]) VALUES (11111, 1, 1000.00)
GO
INSERT INTO [dbo].[conta]
           ([conta],[codcli],[saldo]) VALUES (22222, 2, 1200.00)
GO
INSERT INTO [dbo].[conta]
           ([conta],[codcli],[saldo]) VALUES (33333, 3, 34000.00)
GO
INSERT INTO [dbo].[conta]
           ([conta],[codcli],[saldo]) VALUES (44444, 4, 8000.00)
GO
select * from cliente
select * from conta
go
update cliente set endereco = 'Brig. Luis Antonio, 1000' where codigo = 4
go
update cliente set endereco = 'Rua Santo Amro, 1000', bairro = 'Bela Vista' 
	where codigo = 3
go
CREATE TABLE [dbo].[cliente1](
	[Codigo] [int] NOT NULL,
	[nome] [varchar](60) NOT NULL,
	[endereco] [varchar](60) NULL,
	[bairro] [varchar](60) NULL,
	[cidade] [varchar](40) NULL,
	[estado] [char](2) NULL,
	[cep] [char](9) NULL,
	[fone] [char](14) NULL,
	[cpf] [char](14))

-- Insert com select
select * from cliente1

insert into cliente1
select * from cliente
	where endereco = 'Av. Paulista, 967'

select * into cliente_16102017 from cliente
	where endereco = 'Av. Paulista, 967'

select * from cliente2

-- Padrão ANSI
select * from cliente join conta 
	on codcli = codigo

-- Padrão sQL Server
select * from cliente, conta 
	where codcli = codigo

-- Subquery
select * from cliente
where codigo in (select codcli from conta)

/* create view */

CREATE VIEW  dbo.vew_cliente
	WITH SCHEMABINDING
	AS 

		SELECT CODIGO, NOME FROM DBO.CLIENTE

	GO
/* EXECUTAR A VIEW*/

SELECT * FROM DBO.vew_cliente


EXEC SP_HELP CLIENTE


CREATE NONCLUSTERED INDEX IDX_CONTA
	ON DBO.CONTA (CODCLI, CONTA)


EXEC sp_helpindex CONTA