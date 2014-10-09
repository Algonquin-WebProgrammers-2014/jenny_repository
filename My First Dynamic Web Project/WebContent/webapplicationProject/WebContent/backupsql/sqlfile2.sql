SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `storedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `storedb` ;

-- -----------------------------------------------------
-- Table `storedb`.`toppingpizza`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`toppingpizza` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `size` INT NULL ,
  `price` DOUBLE NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `storedb`.`specialpizza`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`specialpizza` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `size` INT NULL ,
  `price` DOUBLE NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `storedb`.`customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`customer` (
  `idcustomer` INT NOT NULL ,
  `firstname` VARCHAR(45) NULL ,
  `lastname` VARCHAR(45) NULL ,
  `address` VARCHAR(60) NULL ,
  `phonenumber` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcustomer`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `storedb`.`order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`order` (
  `idorder` VARCHAR(20) NOT NULL ,
  `price` DOUBLE NULL ,
  `orderdate` DATETIME NULL ,
  `status` INT NULL ,
  `customer_idcustomer` INT NOT NULL ,
  PRIMARY KEY (`idorder`) ,
  INDEX `fk_order_customer_idx` (`customer_idcustomer` ASC) ,
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`customer_idcustomer` )
    REFERENCES `storedb`.`customer` (`idcustomer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `storedb`.`orderdetail`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`orderdetail` (
  `idpizzaorder` INT NOT NULL ,
  `specialpizzaorder` VARCHAR(100) NULL ,
  `toppingpizzaorder` VARCHAR(100) NULL ,
  `order_idorder` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idpizzaorder`) ,
  INDEX `fk_pizzaorder_order1_idx` (`order_idorder` ASC) ,
  CONSTRAINT `fk_pizzaorder_order1`
    FOREIGN KEY (`order_idorder` )
    REFERENCES `storedb`.`order` (`idorder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `storedb`.`store`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`store` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `storeid` VARCHAR(45) NULL ,
  `password` VARCHAR(130) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `storedb`.`admin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `storedb`.`admin` (
  `id` INT NOT NULL ,
  `username` VARCHAR(45) NULL ,
  `password` VARCHAR(130) NULL ,
  `firstname` VARCHAR(45) NULL ,
  `lastname` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

USE `storedb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
