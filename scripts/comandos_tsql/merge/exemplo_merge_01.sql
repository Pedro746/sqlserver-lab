-- ############################################
-- Atualização do Estoque Oficial de Brinquedos
-- ############################################
-- 
-- Este script simula a atualização de uma tabela de estoque oficial
-- com base em uma nova lista de brinquedos recebida (tabela temporária).
--
-- As operações realizadas são:
-- 1. Atualizar os registros existentes (quando o brinquedo já existe no estoque).
-- 2. Inserir novos brinquedos que ainda não existiam no estoque.
-- 3. Deletar brinquedos que não aparecem mais na nova lista (saíram de linha).
--
-- A atualização é feita utilizando o comando MERGE,
-- que compara as tabelas pelo campo ID.
--
-- Tabelas usadas:
-- - #EstoqueOficial: representa o estoque atual da loja.
-- - #EstoqueNovo: representa o estoque atualizado recebido.
--
-- Ao final, os dados da tabela oficial estarão sincronizados
-- conforme a nova lista de brinquedos.
--
-- ############################################

CREATE TABLE #EstoqueOficial (
    Id INT,
    Nome VARCHAR(100),
    Quantidade INT
);

INSERT INTO #EstoqueOficial (Id, Nome, Quantidade) VALUES (1, 'Lego Ferrari', 2)
INSERT INTO #EstoqueOficial (Id, Nome, Quantidade) VALUES (2, 'Carro RC', 1)
INSERT INTO #EstoqueOficial (Id, Nome, Quantidade) VALUES (3, 'Barbie', 6)


CREATE TABLE #EstoqueNovo (
    Id INT,
    Nome VARCHAR(100),
    Quantidade INT
);


INSERT INTO #EstoqueNovo (Id, Nome, Quantidade) VALUES (1, 'Lego Ferrari', 2)
INSERT INTO #EstoqueNovo (Id, Nome, Quantidade) VALUES (4, 'Aviao RC', 12)
INSERT INTO #EstoqueNovo (Id, Nome, Quantidade) VALUES (3, 'Barbie', 6)
INSERT INTO #EstoqueNovo (Id, Nome, Quantidade) VALUES (5, 'Actions Figures Naruto', 3)

--UPDATE #EstoqueNovo SET QUANTIDADE = 30 WHERE ID = 3
--DELETE FROM #EstoqueNovo WHERE ID = 4

MERGE #EstoqueOficial AS DESTINO
USING #EstoqueNovo AS ORIGEM
ON DESTINO.ID = ORIGEM.ID

-- ATUALIZA QUANDO ENCONTRAR O MESMO ID
WHEN MATCHED THEN
	UPDATE SET 
		DESTINO.NOME = ORIGEM.NOME,
		DESTINO.QUANTIDADE = ORIGEM.QUANTIDADE

-- INSERE QUANDO NAO ENCONTRAR NA TABELA PRINCIPAL
WHEN NOT MATCHED BY TARGET THEN
	INSERT (ID, NOME, QUANTIDADE)
	VALUES (ORIGEM.ID, ORIGEM.NOME, ORIGEM.QUANTIDADE)

-- DELETA SE O REGISTRO SUMIU DA ORIGEM
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;
		

SELECT * FROM #EstoqueNovo
SELECT * FROM #EstoqueOficial