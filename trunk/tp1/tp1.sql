-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mydb
--

CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;
CREATE TABLE  `mydb`.`auditoria` (
  `idauditoria` int(11) NOT NULL AUTO_INCREMENT,
  `modificacion` text,
  `nombreusuario` char(30) DEFAULT NULL,
  `idmedida` int(11) DEFAULT NULL,
  PRIMARY KEY (`idauditoria`),
  KEY `fk_auditoria_1` (`nombreusuario`),
  KEY `fk_auditoria_2` (`idmedida`),
  CONSTRAINT `fk_auditoria_1` FOREIGN KEY (`nombreusuario`) REFERENCES `usuario` (`nombreusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_auditoria_2` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`extranjero_pais-medpp` (
  `idproducto` int(11) NOT NULL,
  `idmedida` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`idmedida`,`idpais`),
  KEY `fk_ext_pais_medpp_1` (`idproducto`),
  KEY `fk_ext_pais_medpp_2` (`idmedida`),
  KEY `fk_ext_pais_medpp_3` (`idpais`),
  CONSTRAINT `fk_ext_pais_medpp_1` FOREIGN KEY (`idproducto`) REFERENCES `producto_extranjero` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ext_pais_medpp_2` FOREIGN KEY (`idmedida`) REFERENCES `medida_por_prod_pais` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ext_pais_medpp_3` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`fabrica` (
  `idfabrica` int(11) NOT NULL,
  `cantempleados` int(11) DEFAULT NULL,
  `idlocalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfabrica`),
  KEY `fk_fabrica_1` (`idlocalidad`),
  CONSTRAINT `fk_fabrica_1` FOREIGN KEY (`idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`localidad` (
  `idlocalidad` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlocalidad`),
  KEY `fk_localidad_1` (`idprovincia`),
  CONSTRAINT `fk_localidad_1` FOREIGN KEY (`idprovincia`) REFERENCES `provincia` (`idprovincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`medida` (
  `idmedida` int(11) NOT NULL,
  `idnorma` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `tipo` enum('P','PP') DEFAULT NULL,
  PRIMARY KEY (`idmedida`),
  KEY `fk_medida_1` (`idnorma`),
  KEY `fk_medida_2` (`idtipo`),
  CONSTRAINT `fk_medida_1` FOREIGN KEY (`idnorma`) REFERENCES `norma` (`idnorma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medida_2` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`medida-producto` (
  `idproducto` int(11) NOT NULL,
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`idmedida`),
  KEY `fk_medida_producto_1` (`idproducto`),
  KEY `fk_medida_producto_2` (`idmedida`),
  CONSTRAINT `fk_medida_producto_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medida_producto_2` FOREIGN KEY (`idmedida`) REFERENCES `medida_por_producto` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`medida_por_prod_pais` (
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idmedida`),
  KEY `fk_medida_por_prod_pais_1` (`idmedida`),
  CONSTRAINT `fk_medida_por_prod_pais_1` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`medida_por_producto` (
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idmedida`),
  KEY `fk_medida_por_producto_1` (`idmedida`),
  CONSTRAINT `fk_medida_por_producto_1` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`norma` (
  `idnorma` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idnorma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`organismo` (
  `idorganismo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorganismo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`pais` (
  `idpais` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`prod_extranjero-pais` (
  `idproducto` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  `cantanual` float DEFAULT NULL,
  PRIMARY KEY (`idproducto`,`idpais`),
  KEY `fk_prod_extranjero_pais_1` (`idproducto`),
  KEY `fk_prod_extranjero_pais_2` (`idpais`),
  CONSTRAINT `fk_prod_extranjero_pais_1` FOREIGN KEY (`idproducto`) REFERENCES `producto_extranjero` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_extranjero_pais_2` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`prod_nacional_fabrica` (
  `idproducto` int(11) NOT NULL,
  `idfabrica` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`idfabrica`),
  KEY `fk_prod_nacional_fabrica_1` (`idproducto`),
  KEY `fk_prod_nacional_fabrica_2` (`idfabrica`),
  CONSTRAINT `fk_prod_nacional_fabrica_1` FOREIGN KEY (`idproducto`) REFERENCES `producto_nacional` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_nacional_fabrica_2` FOREIGN KEY (`idfabrica`) REFERENCES `fabrica` (`idfabrica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `umedida` varchar(45) DEFAULT NULL,
  `tipo` enum('N','E') NOT NULL,
  `rubro_idrubro` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto_rubro` (`rubro_idrubro`),
  CONSTRAINT `fk_producto_rubro` FOREIGN KEY (`rubro_idrubro`) REFERENCES `rubro` (`idrubro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`producto_extranjero` (
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `fk_producto_extranjero_1` (`productid`),
  CONSTRAINT `fk_producto_extranjero_1` FOREIGN KEY (`productid`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`producto_nacional` (
  `idproducto` int(11) NOT NULL,
  `cantpuestos` float DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto nacional_1` (`idproducto`),
  CONSTRAINT `fk_producto nacional_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`provincia` (
  `idprovincia` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprovincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`rubro` (
  `idrubro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrubro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`tipo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idorganismo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtipo`),
  KEY `fk_tipo_1` (`idorganismo`),
  CONSTRAINT `fk_tipo_1` FOREIGN KEY (`idorganismo`) REFERENCES `organismo` (`idorganismo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE  `mydb`.`usuario` (
  `nombreusuario` char(30) NOT NULL,
  PRIMARY KEY (`nombreusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
