-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.31


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pruebaxal
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ pruebaxal;
USE pruebaxal;

--
-- Table structure for table `pruebaxal`.`aerolineas`
--

DROP TABLE IF EXISTS `aerolineas`;
CREATE TABLE `aerolineas` (
  `ID_AEROLINEA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_AEROLINEA` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_AEROLINEA`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruebaxal`.`aerolineas`
--

/*!40000 ALTER TABLE `aerolineas` DISABLE KEYS */;
INSERT INTO `aerolineas` (`ID_AEROLINEA`,`NOMBRE_AEROLINEA`) VALUES 
 (1,'volaris'),
 (2,'Aeromar'),
 (3,'Interjet'),
 (4,'Aeromexico');
/*!40000 ALTER TABLE `aerolineas` ENABLE KEYS */;


--
-- Table structure for table `pruebaxal`.`aeropuertos`
--

DROP TABLE IF EXISTS `aeropuertos`;
CREATE TABLE `aeropuertos` (
  `ID_AEROPUERTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_AEROPUERTO` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_AEROPUERTO`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruebaxal`.`aeropuertos`
--

/*!40000 ALTER TABLE `aeropuertos` DISABLE KEYS */;
INSERT INTO `aeropuertos` (`ID_AEROPUERTO`,`NOMBRE_AEROPUERTO`) VALUES 
 (1,'Benito Jure'),
 (2,'Guanajuato'),
 (3,'La Paz'),
 (4,'Oaxaca');
/*!40000 ALTER TABLE `aeropuertos` ENABLE KEYS */;


--
-- Table structure for table `pruebaxal`.`movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos` (
  `ID_MOVIMIENTO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_MOVIMIENTO`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruebaxal`.`movimientos`
--

/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` (`ID_MOVIMIENTO`,`DESCRIPCION`) VALUES 
 (1,'Salida'),
 (2,'Llegada');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;


--
-- Table structure for table `pruebaxal`.`vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
CREATE TABLE `vuelos` (
  `ID_AEROLINEA` int(11) DEFAULT NULL,
  `ID_AEROPUERTO` int(11) DEFAULT NULL,
  `ID_MOVIMIENTO` int(11) DEFAULT NULL,
  `DIA` date DEFAULT NULL,
  KEY `ID_AEROLINEA` (`ID_AEROLINEA`),
  KEY `ID_AEROPUERTO` (`ID_AEROPUERTO`),
  KEY `ID_MOVIMIENTO` (`ID_MOVIMIENTO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruebaxal`.`vuelos`
--

/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
INSERT INTO `vuelos` (`ID_AEROLINEA`,`ID_AEROPUERTO`,`ID_MOVIMIENTO`,`DIA`) VALUES 
 (1,1,1,'2021-05-02'),
 (2,1,1,'2021-05-02'),
 (3,2,2,'2021-05-02'),
 (4,3,2,'2021-05-02'),
 (1,3,2,'2021-05-02'),
 (2,1,1,'2021-05-02'),
 (2,3,1,'2021-05-04'),
 (3,4,1,'2021-05-04'),
 (3,4,1,'2021-05-04');
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
