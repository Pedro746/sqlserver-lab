/*
ESTE CÓDIGO SQL REALIZA AS SEGUINTES OPERAÇÕES:

CRIAÇÃO DA TABELA TABUADA: VERIFICA SE A TABELA TABUADA NÃO EXISTE NO BANCO DE DADOS. CASO NÃO EXISTA, ELA É CRIADA COM COLUNAS PARA ARMAZENAR O MULTIPLICANDO, OPERAÇÃO, MULTIPLICADOR E RESULTADO.

TRUNCAMENTO DA TABELA: VERIFICA SE A TABELA CONTÉM DADOS. SE HOUVER, OS DADOS SÃO REMOVIDOS COM O COMANDO TRUNCATE TABLE. CASO CONTRÁRIO, EXIBE UMA MENSAGEM INDICANDO QUE A TABELA JÁ ESTAVA VAZIA.

PREPARAÇÃO PARA INSERÇÃO DE DADOS: DECLARA VARIÁVEIS PARA GERAR OS VALORES DA TABUADA (DE 1 A 10) E INICIA UM LOOP WHILE PARA INSERIR OS DADOS NA TABELA.
*/

-- BLOCO PARA CRIAR A TABELA CASO NAO EXISTA
IF OBJECT_ID('TESTES.TABUADA', 'U') IS NOT NULL
    CREATE TABLE TABUADA(
        ID INT IDENTITY PRIMARY KEY,
        MULTIPLICANDO INT,
        OPERACAO CHAR(1) DEFAULT('X'),
        MULTIPLICADOR INT,
        RESULTADO INT
    )
ELSE
    PRINT 'TABELA EXISTE'

-- BLOCO PARA TRUNCAR A TABELA CASO TENHA DADOS
DECLARE @COUNT INT 
SET @COUNT = (SELECT COUNT(*) FROM TABUADA)

IF (@COUNT = 0)
    PRINT 'TABELA NAO CONTINHA DADOS PARA SER TRUNCADA'
ELSE
    PRINT 'TABELA TRUNCADA'
    TRUNCATE TABLE TABUADA	

-- BLOCO PARA INSERIR DADOS NA TABELA CASO ESTEJA VAZIA
DECLARE @TABUADA INT = 1
DECLARE @MULTIPLICADO INT
DECLARE @RESULTADO INT

WHILE (@TABUADA <= 10)
BEGIN
    SET @MULTIPLICADO = 1
    WHILE(@MULTIPLICADO <= 10)
    BEGIN
        SET @RESULTADO = @TABUADA * @MULTIPLICADO
        --PRINT CAST(@TABUADA AS NVARCHAR) + ' X ' + CAST(@MULTIPLICADO AS NVARCHAR) + ' = ' + CAST(@RESULTADO AS NVARCHAR)

        INSERT INTO TABUADA (
            MULTIPLICANDO,
            MULTIPLICADOR,
            RESULTADO
        ) VALUES(
            @TABUADA,
            @MULTIPLICADO,
            @RESULTADO
        )

        SET @MULTIPLICADO = @MULTIPLICADO + 1
    END
    SET @TABUADA = @TABUADA + 1
END

SELECT 
    MULTIPLICANDO,
    MULTIPLICADOR,
    RESULTADO
FROM 
    TABUADA
