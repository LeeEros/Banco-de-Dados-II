CREATE OR REPLACE FUNCTION FN_ufCidade(codigo int(11))
RETURNS char(2)

BEGIN
DECLARE UfCidade char(2);
SELECT UF INTO UfCidade FROM cidade
WHERE cidade.COD_CIDADE = codigo;
RETURN UfCidade; end;