-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema taktak
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema taktak
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taktak` DEFAULT CHARACTER SET utf8 ;
USE `taktak` ;

-- -----------------------------------------------------
-- Table `taktak`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Client` (
  ` nom_prenom` VARCHAR(20) NOT NULL,
  `tel` INT(8) NOT NULL,
  `adresse` VARCHAR(20) NOT NULL,
  `emailClient` VARCHAR(45) NOT NULL,
  `pwdClient` VARCHAR(45) NULL,
  PRIMARY KEY (`emailClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Administrateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Administrateur` (
  `emailAdmin` VARCHAR(255) NOT NULL,
  `pwdAdmin` VARCHAR(45) NULL,
  PRIMARY KEY (`emailAdmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Avancement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Avancement` (
  `degreAvancement` INT(1) NOT NULL,
  PRIMARY KEY (`degreAvancement`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Livreur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Livreur` (
  `Matricule` INT(10) NOT NULL,
  `nom_prenomL` VARCHAR(20) NOT NULL,
  `telL` INT(8) NULL,
  `adresseL` VARCHAR(20) NULL,
  `secteur` VARCHAR(10) NULL,
  `conge` INT(3) NULL,
  `Avancement_degreAvancement` INT(1) NOT NULL,
  `emailLivreur` VARCHAR(45) NULL,
  `pwdLiv` VARCHAR(45) NULL,
  PRIMARY KEY (`Matricule`),
  INDEX `fk_Livreur_Avancement1_idx` (`Avancement_degreAvancement` ASC) VISIBLE,
  CONSTRAINT `fk_Livreur_Avancement1`
    FOREIGN KEY (`Avancement_degreAvancement`)
    REFERENCES `taktak`.`Avancement` (`degreAvancement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Publication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Publication` (
  `idPub` VARCHAR(10) NOT NULL,
  `intitulePub` VARCHAR(30) NULL,
  `datePub` DATE NOT NULL,
  `Client_emailClient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPub`),
  INDEX `fk_Publication_Client1_idx` (`Client_emailClient` ASC) VISIBLE,
  CONSTRAINT `fk_Publication_Client1`
    FOREIGN KEY (`Client_emailClient`)
    REFERENCES `taktak`.`Client` (`emailClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Colis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Colis` (
  `numColis` INT(10) NOT NULL,
  `libelleColis` VARCHAR(10) NULL,
  `poids` INT NOT NULL,
  `etat` VARCHAR(15) NULL,
  `prixColis` FLOAT NULL,
  `fraisLivraison` FLOAT NULL,
  `Publication_idPub` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`numColis`),
  INDEX `fk_Colis_Publication1_idx` (`Publication_idPub` ASC) VISIBLE,
  CONSTRAINT `fk_Colis_Publication1`
    FOREIGN KEY (`Publication_idPub`)
    REFERENCES `taktak`.`Publication` (`idPub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Facture` (
  `idFacture` INT(10) NOT NULL,
  `dateFacture` DATE NULL,
  `montantFacture` FLOAT NOT NULL,
  `Colis_numColis` INT(10) NOT NULL,
  INDEX `fk_Facture_Colis1_idx` (`Colis_numColis` ASC) VISIBLE,
  CONSTRAINT `fk_Facture_Colis1`
    FOREIGN KEY (`Colis_numColis`)
    REFERENCES `taktak`.`Colis` (`numColis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Vehicule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Vehicule` (
  `matriculeV` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`matriculeV`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Tournee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Tournee` (
  `numTournee` INT(10) NOT NULL,
  `Livreur_Matricule` INT(10) NOT NULL,
  `Avancement_degreAvancement` INT(1) NOT NULL,
  `Vehicule_matriculeV` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`numTournee`),
  INDEX `fk_Tournee_Livreur1_idx` (`Livreur_Matricule` ASC) VISIBLE,
  INDEX `fk_Tournee_Avancement1_idx` (`Avancement_degreAvancement` ASC) VISIBLE,
  INDEX `fk_Tournee_Vehicule1_idx` (`Vehicule_matriculeV` ASC) VISIBLE,
  CONSTRAINT `fk_Tournee_Livreur1`
    FOREIGN KEY (`Livreur_Matricule`)
    REFERENCES `taktak`.`Livreur` (`Matricule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tournee_Avancement1`
    FOREIGN KEY (`Avancement_degreAvancement`)
    REFERENCES `taktak`.`Avancement` (`degreAvancement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tournee_Vehicule1`
    FOREIGN KEY (`Vehicule_matriculeV`)
    REFERENCES `taktak`.`Vehicule` (`matriculeV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`Arret`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`Arret` (
  `numArret` INT(10) NOT NULL,
  `adresse` VARCHAR(20) NOT NULL,
  `Client_emailClient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numArret`),
  INDEX `fk_Arret_Client1_idx` (`Client_emailClient` ASC) VISIBLE,
  CONSTRAINT `fk_Arret_Client1`
    FOREIGN KEY (`Client_emailClient`)
    REFERENCES `taktak`.`Client` (`emailClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`avoir`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`avoir` (
  `Tournee_numTournee` INT(10) NOT NULL,
  `Arret_numArret` INT(10) NOT NULL,
  PRIMARY KEY (`Tournee_numTournee`, `Arret_numArret`),
  INDEX `fk_Tournee_has_Arret_Arret1_idx` (`Arret_numArret` ASC) VISIBLE,
  INDEX `fk_Tournee_has_Arret_Tournee1_idx` (`Tournee_numTournee` ASC) VISIBLE,
  CONSTRAINT `fk_Tournee_has_Arret_Tournee1`
    FOREIGN KEY (`Tournee_numTournee`)
    REFERENCES `taktak`.`Tournee` (`numTournee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tournee_has_Arret_Arret1`
    FOREIGN KEY (`Arret_numArret`)
    REFERENCES `taktak`.`Arret` (`numArret`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`gererC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`gererC` (
  `Administrateur_emailAdmin` VARCHAR(255) NOT NULL,
  `Client_emailClient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Administrateur_emailAdmin`, `Client_emailClient`),
  INDEX `fk_gererC_Client1_idx` (`Client_emailClient` ASC) VISIBLE,
  CONSTRAINT `fk_gererC_Administrateur1`
    FOREIGN KEY (`Administrateur_emailAdmin`)
    REFERENCES `taktak`.`Administrateur` (`emailAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gererC_Client1`
    FOREIGN KEY (`Client_emailClient`)
    REFERENCES `taktak`.`Client` (`emailClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`gererL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`gererL` (
  `Administrateur_emailAdmin` VARCHAR(255) NOT NULL,
  `Livreur_Matricule` INT(10) NOT NULL,
  PRIMARY KEY (`Administrateur_emailAdmin`, `Livreur_Matricule`),
  INDEX `fk_gererL_Livreur1_idx` (`Livreur_Matricule` ASC) VISIBLE,
  CONSTRAINT `fk_gererL_Administrateur1`
    FOREIGN KEY (`Administrateur_emailAdmin`)
    REFERENCES `taktak`.`Administrateur` (`emailAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gererL_Livreur1`
    FOREIGN KEY (`Livreur_Matricule`)
    REFERENCES `taktak`.`Livreur` (`Matricule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taktak`.`planifier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taktak`.`planifier` (
  `Administrateur_emailAdmin` VARCHAR(255) NOT NULL,
  `Tournee_numTournee` INT(10) NOT NULL,
  PRIMARY KEY (`Administrateur_emailAdmin`, `Tournee_numTournee`),
  INDEX `fk_planifier_Tournee1_idx` (`Tournee_numTournee` ASC) VISIBLE,
  CONSTRAINT `fk_planifier_Administrateur1`
    FOREIGN KEY (`Administrateur_emailAdmin`)
    REFERENCES `taktak`.`Administrateur` (`emailAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planifier_Tournee1`
    FOREIGN KEY (`Tournee_numTournee`)
    REFERENCES `taktak`.`Tournee` (`numTournee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
/*hello world*/