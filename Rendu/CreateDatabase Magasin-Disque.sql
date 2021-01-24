-- --------------------------					--
-- Project : Magasin de disques					--
-- Author  : Santos Tiago et Collaud Nathanael	--
-- Version : 1.0								--
-- Date    : 21.01.2021							--
-- --------------------------					--


-- Créer Database
USE master ;
-- Déconnexion des utilisateurs pour drop
IF (EXISTS (SELECT name
FROM master.dbo.sysdatabases
WHERE name = 'magasindisque'))
BEGIN 
    USE master;
    ALTER DATABASE magasindisque SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE magasindisque;
END 
-- création
CREATE DATABASE magasindisque;
GO


 USE magasindisque;
-- création des tables
 BEGIN 
-- Créer table Producters
 CREATE TABLE Producters
	( id int IDENTITY(1,1) NOT NULL ,
	  ProducterNumber int UNIQUE NOT NULL,
	  Lastname varchar (45),
	  Firstname varchar (45),
      Email varchar (45),
       PRIMARY KEY(id))

-- drop table areas
-- Créer table Artists
 CREATE TABLE Artists
	( id int IDENTITY(1,1) NOT NULL ,
	  ArtistNumber int UNIQUE NOT NULL,
	  Lastname varchar (45),
	  Firstname varchar (45),
      StageName varchar (45),
      Email varchar (45),
	  Producter_id int, 	-- FK
       PRIMARY KEY(id))

-- Créer table Groupes
CREATE TABLE Groupes
	( id int IDENTITY(1,1) NOT NULL ,
	  GroupNumber int NOT NULL,
	 GroupName varchar (45) ,
	 NumberOfMember int ,
     PRIMARY KEY(id))

-- Créer table Groupes_has_Artists
CREATE TABLE Groupes_has_Artists
	(id int IDENTITY(1,1) NOT NULL ,
    Groupe_id int ,	-- FK
	  Artist_id int ,-- FK
      PRIMARY KEY(id))	

-- Créer table Customers
CREATE TABLE Customers
	( id int IDENTITY(1,1) NOT NULL ,
	  CustomerNumber int UNIQUE NOT NULL,
	  Lastname varchar (45),
	  Firstname varchar (45),
      Email varchar (45),
      PRIMARY KEY(id))

-- Créer table Packs
 CREATE TABLE Packs
	( id int IDENTITY(1,1) NOT NULL ,
	  PackNumber int NOT NULL,
	  NumberOfTitle int NOT NULL,
	  Price decimal NOT NULL,
	   Customer_id int,	-- FK
       PRIMARY KEY(id)) 

-- Créer table Discs
 CREATE TABLE Discs
	( id int IDENTITY(1,1) NOT NULL ,
	  DiscNumber int UNIQUE NOT NULL,
	  DiscName varchar (45),
	  "Date" date,
	 NumberOfTitle int,
     Price decimal,
      Duration datetime,
      Producter_id int NOT NULL, -- FK
      Customer_id int, -- FK
      Pack_id int,-- FK
      PRIMARY KEY(id))	

-- Créer table Staffs
 CREATE TABLE Staffs
	( id int IDENTITY(1,1) NOT NULL ,
	  StaffNumber int UNIQUE NOT NULL,
	  Lastname varchar (45),
	  Firstname varchar (45),
      Email varchar (45),
      ContractDate date,
      Disc_id int,-- FK
      PRIMARY KEY(id))	

-- Créer table Styles
 CREATE TABLE Styles
	( id int IDENTITY(1,1) NOT NULL ,
	  "name" varchar (45) NOT NULL,
      PRIMARY KEY(id))
	  
      -- Créer table Languages
 CREATE TABLE Languages
	( id int IDENTITY(1,1) NOT NULL ,
	  LanguageCode varchar (2) NOT NULL,
      LanguageName varchar (45) not null,
      PRIMARY KEY(id))
      
-- Créer table Musics
 CREATE TABLE Musics
	( id int IDENTITY(1,1) NOT NULL,
	 MusicNumber int UNIQUE NOT NULL,
	  Title varchar (45) ,							
	 "date" date,						
	  Language_id int ,						-- FK
      Style_id int 		,				-- FK
      Artist_id int 	,					-- FK
      Disc_id int 		,				-- FK
PRIMARY KEY(id)
)

END 

 USE magasindisque;

-- clé étrangère

ALTER TABLE Artists WITH CHECK ADD  CONSTRAINT FK_magasindisque_Producters FOREIGN KEY(Producter_id)
REFERENCES Producters(id)

ALTER TABLE Groupes_has_Artists WITH CHECK ADD  CONSTRAINT FK_magasindisque_Groupe FOREIGN KEY(Groupe_id)
REFERENCES Groupes(id)

ALTER TABLE Groupes_has_Artists WITH CHECK ADD  CONSTRAINT FK_magasindisque_Artists FOREIGN KEY(Artist_id)
REFERENCES Artists(id)

ALTER TABLE Packs WITH CHECK ADD  CONSTRAINT FK_magasindisque_Customers FOREIGN KEY(Customer_id)
REFERENCES Customers(id)
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE Discs WITH CHECK ADD  CONSTRAINT FK_magasindisque_Producter FOREIGN KEY(Producter_id)
REFERENCES Producters(id)

ALTER TABLE Discs WITH CHECK ADD  CONSTRAINT FK_magasindisque_Customer FOREIGN KEY(Customer_id)
REFERENCES Customers(id)
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE Discs WITH CHECK ADD  CONSTRAINT FK_magasindisque_Pack FOREIGN KEY(Pack_id)
REFERENCES Packs(id)

ALTER TABLE Staffs WITH CHECK ADD  CONSTRAINT FK_magasindisque_Discs FOREIGN KEY(Disc_id)
REFERENCES Discs(id)

ALTER TABLE Musics WITH CHECK ADD  CONSTRAINT FK_magasindisque_Language FOREIGN KEY(Language_id)
REFERENCES Languages(id)

ALTER TABLE Musics WITH CHECK ADD  CONSTRAINT FK_magasindisque_Style FOREIGN KEY(Style_id)
REFERENCES Styles(id)

ALTER TABLE Musics WITH CHECK ADD  CONSTRAINT FK_magasindisque_Artist FOREIGN KEY(Artist_id)
REFERENCES Artists(id)

ALTER TABLE Musics WITH CHECK ADD  CONSTRAINT FK_magasindisque_Disc FOREIGN KEY(Disc_id)
REFERENCES Discs(id)

-- contrainte de domaine
ALTER TABLE Discs
        ADD CONSTRAINT CHK_NotTooBig CHECK (NumberOfTitle < 20)
    ;
ALTER TABLE Packs
	ADD CONSTRAINT CHK_NotTooMuch CHECK (NumberOfTitle < 60)
;

USE Master ;