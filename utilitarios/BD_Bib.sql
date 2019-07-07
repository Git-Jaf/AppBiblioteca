-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.21 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_biblioteca
CREATE DATABASE IF NOT EXISTS `bd_biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_biblioteca`;

-- Volcando estructura para tabla bd_biblioteca.libro
CREATE TABLE IF NOT EXISTS `libro` (
  `isbn` int(13) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `precio` double(7,2) NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_biblioteca.libro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;

-- Volcando estructura para tabla bd_biblioteca.prestamo
CREATE TABLE IF NOT EXISTS `prestamo` (
  `codigo` int(6) NOT NULL AUTO_INCREMENT,
  `codUsuario` int(6) NOT NULL DEFAULT '0',
  `isbnLibro` int(13) NOT NULL DEFAULT '0',
  `fechaPrestamo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fechaDevolucion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  KEY `FKPrestamoUsuario` (`codUsuario`),
  KEY `FKPrestamoLibro` (`isbnLibro`),
  CONSTRAINT `FKPrestamoLibro` FOREIGN KEY (`isbnLibro`) REFERENCES `libro` (`isbn`),
  CONSTRAINT `FKPrestamoUsuario` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_biblioteca.prestamo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;

-- Volcando estructura para tabla bd_biblioteca.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `carrera_prof` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_biblioteca.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
