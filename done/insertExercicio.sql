INSERT INTO animais(
    tipo,
    nome
)
VALUES(
    'cachorro',
    'Loirinho'
),
(
    'gato',
    'Frajola'
);

SELECT * FROM animais;

CREATE DATABASE IF NOT EXISTS pet;

USE pet;

DROP TABLE IF EXISTS animais;

CREATE TABLE IF NOT EXISTS animais(
    id_animal INT PRIMARY KEY auto_increment,
    tipo ENUM('cachorro', 'gato'),
    nome VARCHAR(15),
    data_insert TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);