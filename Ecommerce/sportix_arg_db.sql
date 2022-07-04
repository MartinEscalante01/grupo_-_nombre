-- MySQL Script generated by MySQL Workbench
-- Sun Jul  3 21:21:59 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sportix_arg
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sportix_arg` ;

-- -----------------------------------------------------
-- Schema sportix_arg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sportix_arg` DEFAULT CHARACTER SET utf8mb4 ;
USE `sportix_arg` ;

-- -----------------------------------------------------
-- Table `sportix_arg`.`brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`brand` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`brand` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`category` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`country` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`country` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`gender` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`gender` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`sizes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`sizes` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`sizes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sizes` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`productos` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`productos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `category` INT(11) NOT NULL,
  `size` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  `price` INT(11) NOT NULL,
  `gender` INT(11) NOT NULL,
  `brand` INT(11) NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_P_G` (`gender` ASC) VISIBLE,
  INDEX `FK_P_B` (`brand` ASC) VISIBLE,
  INDEX `FK_P_S` (`size` ASC) VISIBLE,
  CONSTRAINT `FK_P_B`
    FOREIGN KEY (`brand`)
    REFERENCES `sportix_arg`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_P_G`
    FOREIGN KEY (`gender`)
    REFERENCES `sportix_arg`.`gender` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_P_S`
    FOREIGN KEY (`size`)
    REFERENCES `sportix_arg`.`sizes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`states`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`states` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`states` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `gender` INT(11) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `phone` INT(11) NOT NULL,
  `country` INT(11) NOT NULL,
  `state` INT(11) NOT NULL,
  `newsletter` VARCHAR(3) NOT NULL,
  `file` VARCHAR(100) NOT NULL,
  `roles` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_U_S` (`state` ASC) VISIBLE,
  INDEX `FK_U_G` (`gender` ASC) VISIBLE,
  CONSTRAINT `FK_U_G`
    FOREIGN KEY (`gender`)
    REFERENCES `sportix_arg`.`gender` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_U_S`
    FOREIGN KEY (`state`)
    REFERENCES `sportix_arg`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`detalle_de_orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`detalle_de_orden` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`detalle_de_orden` (
  `id_usuarios` INT(11) NOT NULL,
  `id_productos` INT(11) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `date` DATETIME NOT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuarios`, `id_productos`, `date`),
  INDEX `FK_ORD_P` (`id_productos` ASC) VISIBLE,
  CONSTRAINT `FK_ORD_P`
    FOREIGN KEY (`id_productos`)
    REFERENCES `sportix_arg`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ORD_USUARIO`
    FOREIGN KEY (`id_usuarios`)
    REFERENCES `sportix_arg`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`order` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`order` (
  `id` INT(11) NOT NULL,
  `iduser` INT(11) NOT NULL,
  `total` DECIMAL(10,0) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_O_user` (`iduser` ASC) VISIBLE,
  CONSTRAINT `FK_O_user`
    FOREIGN KEY (`iduser`)
    REFERENCES `sportix_arg`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sportix_arg`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sportix_arg`.`roles` ;

CREATE TABLE IF NOT EXISTS `sportix_arg`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
