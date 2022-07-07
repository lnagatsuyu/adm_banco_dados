USE aula_4;

DROP TABLE IF EXISTS bebidas;

SELECT 'Criar tabela bebidas' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS bebidas(
    id_bebida SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    data_insercao DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT 'Realizar o INSERT na tabela bebidas' AS 'PRINT DADO';

INSERT INTO bebidas (tipo, marca)
VALUES('Vodka', 'Absolut'), ('Conhaque', 'Brandy'), ('Cachaça', 'Velho Barrero');

SELECT 'Alter table insert column' AS 'PRINT DADO';

ALTER TABLE bebidas
ADD COLUMN cor VARCHAR(60) NOT NULL DEFAULT 'transparente' AFTER marca;

SELECT 'Alter table bebidas DROP marca' AS 'PRINT DADO';

ALTER TABLE bebidas DROP COLUMN marca;