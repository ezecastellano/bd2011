-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4


--
-- Definition of procedure `mydb`.`medidasPorRubro`
--

DROP PROCEDURE IF EXISTS `mydb`.`medidasPorRubro`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE  `mydb`.`medidasPorRubro`()
BEGIN

	SELECT r.idrubro, r.nombre, medidasxrubro.cant_medidas
	FROM rubro r
	LEFT JOIN (
				SELECT p.rubro_idrubro, count(*) cant_medidas
				FROM producto p
				JOIN `medida-producto` m
				ON m.idproducto = p.idproducto
				GROUP BY p.rubro_idrubro
	) AS medidasxrubro
	ON r.idrubro = medidasxrubro.rubro_idrubro;
	
END $$

DELIMITER ;

