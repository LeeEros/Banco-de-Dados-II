/*Criar tabela*/
CREATE TABLE produto(
  idProduto INT null AUTO_INCREMENT,
  nomeProduto varchar(45) NOT Null,
  precoNormal decimal(10, 2) not null,
  precoDesconto decimal(10, 2) not null,
  PRIMARY KEY(idProduto)
);

/*Trigger Desconto*/
CREATE
or REPLACE TRIGGER tr_calculoDesconto BEFORE
INSERT
  on produto FOR EACH ROW
set
  new.precoDesconto = new.precoNormal - (new.precoNormal - 10 / 100);

INSERT into
  produto(idProduto, nomeProduto, precoNormal)
VALUES
  (null, 'Monitor', 499),
  (null, 'Mouse Gamer', 99.99),
  (null, 'Mousepad', 89.99);

/*Criar Trigger que calcula oferta quando o livro for adicionado*/
CREATE
or REPLACE TRIGGER tr_ofertas
AFTER
UPDATE
  ON Livro FOR EACH ROW BEGIN IF new.Quantiade >= 25 THEN
INSERT INTO
  Ofertas(CodOferta, ISSN, Quantidade, Preco)
VALUES
  (
    null,
    new.ISSN,
    new.Quantidade,
    new.Preco *(75 / 100)
  );

END IF;

END
/*Trigger para alimentar uma tabela com dados deletados de outra tabela, tirar delemitador*/
CREATE
OR REPLACE TRIGGER tr_DeletaDesenvolvedor
AFTER
  DELETE on Desenvolvedor FOR EACH ROW BEGIN
INSERT into
  modificados(idModif, nome, observacao)
VALUES
  (
    null,
    old.Nome_Desenvolvedor,
    old.Local_Desenvolvedor
  );

END;

CREATE
OR REPLACE TRIGGER tr_DeletaDistribuidora
AFTER
  DELETE on Distribuidora FOR EACH ROW BEGIN
INSERT into
  modificados(idModif, nome, observacao)
VALUES
  (
    null,
    old.Nome_Distribuidora,
    old.Local_Distribuidora
  );

END;

CREATE
OR REPLACE TRIGGER tr_DeletaPlataforma
AFTER
  DELETE on Plataforma FOR EACH ROW BEGIN
INSERT into
  modificados(idModif, nome, observacao)
VALUES
  (null, old.Nome_Plataforma, old.Marca_Plataforma);

END;

/*Teste de Trigger*/
CREATE
or REPLACE TRIGGER tr_verefica_valor BEFORE
UPDATE
  on Produto FOR EACH ROW BEGIN
INSERT into
  Valor_Produto(codigo, valor_anterior, valor_novo)
VALUES
  (OLD.codigo, OLD.valor, NEW.valor);

END;

Códigos para o exercício de trigger:
insert
  e
update
  Inserindo alguns “ produtos ”
INSERT INTO
  produto (codigo, valor)
VALUES
  (1, 2.5),
  (2, 3.2),
  (3, 5.8),
  (4, 10.8),
  (5, 12.31),
  (6, 99.99),
(7, 102.39),
  (8, 121.12),
  (9, 1999.99),
  (10, 11.99),
  (11, 12.99);

Alterando valores de alguns “ produtos ” - observar os resultados da trigger:
UPDATE
  produto
SET
  valor = 5.4
WHERE
  codigo = 3;

UPDATE
  produto
SET
  valor = 555.94
WHERE
  codigo = 5;

UPDATE
  produto
SET
  valor = 1955.14
WHERE
  codigo = 7;

UPDATE
  produto
SET
  valor = 333.33
WHERE
  codigo = 9;