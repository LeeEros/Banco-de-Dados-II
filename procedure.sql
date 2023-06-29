DELIMITER $ $ CREATE
OR REPLACE PROCEDURE sp_InserteDisiplina(IN pID INT, IN pnome varchar(64)) BEGIN
INSERT INTO
    disiplina (disiplina_id, disiplina_nome)
VALUES
(END $ $ DELIMITER;

DELIMITER $ $ CREATE
OR REPLACE PROCEDURE sp_InserteDisiplina(IN pnome varchar(64)) BEGIN
INSERT INTO
    disiplina (disiplina_nome)
VALUES
(END $ $ DELIMITER;

DELIMITER $ $ CREATE
OR REPLACE PROCEDURE sp_AlteraNomeCliente(IN codigo int(8), IN pNome Varchar(150)) BEGIN
UPDATE
    Clientes
SET
    Nome = pNome
WHERE
    Cod_Cliente = codigo;

End $ $ DELIMITER;

/ / Aletração / / CREATE
OR REPLACE PROCEDURE SP_AleterValor(IN codigo int, valor double) BEGIN
UPDATE
    Livro
SET
    Preco = (Preco - (Preco * valor / 100))
WHERE
    codigo = ISSN;

END;

/ / Aletração / / CREATE
OR REPLACE PROCEDURE sp_alteraEndereco(IN codigo int, IN novoende varchar(150)) BEGIN
UPDATE
    Solicitante
SET
    Solicitante.Endereco = novoende
WHERE
    codigo = Cod_Solicitante;

END;

/ / Alteração / / CREATE
OR REPLACE PROCEDURE sp_AlteraNomeCliente(IN codigo int(8), IN pNome Varchar(150)) BEGIN
UPDATE
    Clientes
SET
    Nome = pNome
WHERE
    Cod_Cliente = codigo;

End;

/ / Inserção / / CREATE
or REPLACE PROCEDURE sp_InsereEditora(
    IN nome varchar(40),
    IN endereco varchar(100),
    IN telefone varchar(14)
) BEGIN
INSERT INTO
    Editora(Nome, Endereco, Telefone)
VALUES
(nome, ende, tel);

END;

/ / Alteração / / CREATE
or REPLACE PROCEDURE sp_nomeArtistico(IN codigo INT, IN nome_artistico varchar(100)) BEGIN
UPDATE
    Autor
SET
    NomeArt = nome_artistico
WHERE
    codigo = Cod_Autor;

END;

/ / DELETAR / / CREATE
OR REPLACE PROCEDURE sp_deletaEditora(IN codigo int) BEGIN
DELETE FROM
    Editora
WHERE
    codigo = Cod_Editora;

END;

/ / Alteração e apresente / / CREATE
OR REPLACE PROCEDURE sp_alteraEndereco(IN codigo int, IN novoende varchar(150)) BEGIN
UPDATE
    Solicitante
SET
    Endereco = novoende
WHERE
    codigo = Cod_Solicitante;

SELECT
    CONCAT('O Endereço foi alterado para', novoende);

END;

Call sp_InsereEditora('Testandobr', 'Rua', '3434');

CALL sp_nomeArtistico(01, "Teste");

CALL sp_deletaEditora(8);

/ / Inserção e Apresentação / / CREATE
OR REPLACE PROCEDURE SP_InsereFilme(
    IN CodFilme INT,
    IN NomeFilme varchar(100),
    IN GeneroFilme INT,
    IN ClassificacaoFilme varchar(20),
    ValorFilme Decimal
) BEGIN
INSERT INTO
    Filmes(
        Cod_Filme,
        Nome,
        Cod_Genero,
        Classificacao,
        Valor
    )
VALUES
(
        CodFilme,
        NomeFilme,
        GeneroFilme,
        ClassificacaoFilme,
        ValorFilme
    );

SELECT
    CONCAT(
        'O Filme ',
        NomeFilme,
        'foi adicionado com sucesso, código: ',
        CodFilme
    );

END;

/ / Insere,
apresenta,
usando funções / / CREATE
OR REPLACE PROCEDURE sp_InsereLocacao(
    IN CodLocacao INT,
    IN DataLocacao Date,
    IN CodCliente INT,
    IN CodFilme INT
) BEGIN
INSERT INTO
    Locacoes(
        Cod_Locacao,
        Locacoes.Data,
        Cod_Cliente,
        Cod_Filme
    )
VALUES
(CodLocacao, DataLocacao, CodCliente, CodFilme);

SELECT
    CONCAT(
        'Foi Inserida a Locação, para o Cliente',
        FN_clientesNome(CodCliente),
        ' com o Filme ',
        FN_FilmeNome(CodFilme),
        ' código da Locação: ',
        CodLocacao
    );

END;

/ Deletar Gambiara / CREATE
OR REPLACE PROCEDURE sp_DeleteLocacao(IN CodLocacao INT) BEGIN
DELETE FROM
    Locacoes
WHERE
    Cod_Locacao = CodLocacao;

SELECT
    Concat(
        'A locação código: ',
        CodLocacao,
        ' foi deletada! do Dia',
        date_format(data, '%d%m%y'),
        'Cliente que Locou ',
        Cod_Cliente
    ) as 'Locação Deletada'
FROM
    Locacoes
WHERE
    Cod_Locacao = CodLocacao;

END;

/ Deletar Certo / BEGIN DECLARE CodCliente INT;

DECLARE DataLocacao DATE;

SELECT
    Locacoes.Data INTO DataLocacao
FROM
    Locacoes
WHERE
    Cod_Locacao = CodLocacao;

SELECT
    Locacoes.Cod_Cliente INTO CodCliente
FROM
    Locacoes
WHERE
    Cod_Locacao = CodLocacao;

DELETE FROM
    Locacoes
WHERE
    Cod_Locacao = CodLocacao;

SELECT
    Concat(
        'A locação código: ',
        CodLocacao,
        ' foi deletada! do Dia ',
        date_format(DataLocacao, '%d/%m/%Y'),
        ',',
        'Cliente que Locou: ',
        CodCliente
    ) as 'Locação Deletada';

END / Função / CREATE
OR REPLACE FUNCTION FN_ClienteLocacao(codigo int) RETURNS varchar(150) BEGIN DECLARE CodCliente int;

SELECT
    Cod_Cliente INTO CodCliente
FROM
    Locacoes
WHERE
    Cod_Cliente = codigo;

RETURN FN_clienteNome(CodCliente);

End;

/ / Atualiza e apresenta CREATE
OR REPLACE PROCEDURE sp_AlteraNomeCliente(
    IN codigo int,
    IN NomeCliente varchar(150),
    IN TelefoneCliente varchar(20),
    IN CPFCliente varchar(11)
) BEGIN
UPDATE
    Clientes
SET
    Nome = NomeCliente,
    Telefone = TelefoneCliente,
    CPF = CPFCliente
WHERE
    codigo = Cod_Cliente;

SELECT
    CONCAT(
        'O Cliente foi alterado com Sucesso! Código ',
        codigo,
        " Nome: ",
        NomeCliente,
        " Telefone: ",
        TelefoneCliente,
        " CPF: ",
        CPFCliente
    ) AS "Alteração Cliente";

END;