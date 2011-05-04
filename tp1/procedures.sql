CREATE PROCEDURE `mydb`.`prodMasMC`()
BEGIN
SELECT  p.nombre
	FROM
	producto p,
	(SELECT idproducto, count(*) as cantidad
		FROM
		((SELECT idproducto,idmedida FROM `medida-producto`) UNION ALL (SELECT idproducto,idmedida FROM `extranjero_pais-medpp`)) a, medida c
			WHERE  a.idmedida = c.idmedida AND CURRENT_TIMESTAMP between c.desde and c.hasta
			GROUP BY idproducto) b,
	(SELECT MAX(cantidad) maximo FROM 
		(SELECT idproducto, count(*) as cantidad
			FROM
			((SELECT idproducto,idmedida FROM `medida-producto`) UNION ALL (SELECT idproducto,idmedida FROM `extranjero_pais-medpp`)) a, medida c
				WHERE  a.idmedida = c.idmedida AND CURRENT_TIMESTAMP between c.desde and c.hasta
				GROUP BY idproducto) b) n
		WHERE p.idproducto = b.idproducto and n.maximo=b.cantidad;
END

CREATE PROCEDURE  `mydb`.`prodTodasMC`()
BEGIN
		SELECT  p.nombre FROM
			producto p,
			(  SELECT DISTINCT idproducto, idtipo 
				FROM
					((SELECT idproducto,idmedida FROM `medida-producto`) UNION ALL (SELECT idproducto,idmedida FROM `extranjero_pais-medpp`)) a, medida c 
					  WHERE  a.idmedida = c.idmedida AND CURRENT_TIMESTAMP between c.desde and c.hasta
			)  b
		WHERE p.idproducto = b.idproducto
		GROUP BY b.idproducto
		HAVING COUNT(*) = (select COUNT(idtipo) from tipo);
END
