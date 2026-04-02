-- insert.sql (extended)

-- kategorija
INSERT INTO kategorija (nosaukums) VALUES ('Indie');
INSERT INTO kategorija (nosaukums) VALUES ('AAA');
INSERT INTO kategorija (nosaukums) VALUES ('Classic');
INSERT INTO kategorija (nosaukums) VALUES ('Early Access');

-- platforma
INSERT INTO platforma (nosaukums) VALUES ('PC');
INSERT INTO platforma (nosaukums) VALUES ('PlayStation');
INSERT INTO platforma (nosaukums) VALUES ('Xbox');
INSERT INTO platforma (nosaukums) VALUES ('Nintendo Switch');
INSERT INTO platforma (nosaukums) VALUES ('Mobile');

-- zanrs
INSERT INTO zanrs (nosaukums) VALUES ('Action');
INSERT INTO zanrs (nosaukums) VALUES ('RPG');
INSERT INTO zanrs (nosaukums) VALUES ('Shooter');
INSERT INTO zanrs (nosaukums) VALUES ('Strategy');
INSERT INTO zanrs (nosaukums) VALUES ('Adventure');
INSERT INTO zanrs (nosaukums) VALUES ('Platformer');
INSERT INTO zanrs (nosaukums) VALUES ('Puzzle');
INSERT INTO zanrs (nosaukums) VALUES ('Sports');

-- studija
INSERT INTO studija (nosaukums, valsts) VALUES ('Valve', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('CD Projekt', 'Poland');
INSERT INTO studija (nosaukums, valsts) VALUES ('FromSoftware', 'Japan');
INSERT INTO studija (nosaukums, valsts) VALUES ('Supergiant Games', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Rockstar Games', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Mojang', 'Sweden');
INSERT INTO studija (nosaukums, valsts) VALUES ('Blizzard Entertainment', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Epic Games', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Respawn Entertainment', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Nintendo', 'Japan');
INSERT INTO studija (nosaukums, valsts) VALUES ('Bethesda Game Studios', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Larian Studios', 'Belgium');
INSERT INTO studija (nosaukums, valsts) VALUES ('Riot Games', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('Hello Games', 'United Kingdom');

-- =====================
-- spele (15 игр)
-- =====================

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Hades',
  DATE '2020-09-17',
  (SELECT studija_id FROM studija WHERE nosaukums='Supergiant Games'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Action'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='Indie')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id, cena)
VALUES (
  'Elden Ring',
  DATE '2022-02-25',
  (SELECT studija_id FROM studija WHERE nosaukums='FromSoftware'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='RPG'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA'),
  59.99
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id, cena)
VALUES (
  'Counter-Strike 2',
  DATE '2023-09-27',
  (SELECT studija_id FROM studija WHERE nosaukums='Valve'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Shooter'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA'),
  0
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'The Witcher 3: Wild Hunt',
  DATE '2015-05-19',
  (SELECT studija_id FROM studija WHERE nosaukums='CD Projekt'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='RPG'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='Classic')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id, cena)
VALUES (
  'Grand Theft Auto V',
  DATE '2013-09-17',
  (SELECT studija_id FROM studija WHERE nosaukums='Rockstar Games'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Action'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='Classic'),
  14.99
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Minecraft',
  DATE '2011-11-18',
  (SELECT studija_id FROM studija WHERE nosaukums='Mojang'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Adventure'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='Classic')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Fortnite',
  DATE '2017-07-21',
  (SELECT studija_id FROM studija WHERE nosaukums='Epic Games'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Shooter'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Apex Legends',
  DATE '2019-02-04',
  (SELECT studija_id FROM studija WHERE nosaukums='Respawn Entertainment'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='Xbox'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Shooter'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Overwatch',
  DATE '2016-05-24',
  (SELECT studija_id FROM studija WHERE nosaukums='Blizzard Entertainment'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Shooter'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'The Legend of Zelda: Breath of the Wild',
  DATE '2017-03-03',
  (SELECT studija_id FROM studija WHERE nosaukums='Nintendo'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='Nintendo Switch'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Adventure'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Super Mario Odyssey',
  DATE '2017-10-27',
  (SELECT studija_id FROM studija WHERE nosaukums='Nintendo'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='Nintendo Switch'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Platformer'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Skyrim',
  DATE '2011-11-11',
  (SELECT studija_id FROM studija WHERE nosaukums='Bethesda Game Studios'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='RPG'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='Classic')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Baldur''s Gate 3',
  DATE '2023-08-03',
  (SELECT studija_id FROM studija WHERE nosaukums='Larian Studios'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='RPG'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'League of Legends',
  DATE '2009-10-27',
  (SELECT studija_id FROM studija WHERE nosaukums='Riot Games'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Strategy'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'No Man''s Sky',
  DATE '2016-08-09',
  (SELECT studija_id FROM studija WHERE nosaukums='Hello Games'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Adventure'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

-- =====================
-- reitingi (30 строк)
-- =====================

-- Hades (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Hades' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 40, 'Ļoti laba spēle.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Hades' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        8, SYSDATE - 12, 'Spēle ir dinamiska.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Hades' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 2, NULL);

-- Elden Ring (PlayStation)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Elden Ring' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        10, SYSDATE - 90, 'Masterpiece.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Elden Ring' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        9, SYSDATE - 7, 'Grūti, bet interesanti.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Elden Ring' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        10, SYSDATE - 1, NULL);

-- Counter-Strike 2 (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Counter-Strike 2' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        7, SYSDATE - 25, 'Good, but needs updates.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Counter-Strike 2' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        8, SYSDATE - 1, 'Patīk spēlēt ar draugiem.');

-- Witcher 3 (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='The Witcher 3: Wild Hunt' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        10, SYSDATE - 200, 'Klasika.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='The Witcher 3: Wild Hunt' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 30, 'Ļoti labs sižets.');

-- GTA V (PlayStation)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Grand Theft Auto V' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        9, SYSDATE - 300, 'Joprojām labs online.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Grand Theft Auto V' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        8, SYSDATE - 15, 'Daudz satura.');

-- Minecraft (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Minecraft' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        10, SYSDATE - 500, 'Var spēlēt bezgalīgi.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Minecraft' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 60, 'Labs co-op.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Minecraft' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        8, SYSDATE - 3, NULL);

-- Fortnite (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Fortnite' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        7, SYSDATE - 120, 'Dažreiz pārāk daudz kosmētikas.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Fortnite' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        8, SYSDATE - 3, 'Ātras spēles.');

-- Apex Legends (Xbox)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Apex Legends' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='Xbox')),
        8, SYSDATE - 22, 'Labs šaušanas feel.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Apex Legends' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='Xbox')),
        7, SYSDATE - 2, 'Grūti solo.');

-- Overwatch (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Overwatch' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        7, SYSDATE - 180, 'Labs, bet balanss mainās.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Overwatch' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        6, SYSDATE - 9, 'Reizēm toksiska komanda.');

-- Zelda BOTW (Switch)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='The Legend of Zelda: Breath of the Wild'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='Nintendo Switch')),
        10, SYSDATE - 250, 'Viena no labākajām.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='The Legend of Zelda: Breath of the Wild'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='Nintendo Switch')),
        9, SYSDATE - 11, 'Skaista pasaule.');

-- Mario Odyssey (Switch)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Super Mario Odyssey'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='Nintendo Switch')),
        9, SYSDATE - 70, 'Ļoti jautra.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Super Mario Odyssey'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='Nintendo Switch')),
        8, SYSDATE - 6, 'Labs platformeris.');

-- Skyrim (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Skyrim'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 600, 'Nostalģija.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Skyrim'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        8, SYSDATE - 21, 'Modi ir super.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Skyrim'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 2, NULL);

-- BG3 (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Baldur''s Gate 3'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        10, SYSDATE - 35, 'Ļoti dziļa RPG.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='Baldur''s Gate 3'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        9, SYSDATE - 4, 'Daudz izvēļu.');

-- League of Legends (PC)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='League of Legends'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        7, SYSDATE - 400, 'Atkarību izraisoša.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='League of Legends'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
        6, SYSDATE - 8, 'Grūti bez komandas.');

-- No Man's Sky (PlayStation)
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='No Man''s Sky'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        8, SYSDATE - 140, 'Tagad daudz labāka nekā sākumā.');
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES ((SELECT spele_id FROM spele WHERE nosaukums='No Man''s Sky'
         AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
        7, SYSDATE - 13, 'Interesanta izpēte.');

COMMIT;
