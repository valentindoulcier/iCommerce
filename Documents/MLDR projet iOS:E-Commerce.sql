SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `iCommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `iCommerce` ;

-- -----------------------------------------------------
-- Table `iCommerce`.`CodePostal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`CodePostal` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`CodePostal` (
  `idCodePostal` INT NOT NULL AUTO_INCREMENT ,
  `numCodePostal` INT NOT NULL ,
  PRIMARY KEY (`idCodePostal`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Ville`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Ville` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Ville` (
  `idVille` INT NOT NULL AUTO_INCREMENT ,
  `idCodePostal` INT NOT NULL ,
  `nomVille` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idVille`) ,
  INDEX `fkIdCodePostal_idx` (`idCodePostal` ASC) ,
  CONSTRAINT `fkIdCodePostalVille`
    FOREIGN KEY (`idCodePostal` )
    REFERENCES `iCommerce`.`CodePostal` (`idCodePostal` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`AdresseClient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`AdresseClient` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`AdresseClient` (
  `idAdresseClient` INT NOT NULL ,
  `appartement` VARCHAR(45) NULL ,
  `numRue` VARCHAR(5) NOT NULL ,
  `nomRue` VARCHAR(45) NOT NULL ,
  `idVille` INT NOT NULL ,
  PRIMARY KEY (`idAdresseClient`) ,
  INDEX `fkidVille_idx` (`idVille` ASC) ,
  CONSTRAINT `fkidVilleAdresseClient`
    FOREIGN KEY (`idVille` )
    REFERENCES `iCommerce`.`Ville` (`idVille` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Client` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Client` (
  `idClient` INT NOT NULL AUTO_INCREMENT ,
  `refClient` VARCHAR(8) NOT NULL ,
  `nomClient` VARCHAR(45) NOT NULL ,
  `emailClient` VARCHAR(45) NOT NULL ,
  `loginClient` VARCHAR(45) NOT NULL ,
  `passwordClient` VARCHAR(128) NOT NULL ,
  `idAdressePrincipale` INT NOT NULL ,
  `telephonePortable` VARCHAR(10) NULL ,
  `telephoneDomicile` VARCHAR(10) NULL ,
  PRIMARY KEY (`idClient`) ,
  INDEX `fkIdAdressePrincipale_idx` (`idAdressePrincipale` ASC) ,
  UNIQUE INDEX `refClient_UNIQUE` (`refClient` ASC) ,
  CONSTRAINT `fkIdAdressePrincipaleClient`
    FOREIGN KEY (`idAdressePrincipale` )
    REFERENCES `iCommerce`.`AdresseClient` (`idAdresseClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Categorie` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Categorie` (
  `idCategorie` INT NOT NULL AUTO_INCREMENT COMMENT '		' ,
  `nomCategorie` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCategorie`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`SousCategorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`SousCategorie` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`SousCategorie` (
  `idSousCategorie` INT NOT NULL AUTO_INCREMENT ,
  `idCategorie` INT NOT NULL ,
  `nomSousCategorie` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idSousCategorie`) ,
  INDEX `fkIdCategorie_idx` (`idCategorie` ASC) ,
  CONSTRAINT `fkIdCategorieSC`
    FOREIGN KEY (`idCategorie` )
    REFERENCES `iCommerce`.`Categorie` (`idCategorie` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Marque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Marque` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Marque` (
  `idMarque` INT NOT NULL AUTO_INCREMENT ,
  `nomMarque` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idMarque`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Article` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Article` (
  `idArticle` INT NOT NULL AUTO_INCREMENT ,
  `refArticle` VARCHAR(45) NOT NULL ,
  `nomArticle` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(200) NULL ,
  `photo` BLOB NULL ,
  `idCategorie` INT NOT NULL ,
  `idSousCategorie` INT NULL ,
  `idMarque` INT NOT NULL ,
  `prixHT` DECIMAL(10,2) NOT NULL ,
  `tauxTVA` DECIMAL(4,2) NOT NULL ,
  PRIMARY KEY (`idArticle`) ,
  INDEX `idCategorie_idx` (`idCategorie` ASC) ,
  INDEX `fkIdSousCategorie_idx` (`idSousCategorie` ASC) ,
  INDEX `fkIdMarque_idx` (`idMarque` ASC) ,
  UNIQUE INDEX `refArticle_UNIQUE` (`refArticle` ASC) ,
  CONSTRAINT `fkIdCategorieArticle`
    FOREIGN KEY (`idCategorie` )
    REFERENCES `iCommerce`.`Categorie` (`idCategorie` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdSousCategorieArticle`
    FOREIGN KEY (`idSousCategorie` )
    REFERENCES `iCommerce`.`SousCategorie` (`idSousCategorie` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdMarqueArticle`
    FOREIGN KEY (`idMarque` )
    REFERENCES `iCommerce`.`Marque` (`idMarque` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Commentaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Commentaire` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Commentaire` (
  `idCommentaire` INT NOT NULL AUTO_INCREMENT ,
  `idArticle` INT NOT NULL ,
  `idClient` INT NOT NULL ,
  `commentaireArticle` VARCHAR(500) NOT NULL ,
  `noteArticle` DECIMAL(3,1) NOT NULL ,
  PRIMARY KEY (`idCommentaire`) ,
  INDEX `fkIdArticle_idx` (`idArticle` ASC) ,
  INDEX `fkIdClient_idx` (`idClient` ASC) ,
  CONSTRAINT `fkIdArticleCommentaire`
    FOREIGN KEY (`idArticle` )
    REFERENCES `iCommerce`.`Article` (`idArticle` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdClientCommentaire`
    FOREIGN KEY (`idClient` )
    REFERENCES `iCommerce`.`Client` (`idClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`TypeLivraison`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`TypeLivraison` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`TypeLivraison` (
  `idTypeLivraison` INT NOT NULL ,
  `nomTypeLivraison` VARCHAR(45) NOT NULL ,
  `prixTypeLivraison` DECIMAL(5,2) NOT NULL ,
  PRIMARY KEY (`idTypeLivraison`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`EtatCommande`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`EtatCommande` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`EtatCommande` (
  `idEtatCommande` INT NOT NULL ,
  `nomEtatComande` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEtatCommande`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`Commande`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`Commande` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`Commande` (
  `idCommande` INT NOT NULL AUTO_INCREMENT ,
  `idClient` INT NOT NULL ,
  `dateCommande` DATETIME NOT NULL ,
  `dateEstimeeLivraison` DATETIME NOT NULL ,
  `dateExpedition` DATETIME NULL ,
  `idEtatCommande` INT NOT NULL ,
  `numColis` VARCHAR(45) NULL ,
  `idTypeLivraison` INT NOT NULL ,
  `adresseLivraison` INT NOT NULL ,
  `adresseFacturation` INT NOT NULL ,
  `prixLivraison` DECIMAL(5,2) NOT NULL ,
  PRIMARY KEY (`idCommande`) ,
  INDEX `fkIdClient_idx` (`idClient` ASC) ,
  INDEX `fkIdTypeLivraison_idx` (`idTypeLivraison` ASC) ,
  INDEX `fkIdAdresseLivraison_idx` (`adresseLivraison` ASC) ,
  INDEX `fkIdAdresseFacturation_idx` (`adresseFacturation` ASC) ,
  INDEX `fkIdEtatCommande_idx` (`idEtatCommande` ASC) ,
  CONSTRAINT `fkIdClientCommande`
    FOREIGN KEY (`idClient` )
    REFERENCES `iCommerce`.`Client` (`idClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdTypeLivraisonCommande`
    FOREIGN KEY (`idTypeLivraison` )
    REFERENCES `iCommerce`.`TypeLivraison` (`idTypeLivraison` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdAdresseLivraisonCommande`
    FOREIGN KEY (`adresseLivraison` )
    REFERENCES `iCommerce`.`AdresseClient` (`idAdresseClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdAdresseFacturationCommande`
    FOREIGN KEY (`adresseFacturation` )
    REFERENCES `iCommerce`.`AdresseClient` (`idAdresseClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdEtatCommandeCommande`
    FOREIGN KEY (`idEtatCommande` )
    REFERENCES `iCommerce`.`EtatCommande` (`idEtatCommande` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`ArticleCommande`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`ArticleCommande` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`ArticleCommande` (
  `idArticleCommande` INT NOT NULL AUTO_INCREMENT ,
  `idCommande` INT NOT NULL ,
  `idArticle` INT NOT NULL ,
  `prixHT` DECIMAL(10,2) NOT NULL ,
  `tauxTVA` DECIMAL(4,2) NOT NULL ,
  `quantite` INT NOT NULL ,
  PRIMARY KEY (`idArticleCommande`) ,
  INDEX `fkIdArticle_idx` (`idArticle` ASC) ,
  CONSTRAINT `fkIdArticleArtCom`
    FOREIGN KEY (`idArticle` )
    REFERENCES `iCommerce`.`Article` (`idArticle` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdCommandeArtCom`
    FOREIGN KEY (`idCommande` )
    REFERENCES `iCommerce`.`Commande` (`idCommande` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`AutreAdresse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`AutreAdresse` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`AutreAdresse` (
  `idAutreAdresse` INT NOT NULL ,
  `idAdresseClient` INT NOT NULL ,
  `idClient` INT NOT NULL ,
  PRIMARY KEY (`idAutreAdresse`) ,
  INDEX `fkIdAdresseClient_idx` (`idAdresseClient` ASC) ,
  INDEX `fkIdClient_idx` (`idClient` ASC) ,
  CONSTRAINT `fkIdAdresseClientAutreAdresse`
    FOREIGN KEY (`idAdresseClient` )
    REFERENCES `iCommerce`.`AdresseClient` (`idAdresseClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdClientAutreAdresse`
    FOREIGN KEY (`idClient` )
    REFERENCES `iCommerce`.`Client` (`idClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iCommerce`.`ListeSouhait`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iCommerce`.`ListeSouhait` ;

CREATE  TABLE IF NOT EXISTS `iCommerce`.`ListeSouhait` (
  `idListeSouhait` INT NOT NULL ,
  `idArticle` INT NOT NULL ,
  `idClient` INT NOT NULL ,
  PRIMARY KEY (`idListeSouhait`) ,
  INDEX `fkIdArticle_idx` (`idArticle` ASC) ,
  INDEX `fkIdClient_idx` (`idClient` ASC) ,
  CONSTRAINT `fkIdArticleSouhait`
    FOREIGN KEY (`idArticle` )
    REFERENCES `iCommerce`.`Article` (`idArticle` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fkIdClientSouhait`
    FOREIGN KEY (`idClient` )
    REFERENCES `iCommerce`.`Client` (`idClient` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `iCommerce` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
