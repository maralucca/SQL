-- Atualizando cursor T-SQL
DROP TABLE Funcionario
GO
CREATE TABLE Funcionario
(
    codigo int NOT NULL,
    numero_randomico VARCHAR(50) NULL
) 
go
select * from funcionario
go
-- Inserindo 500 registros na tabela
SET NOCOUNT ON
DECLARE @codigo AS INT
SET @codigo = 1
WHILE (@codigo <= 500)
BEGIN
    INSERT INTO Funcionario 
		SELECT @codigo,NULL
    
    SET @codigo = @codigo + 1
END
SET NOCOUNT OFF
go
-- Criando uma chave primária na tabela para utilizar cursores 
-- com atualização, 
-- caso contrário será somente leitura
ALTER TABLE Funcionario ADD  CONSTRAINT PK_Funcionario 
PRIMARY KEY CLUSTERED 
(
    codigo ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, 
IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON
) 
go
-- Verificando o campo numero_randomico com valor NULL
select * from funcionario where numero_randomico is null
go
-- Criando um curso para atualização
SET NOCOUNT ON
DECLARE 
    @codigo AS INT, 
    @numero_randomico AS VARCHAR(50),
    @temp AS VARCHAR(50)

DECLARE FUNC_CURSOR CURSOR FOR
SELECT codigo, numero_randomico FROM funcionario 
FOR UPDATE OF numero_randomico
OPEN FUNC_CURSOR
FETCH NEXT FROM FUNC_CURSOR
INTO @codigo, @numero_randomico

WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT @temp =  FLOOR(RAND()*10000000000)
    UPDATE funcionario SET numero_randomico = @TEMP WHERE CURRENT OF FUNC_CURSOR
  
    FETCH NEXT FROM FUNC_CURSOR
    INTO @codigo, @numero_randomico
END
CLOSE FUNC_CURSOR
DEALLOCATE FUNC_CURSOR

SET NOCOUNT OFF

-- Verificando o campo numero_randomico com valor atualizado
select * from funcionario where numero_randomico is null
select * from funcionario where numero_randomico is not null
go
