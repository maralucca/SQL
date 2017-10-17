USE [CursoSQL_2016]
GO

/****** Object:  Table [dbo].[conta]    Script Date: 16/10/2017 14:00:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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

GO

ALTER TABLE [dbo].[conta]  WITH CHECK ADD  CONSTRAINT [FK_cliente_conta] FOREIGN KEY([codcli])
REFERENCES [dbo].[cliente] ([Codigo])
GO

ALTER TABLE [dbo].[conta] CHECK CONSTRAINT [FK_cliente_conta]
GO


