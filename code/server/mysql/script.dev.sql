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
-- Créer les table ayant des clés étrangères
-- Créer une table : 

CREATE TABLE festivalrockny2_dev.visitor(
    PRIMARY KEY id MEDIUMINT UNSIGNED  AUTO_INCREMENT,
    email VARCHAR(50) UNSIGNED NOT NULL,
    FOREIGN KEY(ticket_id) REFERENCES ticket(id),
    ticket_id MEDIUMINT UNSIGNED NOT NULL 
);

CREATE TABLE festivalrockny2_dev.ticket(
    PRIMARY KEY id MEDIUMINT UNSIGNED AUTO_INCREMENT,
    date_time DATETIME,
    price MONEY NOT NULL,
    FOREIGN KEY (programming_id)  REFERENCES programming(id),
    programming_id TINYINT(1) UNSIGNED NOT NULL 
);

CREATE TABLE festivalrockny2_dev.band.artist(
    PRIMARY KEY id TINYINT(1) UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    rock_style TINYINT(2) UNSIGNED,
    FOREIGN KEY artist_id TINYINT(2) UNSIGNED REFERENCES
    artist(id) 
);

-- TABLE DE JOINTURE: INSTRUMENTAL - INSTRUMENT
CREATE TABLE festivalrockny2_dev.programming(
    PRIMARY KEY id TINYINT(1) UNSIGNED  AUTO_INCREMENT,
    FOREIGN KEY(programming_artist_id,) REFERENCES programming_artist(id),
    date_time DATETIME,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE festivalrockny2_dev.programming_artist(
    PRIMARY KEY programming_id TINYINT(1) UNSIGNED AUTO_INCREMENT,
        FOREIGN KEY (programming_id) REFERENCES programming(id),
    
    PRIMARY KEY 
    artist_id TINYINT(2) UNSIGNED AUTO_INCREMENT,
        FOREIGN KEY (artist_id) REFERENCES artist(id)       
);



CREATE TABLE festivalrockny2_dev.artist(
    PRIMARY KEY id TINYINT(2) UNSIGNED  AUTO_INCREMENT,
    FOREIGN KEY(programming_artist_id,) REFERENCES programming_artist(id),
    name VARCHAR(50) NOT NULL UNIQUE,
    rock_style TINYINT(2) UNSIGNED
);

-- Créer des enregistrements:
-- Commencer par les enregistrements des tables sans clés étrangères
INSERT INTO festivalrockny2_dev.visitor
VALUES
    -- Pour la PK, utiliser NULL pour l'auto-incrémentation
-- ROLE DES UTILISATEURS
    (NULL,'Visitor1', 'emailvisitateur1@gmail.com'),
    (NULL,'Visitor2', 'emailvisitateur2@gmail.com'),
    (NULL,'Visitor3', 'emailvisitateur3@gmail.com'),
    (NULL,'Visitor4', 'emailvisitateur4@gmail.com')
;

INSERT INTO festivalrockny2_dev.ticket
VALUES
-- TYPE DU ETAT DES DEMANDES
    (NULL, 1, '21/06/2025'),
    (NULL, 2, '22/06/2025')
;

INSERT INTO festivalrockny2_dev.band.artist
VALUES
-- GENRE DE L'INSTRUMENTAL
    (NULL, 1, 'INDOCHINE -Nicola Sirkis', 'style pop rock francais'),
    (NULL, 2, 'SKIP THE USE - Mat Bastard', 'style pop rock, electro, punck rock francais')   
;

INSERT INTO festivalrockny2_dev.programming
VALUES
-- SOUS-GENRE DE L'INSTRUMENTAL
    (NULL, 1, '21/06/2025', 'INDOCHINE - Nicola Sirkis, Izia'),
    (NULL, 2, '22/06/2025', 'SKIP THE USE - Mat Bastard')
;

;

INSERT INTO festivalrockny2_dev.programming_artist
VALUES
-- NOM D'ARTISTES
(NULL, 1, '21/06/2025','Nicola Sirkis-INDOCHINE', 'style pop rock francais'),
(NULL, 1, '21/06/2025','Izia', 'style pop rock, electro'),
(NULL, 2, '22/06/2025','Mat Bastard-SKIP THE USE', 'style pop rock, electro, punck rock francais')
    
;

INSERT INTO festivalrockny2_dev.artist
VALUES
-- NOM D'INSTRUMENTS
    (NULL, 1, 'Nicola Sirkis'),
    (NULL, 2,'Izia Higelin'),
    (NULL, 3,'Mat Bastard')
;   


-- -- Créer les enregistrements des tables avec clés étrangères
-- INSERT INTO discraeproduction_dev.instrumental
-- VALUES
-- -- LES INSTRUMENTALES / PROD.
--     (NULL, 'Plan', 'XXXbpm', 245, '2023', 1, 3, 11, NULL),
--     (NULL, 'Merch', 'XXXbpm', 198, '2024', 1, 1, 12, NULL)
-- ;

-- -- Table de jointure: instrumental_instrument
-- INSERT INTO discraeproduction_dev.instrumental_instrument
-- VALUES
-- -- LES INSTRUMENTS DANS LES INSTRUMENTALES
--     (1, 1),
--     (2, 1),
--     (2, 5)
-- ;

-- INSERT INTO discraeproduction_dev.playlist
-- VALUES
-- -- LES PLAYLISTS
--     (NULL, 'Drill - BEATS', NULL, 1, NULL),
--     (NULL, 'Trap - BEATS', NULL, 2, NULL),
--     (NULL, 'Boom Bap - BEATS', NULL, 3, NULL),
--     (NULL, 'New Wave - BEATS', NULL, 4, NULL),
--     (NULL, '2k24 - BEATS', '2024', NULL, NULL),
--     (NULL, '2k23 - BEATS', '2023', NULL, NULL),
--     (NULL, '2k22 - BEATS', '2022', NULL, NULL)
-- ;

-- -- Table de jointure: instrumental_playlist
-- INSERT INTO discraeproduction_dev.instrumental_playlist
-- VALUES
-- -- LES INSTRUMENTALES dans les PLAYLISTS
--     (1, 1),
--     (2, 1),
--     (1, 6),
--     (2, 5)
-- ;

-- INSERT INTO discraeproduction_dev.licence
-- VALUES
-- -- LES LICENCES
--     (NULL, 'Standard', 29.99, 'Morbi tincidunt posuere arcu. Cras venenatis est vitae dolor.'),
--     (NULL, 'Premium', 49.99, 'Morbi tincidunt posuere arcu. Cras venenatis est vitae dolor.'),
--     (NULL, 'Unlimited', 99.99, 'Morbi tincidunt posuere arcu. Cras venenatis est vitae dolor.')
-- ;

-- -- Table de jointure: licence_instrumental
-- INSERT INTO discraeproduction_dev.licence_instrumental
-- VALUES
-- -- LES LICENCES ATTRIBUE AUX INSTRUMENTALES 
--     (NULL, 2, 1),
--     (NULL, 3, 1),
--     (NULL, 1, 1),
--     (NULL, 2, 2),
--     (NULL, 3, 2),
--     (NULL, 3, 2)
-- ;

-- INSERT INTO discraeproduction_dev.user
-- VALUES
-- -- LES UTILISATEURS
--     (NULL, 'discrae', 'discraeprod@gmail.com', 'MDP_ADMIN', 2),
--     (NULL, 'pseudo1', 'nom1@email.com', 'MDP', 1),
--     (NULL, 'pseudo2', 'nom2@email.com', 'MDP2', 1)
-- ;

-- INSERT INTO discraeproduction_dev.demand
-- VALUES
-- -- LES COMMANDES DES LICENCES -- date, état, licence, user --
--     (NULL, '2024-09-11', 1, 1, 2),
--     (NULL, '2024-10-22', 2, 2, 3),
--     (NULL, '2024-10-31', 2, 3, 3)
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