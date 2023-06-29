SELECT
    L.Cod_Locacao,
    L.Data,
    L.Cod_Cliente,
    C.Nome,
    L.Cod_Filme,
    F.Nome
FROM
    locacoes L,
    clientes C,
    filmes F
WHERE
    L.Cod_Cliente = C.Cod_Cliente
    AND L.Cod_Filme = F.Cod_Filme;

SELECT
    L.Cod_Locacao AS 'Código da Locação',
    Date_Format(L.Data, "%d/%m/%Y") As 'Data da Locação',
    L.Cod_Cliente AS 'Código do Cliente',
    C.Nome AS 'Nome do Cliente',
    L.Cod_Filme AS 'Código do Filme',
    F.Nome AS 'Titulo do Filme',
    F.Valor AS 'Valor da Locação'
FROM
    locacoes L,
    clientes C,
    filmes F
WHERE
    L.Cod_Cliente = C.Cod_Cliente
    AND L.Cod_Filme = F.Cod_Filme;

CREATE VIEW Vw_Consulta_Locacoes AS
SELECT
    L.Cod_Locacao AS 'Código da Locação',
    Date_Format(L.Data, "%d/%m/%Y") As 'Data da Locação',
    L.Cod_Cliente AS 'Código do Cliente',
    C.Nome AS 'Nome do Cliente',
    L.Cod_Filme AS 'Código do Filme',
    F.Nome AS 'Titulo do Filme',
    F.Valor AS 'Valor da Locação'
FROM
    locacoes L,
    clientes C,
    filmes F
WHERE
    L.Cod_Cliente = C.Cod_Cliente
    AND L.Cod_Filme = F.Cod_Filme
ORDER BY
    L.Cod_Locacao;

CREATE
OR REPLACE VIEW (atualiza a view)