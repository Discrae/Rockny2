-- COMMANDES :
    -- mysql -u 'user' -p = Se connecter au terminal MySQL

    -- source script.dev.sql; = Charger le fichier SQL dans le serveur SQL
    -- show databases; = Afficher les bases de données
    -- use discraeproduction_dev; = Sélectionner une base de données
    -- show tables; = Afficher la liste des tables
    -- table 'nomtable' = Afficher une table
    -- exit = Quitter



-- Supprimer la base de données, 
-- DROP DATABASE 'database'

-- Seulement, si elle existe 
-- ATTENTION uniquement en dévelopement
DROP DATABASE IF EXISTS festivalrockny2_dev;



-- Créer une base de données:
CREATE DATABASE  festivalrockny2_dev;



-- Commencer par créer les tables n'ayant pas de clés étrangéres
-- Créer une table : 

CREATE TABLE festivalrockny2_dev.visitor(
    id MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    EMAIL VARCHAR(50) UNSIGNED NOT NULL,
    ticket_id MEDIUMINT UNSIGNED, FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE festivalrockny2_dev.ticket(
    id MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    date_time DATETIME,
    price MONEY NOT NULL,
    programming_id TINYINT(1) UNSIGNED NOT NULL, FOREIGN KEY (programming_id)  REFERENCES programming(id)
);



-- Créer les table ayant des clés étrangères
-- CREATE TABLE discraeproduction_dev.instrumental(
--     id TINYINT(3) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(20) NOT NULL UNIQUE,
--     bpm VARCHAR(6) NOT NULL,
--     duration SMALLINT(3) NOT NULL,
--     date YEAR NOT NULL,
    
--     id_genre TINYINT(1) UNSIGNED,
--         FOREIGN KEY (id_genre) REFERENCES genre(id),

--     id_subgenre TINYINT(1) UNSIGNED,
--         FOREIGN KEY (id_subgenre) REFERENCES subgenre(id),

--     id_notekey TINYINT(2) UNSIGNED,
--         FOREIGN KEY (id_notekey) REFERENCES notekey(id),    

--     id_artist TINYINT(2) UNSIGNED,
--         FOREIGN KEY (id_artist) REFERENCES artist(id)
-- );

-- TABLE DE JOINTURE: INSTRUMENTAL - INSTRUMENT
CREATE TABLE festivalrockny2_dev.programming_artist(
    programming_id TINYINT(1) UNSIGNED AUTO_INCREMENT,
        FOREIGN KEY (programming_id) REFERENCES programming(id),
    
    artist_id TINYINT(1) UNSIGNED AUTO_INCREMENT,
        FOREIGN KEY (artist_id) REFERENCES artist(id)       
);

CREATE TABLE discraeproduction_dev.programming(
    PRIMARY KEY id TINYINT(2) UNSIGNED  AUTO_INCREMENT,FOREIGN KEY(programming_artist_id,) REFERENCES programming_artist(id),
    FOREIGN KEY(programming_band.artist_id),REFERENCES programming_band.artist(id),
    date_time DATETIME, 
);

-- TABLE DE JOINTURE: INSTRUMENTAL - PLAYLIST
-- CREATE TABLE discraeproduction_dev.instrumental_playlist(
--     id_instrumental TINYINT(3) UNSIGNED,
--         FOREIGN KEY (id_instrumental) REFERENCES instrumental(id),
    
--     id_playlist TINYINT(2) UNSIGNED,
--         FOREIGN KEY (id_playlist) REFERENCES playlist(id)       
-- );

-- CREATE TABLE discraeproduction_dev.licence(
--     id TINYINT(1) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
--     type VARCHAR(15) NOT NULL,
--     price DECIMAL(3.2) UNSIGNED,
--     description VARCHAR(255) NOT NULL
-- );

-- TABLE DE JOINTURE: LICENCE - INSTRUMENTAL
-- CREATE TABLE discraeproduction_dev.licence_instrumental(
--     id SMALLINT(3) UNSIGNED PRIMARY KEY AUTO_INCREMENT,

--     id_licence TINYINT(1) UNSIGNED,
--         FOREIGN KEY (id_licence) REFERENCES licence(id),
        
--     id_instrumental TINYINT(3) UNSIGNED,
--         FOREIGN KEY (id_instrumental) REFERENCES instrumental(id)
-- );

CREATE TABLE discraeproduction_dev.user(
    id TINYINT(3) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(50) NOT NULL,
    email VARCHAR(75) NOT NULL UNIQUE,
    password VARCHAR(75) NOT NULL,
    
    -- FK reprend strictement le type de la PK
    id_role TINYINT(1) UNSIGNED,
        -- la FK doit référencer la PK de la table jointe
        FOREIGN KEY (id_role) REFERENCES role(id)
);

CREATE TABLE discraeproduction_dev.demand(
    id TINYINT(3) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    
    id_demandstate TINYINT(1) UNSIGNED,
        FOREIGN KEY (id_demandstate) REFERENCES demandstate(id),

    id_licence TINYINT(1) UNSIGNED,
        FOREIGN KEY (id_licence) REFERENCES licence(id),    

    id_user TINYINT(3) UNSIGNED,
        FOREIGN KEY (id_user) REFERENCES user(id)
);






-- Créer des enregistrements:
-- Commencer par les enregistrements des tables sans clés étrangères
INSERT INTO discraeproduction_dev.role
VALUES
    -- Pour la PK, utiliser NULL pour l'auto-incrémentation
-- ROLE DES UTILISATEURS
    (NULL,'Utilisateur'),
    (NULL,'Administrateur')
;

INSERT INTO discraeproduction_dev.demandstate
VALUES
-- TYPE DU ETAT DES DEMANDES
    (NULL,'En Attente'),
    (NULL,'Accepté'),
    (NULL,'Refusé')
;

INSERT INTO discraeproduction_dev.genre
VALUES
-- GENRE DE L'INSTRUMENTAL
    (NULL,'Drill'), -- 1 --
    (NULL,'Trap'), -- 2 --
    (NULL,'Boom Bap - Old School'), -- 3 --
    (NULL,'New Wave'), -- 4 --
    (NULL,'Latin') -- 5 --

;

INSERT INTO discraeproduction_dev.subgenre
VALUES
-- SOUS-GENRE DE L'INSTRUMENTAL
    (NULL,'Melodic'),
    (NULL,'Dark'),
    (NULL,'Agressive'),
    (NULL,'Ethnic')
;

INSERT INTO discraeproduction_dev.notekey
VALUES
-- GAMME MINEUR
    (NULL,'Cm'), -- 1 --
    (NULL,'C#m'),
    (NULL,'Dm'),
    (NULL,'D#m'),
    (NULL,'Em'), -- 5 -- 
    (NULL,'Fm'), 
    (NULL,'F#m'),    
    (NULL,'Gm'), 
    (NULL,'G#m'), 
    (NULL,'Am'), -- 10 --    
    (NULL,'A#m'), 
    (NULL,'Bm'), 
-- GAMME MAJEUR
    (NULL,'C'), -- 1 --
    (NULL,'C#'),
    (NULL,'D'),
    (NULL,'D#'),
    (NULL,'E'), -- 5 --  
    (NULL,'F'), 
    (NULL,'F#'),    
    (NULL,'G'), 
    (NULL,'G#'), 
    (NULL,'A'), -- 10 --    
    (NULL,'A#'), 
    (NULL,'B')
;

INSERT INTO discraeproduction_dev.artist
VALUES
-- NOM D'ARTISTES
    (NULL,'1Pliké140'),
    (NULL,'menace Santana'),
    (NULL,'La Fève')
;

INSERT INTO discraeproduction_dev.instrument
VALUES
-- NOM D'INSTRUMENTS
    (NULL,'Piano'),
    (NULL,'Bells'),
    (NULL,'Guitar'),
    (NULL,'Violin'),
    (NULL,'Strings'),
    (NULL,'Choir'),
    (NULL,'Vocal'),
    (NULL,'Flute')
;   



-- Créer les enregistrements des tables avec clés étrangères
INSERT INTO discraeproduction_dev.instrumental
VALUES
-- LES INSTRUMENTALES / PROD.
    (NULL, 'Plan', 'XXXbpm', 245, '2023', 1, 3, 11, NULL),
    (NULL, 'Merch', 'XXXbpm', 198, '2024', 1, 1, 12, NULL)
;

-- Table de jointure: instrumental_instrument
INSERT INTO discraeproduction_dev.instrumental_instrument
VALUES
-- LES INSTRUMENTS DANS LES INSTRUMENTALES
    (1, 1),
    (2, 1),
    (2, 5)
;

INSERT INTO discraeproduction_dev.playlist
VALUES
-- LES PLAYLISTS
    (NULL, 'Drill - BEATS', NULL, 1, NULL),
    (NULL, 'Trap - BEATS', NULL, 2, NULL),
    (NULL, 'Boom Bap - BEATS', NULL, 3, NULL),
    (NULL, 'New Wave - BEATS', NULL, 4, NULL),
    (NULL, '2k24 - BEATS', '2024', NULL, NULL),
    (NULL, '2k23 - BEATS', '2023', NULL, NULL),
    (NULL, '2k22 - BEATS', '2022', NULL, NULL)
;

-- Table de jointure: instrumental_playlist
INSERT INTO discraeproduction_dev.instrumental_playlist
VALUES
-- LES INSTRUMENTALES dans les PLAYLISTS
    (1, 1),
    (2, 1),
    (1, 6),
    (2, 5)
;

INSERT INTO discraeproduction_dev.licence
VALUES
-- LES LICENCES
    (NULL, 'Standard', 29.99, 'Morbi tincidunt posuere arcu. Cras venenatis est vitae dolor.'),
    (NULL, 'Premium', 49.99, 'Morbi tincidunt posuere arcu. Cras venenatis est vitae dolor.'),
    (NULL, 'Unlimited', 99.99, 'Morbi tincidunt posuere arcu. Cras venenatis est vitae dolor.')
;

-- Table de jointure: licence_instrumental
INSERT INTO discraeproduction_dev.licence_instrumental
VALUES
-- LES LICENCES ATTRIBUE AUX INSTRUMENTALES 
    (NULL, 2, 1),
    (NULL, 3, 1),
    (NULL, 1, 1),
    (NULL, 2, 2),
    (NULL, 3, 2),
    (NULL, 3, 2)
;

INSERT INTO discraeproduction_dev.user
VALUES
-- LES UTILISATEURS
    (NULL, 'discrae', 'discraeprod@gmail.com', 'MDP_ADMIN', 2),
    (NULL, 'pseudo1', 'nom1@email.com', 'MDP', 1),
    (NULL, 'pseudo2', 'nom2@email.com', 'MDP2', 1)
;

INSERT INTO discraeproduction_dev.demand
VALUES
-- LES COMMANDES DES LICENCES -- date, état, licence, user --
    (NULL, '2024-09-11', 1, 1, 2),
    (NULL, '2024-10-22', 2, 2, 3),
    (NULL, '2024-10-31', 2, 3, 3)
;



-- Modifer des enregistrements:
    -- UPDATE discraeproduction_dev.demandstate --
-- SET = Permet de cibler les colonnes à mettre a jour, et affecter une nouvelle valeur
    -- SET demandstate.type = 'ERROR' --
-- WHERE = Permet de créer une condition, cibler une colonne et une valeur
    -- WHERE demandstate.id = 2 --
-- ;



-- Supprimer un enregistrement:
    -- DELETE FROM discraeproduction_dev.demandstate --
    -- WHERE demandstate.id = 2 --
-- ;