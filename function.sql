BEGIN DECLARE DataN DATE;

SELECT
    datanascimentointo INTO DataN
FROM
    piloto
WHERE
    licencaPiloto = codigo;

RETURN DataN;

END;

/ / DELIMITER $ $ CREATE FUNCTION FN_pilotodata(codigo INT(8)) RETURNS varchar(10) BEGIN DECLARE DataN varchar(10);

SELECT
    datanascimento INTO DataN
FROM
    piloto
WHERE
    licencaPiloto = codigo;

RETURN Date_Format(DataN, "%d/%m/%Y");

end;

/ / Criar View ultilizando funções: CREATE
or REPLACE VIEW VW_piloto AS
SELECT
    p.licencaPiloto as "Código do Piloto",
    p.nomePiloto as "Nome do Piloto",
    DATE_FORMAT(p.datanascimento, "%d/%m/%Y") as "Data de Nascimento",
    FN_carroNome(p.codCarro) as "Carro",
    FN_equipeNome(p.codEquipe) as "Equipe",
    FN_paisNome(p.codPais) as "Pais"
From
    piloto p;

/ / locadora CREATE
OR REPLACE FUNCTION FN_clientesNome(codigo int(8)) RETURNS varchar(150) BEGIN DECLARE NomeCliente varchar(150);

SELECT
    Nome INTO NomeCliente
FROM
    Clientes
WHERE
    Cod_Cliente = codigo;

RETURN NomeCliente;

end;

CREATE
OR REPLACE FUNCTION FN_filmeNome (codigo int(8)) RETURNS varchar(250) BEGIN DECLARE NomeFilme varchar(250);

SELECT
    Nome into NomeFilme
FROM
    Filmes
WHERE
    Filmes.Cod_Filme = codigo;

RETURN NomeFilme;

end;