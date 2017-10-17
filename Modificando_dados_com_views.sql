/* Criando o banco de dados */
create database [CursoSQL_2016]
go

USE [CursoSQL_2016]
GO
--drop TABLE [dbo].[cliente]

go

CREATE TABLE [dbo].[cliente](
	[Codigo] [int] NOT NULL,
	[nome] [varchar](60) NOT NULL,
	[endereco] [varchar](60) NULL,
	[bairro] [varchar](60) NULL,
	[cidade] [varchar](40) NULL,
	[estado] [char](2) NULL,
	[cep] [char](9) NULL,
	[fone] [char](14) NULL,
	[cpf] [char](14))
go

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
INSERT INTO [dbo].[cliente]
           ([Codigo],[nome],[endereco],[bairro],[cidade],[estado],[cep],[cpf])
     VALUES
    (5, 'Paulo', 'Av. Paulista, 967', 'Cerqueira cesar', 'São Paulo', 'SP', '12345-123', '4444444444')
GO
USE [CursoSQL_2016]
GO
CREATE TABLE [dbo].[conta](
	[conta] [int] NOT NULL,
	[codcli] [int] NOT NULL,
	[saldo] [money] NULL,
 CONSTRAINT [PK_conta] PRIMARY KEY CLUSTERED 
(
	[conta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

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
-- Insert com select
select * from cliente1

insert into cliente1
select * from cliente
	where endereco = 'Av. Paulista, 967'

select * into cliente_16102017 from cliente
	where endereco = 'Av. Paulista, 967'

select * from conta

-- Padrão ANSI
select * from cliente join conta 
	on codcli = codigo

-- Padrão sQL Server
select * from cliente, conta 
	where codcli = codigo

-- Padrão ANSI
select * from cliente left outer join conta 
	on codcli = codigo

-- Subquery
select * from cliente
where codigo in (select codcli from conta)


-- Criando uma view
CREATE VIEW dbo.vie_cliente
WITH SCHEMABINDING
AS
    SELECT codigo, nome from dbo.cliente
GO
-- Executando uma view
select * from vie_cliente


