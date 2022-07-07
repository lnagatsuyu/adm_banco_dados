/***************************Leonardo Kenzo Nagatsuyu*********************************/


/*******************************Tabela Usuario*******************************************/
DROP SCHEMA IF EXISTS trabdba;

CREATE DATABASE IF NOT EXISTS trabDBA CHARACTER SET utf8 COLLATE utf8_general_ci;

USE trabDBA;

DROP TABLE IF EXISTS usuarios, clientes, cargos, produtos, clientes_produtos, empresas;

SELECT 'Cria tabela usuarios' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS usuarios(
    id_usuario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL
);


SELECT 'INSERT na tabela usuarios' AS 'PRINT DADO';

INSERT INTO
    usuarios(
        nome,
        endereco,
        cargo
    )

VALUES(
    'Rodrigo',
    'Rua Andrei',
    'Secretario'
),
      (
          'Bruno',
          'Rua Madeira',
          'Vendedor'
      ),

      (
          'Marcos',
          'Rua Joao',
          'Gerente'
      ),

      (
          'Marcela',
          'Rua Andrei',
          'Diretor'
      ),

      (
        'Andre',
        'Avenida republica Argentina',
        'Estoquista'
      );

/*******************************cargo*******************************************/



SELECT 'Criar tabela cargos' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS cargos(
    id_cargo SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipoCargo VARCHAR(64) NOT NULL
);

DESCRIBE cargos;

INSERT INTO cargos(tipoCargo) 
VALUES
(
  'Secretario'),
  ('Gerente'),
  ('Estoquista'),
  ('Vendedor'),
  ('Diretor');

    /* SELECT 'INNER JOIN' AS '';

    SELECT
        cargos.cargos,
        usuarios.usuarios,
    FROM
        cargos
    INNER JOIN
        usuarios ON usuarios.id_usuario = cargos.id_usuario; */



/*SELECT * FROM usuarios*/
/*******************************PRODUTO*******************************************/



SELECT 'Criar tabela produtos' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS produtos(
    id_produto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    precoDeCompra INTEGER NOT NULL,
    precoDeVenda INTEGER NOT NULL,
    estoque INTEGER NOT NULL
);

SELECT 'INSERT na tabela usuarios' AS 'PRINT DADO';

INSERT INTO
    produtos(
        nome,
        precoDeCompra,
        precoDeVenda,
        estoque
    )

VALUES(
    'achocolatado',
    5,
    9,
    420
),

      (
        'chocolate',
        2,
        5,
        500
      ),

      (
        'cafe',
        7,
        15,
        700
      ),

      (
        'arroz',
        20,
        32,
        356
      ),

      (
        'agua',
        1,
        3,
        950
      ),

      (
        'sorvete',
        3,
        7,
        400
      );

/*SELECT * FROM produtos;*/



/*SELECT * FROM clientes_produtos;*/

/*******************************EMPRESA*******************************************/



SELECT 'Criar tabela empresas' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS empresas(
    id_empresas SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO
    empresas(
        nome
    )

VALUES(
    'nescau'
),
      (
        'lacta'
      ),

      (
        'Ouro Fino'
      ),

      (
        'tio joao'
      ),

      (
        'cristal'
      ),

      (
        'tablito'
      );

/*SELECT * FROM empresas;*/

/*******************************CLIENTES*******************************************/


SELECT 'Criar tabela clientes' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS clientes(
    cpf_cnpj INT UNSIGNED PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone INT NOT NULL
);

SELECT 'INSERT na tabela clientes' AS 'PRINT DADO';

INSERT INTO
    clientes(
        cpf_cnpj,
        nome,
        endereco,
        telefone
    )

VALUES(
    '1',
    'roberto',
    'rua das flores',
    '12312432'
    ),
      (
          '2',
          'marcelo',
          'rua do mercado',
          '76867867'
      ),
      (
        '3',
        'mateus',
        'rua Mateus',
        '2343435'

      ),
      (
        '4',
        'Gerson',
        'Rua Bruno',
        '34567890'
      );


/*******************************CLIENTES - PRODUTOS*******************************************/


SELECT 'Criar tabela clientes_produtos' as 'PRINT DADO';

CREATE TABLE IF NOT EXISTS clientes_produtos(
  cpf_cnpj INT UNSIGNED,
  id_produto INT UNSIGNED,
  CONSTRAINT fk_clientes FOREIGN KEY (cpf_cnpj) REFERENCES clientes(cpf_cnpj),
  CONSTRAINT fk_produtos FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes_produtos(
  cpf_cnpj,
  id_produto
)VALUES
(1,1),
(1,2),
(2,1),
(2,5),
(4,1),
(4,2),
(3,2);



DESCRIBE clientes_produtos;

SELECT * FROM cargos;

SELECT * FROM usuarios;
SELECT * FROM produtos;
SELECT * FROM produtos WHERE (nome = 'achocolatado');
SELECT * FROM clientes;
SELECT * FROM empresas;
SELECT * FROM clientes_produtos;

/*4*/
SELECT * FROM 
  clientes 
LEFT JOIN 
  clientes_produtos ON clientes.cpf_cnpj = clientes_produtos.cpf_cnpj
LEFT JOIN
  produtos ON produtos.id_produto = clientes_produtos.id_produto
WHERE 
  clientes.nome = 'Gerson';

/*5*/

SELECT * FROM 
  clientes 
LEFT JOIN 
  clientes_produtos ON clientes.cpf_cnpj = clientes_produtos.cpf_cnpj
LEFT JOIN
  produtos ON produtos.id_produto = clientes_produtos.id_produto
WHERE 
  clientes.nome IN ('roberto', 'marcelo');

/*6*/

SELECT * FROM 
  clientes 
LEFT JOIN 
  clientes_produtos ON clientes.cpf_cnpj = clientes_produtos.cpf_cnpj
LEFT JOIN
  produtos ON produtos.id_produto = clientes_produtos.id_produto
WHERE 
  clientes.nome IN ('roberto', 'marcelo') LIMIT 3;

  /*7*/

SELECT * FROM 
  clientes 
LEFT JOIN 
  clientes_produtos ON clientes.cpf_cnpj = clientes_produtos.cpf_cnpj
LEFT JOIN
  produtos ON produtos.id_produto = clientes_produtos.id_produto
WHERE 
  clientes.nome IN ('roberto', 'marcelo') ORDER BY produtos.estoque DESC;

/*8*/

SELECT * FROM 
  clientes 
LEFT JOIN 
  clientes_produtos ON clientes.cpf_cnpj = clientes_produtos.cpf_cnpj
LEFT JOIN
  produtos ON produtos.id_produto = clientes_produtos.id_produto
WHERE 
  clientes.nome IN ('roberto', 'marcelo') ORDER BY produtos.precoDeCompra DESC;
