SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema HOTEL_BIENVENUE
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `HOTEL_BIENVENUE` ;

-- -----------------------------------------------------
-- Schema HOTEL_BIENVENUE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HOTEL_BIENVENUE` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `HOTEL_BIENVENUE` ;

-- -----------------------------------------------------
-- Table `HOTEL_BIENVENUE`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOTEL_BIENVENUE`.`Admin` (
  `Id_admin` SMALLINT NOT NULL,
  `Password` CHAR(20) BINARY NOT NULL,
  PRIMARY KEY (`Id_admin`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HOTEL_BIENVENUE`.`BOOKING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOTEL_BIENVENUE`.`BOOKING` (
  `Id_booking` SMALLINT UNSIGNED NOT NULL,
  `Night_stay` VARCHAR(3) NOT NULL,
  `Reservation deadline` SMALLINT NULL,
  `Guests` SMALLINT NULL,
  `Status` CHAR(7) NOT NULL,
  `Booking_number` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) BINARY NOT NULL,
  PRIMARY KEY (`Id_booking`),
  INDEX `Id_réservation` (`Id_booking` ASC) VISIBLE,
  CONSTRAINT `Canal`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`PURCHASE CHANNEL` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_client`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`CUSTOMER` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_chambre`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`ROOM` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_admin`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`Admin` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HOTEL_BIENVENUE`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOTEL_BIENVENUE`.`CUSTOMER` (
  `Id_customer` SMALLINT UNSIGNED NOT NULL,
  `Name` CHAR(45) NOT NULL,
  `First_name` CHAR(45) NOT NULL,
  `Phone` CHAR(15) NOT NULL,
  `Email` CHAR(45) NOT NULL,
  PRIMARY KEY (`Id_customer`),
  INDEX `Id_client` (`Id_customer` ASC) VISIBLE,
  CONSTRAINT `Id_admin`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`Admin` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HOTEL_BIENVENUE`.`PURCHASE CHANNEL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOTEL_BIENVENUE`.`PURCHASE CHANNEL` (
  `Canal` CHAR(20) NOT NULL,
  PRIMARY KEY (`Canal`),
  CONSTRAINT `Id_client`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`CUSTOMER` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HOTEL_BIENVENUE`.`ROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOTEL_BIENVENUE`.`ROOM` (
  `Id_room` SMALLINT UNSIGNED NOT NULL,
  `Type` CHAR(15) NULL,
  `Room_number` CHAR(10) NOT NULL,
  `Phone` CHAR(15) NULL,
  `Description` CHAR(100) NULL,
  `Floor` CHAR(3) NOT NULL,
  `Price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`Id_room`),
  INDEX `Id_chambre` (`Id_room` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HOTEL_BIENVENUE`.`SATISFACTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOTEL_BIENVENUE`.`SATISFACTION` (
  `Score` SMALLINT NULL,
  CONSTRAINT `Id_client`
    FOREIGN KEY ()
    REFERENCES `HOTEL_BIENVENUE`.`CUSTOMER` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
