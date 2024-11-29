-- Active: 1698132942408@@127.0.0.1@5432@postgres

CREATE TABLE IF NOT EXISTS
    movie (
        id INT PRIMARY KEY,
        title VARCHAR(50),
        synopsis TEXT
    );

CREATE TABLE IF NOT EXISTS
    person (
        id INT PRIMARY KEY,
        name VARCHAR(20),
        surname VARCHAR(20),
        date_birthday date
    );

CREATE TABLE IF NOT EXISTS
    award (
        id INT,
        name varchar(50),
        year INT,
        id_movie INT references movie (id),
        id_person INT references person (id),
        PRIMARY KEY (id)
    );

CREATE TABLE  IF NOT EXISTS
    directed_by (
        id_movie INT references movie (id),
        id_person INT references person (id),
        PRIMARY KEY (id_movie, id_person)
    );


CREATE TABLE IF NOT EXISTS
    performed_by (
        id_movie INT references movie (id),
        id_person INT references person (id),
        PRIMARY KEY (id_movie, id_person)
    );


INSERT INTO
    MOVIE (id, title, synopsis)
VALUES
    (
        1,
        'El caballero oscuro',
        'Tras la muerte de Rachel Dawes, Bruce Wayne se recluye en su mansión como Batman. El Joker, un nuevo villano que pretende sembrar el caos en Gotham City, le obliga a salir de su retiro para enfrentarse a él.'
    ),
    (
        2,
        'Piratas del caribe: La maldición de la perla negra',
        'El capitán Barbossa le roba el barco al pirata Jack Sparrow y secuestra a Elizabeth, amiga de Will Turner. Barbossa y su tripulación son víctimas de un conjuro que los condena a vivir eternamente y a transformarse cada noche en esqueletos vivientes.'
    ),
    (
        3,
        'Shine',
        'El camino hacia la madurez de un niño prodigio del piano se ve truncado por unas crisis psiquiátricas que le hunden en profundas depresiones, fruto de las presiones familiares.'
    ),
    (
        4,
        'Trascendence',
        'El Dr. Will Caster, la mayor autoridad del mundo en inteligencia artificial, está llevando a cabo experimentos muy controvertidos para crear una máquina muy especial.'
    );


-- Insert Directors and Actors
INSERT INTO
    person (id, name, surname, date_birthday)
VALUES
    (1, 'Christopher', 'Nolan', '1970-07-30'), -- Director of The Dark Knight
    (2, 'Christian', 'Bale', '1974-01-30'), -- Actores de batman
    (3, 'Heath', 'Ledger', '1979-04-04'),
    (4, 'Aaron', 'Eckhart', '1968-03-12'),
    (5, 'Michael', 'Caine', '1933-03-14'),
    (6, 'Morgan', 'Freeman', '1937-06-12'),
    (7, 'Gore', 'Verbinsky', '1964-03-16'), -- Director Piratas del caribe
    (8, 'Johnny', 'Deep', '1963-06-09'), -- Actores de piratas del caribe
    (9, 'Orlando', 'Bloom', '1977-01-13'),
    (10, 'Keira', 'Knightley', '1985-03-26'),
    (11, 'Geoffrey', 'Rush', '1951-07-06'),
    (12, 'Scott', 'Hicks', '1953-03-04'), -- Director de Shine
    (13, 'Taylor', 'Noah', '1969-09-04'), -- Actores de shine
    (14, 'Rebecca', 'Hall', NULL), -- Actores de transcendence
    (15, 'Paul', 'Bettany', NULL);
;


-- Insert Award Data
INSERT INTO award (id, name, year, id_movie, id_person)
VALUES
    (1, 'Oscar Mejor Actor de Reparto', 2008, 1, 3), -- Batman, Heath Ledger
    (2, 'MVT Movie Awards Mejor villano', 2009, 1, 3), -- Batman, Heath Ledger
    (3, 'Globo de oro al mejor actor de reparto', 2009, 1, 3), -- Batman, Heath Ledger
    (4, 'Premios Empire Mejor Director', 2009, 1, 1), -- Batman, Christopher Nolan,
    (5, 'MTV Movie Award Mejor Interpretación Masculina', 2004, 2, 8), -- Piratas del caribe, Johnny Deep
    (6, 'Premio Empire al Mejor Actor', 2004, 2, 8), -- Piratas del caribe, Johnny Deep
    (7, 'Óscar Mejor Actor de Reparto', 1997, 3, 11); -- Shine, Geoffrey Rush






-- Insert Performed By Data
INSERT INTO performed_by (id_movie, id_person)
VALUES
    (1, 2), -- Actores de Batman
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (3, 11),
    (3, 13),
    (4, 6),
    (4, 8),
    (4, 14),
    (4, 15)
;


-- Insert Directed By Data
INSERT INTO directed_by (id_movie, id_person)
VALUES
    (1, 1), -- Director de BATMAN
    (2, 7), -- Director de Piratas del caribe
    (3, 12), -- Director de shine
    (4, 1) -- Director de transcendence
    ;