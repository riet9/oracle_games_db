-- short_insert.sql

-- kategorija
INSERT INTO kategorija (nosaukums) VALUES ('Indie');
INSERT INTO kategorija (nosaukums) VALUES ('AAA');
INSERT INTO kategorija (nosaukums) VALUES ('Classic');

-- platforma
INSERT INTO platforma (nosaukums) VALUES ('PC');
INSERT INTO platforma (nosaukums) VALUES ('PlayStation');
INSERT INTO platforma (nosaukums) VALUES ('Xbox');
INSERT INTO platforma (nosaukums) VALUES ('Nintendo Switch');

-- zanrs
INSERT INTO zanrs (nosaukums) VALUES ('Action');
INSERT INTO zanrs (nosaukums) VALUES ('RPG');
INSERT INTO zanrs (nosaukums) VALUES ('Shooter');
INSERT INTO zanrs (nosaukums) VALUES ('Strategy');

-- studija
INSERT INTO studija (nosaukums, valsts) VALUES ('Valve', 'USA');
INSERT INTO studija (nosaukums, valsts) VALUES ('CD Projekt', 'Poland');
INSERT INTO studija (nosaukums, valsts) VALUES ('FromSoftware', 'Japan');
INSERT INTO studija (nosaukums, valsts) VALUES ('Supergiant Games', 'USA');

-- spele
-- (берём id по nosaukums через подзапросы, чтобы не знать конкретные числа identity)
INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Hades',
  DATE '2020-09-17',
  (SELECT studija_id FROM studija WHERE nosaukums='Supergiant Games'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Action'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='Indie')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Elden Ring',
  DATE '2022-02-25',
  (SELECT studija_id FROM studija WHERE nosaukums='FromSoftware'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='RPG'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

INSERT INTO spele (nosaukums, izlaides_datums, studija_id, platforma_id, zanrs_id, kategorija_id)
VALUES (
  'Counter-Strike 2',
  DATE '2023-09-27',
  (SELECT studija_id FROM studija WHERE nosaukums='Valve'),
  (SELECT platforma_id FROM platforma WHERE nosaukums='PC'),
  (SELECT zanrs_id FROM zanrs WHERE nosaukums='Shooter'),
  (SELECT kategorija_id FROM kategorija WHERE nosaukums='AAA')
);

-- reitingi
INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES (
  (SELECT spele_id FROM spele WHERE nosaukums='Hades' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
  9,
  SYSDATE - 10,
  'Ļoti laba spēle.'
);

INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES (
  (SELECT spele_id FROM spele WHERE nosaukums='Elden Ring' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PlayStation')),
  10,
  SYSDATE - 5,
  'Masterpiece.'
);

INSERT INTO reitingi (spele_id, vertejums, reitinga_datums, komentars)
VALUES (
  (SELECT spele_id FROM spele WHERE nosaukums='Counter-Strike 2' AND platforma_id=(SELECT platforma_id FROM platforma WHERE nosaukums='PC')),
  7,
  SYSDATE - 2,
  'Good, but needs updates.'
);

COMMIT;
