-- --------------------------					--
-- Project : Magasin de disque					--
-- Author  : Collaud Nathanael et Santos Tiago	--
-- Version : 1.0								--
-- Date    : 21.01.2021							--
-- --------------------------					--

USE MagasinDeDisque;

GO

-- Drop de la vue --

IF (EXISTS (SELECT name
FROM sys.views
WHERE name = 'createView'))
BEGIN
    DROP VIEW createView;
END

GO

-- création de la vue des quantité d'entrée par table --

CREATE VIEW createView AS SELECT * FROM 
	(SELECT COUNT(*) AS "Groupes" FROM Groupes) as Groupes,
    (SELECT COUNT(*) AS "Artists" FROM Artists) as Artists,
    (SELECT COUNT(*) AS "Producters" FROM Producters) as Producters,
    (SELECT COUNT(*) AS "Customers" FROM Customers) as Customers,
    (SELECT COUNT(*) AS "Groupes_has_Artists" FROM Groupes_has_Artists) as Groupes_has_Artists,
    (SELECT COUNT(*) AS "Staffs" FROM Staffs) as Staffs,
    (SELECT COUNT(*) AS "Packs" FROM Packs) as Packs,
    (SELECT COUNT(*) AS "Discs" FROM Discs) as Discs,
    (SELECT COUNT(*) AS "Styles" FROM Styles) as Styles,
	(SELECT COUNT(*) AS "Languages" FROM Languages) as Languages,
	(SELECT COUNT(*) AS "Musics" FROM Musics) as Musics
;

GO

-- Afficher vue --

SELECT *
FROM createView;

USE master;