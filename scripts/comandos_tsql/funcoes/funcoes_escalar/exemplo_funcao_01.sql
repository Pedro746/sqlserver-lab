-- FUNCAO ESCALAR 

/*
CRIANDO FUNÇÃO PARA LIMPAR ESPAÇOES VAZIOS DA DIREITA E DA ESQUERDA
*/

-- CRIANDO A FUNCAO
CREATE FUNCTION FN_TRIM(@ST VARCHAR(1000))
RETURNS VARCHAR(1000)

BEGIN
	RETURN(LTRIM(RTRIM(@ST)))
END

-- USANDO A FUNCAO
SELECT '>' + ('          SQL           ') + '<'
UNION
SELECT '>' + DBO.FN_TRIM('          SQL           ') + '<'

-- ALTERANDO A FUNCAO
ALTER FUNCTION FN_TRIM(@ST VARCHAR(500))
RETURNS VARCHAR(500)

BEGIN
	RETURN(LTRIM(RTRIM(@ST)))
END

-- DELETANDO UMA FUNCAO
DROP FUNCTION FN_TRIM