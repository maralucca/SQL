-- Funções Nativas do SQL
select left('anderson',2))
select right('anderson', 2)
select substring('anderson', 3, 2)
select ltrim('    anderson')
select rtrim('anderson     ') + '*'
select upper('anderson')
select lower('ANDERSON')
select len('ANDERSON')
select reverse('anderson')
select replicate('*', 10)
select replace('anderson', 'n', '*')
select patindex('[Aa]%', 'Anderson aaa') 
SELECT PATINDEX('%en_ure%', 'please ensure the door is locked');
select charindex('n', 'anderson')
select charindex('n', 'anderson', 3)
select convert(varchar(10), '08/21/2013' , 112) 
select  upper(substring(nome,1,1)) +
	lower(substring(nome,2,len(nome)-1))
 as nome from tb_cliente1

declare @cpf as varchar(14)
set @cpf = '409.123.456-09'
select  replace(substring(@cpf, 1, 
	patindex('%-%', @cpf)-1), '.', '') as cpf1,
	right(@cpf, 2) as cpf2

create table teste_cpf(cpf char(14))
go
insert into teste_cpf values ('409.123.456-09')
insert into teste_cpf values ('334.657.789-58')
insert into teste_cpf values ('567.321.765-88')
go


-- Função STUFF
DECLARE @string1 VARCHAR(20) = 'Microsoft Server'
DECLARE @string2 VARCHAR(20) = 'SQL Server 2005'
 
SELECT      @string1 + ' -> ' + STUFF(@string1, 11, 0, 'SQL ')
            AS 'String 1',
            @string2 + ' -> ' + STUFF(@string2, 15, 1, '8 R2')
            AS 'String 2'
            
-- Função REPLACE           
DECLARE @string3 VARCHAR(35) = 'sql 2005, sql 2008, sql 2008 r2'
SELECT @string3, REPLACE(@string3,'sql','SQL')