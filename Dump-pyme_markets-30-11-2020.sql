-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.19 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para pyme_markets
CREATE DATABASE IF NOT EXISTS `pyme_markets` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pyme_markets`;

-- Volcando estructura para tabla pyme_markets.admin_user_profile
CREATE TABLE IF NOT EXISTS `admin_user_profile` (
  `AUP_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AUP_Name` varchar(45) DEFAULT NULL,
  `AUP_Last_Name` varchar(45) DEFAULT NULL,
  `AUP_NIF` varchar(45) DEFAULT '0',
  `AUP_Country` varchar(45) DEFAULT NULL,
  `AUP_Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AUP_Id`),
  UNIQUE KEY `PUP_NIF_UNIQUE` (`AUP_NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.admin_user_profile: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_profile` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.category_product
CREATE TABLE IF NOT EXISTS `category_product` (
  `CatProd_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `CatProd_SubCat_Id` smallint unsigned DEFAULT NULL,
  `CatProd_Name` varchar(45) DEFAULT NULL,
  `CatProd_Icon_Url` varchar(45) DEFAULT NULL,
  `CatProd_Search_Url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CatProd_Id`),
  UNIQUE KEY `CatProd_Id_UNIQUE` (`CatProd_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.category_product: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT IGNORE INTO `category_product` (`CatProd_Id`, `CatProd_SubCat_Id`, `CatProd_Name`, `CatProd_Icon_Url`, `CatProd_Search_Url`) VALUES
	(2, NULL, 'Comida Rapida', '../../assets/icons-category/comida-rapida', '/comida-rapida'),
	(3, NULL, 'Verano Mujer', '../../assets/icons-category/verano-mujer', '/verano-mujer'),
	(4, NULL, 'Verano Hombre', '../../assets/icons-category/verano-hombre', '/verano-hombre'),
	(5, NULL, 'Outdor', '../../assets/icons-category/outdoor', '/outdoor'),
	(6, NULL, 'Cafe', '../../assets/icons-category/cafe', '/cafe'),
	(7, NULL, 'Hoteleria', '../../assets/icons-category/hoteleria', '/hoteleria'),
	(8, NULL, 'Joyeria', '../../assets/icons-category/joyeria', '/joyeria'),
	(9, NULL, 'Alcohol', '../../assets/icons-category/alcohol', '/alcohol'),
	(10, NULL, 'Disfraces', '../../assets/icons-category/disfraces', '/disfraces');
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.payment_user_config
CREATE TABLE IF NOT EXISTS `payment_user_config` (
  `PUC_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PUC_UsrAcc_Id` bigint unsigned NOT NULL,
  `PUC_Card_Type` varchar(45) DEFAULT NULL,
  `PUC_Number_Config` tinyint unsigned NOT NULL,
  PRIMARY KEY (`PUC_Id`),
  KEY `FK_PUC_UserAccount_idx` (`PUC_UsrAcc_Id`),
  CONSTRAINT `FK_PUC_UserAccount` FOREIGN KEY (`PUC_UsrAcc_Id`) REFERENCES `users_account` (`UsrAcc_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.payment_user_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `payment_user_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_user_config` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.product
CREATE TABLE IF NOT EXISTS `product` (
  `Product_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Product_PymeProf_Id` bigint unsigned NOT NULL,
  `Product_CatProd_Id` smallint unsigned NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Product_Description` varchar(100) DEFAULT NULL,
  `Product_Img_Url` varchar(150) DEFAULT NULL,
  `Product_Search_Url` varchar(150) DEFAULT NULL,
  `Product_Unit_Price` decimal(10,2) unsigned NOT NULL,
  `Product_Offer` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `Product_Date_Created` date DEFAULT NULL,
  `Product_Last_Update` date DEFAULT NULL,
  `Product_Is_Free_Shipping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Product_Id`),
  KEY `FK_Product_PymeProf_idx` (`Product_PymeProf_Id`),
  KEY `FK_Product_CatProd_idx` (`Product_CatProd_Id`),
  CONSTRAINT `FK_Product_CatProd` FOREIGN KEY (`Product_CatProd_Id`) REFERENCES `category_product` (`CatProd_Id`),
  CONSTRAINT `FK_Product_PymeProf` FOREIGN KEY (`Product_PymeProf_Id`) REFERENCES `pyme_profile` (`PymeProf_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.product: ~56 rows (aproximadamente)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`Product_Id`, `Product_PymeProf_Id`, `Product_CatProd_Id`, `Product_Name`, `Product_Description`, `Product_Img_Url`, `Product_Search_Url`, `Product_Unit_Price`, `Product_Offer`, `Product_Date_Created`, `Product_Last_Update`, `Product_Is_Free_Shipping`) VALUES
	(75, 1, 6, 'Cafe Nescafe Fina Selección Origins Frasco 100g  X5 Sabores', 'Cafe Nescafe Fina Selección Origins Frasco 100g  X5 Sabores', 'https://http2.mlstatic.com/cafe-nescafe-fina-seleccion-origins-frasco-100g-x5-sabores-D_NQ_NP_704560-MLC43834391833_102020-V.jpg', 'cafe-nescafe-fina-seleccion-origins-frasco-100g-x5-sabores-D_NQ_NP_704560-MLC43834391833_102020-V', 25990.00, 13.00, '2020-11-21', '2020-11-21', 1),
	(76, 2, 6, 'Café Starbucks Variedades Surtidas 3 X 250 Gramos', 'Café Starbucks Variedades Surtidas 3 X 250 Gramos', 'https://http2.mlstatic.com/cafe-starbucks-variedades-surtidas-3-x-250-gramos-D_NQ_NP_622330-MLC43653682840_102020-V.jpg', 'cafe-starbucks-variedades-surtidas-3-x-250-gramos-D_NQ_NP_622330-MLC43653682840_102020-V', 27990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(77, 2, 6, '1kg Lavazza Expert Gusto Forte', '1kg Lavazza Expert Gusto Forte', 'https://http2.mlstatic.com/1kg-lavazza-expert-gusto-forte-D_NQ_NP_891359-MLC41159432368_032020-V.jpg', '1kg-lavazza-expert-gusto-forte-D_NQ_NP_891359-MLC41159432368_032020-V', 35000.00, 48.00, '2020-11-21', '2020-11-21', 0),
	(78, 2, 6, 'Café Lucaffe Mamma Lucia 1k 2x500g Grano Molido Envío Gratis', 'Café Lucaffe Mamma Lucia 1k 2x500g Grano Molido Envío Gratis', 'https://http2.mlstatic.com/cafe-lucaffe-mamma-lucia-1k-2x500g-grano-molido-envio-gratis-D_NQ_NP_804335-MLC43969147313_112020-V.jpg', 'cafe-lucaffe-mamma-lucia-1k-2x500g-grano-molido-envio-gratis-D_NQ_NP_804335-MLC43969147313_112020-V', 23990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(79, 1, 6, '1 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', '1 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', 'https://http2.mlstatic.com/1-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_676164-MLC44023446769_112020-V.jpg', '1-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_676164-MLC44023446769_112020-V', 17900.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(80, 1, 6, 'Café Nescafé® Tradición Tarro 400g Pack X2', 'Café Nescafé® Tradición Tarro 400g Pack X2', 'https://http2.mlstatic.com/cafe-nescafe-tradicion-tarro-400g-pack-x2-D_NQ_NP_957393-MLC43702017034_102020-V.jpg', 'cafe-nescafe-tradicion-tarro-400g-pack-x2-D_NQ_NP_957393-MLC43702017034_102020-V', 15990.00, 16.00, '2020-11-21', '2020-11-21', 0),
	(81, 2, 6, '!!oferta!!1kilo+200 Grs Café Sello Rojo (2bolsas 600 Grs) ', '!!oferta!!1kilo+200 Grs Café Sello Rojo (2bolsas 600 Grs) ', 'https://http2.mlstatic.com/oferta1kilo-200-grs-cafe-sello-rojo-2bolsas-600-grs-D_NQ_NP_736209-MLC43655073224_102020-V.jpg', 'oferta1kilo-200-grs-cafe-sello-rojo-2bolsas-600-grs-D_NQ_NP_736209-MLC43655073224_102020-V', 12000.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(82, 2, 6, 'Café Lucaffe Mamma Lucia 1k 2x500g Grano Molido Envío Gratis', 'Café Lucaffe Mamma Lucia 1k 2x500g Grano Molido Envío Gratis', 'https://http2.mlstatic.com/cafe-lucaffe-mamma-lucia-1k-2x500g-grano-molido-envio-gratis-D_NQ_NP_804335-MLC43969147313_112020-V.jpg', 'cafe-lucaffe-mamma-lucia-1k-2x500g-grano-molido-envio-gratis-D_NQ_NP_804335-MLC43969147313_112020-V', 23990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(83, 2, 6, '1 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', '1 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', 'https://http2.mlstatic.com/1-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_676164-MLC44023446769_112020-V.jpg', '1-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_676164-MLC44023446769_112020-V', 17900.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(84, 2, 6, 'Café Turco Tueste Especial  Kilo $13.990 Por Kilo', 'Café Turco Tueste Especial  Kilo $13.990 Por Kilo', 'https://http2.mlstatic.com/cafe-turco-tueste-especial-kilo-13990-por-kilo-D_NQ_NP_968604-MLC29033597923_122018-V.jpg', 'cafe-turco-tueste-especial-kilo-13990-por-kilo-D_NQ_NP_968604-MLC29033597923_122018-V', 14990.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(85, 1, 6, '1 Kg Café En Grano Mokador, Italia, Envío Gratis Por 2 Kg', '1 Kg Café En Grano Mokador, Italia, Envío Gratis Por 2 Kg', 'https://http2.mlstatic.com/1-kg-cafe-en-grano-mokador-italia-envio-gratis-por-2-kg-D_NQ_NP_913683-MLC31306802182_072019-V.jpg', '1-kg-cafe-en-grano-mokador-italia-envio-gratis-por-2-kg-D_NQ_NP_913683-MLC31306802182_072019-V', 13500.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(86, 1, 6, '2 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', '2 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', 'https://http2.mlstatic.com/2-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_677138-MLC44028767309_112020-V.jpg', '2-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_677138-MLC44028767309_112020-V', 33900.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(87, 2, 6, 'Cafe Colombiano Sello Rojo 600 Gramos', 'Cafe Colombiano Sello Rojo 600 Gramos', 'https://http2.mlstatic.com/cafe-colombiano-sello-rojo-600-gramos-D_NQ_NP_689226-MLC31998278501_082019-V.jpg', 'cafe-colombiano-sello-rojo-600-gramos-D_NQ_NP_689226-MLC31998278501_082019-V', 5800.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(88, 1, 6, 'Pack Café Colombiano Aguila Roja 500 Grs +sello Rojo 600grs', 'Pack Café Colombiano Aguila Roja 500 Grs +sello Rojo 600grs', 'https://http2.mlstatic.com/pack-cafe-colombiano-aguila-roja-500-grs-sello-rojo-600grs-D_NQ_NP_631447-MLC41387669553_042020-V.jpg', 'pack-cafe-colombiano-aguila-roja-500-grs-sello-rojo-600grs-D_NQ_NP_631447-MLC41387669553_042020-V', 12000.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(89, 2, 6, '1 K Cafe Grano Organico Etiopia Tueste Hoy 48% Off', '1 K Cafe Grano Organico Etiopia Tueste Hoy 48% Off', 'https://http2.mlstatic.com/1-k-cafe-grano-organico-etiopia-tueste-hoy-48-off-D_NQ_NP_854466-MLC41543490079_042020-V.jpg', '1-k-cafe-grano-organico-etiopia-tueste-hoy-48-off-D_NQ_NP_854466-MLC41543490079_042020-V', 20900.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(90, 1, 6, 'Café En Grano Entero Lucaffe Mamma Lucia 1kg Envío Gratis ', 'Café En Grano Entero Lucaffe Mamma Lucia 1kg Envío Gratis ', 'https://http2.mlstatic.com/cafe-en-grano-entero-lucaffe-mamma-lucia-1kg-envio-gratis-D_NQ_NP_633259-MLC31212183796_062019-V.jpg', 'cafe-en-grano-entero-lucaffe-mamma-lucia-1kg-envio-gratis-D_NQ_NP_633259-MLC31212183796_062019-V', 23990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(91, 2, 6, 'Café Nescafé® Fina Selección Alta Intensidad 100g Pack X3', 'Café Nescafé® Fina Selección Alta Intensidad 100g Pack X3', 'https://http2.mlstatic.com/cafe-nescafe-fina-seleccion-alta-intensidad-100g-pack-x3-D_NQ_NP_674909-MLC43772045416_102020-V.jpg', 'cafe-nescafe-fina-seleccion-alta-intensidad-100g-pack-x3-D_NQ_NP_674909-MLC43772045416_102020-V', 15790.00, 15.00, '2020-11-21', '2020-11-21', 0),
	(92, 1, 6, 'Café Nescafé® Fina Selección Alta Rica Frasco 100g Pack X3', 'Café Nescafé® Fina Selección Alta Rica Frasco 100g Pack X3', 'https://http2.mlstatic.com/cafe-nescafe-fina-seleccion-alta-rica-frasco-100g-pack-x3-D_NQ_NP_902541-MLC43917165380_102020-V.jpg', 'cafe-nescafe-fina-seleccion-alta-rica-frasco-100g-pack-x3-D_NQ_NP_902541-MLC43917165380_102020-V', 15790.00, 15.00, '2020-11-21', '2020-11-21', 0),
	(93, 2, 6, '2 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', '2 Kg Cafe Orgánico Alto Amazonas Lanzamiento -60% Off Grano', 'https://http2.mlstatic.com/2-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_677138-MLC44028767309_112020-V.jpg', '2-kg-cafe-organico-alto-amazonas-lanzamiento-60-off-grano-D_NQ_NP_677138-MLC44028767309_112020-V', 33900.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(94, 2, 6, '1 K Cafe Grano Organico Etiopia Tueste Hoy 48% Off', '1 K Cafe Grano Organico Etiopia Tueste Hoy 48% Off', 'https://http2.mlstatic.com/1-k-cafe-grano-organico-etiopia-tueste-hoy-48-off-D_NQ_NP_854466-MLC41543490079_042020-V.jpg', '1-k-cafe-grano-organico-etiopia-tueste-hoy-48-off-D_NQ_NP_854466-MLC41543490079_042020-V', 20900.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(95, 1, 6, ' Pack Pack Get Up, Stand Up 227grs + Prensa Francesa 600ml', ' Pack Pack Get Up, Stand Up 227grs + Prensa Francesa 600ml', 'https://http2.mlstatic.com/pack-pack-get-up-stand-up-227grs-prensa-francesa-600ml-D_NQ_NP_794394-MLC42079552958_062020-V.jpg', 'pack-pack-get-up-stand-up-227grs-prensa-francesa-600ml-D_NQ_NP_794394-MLC42079552958_062020-V', 23990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(96, 2, 6, '3kg Cappuccinos, Capuchinos A Elección, Mocachino', '3kg Cappuccinos, Capuchinos A Elección, Mocachino', 'https://http2.mlstatic.com/3kg-cappuccinos-capuchinos-a-eleccion-mocachino-D_NQ_NP_871260-MLC44116051068_112020-V.jpg', '3kg-cappuccinos-capuchinos-a-eleccion-mocachino-D_NQ_NP_871260-MLC44116051068_112020-V', 19990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(97, 1, 6, 'Café Nescafé® Doble Choca Moka 8x23g X3 Cajas', 'Café Nescafé® Doble Choca Moka 8x23g X3 Cajas', 'https://http2.mlstatic.com/cafe-nescafe-doble-choca-moka-8x23g-x3-cajas-D_NQ_NP_966749-MLC43620948842_092020-V.jpg', 'cafe-nescafe-doble-choca-moka-8x23g-x3-cajas-D_NQ_NP_966749-MLC43620948842_092020-V', 8399.00, 20.00, '2020-11-21', '2020-11-23', 0),
	(98, 2, 6, 'Café Lucaffe Italiano 2 Tarros 250gr Grano Molido Envío Free', 'Café Lucaffe Italiano 2 Tarros 250gr Grano Molido Envío Free', 'https://http2.mlstatic.com/cafe-lucaffe-italiano-2-tarros-250gr-grano-molido-envio-free-D_NQ_NP_857235-MLC43819292285_102020-V.jpg', 'cafe-lucaffe-italiano-2-tarros-250gr-grano-molido-envio-free-D_NQ_NP_857235-MLC43819292285_102020-V', 25990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(99, 1, 6, 'Café Grano Montañes 1 Kilo Tostado En Chile Despacho Gratis', 'Café Grano Montañes 1 Kilo Tostado En Chile Despacho Gratis', 'https://http2.mlstatic.com/cafe-grano-montanes-1-kilo-tostado-en-chile-despacho-gratis-D_NQ_NP_766154-MLC43442225065_092020-V.jpg', 'cafe-grano-montanes-1-kilo-tostado-en-chile-despacho-gratis-D_NQ_NP_766154-MLC43442225065_092020-V', 19990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(100, 2, 6, 'Café En Grano Entero Lucaffe Mr. Exclusive 1kg Envío Gratis', 'Café En Grano Entero Lucaffe Mr. Exclusive 1kg Envío Gratis', 'https://http2.mlstatic.com/cafe-en-grano-entero-lucaffe-mr-exclusive-1kg-envio-gratis-D_NQ_NP_666638-MLC43595281241_092020-V.jpg', 'cafe-en-grano-entero-lucaffe-mr-exclusive-1kg-envio-gratis-D_NQ_NP_666638-MLC43595281241_092020-V', 32990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(101, 1, 6, 'Café Nescafé® Vegan Macchiato Almendra Y Coco X4 Cajas', 'Café Nescafé® Vegan Macchiato Almendra Y Coco X4 Cajas', 'https://http2.mlstatic.com/cafe-nescafe-vegan-macchiato-almendra-y-coco-x4-cajas-D_NQ_NP_926409-MLC43772098029_102020-V.jpg', 'cafe-nescafe-vegan-macchiato-almendra-y-coco-x4-cajas-D_NQ_NP_926409-MLC43772098029_102020-V', 12900.00, 15.00, '2020-11-21', '2020-11-21', 0),
	(102, 2, 6, 'Café Nescafé® Capuccino 10x14g X3 Cajas', 'Café Nescafé® Capuccino 10x14g X3 Cajas', 'https://http2.mlstatic.com/cafe-nescafe-capuccino-10x14g-x3-cajas-D_NQ_NP_666588-MLC43621011509_092020-V.jpg', 'cafe-nescafe-capuccino-10x14g-x3-cajas-D_NQ_NP_666588-MLC43621011509_092020-V', 9690.00, 15.00, '2020-11-21', '2020-11-21', 0),
	(103, 2, 6, 'Nescafé Tradición Tarro 420g', 'Nescafé Tradición Tarro 420g', 'https://http2.mlstatic.com/nescafe-tradicion-tarro-420g-D_NQ_NP_972134-MLC41720495733_052020-V.jpg', 'nescafe-tradicion-tarro-420g-D_NQ_NP_972134-MLC41720495733_052020-V', 9039.00, 13.00, '2020-11-21', '2020-11-21', 0),
	(104, 1, 6, 'Café En Grano Entero Lucaffe Mamma Lucia 1kg Envío Gratis ', 'Café En Grano Entero Lucaffe Mamma Lucia 1kg Envío Gratis ', 'https://http2.mlstatic.com/cafe-en-grano-entero-lucaffe-mamma-lucia-1kg-envio-gratis-D_NQ_NP_633259-MLC31212183796_062019-V.jpg', 'cafe-en-grano-entero-lucaffe-mamma-lucia-1kg-envio-gratis-D_NQ_NP_633259-MLC31212183796_062019-V', 23990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(105, 1, 6, '3kg Cappuccinos, Capuchinos A Elección, Mocachino', '3kg Cappuccinos, Capuchinos A Elección, Mocachino', 'https://http2.mlstatic.com/3kg-cappuccinos-capuchinos-a-eleccion-mocachino-D_NQ_NP_871260-MLC44116051068_112020-V.jpg', '3kg-cappuccinos-capuchinos-a-eleccion-mocachino-D_NQ_NP_871260-MLC44116051068_112020-V', 19990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(106, 1, 6, '3 Kg. Capuccino, Mokaccino, Máquinas Vending', '3 Kg. Capuccino, Mokaccino, Máquinas Vending', 'https://http2.mlstatic.com/3-kg-capuccino-mokaccino-maquinas-vending-D_NQ_NP_966262-MLC42678325746_072020-V.jpg', '3-kg-capuccino-mokaccino-maquinas-vending-D_NQ_NP_966262-MLC42678325746_072020-V', 19990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(107, 2, 6, 'Cafe Sello Rojo Grano Molido 600 Grs, 100% Colombiano', 'Cafe Sello Rojo Grano Molido 600 Grs, 100% Colombiano', 'https://http2.mlstatic.com/cafe-sello-rojo-grano-molido-600-grs-100-colombiano-D_NQ_NP_726100-MLC31212448386_062019-V.jpg', 'cafe-sello-rojo-grano-molido-600-grs-100-colombiano-D_NQ_NP_726100-MLC31212448386_062019-V', 5700.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(108, 1, 6, 'Café Starbucks Espresso 5 Lbs (2,3 Kilogramos), Dark Roast.', 'Café Starbucks Espresso 5 Lbs (2,3 Kilogramos), Dark Roast.', 'https://http2.mlstatic.com/cafe-starbucks-espresso-5-lbs-23-kilogramos-dark-roast-D_NQ_NP_873651-MLC41584354867_042020-V.jpg', 'cafe-starbucks-espresso-5-lbs-23-kilogramos-dark-roast-D_NQ_NP_873651-MLC41584354867_042020-V', 44990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(109, 1, 6, 'Café Nescafé® Tres Sabores Lacteados X3 Cajas', 'Café Nescafé® Tres Sabores Lacteados X3 Cajas', 'https://http2.mlstatic.com/cafe-nescafe-tres-sabores-lacteados-x3-cajas-D_NQ_NP_991701-MLC43772174718_102020-V.jpg', 'cafe-nescafe-tres-sabores-lacteados-x3-cajas-D_NQ_NP_991701-MLC43772174718_102020-V', 9990.00, 20.00, '2020-11-21', '2020-11-21', 0),
	(110, 1, 6, 'Café Lavazza Expert Gusto Forte Grano Entero 1kg', 'Café Lavazza Expert Gusto Forte Grano Entero 1kg', 'https://http2.mlstatic.com/cafe-lavazza-expert-gusto-forte-grano-entero-1kg-D_NQ_NP_689202-MLC41891460242_052020-V.jpg', 'cafe-lavazza-expert-gusto-forte-grano-entero-1kg-D_NQ_NP_689202-MLC41891460242_052020-V', 18990.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(111, 2, 6, 'Café Starbucks® Medium Roast 90g', 'Café Starbucks® Medium Roast 90g', 'https://http2.mlstatic.com/cafe-starbucks-medium-roast-90g-D_NQ_NP_816348-MLC42546678089_072020-V.jpg', 'cafe-starbucks-medium-roast-90g-D_NQ_NP_816348-MLC42546678089_072020-V', 6990.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(112, 2, 6, 'Café Molido Montañes 1 Kilo Tostado En Chile Despacho Gratis', 'Café Molido Montañes 1 Kilo Tostado En Chile Despacho Gratis', 'https://http2.mlstatic.com/cafe-molido-montanes-1-kilo-tostado-en-chile-despacho-gratis-D_NQ_NP_712607-MLC43442423651_092020-V.jpg', 'cafe-molido-montanes-1-kilo-tostado-en-chile-despacho-gratis-D_NQ_NP_712607-MLC43442423651_092020-V', 19990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(113, 2, 6, '1 Bolsas De Preparados En Polvo Para Helados Soft', '1 Bolsas De Preparados En Polvo Para Helados Soft', 'https://http2.mlstatic.com/1-bolsas-de-preparados-en-polvo-para-helados-soft-D_NQ_NP_623575-MLC32734760008_112019-V.jpg', '1-bolsas-de-preparados-en-polvo-para-helados-soft-D_NQ_NP_623575-MLC32734760008_112019-V', 2570.00, 0.00, '2020-11-21', '2020-11-23', 0),
	(114, 1, 6, '1 Kg Lavazza Gusto Forte + 100 Grs. Il Filtro Classico Grano', '1 Kg Lavazza Gusto Forte + 100 Grs. Il Filtro Classico Grano', 'https://http2.mlstatic.com/1-kg-lavazza-gusto-forte-100-grs-il-filtro-classico-grano-D_NQ_NP_991692-MLC43737766256_102020-V.jpg', '1-kg-lavazza-gusto-forte-100-grs-il-filtro-classico-grano-D_NQ_NP_991692-MLC43737766256_102020-V', 38700.00, 40.00, '2020-11-21', '2020-11-21', 1),
	(115, 2, 6, 'Café Italiano Lavazza Grand Hotel 1 Kg Molido Envio Gratis', 'Café Italiano Lavazza Grand Hotel 1 Kg Molido Envio Gratis', 'https://http2.mlstatic.com/cafe-italiano-lavazza-grand-hotel-1-kg-molido-envio-gratis-D_NQ_NP_606180-MLC41514848665_042020-V.jpg', 'cafe-italiano-lavazza-grand-hotel-1-kg-molido-envio-gratis-D_NQ_NP_606180-MLC41514848665_042020-V', 20990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(116, 1, 6, 'Café Nescafé® Fina Selección Baja Intensidad 100g Pack X3', 'Café Nescafé® Fina Selección Baja Intensidad 100g Pack X3', 'https://http2.mlstatic.com/cafe-nescafe-fina-seleccion-baja-intensidad-100g-pack-x3-D_NQ_NP_846326-MLC43781945932_102020-V.jpg', 'cafe-nescafe-fina-seleccion-baja-intensidad-100g-pack-x3-D_NQ_NP_846326-MLC43781945932_102020-V', 15790.00, 15.00, '2020-11-21', '2020-11-21', 0),
	(117, 2, 6, 'Café Liofilizado Juan Valdez 190g. Agronewen', 'Café Liofilizado Juan Valdez 190g. Agronewen', 'https://http2.mlstatic.com/cafe-liofilizado-juan-valdez-190g-agronewen-D_NQ_NP_899663-MLC43028090523_082020-V.jpg', 'cafe-liofilizado-juan-valdez-190g-agronewen-D_NQ_NP_899663-MLC43028090523_082020-V', 15900.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(118, 1, 6, 'Café Starbucks Variedades Surtidas 6 X 250 Gramos.', 'Café Starbucks Variedades Surtidas 6 X 250 Gramos.', 'https://http2.mlstatic.com/cafe-starbucks-variedades-surtidas-6-x-250-gramos-D_NQ_NP_837813-MLC42050304569_062020-V.jpg', 'cafe-starbucks-variedades-surtidas-6-x-250-gramos-D_NQ_NP_837813-MLC42050304569_062020-V', 49990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(119, 1, 6, 'Café Sello Rojo 1 Kg (2 De 500gr) Molido 100% Colombiano ', 'Café Sello Rojo 1 Kg (2 De 500gr) Molido 100% Colombiano ', 'https://http2.mlstatic.com/cafe-sello-rojo-1-kg-2-de-500gr-molido-100-colombiano-D_NQ_NP_991578-MLC43747149298_102020-V.jpg', 'cafe-sello-rojo-1-kg-2-de-500gr-molido-100-colombiano-D_NQ_NP_991578-MLC43747149298_102020-V', 10490.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(120, 1, 6, 'Café Starbucks® Dark Roast 90g', 'Café Starbucks® Dark Roast 90g', 'https://http2.mlstatic.com/cafe-starbucks-dark-roast-90g-D_NQ_NP_786063-MLC42546481757_072020-V.jpg', 'cafe-starbucks-dark-roast-90g-D_NQ_NP_786063-MLC42546481757_072020-V', 6990.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(121, 1, 6, 'Café Sello Rojo + Águila Roja Molidos 500 Gr Cada Uno ', 'Café Sello Rojo + Águila Roja Molidos 500 Gr Cada Uno ', 'https://http2.mlstatic.com/cafe-sello-rojo-aguila-roja-molidos-500-gr-cada-uno-D_NQ_NP_818161-MLC43747117727_102020-V.jpg', 'cafe-sello-rojo-aguila-roja-molidos-500-gr-cada-uno-D_NQ_NP_818161-MLC43747117727_102020-V', 10990.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(122, 1, 6, 'Café Mokador Extra Cream 1 Kg En Grano + 100 Grs Lavazza', 'Café Mokador Extra Cream 1 Kg En Grano + 100 Grs Lavazza', 'https://http2.mlstatic.com/cafe-mokador-extra-cream-1-kg-en-grano-100-grs-lavazza-D_NQ_NP_887776-MLC43737027102_102020-V.jpg', 'cafe-mokador-extra-cream-1-kg-en-grano-100-grs-lavazza-D_NQ_NP_887776-MLC43737027102_102020-V', 19990.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(123, 1, 6, 'Cafe Colombiano Aguila Roja 500 Gramos', 'Cafe Colombiano Aguila Roja 500 Gramos', 'https://http2.mlstatic.com/cafe-colombiano-aguila-roja-500-gramos-D_NQ_NP_610136-MLC31212695763_062019-V.jpg', 'cafe-colombiano-aguila-roja-500-gramos-D_NQ_NP_610136-MLC31212695763_062019-V', 5800.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(124, 2, 6, 'Café Arábica De Alturas Ciao Premium Turco 1 Kilo $13.990 ', 'Café Arábica De Alturas Ciao Premium Turco 1 Kilo $13.990 ', 'https://http2.mlstatic.com/cafe-arabica-de-alturas-ciao-premium-turco-1-kilo-13990-D_NQ_NP_743187-MLC41524477145_042020-V.jpg', 'cafe-arabica-de-alturas-ciao-premium-turco-1-kilo-13990-D_NQ_NP_743187-MLC41524477145_042020-V', 13990.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(125, 2, 6, '4kg Capuccinos Variados ,vainilla Mocachino, Despacho Gratis', '4kg Capuccinos Variados ,vainilla Mocachino, Despacho Gratis', 'https://http2.mlstatic.com/4kg-capuccinos-variados-vainilla-mocachino-despacho-gratis-D_NQ_NP_912392-MLC43556788911_092020-V.jpg', '4kg-capuccinos-variados-vainilla-mocachino-despacho-gratis-D_NQ_NP_912392-MLC43556788911_092020-V', 26354.00, 0.00, '2020-11-21', '2020-11-21', 1),
	(126, 2, 6, 'Café Nescafé® Fina Selección Colombia 100g Pack X3', 'Café Nescafé® Fina Selección Colombia 100g Pack X3', 'https://http2.mlstatic.com/cafe-nescafe-fina-seleccion-colombia-100g-pack-x3-D_NQ_NP_748935-MLC43781971559_102020-V.jpg', 'cafe-nescafe-fina-seleccion-colombia-100g-pack-x3-D_NQ_NP_748935-MLC43781971559_102020-V', 15790.00, 15.00, '2020-11-21', '2020-11-21', 0),
	(127, 1, 6, 'Café Starbucks Komodo Descafeinado 250g  - Envío Inmediato', 'Café Starbucks Komodo Descafeinado 250g  - Envío Inmediato', 'https://http2.mlstatic.com/cafe-starbucks-komodo-descafeinado-250g-envio-inmediato-D_NQ_NP_726884-MLC43582144909_092020-V.jpg', 'cafe-starbucks-komodo-descafeinado-250g-envio-inmediato-D_NQ_NP_726884-MLC43582144909_092020-V', 8000.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(128, 2, 6, '1kg Capuchino (capuccino) Maquina Vending, Nescafe Alegria', '1kg Capuchino (capuccino) Maquina Vending, Nescafe Alegria', 'https://http2.mlstatic.com/1kg-capuchino-capuccino-maquina-vending-nescafe-alegria-D_NQ_NP_781135-MLC29211831191_012019-V.jpg', '1kg-capuchino-capuccino-maquina-vending-nescafe-alegria-D_NQ_NP_781135-MLC29211831191_012019-V', 6890.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(129, 1, 6, 'Cafe Mokador Extra Crema', 'Cafe Mokador Extra Crema', 'https://http2.mlstatic.com/cafe-mokador-extra-crema-D_NQ_NP_941804-MLC41633545322_052020-V.jpg', 'cafe-mokador-extra-crema-D_NQ_NP_941804-MLC41633545322_052020-V', 9900.00, 0.00, '2020-11-21', '2020-11-21', 0),
	(130, 2, 6, '1k De Café Colombiano Aguila Roja Molido Tostado ', '1k De Café Colombiano Aguila Roja Molido Tostado ', 'https://http2.mlstatic.com/1k-de-cafe-colombiano-aguila-roja-molido-tostado-D_NQ_NP_960796-MLC43735060590_102020-V.jpg', '1k-de-cafe-colombiano-aguila-roja-molido-tostado-D_NQ_NP_960796-MLC43735060590_102020-V', 11900.00, 0.00, '2020-11-21', '2020-11-21', 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.product_details
CREATE TABLE IF NOT EXISTS `product_details` (
  `ProdDet_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ProdDet_Prod_Id` bigint unsigned NOT NULL,
  `ProdDet_Description` varchar(200) DEFAULT NULL,
  `ProdDet_Stock` mediumint NOT NULL DEFAULT '0',
  `ProdDet_Total_Sold` mediumint NOT NULL DEFAULT '0',
  `ProdDet_Status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT 'Status\n1 = Habilitado\n2 = Deshabilitado\n3 = Suspendido\n4 = NO Stock\n',
  `ProdDet_Galery_Url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProdDet_Id`),
  KEY `FK_ProdDet_Product_idx` (`ProdDet_Prod_Id`),
  CONSTRAINT `FK_ProdDet_Product` FOREIGN KEY (`ProdDet_Prod_Id`) REFERENCES `product` (`Product_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.product_details: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.public_user_profile
CREATE TABLE IF NOT EXISTS `public_user_profile` (
  `PUP_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PUP_Name` varchar(45) DEFAULT NULL,
  `PUP_Last_Name` varchar(45) DEFAULT NULL,
  `PUP_NIF` varchar(45) DEFAULT '0',
  `PUP_Country` varchar(45) DEFAULT NULL,
  `PUP_Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PUP_Id`),
  UNIQUE KEY `PUP_NIF_UNIQUE` (`PUP_NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.public_user_profile: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `public_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_user_profile` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.pyme_profile
CREATE TABLE IF NOT EXISTS `pyme_profile` (
  `PymeProf_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PymeProf_Name` varchar(45) NOT NULL,
  `PymeProf_Tags` varchar(45) DEFAULT NULL,
  `PymeProf_Icon_Url` varchar(45) DEFAULT NULL,
  `PymeProf_Img_Url` varchar(45) DEFAULT NULL,
  `PymeProf_Search_Url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PymeProf_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.pyme_profile: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pyme_profile` DISABLE KEYS */;
INSERT IGNORE INTO `pyme_profile` (`PymeProf_Id`, `PymeProf_Name`, `PymeProf_Tags`, `PymeProf_Icon_Url`, `PymeProf_Img_Url`, `PymeProf_Search_Url`) VALUES
	(1, 'Pyme Prueba', 'pruba, alcohol, motita', '../assets/icons/pymePruebaIcon', '../assets/img/pymePruebaImg', '/pymePrueba'),
	(2, 'Nescafe', 'cafe, cocina, cafetera', '../assets/icons/Nescafe', '../assets/img/pymes/Nescafe', '/Nescafe'),
	(3, 'Starbucks', 'cafe, cocina, cafetera, fino', '../assets/icons/Starbucks', '../assets/img/pymes/Starbucks', '/Starbucks');
/*!40000 ALTER TABLE `pyme_profile` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.sales_invoice
CREATE TABLE IF NOT EXISTS `sales_invoice` (
  `SalInv_Id` int NOT NULL,
  `SalInv_UsrAcc_Id` bigint unsigned NOT NULL,
  `SalInv_Products` json NOT NULL,
  `SalInv_Transaction_State` tinyint unsigned NOT NULL DEFAULT '0',
  `SalInv_State` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SalInv_Id`),
  KEY `FK_SalesInv_UsrAcc_idx` (`SalInv_UsrAcc_Id`),
  CONSTRAINT `FK_SalesInv_UsrAcc` FOREIGN KEY (`SalInv_UsrAcc_Id`) REFERENCES `users_account` (`UsrAcc_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.sales_invoice: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.shipping_user_config
CREATE TABLE IF NOT EXISTS `shipping_user_config` (
  `SUC_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SUC_UsrAcc_Id` bigint unsigned NOT NULL,
  `SUC_Number_Config` tinyint unsigned NOT NULL,
  `SUC_Country_Code` varchar(2) NOT NULL,
  `SUC_City_id` int NOT NULL,
  `SUC_Address` varchar(45) NOT NULL,
  PRIMARY KEY (`SUC_Id`),
  KEY `FK_SUC_UserAccount_idx` (`SUC_UsrAcc_Id`),
  CONSTRAINT `FK_SUC_UserAccount` FOREIGN KEY (`SUC_UsrAcc_Id`) REFERENCES `users_account` (`UsrAcc_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.shipping_user_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `shipping_user_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_user_config` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.shopping_cart
CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `ShopCart_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ShopCart_UsrAcc_Id` bigint unsigned NOT NULL,
  `ShopCart_Products` json NOT NULL,
  PRIMARY KEY (`ShopCart_Id`),
  KEY `FK_ShoppCart_UsrAcc_idx` (`ShopCart_UsrAcc_Id`),
  CONSTRAINT `FK_ShoppCart_UsrAcc` FOREIGN KEY (`ShopCart_UsrAcc_Id`) REFERENCES `users_account` (`UsrAcc_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.shopping_cart: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;

-- Volcando estructura para tabla pyme_markets.users_account
CREATE TABLE IF NOT EXISTS `users_account` (
  `UsrAcc_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UsrAcc_PymeProfile_Id` bigint unsigned NOT NULL,
  `UsrAcc_PUP_Id` bigint unsigned DEFAULT NULL,
  `UsrAcc_AUP_Id` bigint unsigned DEFAULT NULL,
  `UsrAcc_Status` tinyint unsigned NOT NULL DEFAULT '1',
  `UsrAcc_Privileges_Id` int unsigned NOT NULL,
  PRIMARY KEY (`UsrAcc_Id`),
  KEY `FK_UserAccount_PymeProf_idx` (`UsrAcc_PymeProfile_Id`),
  KEY `FK_UserAccount_PUP_idx` (`UsrAcc_PUP_Id`),
  KEY `FK_UserAccount_AUP_idx` (`UsrAcc_AUP_Id`),
  CONSTRAINT `FK_UserAccount_AUP` FOREIGN KEY (`UsrAcc_AUP_Id`) REFERENCES `admin_user_profile` (`AUP_Id`),
  CONSTRAINT `FK_UserAccount_PUP` FOREIGN KEY (`UsrAcc_PUP_Id`) REFERENCES `public_user_profile` (`PUP_Id`),
  CONSTRAINT `FK_UserAccount_PymeProf` FOREIGN KEY (`UsrAcc_PymeProfile_Id`) REFERENCES `pyme_profile` (`PymeProf_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pyme_markets.users_account: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_account` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
