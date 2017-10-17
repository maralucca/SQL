drop table cliente
go
Create table cliente
(
Codigo int not null,
nome varchar(60) not null,
endereco varchar(60),
bairro varchar(60),
cidade varchar(40),
estado char(2),
cep char(9),
fone char(14),
cpf char(14)
)
ALTER TABLE Cliente
ADD CONSTRAINT PK_codigo
     PRIMARY KEY CLUSTERED (codigo)
go
ALTER TABLE clienteADD CONSTRAINT U_cpf 	
	UNIQUE NONCLUSTERED (cpf)
go
ALTER TABLE clienteADD CONSTRAINT U_nome 	
	UNIQUE NONCLUSTERED (nome)
go
create table conta
(
conta int not null,
codcli int not null,
saldo money)
go
ALTER TABLE Conta
ADD CONSTRAINT PK_conta
     PRIMARY KEY CLUSTERED (conta)
go
ALTER TABLE conta
	ADD CONSTRAINT FK_cliente_conta 
	FOREIGN KEY (codcli) 
	REFERENCES cliente(codigo)
go
ALTER TABLE clienteADD CONSTRAINT 
	DF_fone DEFAULT '00000-0000' FOR fone
go
ALTER TABLE ClienteADD CONSTRAINT CK_cep
	CHECK (cep LIKE 
	'[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]')


