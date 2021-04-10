-- -----------------------------------------------------
-- Schema Pro
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `Pro` ;
DROP TABLE Personne, Certificat, Champ;
DROP FUNCTION random_string;

-- -----------------------------------------------------
-- Schema Pro
-- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `Pro` DEFAULT CHARACTER SET utf8 ;
USE `Pro` ;

-- -----------------------------------------------------
-- Table `Pro`.`Personne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pro`.`Personne` (
  `idPersonne` INT NOT NULL AUTO_INCREMENT,
  `prenom` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `npa` VARCHAR(45) NOT NULL,
  `typeCompte` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `motDePasse` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idPersonne`),
  UNIQUE INDEX `UC_Personne_email` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pro`.`Certificat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pro`.`Certificat` (
  `idCertificat` CHAR(10) NOT NULL,
  `idPersonnePersonne` INT NOT NULL,
  `dateSignature` DATE NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCertificat`),
  INDEX `IDX_FK_Certificat_Personne` (`idPersonnePersonne` ASC),
  INDEX `IDX_Certificat_id` (`id` ASC),
  CONSTRAINT `FK_Personne_Certificat`
    FOREIGN KEY (`idPersonnePersonne`)
    REFERENCES `Pro`.`Personne` (`idPersonne`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pro`.`Champ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pro`.`Champ` (
  `idCertificatCertificat` CHAR(10) NOT NULL,
  `nom` VARCHAR(256) NOT NULL,
  `valeur` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idCertificatCertificat`, `nom`),
  CONSTRAINT `FK_Certificat_Champ`
    FOREIGN KEY (`idCertificatCertificat`)
    REFERENCES `Pro`.`Certificat` (`idCertificat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `Pro` ;

-- -----------------------------------------------------
-- function random_string
-- -----------------------------------------------------

DELIMITER $$
USE `Pro`$$
CREATE FUNCTION `random_string`(length SMALLINT(3), seed VARCHAR(255)) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
    SET @output = '';

    IF seed IS NULL OR seed = '' THEN SET seed = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; END IF;

    SET @rnd_multiplier = LENGTH(seed);

    WHILE LENGTH(@output) < length DO
        # Select random character and add to output
        SET @output = CONCAT(@output, SUBSTRING(seed, RAND() * (@rnd_multiplier + 1), 1));
    END WHILE;

    RETURN @output;
END$$


DELIMITER ;
USE `Pro`;

DELIMITER $$
USE `Pro`$$
CREATE TRIGGER `Pro`.`Certificat_BEFORE_INSERT` BEFORE INSERT ON `Certificat` FOR EACH ROW
BEGIN
	SET @exists = 1;
    SET @id = 0;
	WHILE (@exists <> 0) DO
		SET @id = (SELECT random_string(10, ''));
		SELECT COUNT(*) INTO @exists FROM Certificat WHERE idCertificat = @id;
	END WHILE;
    
	SET NEW.idCertificat = @id;
END$$


DELIMITER ;