USE [CursoSQL_2016]
GO

/****** Object:  Table [dbo].[cliente]    Script Date: 16/10/2017 13:59:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cliente](
	[Codigo] [int] NOT NULL,
	[nome] [varchar](60) NOT NULL,
	[endereco] [varchar](60) NULL,
	[bairro] [varchar](60) NULL,
	[cidade] [varchar](40) NULL,
	[estado] [char](2) NULL,
	[cep] [char](9) NULL,
	[fone] [char](14) NULL,
	[cpf] [char](14) NULL,
 CONSTRAINT [PK_codigo] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_cpf] UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_nome] UNIQUE NONCLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[cliente] ADD  CONSTRAINT [DF_fone]  DEFAULT ('00000-0000') FOR [fone]
GO

ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [CK_cep] CHECK  (([cep] like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [CK_cep]
GO


