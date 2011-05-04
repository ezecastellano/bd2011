DROP TABLE IF EXISTS `mydb`.`auditoria`;

CREATE TABLE `mydb`.`auditoria`
(
   id int NOT NULL AUTO_INCREMENT,
   idmedida int,
   descripcion varchar(50),
   valor_anterior varchar(50),
   valor_nuevo varchar(50),
   usuario varchar(40),
   modificado datetime,
   PRIMARY KEY(id)
) ENGINE = InnoDB;

delimiter $$

DROP TRIGGER IF EXISTS medidaUpdate$$
CREATE TRIGGER medidaUpdate after UPDATE ON medida
   FOR each row
    BEGIN
         INSERT INTO auditoria (idmedida, descripcion, valor_anterior , valor_nuevo, usuario  , modificado ) VALUES(OLD.idmedida,'UPDATED' , OLD.idnorma , NEW.idnorma, CURRENT_USER(), NOW() );
    END;$$

DROP TRIGGER IF EXISTS medidaDelete$$
CREATE TRIGGER medidaDelete after DELETE ON medida
   FOR each row
    BEGIN
         INSERT INTO auditoria (idmedida, descripcion, valor_anterior ,  usuario  , modificado ) VALUES(OLD.idmedida,'DELETED' ,OLD.idnorma ,  CURRENT_USER(), NOW() );
    END;$$

DROP TRIGGER IF EXISTS medidaInsert$$
CREATE TRIGGER medidaInsert after INSERT ON medida
   FOR each row
    BEGIN
      INSERT INTO auditoria (idmedida, descripcion, valor_nuevo, usuario  , modificado ) VALUES (NEW.idmedida,'INSERTED',  NEW.idnorma, CURRENT_USER(), NOW() );
    END;$$
