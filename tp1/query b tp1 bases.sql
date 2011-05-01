CREATE PROCEDURE `mydb`.`prodTodasMC` ()
BEGIN
		SELECT  p.nombre
		FROM
			producto p,
			(
				SELECT DISTINCT idproducto, idtipo 
				FROM 
					((SELECT idproducto,idmedida FROM `medida-producto`) UNION ALL (SELECT idproducto,idmedida FROM `extranjero_pais-medpp`)) a, medida c 
					  WHERE  a.idmedida = c.idmedida AND c.enVigencia="1"
			)  b
		WHERE p.idproducto = b.idproducto
		GROUP BY b.idproducto
		HAVING COUNT(*) = (select COUNT(idtipo) from tipo);

END


