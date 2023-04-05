CREATE OR REPLACE FUNCTION FN_atletaNome(codigo INT(11))
RETURNS varchar(60)

BEGIN
DECLARE NomeAtleta varchar(60);
SELECT NOME_ATLETA INTO NomeAtleta FROM atleta
WHERE atleta.COD_ATLETA = codigo;
RETURN NomeAtleta;