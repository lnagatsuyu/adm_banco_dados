USE aula5;

SELECT 'PRIMARY KEY - FOREIGN KEY' as '';

DROP TABLE IF tempo;

CREATE TABLE IF NOT EXISTS tempo (
    id_tempo SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome enum('sol','nublado','chuva') DEFAULT 'sol'
);

DESCRIBE tempo;

INSERT INTO tempo 
    (nome)
VALUES
    ('sol'),
    ('nublado'),
    ('chuva');

select * from tempo;
DROP TABLE IF EXISTS cidade;

CREATE TABLE IF NOT EXISTS cidade (
    id_cidade SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    temperatura FLOAT,
    id_tempo SMALLINT UNSIGNED,
    CONSTRAINT fk_tempo FOREIGN KEY (id_tempo) REFERENCES tempo(id_tempo) 
);


DESCRIBE cidade;
SELECT * FROM cidade;


SELECT 
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_NAME = 'tempo';

INSERT INTO cidade (nome, temperatura,id_tempo)
VALUES 
    ('Curitiba', 5.15, 2),
    ('Sao Paulo', 25.5, 3),
    ('Rio de Janeiro', 40, 1),
    ('Porto Alegre', 12, 2),
    ('Fortaleza', 35.2, 1),
    ('Cuiaba', 35.2, 10);

SELECT * FROM cidade;

DELETE FROM tempo WHERE id_tempo = 2;
