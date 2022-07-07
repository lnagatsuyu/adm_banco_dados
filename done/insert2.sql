INSERT INTO person 
    (
        fname,
        lname,
        eye_color,
        birth_date,
        street,
        city,
        state,
        country,
        postal_code
    )
    VALUES
    (
        'Fernanda',
        ' de Souza',
        'Azul',
        '1975-03-01 10:15',
        'Rua Durval',
        'São Paulo',
        'São Paulo',
        'Brasil',
        810022
    ),
        (
        'Elaine',
        ' de Pereira',
        'Preto',
        '1971-03-01 10:15',
        'Rua Machado de Assis',
        'Rio de Janeiro',
        'Rio de Janeiro',
        'Brasil',
        810025
    )
    ;

SELECT * FROM person;