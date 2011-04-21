SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`rubro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`rubro` (
  `idrubro` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idrubro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `umedida` VARCHAR(45) NULL ,
  `tipo` ENUM('N','E') NOT NULL ,
  `rubro_idrubro` INT NOT NULL ,
  PRIMARY KEY (`idproducto`) ,
  INDEX `fk_producto_rubro` (`rubro_idrubro` ASC) ,
  CONSTRAINT `fk_producto_rubro`
    FOREIGN KEY (`rubro_idrubro` )
    REFERENCES `mydb`.`rubro` (`idrubro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto_nacional`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`producto_nacional` (
  `idproducto` INT NOT NULL ,
  `cantpuestos` FLOAT NULL ,
  PRIMARY KEY (`idproducto`) ,
  INDEX `fk_producto nacional_1` (`idproducto` ASC) ,
  CONSTRAINT `fk_producto nacional_1`
    FOREIGN KEY (`idproducto` )
    REFERENCES `mydb`.`producto` (`idproducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto_extranjero`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`producto_extranjero` (
  `productid` INT NOT NULL ,
  PRIMARY KEY (`productid`) ,
  INDEX `fk_producto_extranjero_1` (`productid` ASC) ,
  CONSTRAINT `fk_producto_extranjero_1`
    FOREIGN KEY (`productid` )
    REFERENCES `mydb`.`producto` (`idproducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`norma`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`norma` (
  `idnorma` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idnorma`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`usuario` (
  `nombreusuario` CHAR(30) NOT NULL ,
  PRIMARY KEY (`nombreusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`organismo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`organismo` (
  `idorganismo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idorganismo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tipo` (
  `idtipo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `idorganismo` INT NULL ,
  PRIMARY KEY (`idtipo`) ,
  INDEX `fk_tipo_1` (`idorganismo` ASC) ,
  CONSTRAINT `fk_tipo_1`
    FOREIGN KEY (`idorganismo` )
    REFERENCES `mydb`.`organismo` (`idorganismo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medida`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`medida` (
  `idmedida` INT NOT NULL ,
  `idnorma` INT NULL ,
  `idtipo` INT NULL ,
  `tipo` ENUM('P','PP') NULL ,
  PRIMARY KEY (`idmedida`) ,
  INDEX `fk_medida_1` (`idnorma` ASC) ,
  INDEX `fk_medida_2` (`idtipo` ASC) ,
  CONSTRAINT `fk_medida_1`
    FOREIGN KEY (`idnorma` )
    REFERENCES `mydb`.`norma` (`idnorma` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medida_2`
    FOREIGN KEY (`idtipo` )
    REFERENCES `mydb`.`tipo` (`idtipo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`auditoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`auditoria` (
  `idauditoria` INT NOT NULL AUTO_INCREMENT ,
  `modificacion` TEXT NULL ,
  `nombreusuario` CHAR(30) NULL ,
  `idmedida` INT NULL ,
  PRIMARY KEY (`idauditoria`) ,
  INDEX `fk_auditoria_1` (`nombreusuario` ASC) ,
  INDEX `fk_auditoria_2` (`idmedida` ASC) ,
  CONSTRAINT `fk_auditoria_1`
    FOREIGN KEY (`nombreusuario` )
    REFERENCES `mydb`.`usuario` (`nombreusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auditoria_2`
    FOREIGN KEY (`idmedida` )
    REFERENCES `mydb`.`medida` (`idmedida` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medida_por_producto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`medida_por_producto` (
  `idmedida` INT NOT NULL ,
  PRIMARY KEY (`idmedida`) ,
  INDEX `fk_medida_por_producto_1` (`idmedida` ASC) ,
  CONSTRAINT `fk_medida_por_producto_1`
    FOREIGN KEY (`idmedida` )
    REFERENCES `mydb`.`medida` (`idmedida` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medida_producto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`medida_producto` (
  `idproducto` INT NOT NULL ,
  `idmedida` INT NOT NULL ,
  PRIMARY KEY (`idproducto`, `idmedida`) ,
  INDEX `fk_medida_producto_1` (`idproducto` ASC) ,
  INDEX `fk_medida_producto_2` () ,
  CONSTRAINT `fk_medida_producto_1`
    FOREIGN KEY (`idproducto` )
    REFERENCES `mydb`.`producto` (`idproducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medida_producto_2`
    FOREIGN KEY ()
    REFERENCES `mydb`.`medida_por_producto` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medida_por_prod_pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`medida_por_prod_pais` (
  `idmedida` INT NOT NULL ,
  PRIMARY KEY (`idmedida`) ,
  INDEX `fk_medida_por_prod_pais_1` (`idmedida` ASC) ,
  CONSTRAINT `fk_medida_por_prod_pais_1`
    FOREIGN KEY (`idmedida` )
    REFERENCES `mydb`.`medida` (`idmedida` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`pais` (
  `idpais` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idpais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ext_pais_medpp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ext_pais_medpp` (
  `idproducto` INT NOT NULL ,
  `idmedida` INT NOT NULL ,
  `idpais` INT NOT NULL ,
  PRIMARY KEY (`idproducto`, `idmedida`, `idpais`) ,
  INDEX `fk_ext_pais_medpp_1` () ,
  INDEX `fk_ext_pais_medpp_2` () ,
  INDEX `fk_ext_pais_medpp_3` (`idpais` ASC) ,
  CONSTRAINT `fk_ext_pais_medpp_1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`producto_extranjero` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ext_pais_medpp_2`
    FOREIGN KEY ()
    REFERENCES `mydb`.`medida_por_prod_pais` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ext_pais_medpp_3`
    FOREIGN KEY (`idpais` )
    REFERENCES `mydb`.`pais` (`idpais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`provincia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`provincia` (
  `idprovincia` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`idprovincia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`localidad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`localidad` (
  `idlocalidad` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `idprovincia` INT NULL ,
  PRIMARY KEY (`idlocalidad`) ,
  INDEX `fk_localidad_1` (`idprovincia` ASC) ,
  CONSTRAINT `fk_localidad_1`
    FOREIGN KEY (`idprovincia` )
    REFERENCES `mydb`.`provincia` (`idprovincia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fabrica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`fabrica` (
  `idfabrica` INT NOT NULL ,
  `cantempleados` INT NULL ,
  `idlocalidad` INT NULL ,
  PRIMARY KEY (`idfabrica`) ,
  INDEX `fk_fabrica_1` (`idlocalidad` ASC) ,
  CONSTRAINT `fk_fabrica_1`
    FOREIGN KEY (`idlocalidad` )
    REFERENCES `mydb`.`localidad` (`idlocalidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prod_nacional_fabrica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`prod_nacional_fabrica` (
  `idproducto` INT NOT NULL ,
  `idfabrica` INT NOT NULL ,
  PRIMARY KEY (`idproducto`, `idfabrica`) ,
  INDEX `fk_prod_nacional_fabrica_1` () ,
  INDEX `fk_prod_nacional_fabrica_2` (`idfabrica` ASC) ,
  CONSTRAINT `fk_prod_nacional_fabrica_1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`producto_nacional` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_nacional_fabrica_2`
    FOREIGN KEY (`idfabrica` )
    REFERENCES `mydb`.`fabrica` (`idfabrica` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prod_extranjero_pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`prod_extranjero_pais` (
  `idproducto` INT NOT NULL ,
  `idpais` INT NOT NULL ,
  `cantanual` FLOAT NULL ,
  PRIMARY KEY (`idproducto`, `idpais`) ,
  INDEX `fk_prod_extranjero_pais_1` () ,
  INDEX `fk_prod_extranjero_pais_2` (`idpais` ASC) ,
  CONSTRAINT `fk_prod_extranjero_pais_1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`producto_extranjero` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_extranjero_pais_2`
    FOREIGN KEY (`idpais` )
    REFERENCES `mydb`.`pais` (`idpais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
