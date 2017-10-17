---------------------------- Service Broker -----------------------
-- Neste exercício, vamos aprender a  
-- configurar o Service Broker, 
-- e enviar e  receber  mensagens. 
-------------------------------------------------------------------
-- Criando um Banco de dados de mensagens
DROP DATABASE ServiceBrokerTest
GO
CREATE DATABASE ServiceBrokerTest
GO
USE ServiceBrokerTest
GO
-- Habilitando Service Broker
ALTER DATABASE ServiceBrokerTest SET ENABLE_BROKER
GO
-- Criando um tipo de mensagem
CREATE MESSAGE TYPE SBMessage
VALIDATION = NONE
GO
-- Criando um contrato
CREATE CONTRACT SBContract
(SBMessage SENT BY INITIATOR)
GO
-- Criando uma fila de envio
CREATE QUEUE SBSendQueue
GO
-- Criando um fila de recebimento
CREATE QUEUE SBReceiveQueue
GO
-- Criando o Serviço e fila e envio
CREATE SERVICE SBSendService
ON QUEUE SBSendQueue (SBContract)
GO
-- Criando o Serviço e fila e recebimento
CREATE SERVICE SBReceiveService
ON QUEUE SBReceiveQueue (SBContract)
GO
-- Executar os dois passos juntos
-- Começar de diálogo usando  o serviço  em contrato 
DECLARE @SBDialog uniqueidentifier
DECLARE @Message NVARCHAR(128)
BEGIN DIALOG CONVERSATION @SBDialog
FROM SERVICE SBSendService
TO SERVICE 'SBReceiveService'
ON CONTRACT SBContract
WITH ENCRYPTION = OFF
-- Enviando o diálogo de mensagens
SET @Message = N'Opa esta acabando o curso?';
SEND ON CONVERSATION @SBDialog
MESSAGE TYPE SBMessage (@Message)
SET @Message = N'Cervejinha hoje mais tarde?';
SEND ON CONVERSATION @SBDialog
MESSAGE TYPE SBMessage (@Message)
SET @Message = N'No Puppy!';
SEND ON CONVERSATION @SBDialog
MESSAGE TYPE SBMessage (@Message)
GO
-- Até aqui junto
-- Visualizando a mensagens da fila
SELECT CONVERT(NVARCHAR(MAX), message_body) AS Message
--SELECT *
FROM SBReceiveQueue
GO
-- Recebendo a primeira mensagem da fila
RECEIVE TOP(1) CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM SBReceiveQueue
GO
-- Recebendo todas as mensagens da fila
RECEIVE CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM SBReceiveQueue
GO
-- Limpando 
USE master
GO
DROP DATABASE ServiceBrokerTest
GO