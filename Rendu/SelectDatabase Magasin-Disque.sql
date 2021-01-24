  
-- --------------------------					--
-- Project : Magasin de disques					--
-- Author  : Santos Tiago et Collaud Nathanael	--
-- Version : 1.0								--
-- Date    : 21.01.2021							--
-- --------------------------					--

USE MagasinDisque;

GO

-- affiche toute les tables dans leur intégralité --

-- Groupes
SELECT * FROM Groupes;

-- Artists
SELECT * FROM Artists;

-- Producters
SELECT * FROM Producters;

-- Customers
SELECT * FROM Customers;

-- Packs
SELECT * FROM Packs;

-- Discs
SELECT * FROM Discs;

-- Styles
SELECT * FROM Styles;

-- Languages
SELECT * FROM Languages;

-- Staffs
SELECT * FROM Staffs;

-- Musics
SELECT * FROM Musics;

-- Groupes_has_Artists
SELECT * FROM Groupes_has_Artists;


USE master;