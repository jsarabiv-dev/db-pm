-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PYME_MARKETS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PYME_MARKETS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PYME_MARKETS` DEFAULT CHARACTER SET utf8 ;
USE `PYME_MARKETS` ;

-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Category_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Category_Product` (
  `CatProd_Id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CatProd_SubCat_Id` SMALLINT UNSIGNED NULL,
  `CatProd_Name` VARCHAR(45) NULL,
  `CatProd_Icon_Url` VARCHAR(45) NULL,
  `CatProd_Search_Url` VARCHAR(45) NULL,
  PRIMARY KEY (`CatProd_Id`),
  UNIQUE INDEX `CatProd_Id_UNIQUE` (`CatProd_Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Product` (
  `Product_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_PymeProf_Id` INT UNSIGNED NOT NULL,
  `Product_CatProd_Id` SMALLINT UNSIGNED NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Product_Description` VARCHAR(100) NULL,
  `Product_Img_Url` VARCHAR(45) NULL,
  `Product_Search_Url` VARCHAR(45) NULL,
  `Product_Unit_Price` DECIMAL(10,2) UNSIGNED NOT NULL,
  `Product_Offer` TINYINT NOT NULL DEFAULT 0,
  `Product_Date_Created` DATE NULL,
  `Product_Last_Update` DATE NULL,
  PRIMARY KEY (`Product_Id`),
  INDEX `FK_Product_CatProd_idx` (`Product_CatProd_Id` ASC) VISIBLE,
  CONSTRAINT `FK_Product_CatProd`
    FOREIGN KEY (`Product_CatProd_Id`)
    REFERENCES `PYME_MARKETS`.`Category_Product` (`CatProd_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Product_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Product_Details` (
  `ProdDet_Id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProdDet_Prod_Id` BIGINT UNSIGNED NOT NULL,
  `ProdDet_Description` VARCHAR(200) NULL,
  `ProdDet_Stock` MEDIUMINT NOT NULL DEFAULT 0,
  `ProdDet_Total_Sold` MEDIUMINT NOT NULL DEFAULT 0,
  `ProdDet_Status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Status\n1 = Habilitado\n2 = Deshabilitado\n3 = Suspendido\n4 = NO Stock\n',
  `ProdDet_Galery_Url` VARCHAR(45) NULL,
  PRIMARY KEY (`ProdDet_Id`),
  INDEX `FK_ProdDet_Product_idx` (`ProdDet_Prod_Id` ASC) VISIBLE,
  CONSTRAINT `FK_ProdDet_Product`
    FOREIGN KEY (`ProdDet_Prod_Id`)
    REFERENCES `PYME_MARKETS`.`Product` (`Product_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Pyme_Profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Pyme_Profile` (
  `PymeProf_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PymeProf_Name` VARCHAR(45) NOT NULL,
  `PymeProf_Tags` VARCHAR(45) NULL,
  `PymeProf_Icon_Url` VARCHAR(45) GENERATED ALWAYS AS () VIRTUAL,
  `PymeProf_Img_Url` VARCHAR(45) NULL,
  `PymeProf_Search_Url` VARCHAR(45) NULL,
  PRIMARY KEY (`PymeProf_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Public_User_Profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Public_User_Profile` (
  `PUP_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PUP_Name` VARCHAR(45) NULL,
  `PUP_Last_Name` VARCHAR(45) NULL,
  `PUP_NIF` VARCHAR(45) NULL DEFAULT 0,
  `PUP_Country` VARCHAR(45) NULL,
  `PUP_Email` VARCHAR(45) NULL,
  PRIMARY KEY (`PUP_Id`),
  UNIQUE INDEX `PUP_NIF_UNIQUE` (`PUP_NIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Admin_User_Profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Admin_User_Profile` (
  `AUP_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `AUP_Name` VARCHAR(45) NULL,
  `AUP_Last_Name` VARCHAR(45) NULL,
  `AUP_NIF` VARCHAR(45) NULL DEFAULT 0,
  `AUP_Country` VARCHAR(45) NULL,
  `AUP_Email` VARCHAR(45) NULL,
  PRIMARY KEY (`AUP_Id`),
  UNIQUE INDEX `PUP_NIF_UNIQUE` (`AUP_NIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Users_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Users_Account` (
  `UsrAcc_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `UsrAcc_Profile_Id` BIGINT UNSIGNED NOT NULL,
  `UsrAcc_Status` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `UsrAcc_Privileges_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`UsrAcc_Id`),
  INDEX `FK_UserAccount_PUP_idx` (`UsrAcc_Profile_Id` ASC) VISIBLE,
  CONSTRAINT `FK_UserAccount_PUP`
    FOREIGN KEY (`UsrAcc_Profile_Id`)
    REFERENCES `PYME_MARKETS`.`Public_User_Profile` (`PUP_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserAccount_PymeProf`
    FOREIGN KEY (`UsrAcc_Profile_Id`)
    REFERENCES `PYME_MARKETS`.`Pyme_Profile` (`PymeProf_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserAccount_AUP`
    FOREIGN KEY (`UsrAcc_Profile_Id`)
    REFERENCES `PYME_MARKETS`.`Admin_User_Profile` (`AUP_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Payment_User_Config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Payment_User_Config` (
  `PUC_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PUC_UsrAcc_Id` BIGINT UNSIGNED NOT NULL,
  `PUC_Card_Type` VARCHAR(45) NULL,
  `PUC_Number_Config` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`PUC_Id`),
  INDEX `FK_PUC_UserAccount_idx` (`PUC_UsrAcc_Id` ASC) VISIBLE,
  CONSTRAINT `FK_PUC_UserAccount`
    FOREIGN KEY (`PUC_UsrAcc_Id`)
    REFERENCES `PYME_MARKETS`.`Users_Account` (`UsrAcc_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Shipping_User_Config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Shipping_User_Config` (
  `SUC_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SUC_UsrAcc_Id` BIGINT UNSIGNED NOT NULL,
  `SUC_Number_Config` TINYINT UNSIGNED NOT NULL,
  `SUC_Country_Code` VARCHAR(2) NOT NULL,
  `SUC_City_id` INT(11) NOT NULL,
  `SUC_Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SUC_Id`),
  INDEX `FK_SUC_UserAccount_idx` (`SUC_UsrAcc_Id` ASC) VISIBLE,
  CONSTRAINT `FK_SUC_UserAccount`
    FOREIGN KEY (`SUC_UsrAcc_Id`)
    REFERENCES `PYME_MARKETS`.`Users_Account` (`UsrAcc_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Shopping_Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Shopping_Cart` (
  `ShopCart_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ShopCart_UsrAcc_Id` BIGINT UNSIGNED NOT NULL,
  `ShopCart_Products` JSON NOT NULL,
  PRIMARY KEY (`ShopCart_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PYME_MARKETS`.`Sales_Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PYME_MARKETS`.`Sales_Invoice` (
  `SalInv_Id` INT NOT NULL,
  `SalInv_UsrAcc_Id` BIGINT UNSIGNED NOT NULL,
  `SalInv_Products` JSON NOT NULL,
  `SalInv_Transaction_State` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `SalInv_State` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`SalInv_Id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
