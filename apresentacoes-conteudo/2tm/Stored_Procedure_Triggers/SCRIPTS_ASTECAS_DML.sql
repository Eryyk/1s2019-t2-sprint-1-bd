
--Criar um SP (Stored Procedure)
CREATE PROCEDURE SelecionarTodasPessoas -- Nome da procedure
AS
SELECT * FROM PESSOAS -- Consulta

EXEC SelecionarTodasPessoas; -- Executar Procedure


--Com declara��o de vari�vel
CREATE PROCEDURE BuscarNome
@Nome VARCHAR(250)
AS
SELECT NOME FROM PESSOAS WHERE NOME = @Nome -- Utilizando vari�vel como filtro para a consulta

EXEC BuscarNome 'Jefferson'


--Com Id
CREATE PROCEDURE BuscarPorId @IDRECEBIDO INT
AS
SELECT NOME, CPF FROM PESSOAS WHERE ID = @IDRECEBIDO

EXEC BuscarPorId 2


--Deletar Procedure
DROP PROCEDURE BuscarPorId


--Alterando Stored Procedure
ALTER PROCEDURE BuscarPorId
@IDRECEBIDO INT
AS
BEGIN
SELECT NOME FROM PESSOAS WHERE ID = @IDRECEBIDO
END

EXEC BuscarPorId 2
BuscarPorId 2 
GO


--GO no final tem a mesma fun��o que EXEC no in�cio
/*
	BuscarPorId 2 
	GO 
		== 
	EXEC BuscarPorId 2
*/


--Criando Trigger
CREATE TRIGGER MeuTrigger -- Nome do trigger
ON PESSOAS --Qual tabela
AFTER UPDATE, INSERT --FOR: padr�o, dispara junto da a��o/AFTER: ap�s a a��o/INSTEAD OF: no lugar da a��o //// quando INSERT/UPDATE/DELETE insert e delete por exemplo.
AS
BEGIN
	PRINT 'HELLO WORLD'
END
GO

INSERT INTO PESSOAS
VALUES('Franklin', '55555555555', 2)

