-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.11


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

--
-- Definition of table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
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

--
-- Dumping data for table `auditoria`
--

--
-- Definition of table `extranjero_pais-medpp`
--

DROP TABLE IF EXISTS `extranjero_pais-medpp`;
CREATE TABLE `extranjero_pais-medpp` (
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

--
-- Dumping data for table `extranjero_pais-medpp`
--
INSERT INTO `extranjero_pais-medpp` (`idproducto`,`idmedida`,`idpais`) VALUES 
 (1,2,40),
 (3,4,62),
 (12,5,73),
 (28,9,60),
 (42,12,80),
 (42,14,202),
 (43,5,196),
 (43,15,73),
 (66,9,43),
 (66,12,144),
 (66,14,170),
 (68,2,151),
 (68,4,176),
 (68,15,49),
 (107,2,56),
 (107,4,157),
 (107,14,183),
 (114,5,164),
 (114,15,62),
 (114,15,189),
 (161,2,68),
 (176,4,75),
 (180,2,81),
 (207,4,88),
 (223,12,94);

--
-- Definition of table `fabrica`
--

DROP TABLE IF EXISTS `fabrica`;
CREATE TABLE `fabrica` (
  `idfabrica` int(11) NOT NULL AUTO_INCREMENT,
  `cantempleados` int(11) DEFAULT NULL,
  `idlocalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfabrica`),
  KEY `fk_fabrica_1` (`idlocalidad`),
  CONSTRAINT `fk_fabrica_1` FOREIGN KEY (`idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fabrica`
--
INSERT INTO `fabrica` (`idfabrica`,`cantempleados`,`idlocalidad`) VALUES 
 (1,27,1),
 (2,15,2),
 (3,54,3),
 (4,20,4),
 (5,12,3),
 (6,20,240),
 (7,30,23),
 (8,25,45),
 (9,27,35),
 (10,44,400),
 (11,140,78),
 (12,50,340),
 (13,44,400),
 (14,34,240),
 (15,141,340),
 (16,50,200),
 (17,20,22),
 (18,30,14),
 (19,10,53),
 (20,12,340);

--
-- Definition of table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE `localidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlocalidad`),
  KEY `fk_localidad_1` (`idprovincia`),
  CONSTRAINT `fk_localidad_1` FOREIGN KEY (`idprovincia`) REFERENCES `provincia` (`idprovincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `localidad`
--
INSERT INTO `localidad` (`idlocalidad`,`nombre`,`idprovincia`) VALUES 
 (1,'AZUL',1),
 (2,'PUAN',1),
 (3,'LA MATANZA',1),
 (4,'TIGRE',1),
 (5,'25 DE MAYO',1),
 (6,'TRENQUE LAUQUEN',1),
 (7,'9 DE JULIO',1),
 (8,'LANUS',1),
 (9,'LA PLATA',1),
 (10,'MONTE',1),
 (11,'PEHUAJO',1),
 (12,'SAN ISIDRO',1),
 (13,'PERGAMINO',1),
 (14,'ALBERTI',1),
 (15,'CHASCOMUS',1),
 (16,'ESTEBAN ECHEVERRIA',1),
 (17,'MERCEDES',1),
 (18,'BAHIA BLANCA',1),
 (19,'MERLO',1),
 (20,'JUNIN',1),
 (21,'GUAMINI',1),
 (22,'LUJAN',1),
 (23,'LEANDRO N.ALEM',1),
 (24,'MATANZA',1),
 (25,'GENERAL PAZ',1),
 (26,'SAN VICENTE',1),
 (27,'CAÑUELAS',1),
 (28,'ALMIRANTE BROWN',1),
 (29,'CNL.DE MARINA  L.ROSALES',1),
 (30,'BARADERO',1),
 (31,'SAAVEDRA',1),
 (32,'BRANDSEN',1),
 (33,'GENERAL SARMIENTO',1),
 (34,'TAPALQUE',1),
 (35,'SALADILLO',1),
 (36,'MAGDALENA',1),
 (37,'GONZALES CHAVES',1),
 (38,'GENERAL PINTO',1),
 (39,'NAVARRO',1),
 (40,'DAIREAUX',1),
 (41,'LOBOS',1),
 (42,'CORONEL DORREGO',1),
 (43,'ADOLFO ALSINA',1),
 (44,'COLON',1),
 (45,'GENERAL ARENALES',1),
 (46,'LINCOLN',1),
 (47,'VILLARINO',1),
 (48,'VICENTE LOPEZ',1),
 (49,'BARTOLOME MITRE',1),
 (50,'EXALTACION DE LA CRUZ',1),
 (51,'SALTO',1),
 (52,'BRAGADO',1),
 (53,'ZARATE',1),
 (54,'AVELLANEDA',1),
 (55,'AYACUCHO',1),
 (56,'SAN ANDRES DE GILES',1),
 (57,'TANDIL',1),
 (58,'RIVADAVIA',1),
 (59,'PATAGONES',1),
 (60,'GRL.VIAMONTE',1),
 (61,'CNL.DE MARINA LEONARDO ROSALES',1),
 (62,'BALCARCE',1),
 (63,'TRES ARROYOS',1),
 (64,'GENERAL VILLEGAS',1),
 (65,'LOMAS DE ZAMORA',1),
 (66,'BERISSO',1),
 (67,'JUAREZ',1),
 (68,'GRL.PUEYRREDON',1),
 (69,'CORONEL SUAREZ',1),
 (70,'ESCOBAR',1),
 (71,'CARLOS CASARES',1),
 (72,'CHIVILCOY',1),
 (73,'BERAZATEGUI',1),
 (74,'QUILMES',1),
 (75,'TORQUINST',1),
 (76,'3 DE FEBRERO',1),
 (77,'OLAVARRIA',1),
 (78,'PELLEGRINI',1),
 (79,'GENERAL BELGANO',1),
 (80,'FLORENCIO VARELA',1),
 (81,'SALLIQUELO',1),
 (82,'CNL.DE MARINA L.ROSALES',1),
 (83,'MAR CHIQUITA',1),
 (84,'GENERAL PUEYRREDON',1),
 (85,'CAMPANA',1),
 (86,'GRL.SARMIENTO',1),
 (87,'ROJAS',1),
 (88,'SARMIENTO',1),
 (89,'CARMEN DE ARECO',1),
 (90,'PILA',1),
 (91,'TRES DE FEBRERO',1),
 (92,'MORON',1),
 (93,'CASTELLI',1),
 (94,'CHACABUCO',1),
 (95,'GENERAL VIAMONTE',1),
 (96,'RAUCH',1),
 (97,'GENERAL BELGRANO',1),
 (98,'TORNQUIST',1),
 (99,'NECOCHEA',1),
 (100,'MARCOS PAZ',1),
 (101,'CARLOS TEJEDOR',1),
 (102,'SAN PEDRO',1),
 (103,'GENERAL ALVARADO',1),
 (104,'SAN NICOLAS',1),
 (105,'HIPOLITO YRIGOYEN',1),
 (106,'LAS FLORES',1),
 (107,'CORONEL PRINGLES',1),
 (108,'GENERAL SAN MARTIN',1),
 (109,'BENITO JUAREZ',1),
 (110,'SAN CAYETANO',1),
 (111,'ADOLFO GONZALES CHAVES',1),
 (112,'DOLORES',1),
 (113,'SAN ANTONIO',1),
 (114,'LOBERIA',1),
 (115,'RAMALLO',1),
 (116,'GENERAL ALVEAR',1),
 (117,'ENSENADA',1),
 (118,'TORDILLO',1),
 (119,'GENERAL GUIDO',1),
 (120,'GENERAL LAS HERAS',1),
 (121,'GENERAL JUAN MADARIAGA',1),
 (122,'GENERAL LA MADRID',1),
 (123,'GENERAL LAVALLE',1),
 (124,'GENERAL RODRIGUEZ',1),
 (125,'GENERAL VLLEGAS',1),
 (126,'ADOLFO GONZALEZ CHAVES',1),
 (127,'CORONEL DE MARINA L.ROSALES',1),
 (128,'BOLIVAR',1),
 (129,'SAN FERNANDO',1),
 (130,'CAPITAN SARMIENTO',1),
 (131,'ROQUE PEREZ',1),
 (132,'MORENO',1),
 (133,'LAPRIDA',1),
 (134,'MAIPU',1),
 (135,'ECHEVERRIA',1),
 (136,'PILAR',1),
 (137,'CORONEL DE MARINA L. ROSALES',1),
 (138,'SUIPACHA',1),
 (139,'SAN ANTONIO DE ARECO',1),
 (140,'BARAZATEGUI',1),
 (141,'ALSINA',1),
 (142,'LEANDRO N. ELEM',1),
 (143,'GRL.SAN MARTIN',1),
 (144,'CORONEL',1),
 (145,'CAPAYAN',2),
 (146,'ANDALGALA',2),
 (147,'EL ALTO',2),
 (148,'SANTA ROSA',2),
 (149,'ANCASTI',2),
 (150,'PACLIN',2),
 (151,'SANTA MARIA',2),
 (152,'TINOGASTA',2),
 (153,'LA PAZ',2),
 (154,'VALLE VIEJO',2),
 (155,'ANTOFAGASTA DE LA SIERRA',2),
 (156,'BELEN',2),
 (157,'CAPITAL',2),
 (158,'FRAY MAMERTO ESQUIU',2),
 (159,'POMAN',2),
 (160,'AMBATO',2),
 (161,'INDEPENDENCIA',3),
 (162,'SAN FERNANDO',3),
 (163,'PRIMERO DE MAYO',3),
 (164,'FRAY JUSTO SANTA MARIA DE ORO',3),
 (165,'SARGENTO CABRAL',3),
 (166,'GENERAL GUEMES',3),
 (167,'TAPENAGA',3),
 (168,'CHACABUCO',3),
 (169,'LIBERTADOR GRL.SAN MARTIN',3),
 (170,'25 DE MAYO',3),
 (171,'12 DE OCTUBRE',3),
 (172,'COMANDANTE FERNANDEZ',3),
 (173,'QUITILIPI',3),
 (174,'MAYOR LUIS J.FONTANA',3),
 (175,'LIBERTAD',3),
 (176,'BERMEJO',3),
 (177,'ALMIRANTE BROWN',3),
 (178,'MEYOR LUIS J.FONTANA',3),
 (179,'GENERAL BELGRANO',3),
 (180,'LIBERTADOR GRL. SAN MARTIN',3),
 (181,'GENERAL DONOVAN',3),
 (182,'SAN LORENZO',3),
 (183,'LEBERTADOR GRL.SAN MARTIN',3),
 (184,'MAIPU',3),
 (185,'O\'HIGGINS',3),
 (186,'9 DE JULIO',3),
 (187,'LIBERTADOR SAN MARTIN',3),
 (188,'RIO SENGUERR',4),
 (189,'MARTIRES',4),
 (190,'ESCALANTE',4),
 (191,'GAIMAN',4),
 (192,'SARMIENTO',4),
 (193,'CUSHAMEN',4),
 (194,'FLORENTINO AMEGHINO',4),
 (195,'PASO DE INDIOS',4),
 (196,'TELSEN',4),
 (197,'LANGUIÑEO',4),
 (198,'GASTRE',4),
 (199,'FUTALEUFU',4),
 (200,'TEHUELCHES',4),
 (201,'RAWSON',4),
 (202,'BIEDMA',4),
 (203,'RIO CUARTO',5),
 (204,'TOTORAL',5),
 (205,'COLON',5),
 (206,'MINAS',5),
 (207,'PUNILLA',5),
 (208,'JUAREZ CELMAN',5),
 (209,'MARCOS JUAREZ',5),
 (210,'SAN JUSTO',5),
 (211,'TERCERO ARRIBA',5),
 (212,'RIO SECO',5),
 (213,'CAPITAL',5),
 (214,'SANTA MARIA',5),
 (215,'SAN ALBERTO',5),
 (216,'UNION',5),
 (217,'POCHO',5),
 (218,'CALAMUCHITA',5),
 (219,'ISCHILIN',5),
 (220,'GENERAL SAN MARTIN',5),
 (221,'RIO PRIMERO',5),
 (222,'CRUZ DEL EJE',5),
 (223,'GRL.ROCA',5),
 (224,'GENERAL ROCA',5),
 (225,'SOBREMONTE',5),
 (226,'RIO SEGUNDO',5),
 (227,'TULUMBA',5),
 (228,'SAN JAVIER',5),
 (229,'PRESIDENTE ROQUE SAEZ PEÑA',5),
 (230,'PRESIDENTE ROQUE SAENZ PEÑA',5),
 (231,'',5),
 (232,'CRUZ DE EJE',5),
 (233,'CORONEL PRINGLES',5),
 (234,'RIO TERCERO',5),
 (235,'CVALAMUCHITA',5),
 (236,'SAN ROQUE',6),
 (237,'MONTE CASEROS',6),
 (238,'GENERAL ALVEAR',6),
 (239,'CURUZU CUATIA',6),
 (240,'SAN MARTIN',6),
 (241,'MERCEDES',6),
 (242,'SALADAS',6),
 (243,'ITUZAINGO',6),
 (244,'BERON DE ASTRADA',6),
 (245,'BELLA VISTA',6),
 (246,'SAN LUIS DEL PALMAR',6),
 (247,'CAPITAL',6),
 (248,'LAVALLE',6),
 (249,'PASO DE LOS LIBRES',6),
 (250,'GOYA',6),
 (251,'EMPEDRADO',6),
 (252,'SAUCE',6),
 (253,'GENERAL PAZ',6),
 (254,'SANTO TOME',6),
 (255,'SAN MIGUEL',6),
 (256,'CONCEPCION',6),
 (257,'ESQUINA',6),
 (258,'SAN COSME',6),
 (259,'ITATI',6),
 (260,'MBURUCUYA',6),
 (261,'URUGUAY',7),
 (262,'NOGOYA',7),
 (263,'TALA',7),
 (264,'GUALEGUAY',7),
 (265,'DIAMANTE',7),
 (266,'PARANA',7),
 (267,'GUALEGUAYCHU',7),
 (268,'COLON',7),
 (269,'VICTORIA',7),
 (270,'VILLAGUAY',7),
 (271,'FELICIANO',7),
 (272,'CONCORDIA',7),
 (273,'LA PAZ',7),
 (274,'FEDERACION',7),
 (275,'FEDERAL',7),
 (276,'CASTELLANOS',7),
 (277,'PILAGAS',8),
 (278,'PATIÑO',8),
 (279,'PILCOMAYO',8),
 (280,'BERMEJO',8),
 (281,'PIRANE',8),
 (282,'FORMOSA',8),
 (283,'MATACOS',8),
 (284,'RAMON LISTA',8),
 (285,'PILLAGAS',8),
 (286,'LAISHI',8),
 (287,'LEDESMA',9),
 (288,'COCHINOCA',9),
 (289,'EL CARMEN',9),
 (290,'TUMBAYA',9),
 (291,'CAPITAL',9),
 (292,'YAVI',9),
 (293,'HUMAHUACA',9),
 (294,'RINCONADA',9),
 (295,'VALLE GRANDE',9),
 (296,'SUSQUES',9),
 (297,'SANTA CATALINA',9),
 (298,'SAN ANTONIO',9),
 (299,'SANTA BARBARA',9),
 (300,'SAN PEDRO',9),
 (301,'TILCARA',9),
 (302,'LADESMA',9),
 (303,'HUCAL',10),
 (304,'REALICO',10),
 (305,'MARA CO',10),
 (306,'QUEMUQUEMU',10),
 (307,'CHICAL CO',10),
 (308,'GUATRACHE',10),
 (309,'CAPITAL',10),
 (310,'CALEUCALEU',10),
 (311,'TRENEL',10),
 (312,'UTRACAN',10),
 (313,'ATREUCO',10),
 (314,'TOAY',10),
 (315,'CHAPADLEUFU',10),
 (316,'CONELO',10),
 (317,'PUELEN',10),
 (318,'RANCUL',10),
 (319,'QUEMU QUEMU',10),
 (320,'LOVENTUE',10),
 (321,'CONHELO',10),
 (322,'CATRILO',10),
 (323,'CHAPALEUFU',10),
 (324,'ULTRACAN',10),
 (325,'CHALILEO',10),
 (326,'LIHUEL CALEL',10),
 (327,'MARACO',10),
 (328,'CALEU CALEU',10),
 (329,'CURACO',10),
 (330,'LIMAY MAHUIDA',10),
 (331,'CASTRO BARROS',11),
 (332,'GENERAL SAN MARTIN',11),
 (333,'GENERAL LAVALLE',11),
 (334,'ARAUCO',11),
 (335,'GRAL.ANGEL V.PEÑALOZA',11),
 (336,'SAN BLAS DE LOS SAUCES',11),
 (337,'INDEPENDENCIA',11),
 (338,'GENERAL OCAMPO',11),
 (339,'CHILECITO',11),
 (340,'FAMATINA',11),
 (341,'GRL.JUAN FACUNDO QUIROGA',11),
 (342,'GRL.ANGEL V. PEÑALOZA',11),
 (343,'GENERAL BELGRANO',11),
 (344,'GENERAL SARMIENTO',11),
 (345,'CAPITAL',11),
 (346,'GDOR. GORDILLO',11),
 (347,'GENERAL ANGEL VICENTE PEÑALOZA',11),
 (348,'GOBERNADOR GORDILLO',11),
 (349,'ROSARIO VERA PEÑALOZA',11),
 (350,'GRL.SAN MARTIN',11),
 (351,'GENERAL LA MADRID',11),
 (352,'GENERAL JUAN FACUNDO QUIROGA',11),
 (353,'GENERALOCAMPO',11),
 (354,'SANAGASTA',11),
 (355,'SAN RAFAEL',12),
 (356,'LUJAN',12),
 (357,'MALARGUE',12),
 (358,'GUAYMALLEN',12),
 (359,'LAVALLE',12),
 (360,'JUNIN',12),
 (361,'TUPUNGATO',12),
 (362,'RIVADAVIA',12),
 (363,'MAIPU',12),
 (364,'GODOY CRUZ',12),
 (365,'GENERAL ALVEAR',12),
 (366,'LA PAZ',12),
 (367,'TUNUYAN',12),
 (368,'SAN CARLOS',12),
 (369,'LAS HERAS',12),
 (370,'LUJAN DE CUYO',12),
 (371,'SAN MARTIN',12),
 (372,'SANTA ROSA',12),
 (373,'CAPITAL',12),
 (374,'25 DE MAYO',13),
 (375,'IGUAZU',13),
 (376,'EL DORADO',13),
 (377,'LEANDRO N. ALEM',13),
 (378,'APOSTOLES',13),
 (379,'CAINGUAS',13),
 (380,'LEANDRO N.ALEM',13),
 (381,'CONCEPCION',13),
 (382,'SAN PEDRO',13),
 (383,'CANDELARIA',13),
 (384,'GRL.MANUEL BELGRANO',13),
 (385,'OBERA',13),
 (386,'LIBERTADOR GRL.SAN MARTIN',13),
 (387,'SAN IGNACIO',13),
 (388,'MONTECARLO',13),
 (389,'GENERAL MANUEL BELGRANO',13),
 (390,'LEBERTADOR GRL.SAN MARTIN',13),
 (391,'EL GUARANI',13),
 (392,'ELDORADO',13),
 (393,'CAPITAL',13),
 (394,'GUARANI',13),
 (395,'SAN JAVIER',13),
 (396,'LIBERTADOR GRL. SAN MARTIN',13),
 (397,'COLLON CURA',14),
 (398,'ALUMINE',14),
 (399,'MINAS',14),
 (400,'AÑELO',14),
 (401,'CONFLUENCIA',14),
 (402,'CHOS MALAL',14),
 (403,'PICUNCHES',14),
 (404,'NORQUIN',14),
 (405,'PEHUENCHES',14),
 (406,'LONCOPUE',14),
 (407,'HUILICHES',14),
 (408,'ZAPALA',14),
 (409,'CATAN LIL',14),
 (410,'ÑORQUIN',14),
 (411,'LOS LAGOS',14),
 (412,'PICUN LEUFU',14),
 (413,'LACAR',14),
 (414,'ÑOEQUIN',14),
 (415,'VALCHETA',15),
 (416,'25 DE MAYO',15),
 (417,'EL CUY',15),
 (418,'ÑORQUINCO',15),
 (419,'GENERAL ROCA',15),
 (420,'AVELLANEDA',15),
 (421,'CONESA',15),
 (422,'PICHI MAHUIDA',15),
 (423,'SAN ANTONIO',15),
 (424,'PILCANIYEU',15),
 (425,'9 DE JULIO',15),
 (426,'ADOLFO ALSINA',15),
 (427,'BARILOCHE',15),
 (428,'PIHI MAHUIDA',15),
 (429,'LA VIÑA',16),
 (430,'SAN MARTIN',16),
 (431,'ORAN',16),
 (432,'ANTA',16),
 (433,'GRAL.JOSE DE SAN MARTIN',16),
 (434,'GUACHIPAS',16),
 (435,'ROSARIO DE LA FRONTERA',16),
 (436,'RIVADAVIA',16),
 (437,'METAN',16),
 (438,'SAN CARLOS',16),
 (439,'GRL.GUEMES',16),
 (440,'CACHI',16),
 (441,'ROSARIO DE LERMA',16),
 (442,'CAFAYATE',16),
 (443,'LOS ANDES',16),
 (444,'GRL.JOSE DE SAN MARTIN',16),
 (445,'CAPITAL',16),
 (446,'GRL.SAN MARTIN',16),
 (447,'GENERAL GUEMES',16),
 (448,'CERRILLOS',16),
 (449,'CHICOANA',16),
 (450,'LA POMA',16),
 (451,'LA CAPITAL',16),
 (452,'CANDELARIA',16),
 (453,'ROSARIO',16),
 (454,'IRUYA',16),
 (455,'LA CALDERA',16),
 (456,'LOA ANDES',16),
 (457,'MOLINOS',16),
 (458,'SANTA VICTORIA',16),
 (459,'9 DE JULIO',17),
 (460,'JACHAL',17),
 (461,'ALBARDON',17),
 (462,'25 DE MAYO',17),
 (463,'SANTA LUCIA',17),
 (464,'ANGACO',17),
 (465,'IGLESIA',17),
 (466,'VALLE FERTIL',17),
 (467,'CALINGASTA',17),
 (468,'RIVADAVIA',17),
 (469,'CAUCETE',17),
 (470,'SARMIENTO',17),
 (471,'POCITO',17),
 (472,'SAN MARTIN',17),
 (473,'CHIMBAS',17),
 (474,'IGLESIAS',17),
 (475,'ULLUN',17),
 (476,'RAWSON',17),
 (477,'CAPITAL',17),
 (478,'ZONDA',17),
 (479,'BELGRANO',18),
 (480,'CHACABUCO',18),
 (481,'LA CAPITAL',18),
 (482,'GOBERNADOR DUPUY',18),
 (483,'GRL.PEDERNERA',18),
 (484,'AYACUCHO',18),
 (485,'JUNIN',18),
 (486,'GONERNADOR DUPUY',18),
 (487,'CORONEL PRINGLES',18),
 (488,'GENERAL PEDERNERA',18),
 (489,'GOBERNADOR DUVAL',18),
 (490,'IGLESIA',18),
 (491,'LIBERTADOR GRL. SAN MARTIN',18),
 (492,'LIBERTADOR GRL.SAN MARTIN',18),
 (493,'LIBERTADOR GR.SAN MARTIN',18),
 (494,'CAUCETE',18),
 (495,'GUER AIKE',19),
 (496,'DESEADO',19),
 (497,'RIO CHICO',19),
 (498,'MAGALLANES',19),
 (499,'LAGO ARGENTINO',19),
 (500,'CORPEN AIKE',19),
 (501,'LAGO BUENOS AIRES',19),
 (502,'GENERAL LOPEZ',20),
 (503,'ROSARIO',20),
 (504,'GENERAL OBLIGADO',20),
 (505,'CONSTITUCION',20),
 (506,'SAN LORENZO',20),
 (507,'SAN JAVIER',20),
 (508,'LA CAPITAL',20),
 (509,'SAN CRISTOBAL',20),
 (510,'IRIONDO',20),
 (511,'CASTELLANOS',20),
 (512,'NUEVE DE JULIO',20),
 (513,'CASEROS',20),
 (514,'SAN JERONIMO',20),
 (515,'BELGRANO',20),
 (516,'CAPITAL',20),
 (517,'SAN JUSTO',20),
 (518,'GRL.OBLIGADO',20),
 (519,'LA CAPUTAL',20),
 (520,'GRL.LOPEZ',20),
 (521,'VERA',20),
 (522,'9 DE JULIO',20),
 (523,'SAN MARTIN',20),
 (524,'LAS COLONIAS',20),
 (525,'GARAY',20),
 (526,'CASTELANOS',20),
 (527,'LAS COLINAS',20),
 (528,'BANDA',21),
 (529,'MORENO',21),
 (530,'ALBERDI',21),
 (531,'PELLEGRINI',21),
 (532,'OJO DE AGUA',21),
 (533,'RIO HONDO',21),
 (534,'GENERAL TABOADA',21),
 (535,'CHOYA',21),
 (536,'CAPITAL',21),
 (537,'AGUIRRE',21),
 (538,'SILIPICA',21),
 (539,'BELGRANO',21),
 (540,'FIGUEROA',21),
 (541,'SALAVINA',21),
 (542,'QUEBRACHOS',21),
 (543,'ROBLES',21),
 (544,'AVELLANEDA',21),
 (545,'JIMENEZ',21),
 (546,'ATAMISQUI',21),
 (547,'SAN MARTIN',21),
 (548,'MATARA',21),
 (549,'SALAYINA',21),
 (550,'GUASAYAN',21),
 (551,'COPO',21),
 (552,'BRIGADIER JUAN FELIPE IBARRA',21),
 (553,'DOBLES',21),
 (554,'SARMIENTO',21),
 (555,'LORETO',21),
 (556,'MITRE',21),
 (557,'RIVADAVIA',21),
 (558,'USHUAIA',22),
 (559,'ISLAS DEL ATLANTICO SUR',22),
 (560,'SECTOR ANTARTICO ARGENTINO',22),
 (561,'RIO GRANDE',22),
 (562,'IS.DEL ATLANTICO SUR E IS.MALVINAS',22),
 (563,'ANTARTIDA ARGENTINA',22),
 (564,'BURRUYACU',23),
 (565,'TRANCAS',23),
 (566,'MONTEROS',23),
 (567,'LEALES',23),
 (568,'CRUZ ALTA',23),
 (569,'RIO CHICO',23),
 (570,'CHICLIGASTA',23),
 (571,'TAFI',23),
 (572,'GRANEROS',23),
 (573,'FAMAILLA',23),
 (574,'CAPITAL',23);

--
-- Definition of table `medida`
--

DROP TABLE IF EXISTS `medida`;
CREATE TABLE `medida` (
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

--
-- Dumping data for table `medida`
--
INSERT INTO `medida` (`idmedida`,`idnorma`,`idtipo`,`tipo`) VALUES 
 (1,1,1,'P'),
 (2,2,1,'PP'),
 (3,3,1,'P'),
 (4,1,2,'PP'),
 (5,2,2,'PP'),
 (6,3,3,'P'),
 (7,1,3,'P'),
 (8,2,3,'P'),
 (9,1,4,'PP'),
 (10,3,4,'P'),
 (11,1,2,'P'),
 (12,2,4,'PP'),
 (13,3,2,'P'),
 (14,3,3,'PP'),
 (15,3,4,'PP');

--
-- Definition of table `medida-producto`
--

DROP TABLE IF EXISTS `medida-producto`;
CREATE TABLE `medida-producto` (
  `idproducto` int(11) NOT NULL,
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`idmedida`),
  KEY `fk_medida_producto_1` (`idproducto`),
  KEY `fk_medida_producto_2` (`idmedida`),
  CONSTRAINT `fk_medida_producto_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medida_producto_2` FOREIGN KEY (`idmedida`) REFERENCES `medida_por_producto` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medida-producto`
--
INSERT INTO `medida-producto` (`idproducto`,`idmedida`) VALUES 
 (11,1),
 (12,2),
 (22,9),
 (23,8),
 (33,6),
 (34,2),
 (41,7),
 (42,1),
 (43,3),
 (56,10),
 (78,5),
 (89,2),
 (98,3),
 (99,4),
 (100,5),
 (104,8),
 (123,4);

--
-- Definition of table `medida_por_prod_pais`
--

DROP TABLE IF EXISTS `medida_por_prod_pais`;
CREATE TABLE `medida_por_prod_pais` (
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idmedida`),
  KEY `fk_medida_por_prod_pais_1` (`idmedida`),
  CONSTRAINT `fk_medida_por_prod_pais_1` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medida_por_prod_pais`
--
INSERT INTO `medida_por_prod_pais` (`idmedida`) VALUES 
 (2),
 (4),
 (5),
 (9),
 (12),
 (14),
 (15);

--
-- Definition of table `medida_por_producto`
--

DROP TABLE IF EXISTS `medida_por_producto`;
CREATE TABLE `medida_por_producto` (
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idmedida`),
  KEY `fk_medida_por_producto_1` (`idmedida`),
  CONSTRAINT `fk_medida_por_producto_1` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`idmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medida_por_producto`
--
INSERT INTO `medida_por_producto` (`idmedida`) VALUES 
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7),
 (8),
 (9),
 (10);

--
-- Definition of table `norma`
--

DROP TABLE IF EXISTS `norma`;
CREATE TABLE `norma` (
  `idnorma` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idnorma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `norma`
--
INSERT INTO `norma` (`idnorma`) VALUES 
 (1),
 (2),
 (3);

--
-- Definition of table `organismo`
--

DROP TABLE IF EXISTS `organismo`;
CREATE TABLE `organismo` (
  `idorganismo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorganismo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organismo`
--
INSERT INTO `organismo` (`idorganismo`,`nombre`) VALUES 
 (1,'indec'),
 (2,'controladores anonimos'),
 (3,'seguro lo rechaza');

--
-- Definition of table `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pais`
--
INSERT INTO `pais` (`idpais`,`nombre`) VALUES 
 (1,'Afganistán'),
 (2,'Islas Gland'),
 (3,'Albania'),
 (4,'Alemania'),
 (5,'Andorra'),
 (6,'Angola'),
 (7,'Anguilla'),
 (8,'Antártida'),
 (9,'Antigua y Barbuda'),
 (10,'Antillas Holandesas'),
 (11,'Arabia Saudí'),
 (12,'Argelia'),
 (13,'Argentina'),
 (14,'Armenia'),
 (15,'Aruba'),
 (16,'Australia'),
 (17,'Austria'),
 (18,'Azerbaiyán'),
 (19,'Bahamas'),
 (20,'Bahréin'),
 (21,'Bangladesh'),
 (22,'Barbados'),
 (23,'Bielorrusia'),
 (24,'Bélgica'),
 (25,'Belice'),
 (26,'Benin'),
 (27,'Bermudas'),
 (28,'Bhután'),
 (29,'Bolivia'),
 (30,'Bosnia y Herzegovina'),
 (31,'Botsuana'),
 (32,'Isla Bouvet'),
 (33,'Brasil'),
 (34,'Brunéi'),
 (35,'Bulgaria'),
 (36,'Burkina Faso'),
 (37,'Burundi'),
 (38,'Cabo Verde'),
 (39,'Islas Caimán'),
 (40,'Camboya'),
 (41,'Camerún'),
 (42,'Canadá'),
 (43,'República Centroafricana'),
 (44,'Chad'),
 (45,'República Checa'),
 (46,'Chile'),
 (47,'China'),
 (48,'Chipre'),
 (49,'Isla de Navidad'),
 (50,'Ciudad del Vaticano'),
 (51,'Islas Cocos'),
 (52,'Colombia'),
 (53,'Comoras'),
 (54,'República Democrática del Congo'),
 (55,'Congo'),
 (56,'Islas Cook'),
 (57,'Corea del Norte'),
 (58,'Corea del Sur'),
 (59,'Costa de Marfil'),
 (60,'Costa Rica'),
 (61,'Croacia'),
 (62,'Cuba'),
 (63,'Dinamarca'),
 (64,'Dominica'),
 (65,'República Dominicana'),
 (66,'Ecuador'),
 (67,'Egipto'),
 (68,'El Salvador'),
 (69,'Emiratos Árabes Unidos'),
 (70,'Eritrea'),
 (71,'Eslovaquia'),
 (72,'Eslovenia'),
 (73,'España'),
 (74,'Islas ultramarinas de Estados Unidos'),
 (75,'Estados Unidos'),
 (76,'Estonia'),
 (77,'Etiopía'),
 (78,'Islas Feroe'),
 (79,'Filipinas'),
 (80,'Finlandia'),
 (81,'Fiyi'),
 (82,'Francia'),
 (83,'Gabón'),
 (84,'Gambia'),
 (85,'Georgia'),
 (86,'Islas Georgias del Sur y Sandwich del Sur'),
 (87,'Ghana'),
 (88,'Gibraltar'),
 (89,'Granada'),
 (90,'Grecia'),
 (91,'Groenlandia'),
 (92,'Guadalupe'),
 (93,'Guam'),
 (94,'Guatemala'),
 (95,'Guayana Francesa'),
 (96,'Guinea'),
 (97,'Guinea Ecuatorial'),
 (98,'Guinea-Bissau'),
 (99,'Guyana'),
 (100,'Haití'),
 (101,'Islas Heard y McDonald'),
 (102,'Honduras'),
 (103,'Hong Kong'),
 (104,'Hungría'),
 (105,'India'),
 (106,'Indonesia'),
 (107,'Irán'),
 (108,'Iraq'),
 (109,'Irlanda'),
 (110,'Islandia'),
 (111,'Israel'),
 (112,'Italia'),
 (113,'Jamaica'),
 (114,'Japón'),
 (115,'Jordania'),
 (116,'Kazajstán'),
 (117,'Kenia'),
 (118,'Kirguistán'),
 (119,'Kiribati'),
 (120,'Kuwait'),
 (121,'Laos'),
 (122,'Lesotho'),
 (123,'Letonia'),
 (124,'Líbano'),
 (125,'Liberia'),
 (126,'Libia'),
 (127,'Liechtenstein'),
 (128,'Lituania'),
 (129,'Luxemburgo'),
 (130,'Macao'),
 (131,'ARY Macedonia'),
 (132,'Madagascar'),
 (133,'Malasia'),
 (134,'Malawi'),
 (135,'Maldivas'),
 (136,'Malí'),
 (137,'Malta'),
 (138,'Islas Malvinas'),
 (139,'Islas Marianas del Norte'),
 (140,'Marruecos'),
 (141,'Islas Marshall'),
 (142,'Martinica'),
 (143,'Mauricio'),
 (144,'Mauritania'),
 (145,'Mayotte'),
 (146,'México'),
 (147,'Micronesia'),
 (148,'Moldavia'),
 (149,'Mónaco'),
 (150,'Mongolia'),
 (151,'Montserrat'),
 (152,'Mozambique'),
 (153,'Myanmar'),
 (154,'Namibia'),
 (155,'Nauru'),
 (156,'Nepal'),
 (157,'Nicaragua'),
 (158,'Níger'),
 (159,'Nigeria'),
 (160,'Niue'),
 (161,'Isla Norfolk'),
 (162,'Noruega'),
 (163,'Nueva Caledonia'),
 (164,'Nueva Zelanda'),
 (165,'Omán'),
 (166,'Países Bajos'),
 (167,'Pakistán'),
 (168,'Palau'),
 (169,'Palestina'),
 (170,'Panamá'),
 (171,'Papúa Nueva Guinea'),
 (172,'Paraguay'),
 (173,'Perú'),
 (174,'Islas Pitcairn'),
 (175,'Polinesia Francesa'),
 (176,'Polonia'),
 (177,'Portugal'),
 (178,'Puerto Rico'),
 (179,'Qatar'),
 (180,'Reino Unido'),
 (181,'Reunión'),
 (182,'Ruanda'),
 (183,'Rumania'),
 (184,'Rusia'),
 (185,'Sahara Occidental'),
 (186,'Islas Salomón'),
 (187,'Samoa'),
 (188,'Samoa Americana'),
 (189,'San Cristóbal y Nevis'),
 (190,'San Marino'),
 (191,'San Pedro y Miquelón'),
 (192,'San Vicente y las Granadinas'),
 (193,'Santa Helena'),
 (194,'Santa Lucía'),
 (195,'Santo Tomé y Príncipe'),
 (196,'Senegal'),
 (197,'Serbia y Montenegro'),
 (198,'Seychelles'),
 (199,'Sierra Leona'),
 (200,'Singapur'),
 (201,'Siria'),
 (202,'Somalia'),
 (203,'Sri Lanka'),
 (204,'Suazilandia'),
 (205,'Sudáfrica'),
 (206,'Sudán'),
 (207,'Suecia'),
 (208,'Suiza'),
 (209,'Surinam'),
 (210,'Svalbard y Jan Mayen'),
 (211,'Tailandia'),
 (212,'Taiwán'),
 (213,'Tanzania'),
 (214,'Tayikistán'),
 (215,'Territorio Británico del Océano Índico'),
 (216,'Territorios Australes Franceses'),
 (217,'Timor Oriental'),
 (218,'Togo'),
 (219,'Tokelau'),
 (220,'Tonga'),
 (221,'Trinidad y Tobago'),
 (222,'Túnez'),
 (223,'Islas Turcas y Caicos'),
 (224,'Turkmenistán'),
 (225,'Turquía'),
 (226,'Tuvalu'),
 (227,'Ucrania'),
 (228,'Uganda'),
 (229,'Uruguay'),
 (230,'Uzbekistán'),
 (231,'Vanuatu'),
 (232,'Venezuela'),
 (233,'Vietnam'),
 (234,'Islas Vírgenes Británicas'),
 (235,'Islas Vírgenes de los Estados Unidos'),
 (236,'Wallis y Futuna'),
 (237,'Yemen'),
 (238,'Yibuti'),
 (239,'Zambia'),
 (240,'Zimbabue');

--
-- Definition of table `prod_extranjero-pais`
--

DROP TABLE IF EXISTS `prod_extranjero-pais`;
CREATE TABLE `prod_extranjero-pais` (
  `idproducto` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  `cantanual` float DEFAULT NULL,
  PRIMARY KEY (`idproducto`,`idpais`),
  KEY `fk_prod_extranjero_pais_1` (`idproducto`),
  KEY `fk_prod_extranjero_pais_2` (`idpais`),
  CONSTRAINT `fk_prod_extranjero_pais_1` FOREIGN KEY (`idproducto`) REFERENCES `producto_extranjero` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_extranjero_pais_2` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prod_extranjero-pais`
--
INSERT INTO `prod_extranjero-pais` (`idproducto`,`idpais`,`cantanual`) VALUES 
 (1,40,23),
 (3,62,45),
 (12,73,56),
 (28,60,43),
 (42,80,63),
 (42,202,185),
 (43,73,56),
 (43,196,179),
 (66,43,70),
 (66,144,127),
 (66,170,153),
 (68,49,76),
 (68,151,134),
 (68,176,159),
 (107,56,83),
 (107,157,140),
 (107,183,166),
 (114,62,89),
 (114,164,147),
 (114,189,172),
 (161,68,95),
 (176,75,102),
 (180,81,108),
 (207,88,115),
 (223,94,121);

--
-- Definition of table `prod_nacional_fabrica`
--

DROP TABLE IF EXISTS `prod_nacional_fabrica`;
CREATE TABLE `prod_nacional_fabrica` (
  `idproducto` int(11) NOT NULL,
  `idfabrica` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`idfabrica`),
  KEY `fk_prod_nacional_fabrica_1` (`idproducto`),
  KEY `fk_prod_nacional_fabrica_2` (`idfabrica`),
  CONSTRAINT `fk_prod_nacional_fabrica_1` FOREIGN KEY (`idproducto`) REFERENCES `producto_nacional` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_nacional_fabrica_2` FOREIGN KEY (`idfabrica`) REFERENCES `fabrica` (`idfabrica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prod_nacional_fabrica`
--
INSERT INTO `prod_nacional_fabrica` (`idproducto`,`idfabrica`) VALUES 
 (11,11),
 (12,12),
 (22,5),
 (23,8),
 (33,6),
 (34,2),
 (41,7),
 (42,11),
 (43,3),
 (56,4),
 (78,5),
 (78,18),
 (89,2),
 (89,20),
 (98,3),
 (98,19),
 (99,4),
 (100,15),
 (104,18),
 (123,14),
 (200,15),
 (206,3),
 (206,19),
 (206,20);

--
-- Definition of table `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `umedida` varchar(8) NOT NULL,
  `tipo` enum('N','E') NOT NULL,
  `rubro_idrubro` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto_rubro` (`rubro_idrubro`),
  KEY `fk_producto_udemedida` (`umedida`),
  CONSTRAINT `fk_producto_rubro` FOREIGN KEY (`rubro_idrubro`) REFERENCES `rubro` (`idrubro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_udemedida` FOREIGN KEY (`umedida`) REFERENCES `udemedida` (`udemedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--
INSERT INTO `producto` (`idproducto`,`nombre`,`descripcion`,`umedida`,`tipo`,`rubro_idrubro`) VALUES 
 (1,'Albaricoque','','kg','E',4),
 (2,'Arandanos','','kg','N',4),
 (3,'Cereza','','kg','E',4),
 (4,'Ciruela Amarilla','','kg','N',4),
 (5,'Ciruela Claudia','','kg','E',4),
 (6,'Ciruela Larga','','kg','N',4),
 (7,'Ciruela Negra','','kg','N',4),
 (8,'Ciruela President','','kg','E',4),
 (9,'Ciruela Sun Gold','','kg','N',4),
 (10,'Clausellina','','kg','N',4),
 (11,'Clemenvilla','','kg','N',4),
 (12,'Frambuesa','','kg','E',4),
 (13,'Fresa H.','','kg','E',4),
 (14,'Gingols','','kg','E',4),
 (15,'Granadas','','kg','E',4),
 (16,'Grossella','','kg','N',4),
 (17,'Higos Chumbos','','kg','E',4),
 (18,'Higos Naturales','','kg','N',4),
 (19,'Kakis','','tn','E',4),
 (20,'Kiwi','','tn','N',4),
 (21,'Limones','','tn','N',4),
 (22,'Manzana Fuji','','kg','E',4),
 (23,'Manzana Golden','','kg','N',4),
 (24,'Manzana Granny-Smith','','kg','N',4),
 (25,'Manzana Pink Lady','','kg','N',4),
 (26,'Manzana R.Gala','','kg','E',4),
 (27,'Manzana Reineta','','kg','E',4),
 (28,'Manzana Starking','','kg','E',4),
 (29,'Manzana Starq. Granel','','kg','E',4),
 (30,'Melocoton Amarillo','','kg','N',4),
 (31,'Melocoton Blanco','','kg','E',4),
 (32,'Melocoton Rojo','','kg','N',4),
 (33,'Melon Cantaloup','','tn','E',4),
 (34,'Melon Erizo Extra','','kg','N',4),
 (35,'Melon Futuro','','kg','N',4),
 (36,'Melon Marina MCA.','','kg','E',4),
 (37,'Melon Sapo','','kg','N',4),
 (38,'Membrillo','','kg','N',4),
 (39,'Moras','','kg','N',4),
 (40,'Naranja Fortuna','','kg','E',4),
 (41,'Naranja Importacion','','kg','E',4),
 (42,'Naranja Navel Extra','','kg','E',4),
 (43,'Naranja Salustiana','','kg','E',4),
 (44,'Naranja Sanguina','','tn','N',4),
 (45,'Naranja Setsuma','','kg','E',4),
 (46,'Naranja Valencia','','tn','N',4),
 (47,'Naranjas Navel','','kg','E',4),
 (48,'Nectarina','','kg','N',4),
 (49,'Nectarina Granel','','kg','N',4),
 (50,'Nectarina Importacion','','kg','E',4),
 (51,'Nisperos','','kg','N',4),
 (52,'Paraguayo Rojo','','kg','N',4),
 (53,'Pera Alejandrina','','kg','N',4),
 (54,'Pera Blanquilla','','kg','E',4),
 (55,'Pera Castell Extra','','kg','E',4),
 (56,'Pera Conferencia','','tn','E',4),
 (57,'Pera Ercolina','','kg','N',4),
 (58,'Pera Limonera','','tn','N',4),
 (59,'Pera Nachi','','kg','E',4),
 (60,'Pera Packham','','kg','N',4),
 (61,'Pera Passacrassana','','kg','N',4),
 (62,'Pera Premier','','kg','N',4),
 (63,'Picota','','kg','E',4),
 (64,'Platanos','','kg','E',4),
 (65,'Pomelo Amarillo','','kg','E',4),
 (66,'Pomelo Rosa','','tn','E',4),
 (67,'Sandia Negra','','kg','N',4),
 (68,'Sandia Rayada','','tn','E',4),
 (69,'Sharoni','','kg','N',4),
 (70,'Uva Alfonso','','kg','E',4),
 (71,'Uva Blanca','','kg','N',4),
 (72,'Uva Blanca Moscatel','','kg','N',4),
 (73,'Uva Cardinal','','kg','E',4),
 (74,'Uva Dominga ','','kg','N',4),
 (75,'Uva Napoleon','','kg','N',4),
 (76,'Uva Red Globe','','kg','E',4),
 (77,'Salmón','','kg','N',5),
 (78,'Merluza','','kg','N',5),
 (79,'Corvina','','kg','N',5),
 (80,'Cornalitos','','kg','N',5),
 (81,'Camarón','','kg','N',5),
 (82,'Anchoas','','kg','N',5),
 (83,'Barracuda','','tn','N',5),
 (84,'Pez Cardenal','','kg','N',5),
 (85,'Bagre','','tn','N',5),
 (86,'Meros','','kg','N',5),
 (87,'Rubios','','kg','N',5),
 (88,'Jurel','','kg','N',5),
 (89,'Caballas','','kg','N',5),
 (90,'Abadejo','','kg','N',5),
 (91,'Merluzas negras','','kg','E',5),
 (92,'Salmón Real','','kg','E',5),
 (93,'Arenque Real','','tn','E',5),
 (94,'Vaca','','tn','N',1),
 (95,'Oveja','','kg','N',1),
 (96,'Cerdo','','tn','N',1),
 (97,'Gallina','','kg','N',1),
 (98,'Pato','','kg','N',1),
 (99,'Pavo','','kg','E',1),
 (100,'Pollo','','tn','E',1),
 (101,'Caballo','','tn','N',1),
 (102,'Arroz blanco','','kg','N',3),
 (103,'Trigo','','kg','N',3),
 (104,'Harina de maíz','','kg','N',3),
 (105,'Fideos','','tn','E',3),
 (106,'Queso','','tn','E',3),
 (107,'Garbanzo','','kg','E',3),
 (108,'Soja','','tn','N',3),
 (109,'Arroz integral ','','kg','N',3),
 (110,'Arroz silvestre ','','kg','N',3),
 (111,'Maíz','','kg','N',3),
 (112,'Harina integral de trigo ','','tn','N',3),
 (113,'Trigo agrietado ','','tn','E',3),
 (114,'Trigo bulghur ','','kg','E',3),
 (115,'Cebada perlada ','','kg','N',3),
 (116,'Hojuelas de cebada ','','kg','N',3),
 (117,'Bayas enteras de centeno ','','tn','N',3),
 (118,'Hojuelas de centeno ','','tn','N',3),
 (119,'Avena ','','kg','E',3),
 (120,'Harina de avena ','','tn','E',3),
 (121,'Mijo ','','kg','E',3),
 (122,'Quinoa ','','kg','N',3),
 (123,'Amaranto','','kg','N',3),
 (124,'Nogales ','','tn','N',3),
 (125,'Almendras ','','tn','N',3),
 (126,'Pistachos ','','kg','N',3),
 (127,'Avellanas ','','kg','E',3),
 (128,'Nueces del Brasil ','','kg','E',3),
 (129,'Castañas ','','tn','E',3),
 (130,'Nueces del pino ','','tn','N',3),
 (131,'Girasol ','','kg','N',3),
 (132,'Calabaza ','','tn','N',3),
 (133,'Sésamo ','','kg','N',3),
 (134,'Lino','','kg','N',3),
 (135,'Aguardiente','','l','E',2),
 (136,'Allasch','','l','N',2),
 (137,'Amer Picón','','l','N',2),
 (138,'Anís','','ml','N',2),
 (139,'Apple Brandy o Applejack','','ml','N',2),
 (140,'Apricot Brandy','','l','E',2),
 (141,'Araqui','','l','E',2),
 (142,'Arrat','','l','E',2),
 (143,'Benedictine','','l','E',2),
 (144,'Bill Cobianchi','','l','E',2),
 (145,'Bisleri','','ml','N',2),
 (146,'Bitters','','ml','N',2),
 (147,'Byrrh','','l','N',2),
 (148,'Calisay','','l','N',2),
 (149,'Calvados','','l','E',2),
 (150,'Campari','','l','E',2),
 (151,'Cerveza','','l','E',2),
 (152,'Cointreau','','ml','E',2),
 (153,'Coñac (Cognac o Brandy)','','ml','E',2),
 (154,'Cordial Medoc','','l','N',2),
 (155,'Crema de ananás','','l','N',2),
 (156,'Crema de bananas','','l','N',2),
 (157,'Crema de cacao','','l','N',2),
 (158,'Crema de cassis','','l','E',2),
 (159,'Crema de frutillas','','ml','E',2),
 (160,'Crema de mandarina','','ml','E',2),
 (161,'Crema de moka','','l','E',2),
 (162,'Crema de noyau','','l','E',2),
 (163,'Crema de rosa','','l','N',2),
 (164,'Crema de vainilla','','l','N',2),
 (165,'Crema de violeta','','l','N',2),
 (166,'Cuarenta y Tres','','ml','N',2),
 (167,'Curacao','','ml','E',2),
 (168,'Cha','','l','E',2),
 (169,'Champán (Champagne)','','l','E',2),
 (170,'Cherry Brandy','','l','E',2),
 (171,'Chicha','','l','E',2),
 (172,'Doucico','','l','N',2),
 (173,'Fernet Branca','','ml','N',2),
 (174,'Ginebra (Gin)','','ml','N',2),
 (175,'Grand Marnier','','l','N',2),
 (176,'Grappa','','l','E',2),
 (177,'Guignolet','','l','E',2),
 (178,'Huarapo','','l','E',2),
 (179,'Huarazo','','l','E',2),
 (180,'Jerez','','ml','E',2),
 (181,'Katsch','','ml','N',2),
 (182,'Kava','','l','N',2),
 (183,'Kirsch','','l','N',2),
 (184,'Kummel','','l','N',2),
 (185,'Kwas','','l','E',2),
 (186,'lagbi','','l','E',2),
 (187,'lipun','','ml','E',2),
 (188,'Malvasía','','ml','E',2),
 (189,'Manzanilla','','l','E',2),
 (190,'Marrasquino','','l','N',2),
 (191,'Mastig','','l','N',2),
 (192,'Noilly Prat','','l','N',2),
 (193,'Ojén','','l','N',2),
 (194,'Oporto','','ml','E',2),
 (195,'Orange Bitters','','ml','E',2),
 (196,'Pa Me Kue','','l','E',2),
 (197,'Palo','','l','E',2),
 (198,'Pecktet','','l','E',2),
 (199,'Perry','','l','N',2),
 (200,'Pernod','','l','N',2),
 (201,'Pinkel','','ml','N',2),
 (202,'Pippermint','','ml','N',2),
 (203,'Pisco','','l','E',2),
 (204,'Polinnaia','','l','E',2),
 (205,'Prinche','','l','E',2),
 (206,'Pulque','','l','E',2),
 (207,'Quetsch','','l','E',2),
 (208,'Quinina','','ml','N',2),
 (209,'Riwas','','ml','N',2),
 (210,'Ron','','l','N',2),
 (211,'Sa','','l','N',2),
 (212,'Sake','','l','E',2),
 (213,'Schochu','','l','E',2),
 (214,'Secrestat','','l','E',2),
 (215,'Sidra','','ml','E',2),
 (216,'Sinday','','ml','E',2),
 (217,'Slivovitza','','l','N',2),
 (218,'Swedish Punch','','l','N',2),
 (219,'Tequila','','l','N',2),
 (220,'Triple seco','','l','N',2),
 (221,'Tuica','','l','E',2),
 (222,'Vermut','','ml','E',2),
 (223,'Vodka','','ml','E',2),
 (224,'Whisky','','l','E',2);

--
-- Definition of table `producto_extranjero`
--

DROP TABLE IF EXISTS `producto_extranjero`;
CREATE TABLE `producto_extranjero` (
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `fk_producto_extranjero_1` (`productid`),
  CONSTRAINT `fk_producto_extranjero_1` FOREIGN KEY (`productid`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto_extranjero`
--
INSERT INTO `producto_extranjero` (`productid`) VALUES 
 (1),
 (3),
 (12),
 (28),
 (42),
 (43),
 (66),
 (68),
 (107),
 (114),
 (161),
 (176),
 (180),
 (207),
 (223);

--
-- Definition of table `producto_nacional`
--

DROP TABLE IF EXISTS `producto_nacional`;
CREATE TABLE `producto_nacional` (
  `idproducto` int(11) NOT NULL,
  `cantpuestos` float DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto nacional_1` (`idproducto`),
  CONSTRAINT `fk_producto nacional_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto_nacional`
--
INSERT INTO `producto_nacional` (`idproducto`,`cantpuestos`) VALUES 
 (11,11),
 (12,12),
 (22,5),
 (23,8),
 (33,6),
 (34,2),
 (41,7),
 (42,34),
 (43,54),
 (56,76),
 (78,45),
 (89,9),
 (98,22),
 (99,67),
 (100,32),
 (104,5),
 (123,4),
 (200,31),
 (206,7);

--
-- Definition of table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `idprovincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprovincia`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provincia`
--
INSERT INTO `provincia` (`idprovincia`,`nombre`) VALUES 
 (1,'Buenos Aires'),
 (2,'Catamarca'),
 (3,'Chaco'),
 (4,'Chubut'),
 (5,'Cordoba'),
 (6,'Corrientes'),
 (7,'Entre Rios'),
 (8,'Formosa'),
 (9,'Jujuy'),
 (10,'La Pampa'),
 (11,'La Rioja'),
 (12,'Mendoza'),
 (13,'Misiones'),
 (14,'Neuquen'),
 (15,'Rio Negro'),
 (16,'Salta'),
 (17,'San Juan'),
 (18,'San Luis'),
 (19,'Santa Cruz'),
 (20,'Santa Fe'),
 (21,'Santiago del Estero'),
 (22,'Tierra del Fuego'),
 (23,'Tucuman');

--
-- Definition of table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
CREATE TABLE `rubro` (
  `idrubro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrubro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rubro`
--
INSERT INTO `rubro` (`idrubro`,`nombre`) VALUES 
 (1,'Ganaderia'),
 (2,'Alimento'),
 (3,'Bebida'),
 (4,'Agropecuario'),
 (5,'Pesca');

--
-- Definition of table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE `tipo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idorganismo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtipo`),
  KEY `fk_tipo_1` (`idorganismo`),
  CONSTRAINT `fk_tipo_1` FOREIGN KEY (`idorganismo`) REFERENCES `organismo` (`idorganismo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo`
--
INSERT INTO `tipo` (`idtipo`,`nombre`,`idorganismo`) VALUES 
 (1,'monetaria',1),
 (2,'vencimiento',2),
 (3,'ingrediente',3),
 (4,'vacunacion',2);

--
-- Definition of table `udemedida`
--

DROP TABLE IF EXISTS `udemedida`;
CREATE TABLE `udemedida` (
  `udemedida` varchar(8) NOT NULL,
  PRIMARY KEY (`udemedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `udemedida`
--
INSERT INTO `udemedida` (`udemedida`) VALUES 
 ('cm'),
 ('g'),
 ('kg'),
 ('km'),
 ('l'),
 ('m'),
 ('ml'),
 ('tn');

--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `nombreusuario` char(30) NOT NULL,
  PRIMARY KEY (`nombreusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
