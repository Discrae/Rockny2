-- -- Selectionner des enregistrements:
--     -- Choisir les colonnes à sélectionner
--     -- Selection 
--     -- select firstname,lastname,rue,ville
--     -- from project_artisanal.client

-- -- Where permet de créer une condition pour récupérer des enregistrements
-- -- WHERE
-- --     client_id = 4;

-- SELECT product.name,product.parfum
-- FROM discraeproduction_dev
-- WHERE 
--     product.category = 'savon';

-- -- Sélectionner les nom et prénom des client et
-- -- ordered_date, order_status, payment_type de orders where client_id est less than 8





-- Jointure : sélectionner des données présentes dans plusieurs tables en utilisant les relations
SELECT
    orders.*,
    licence.*,
    instrumental.title
FROM 
    discraeproduction_dev.licence

-- JOIN/INNER JOIN permet de cibler une table en relation
-- JOIN
--     discraeproduction_dev.licence

-- -- ON permet de relier une clé étrangére à une clé primaire
-- ON 
--     orders.id_licence = licence.id
JOIN
    discraeproduction_dev.instrumental

-- Jointure avec une table de jointure
JOIN
    discraeproduction_dev.licence_instrumental
ON
    licence_instrumental.id_instrumental = instrumental.id
AND
    licence_instrumental.id_licence = licence.id
JOIN
    discraeproduction_dev.orders
ON
    orders.id_licence = licence.id
;