/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.24-26 : Database - prueba_developer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prueba_developer` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `encuestas` */

DROP TABLE IF EXISTS `encuestas`;

CREATE TABLE `encuestas` (
  `codigo_encuesta` int(11) NOT NULL,
  `nombre_encuesta` char(80) DEFAULT NULL,
  PRIMARY KEY (`codigo_encuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `encuestas` */

insert  into `encuestas`(`codigo_encuesta`,`nombre_encuesta`) values 
(1,'ATENCION VIAL'),
(2,'ATENCION ODONTOLOGICA'),
(3,'ATENCION MEDICA'),
(4,'ATENCION LEGAL'),
(5,'ATENCION HOGAR'),
(6,'ATENCION EXTRANJERO');

/*Table structure for table `preguntas_encuesta` */

DROP TABLE IF EXISTS `preguntas_encuesta`;

CREATE TABLE `preguntas_encuesta` (
  `num_pregunta` int(11) NOT NULL,
  `codigo_encuesta` int(11) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`num_pregunta`,`codigo_encuesta`),
  KEY `codigo_encuesta` (`codigo_encuesta`),
  CONSTRAINT `preguntas_encuesta_ibfk_1` FOREIGN KEY (`codigo_encuesta`) REFERENCES `encuestas` (`codigo_encuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `preguntas_encuesta` */

insert  into `preguntas_encuesta`(`num_pregunta`,`codigo_encuesta`,`descripcion`) values 
(1,1,'COMO CALIFICA LA ATENCION DEL AGENTE?'),
(1,2,'COMO CALIFICA LA ATENCION DEL AGENTE?'),
(1,3,'COMO CALIFICA LA ATENCION DEL AGENTE?'),
(1,4,'COMO CALIFICA LA ATENCION DEL AGENTE?'),
(1,5,'COMO CALIFICA LA ATENCION DEL AGENTE?'),
(1,6,'COMO CALIFICA LA ATENCION DEL AGENTE?'),
(2,1,'COMO CALIFICA LA ATENCION DEL PROVEEDOR?'),
(2,2,'COMO CALIFICA LA ATENCION DEL PROVEEDOR?'),
(2,3,'COMO CALIFICA LA ATENCION DEL PROVEEDOR?'),
(2,4,'COMO CALIFICA LA ATENCION DEL PROVEEDOR?'),
(2,5,'COMO CALIFICA LA ATENCION DEL PROVEEDOR?'),
(2,6,'COMO CALIFICA LA ATENCION DEL PROVEEDOR?'),
(3,1,'COMO CALIFICA LA EFICACIA DEL SERVICIO?'),
(3,2,'COMO CALIFICA LA EFICACIA DEL SERVICIO?'),
(3,3,'COMO CALIFICA LA EFICACIA DEL SERVICIO?'),
(3,4,'COMO CALIFICA LA EFICACIA DEL SERVICIO?'),
(3,5,'COMO CALIFICA LA EFICACIA DEL SERVICIO?'),
(3,6,'COMO CALIFICA LA EFICACIA DEL SERVICIO?'),
(4,1,'COMO CALIFICA LA TIEMPO DE TERMINACION DEL SERVICIO?'),
(4,2,'COMO CALIFICA LA TIEMPO DE TERMINACION DEL SERVICIO?'),
(4,3,'COMO CALIFICA LA TIEMPO DE TERMINACION DEL SERVICIO?'),
(4,4,'COMO CALIFICA LA TIEMPO DE TERMINACION DEL SERVICIO?'),
(4,5,'COMO CALIFICA LA TIEMPO DE TERMINACION DEL SERVICIO?'),
(4,6,'COMO CALIFICA LA TIEMPO DE TERMINACION DEL SERVICIO?'),
(5,1,'EL COSTO COBRADO LE PARECIO EL ADECUADO?'),
(5,2,'EL COSTO COBRADO LE PARECIO EL ADECUADO?'),
(5,3,'EL COSTO COBRADO LE PARECIO EL ADECUADO?'),
(5,4,'EL COSTO COBRADO LE PARECIO EL ADECUADO?'),
(5,5,'EL COSTO COBRADO LE PARECIO EL ADECUADO?'),
(5,6,'EL COSTO COBRADO LE PARECIO EL ADECUADO?'),
(6,1,'NNNNNNN?');

/*Table structure for table `respuesta_encuesta` */

DROP TABLE IF EXISTS `respuesta_encuesta`;

CREATE TABLE `respuesta_encuesta` (
  `codigo_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_encuesta` int(11) DEFAULT NULL,
  `fecha_respuesta` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo_respuesta`),
  KEY `codigo_encuesta` (`codigo_encuesta`),
  CONSTRAINT `respuesta_encuesta_ibfk_1` FOREIGN KEY (`codigo_encuesta`) REFERENCES `encuestas` (`codigo_encuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `respuesta_encuesta` */

/*Table structure for table `respuesta_pregunta` */

DROP TABLE IF EXISTS `respuesta_pregunta`;

CREATE TABLE `respuesta_pregunta` (
  `num_pregunta` int(11) NOT NULL,
  `codigo_encuesta` int(11) NOT NULL,
  `califica` int(11) DEFAULT NULL,
  `codigo_respuesta` int(11) NOT NULL,
  PRIMARY KEY (`num_pregunta`,`codigo_encuesta`,`codigo_respuesta`),
  KEY `codigo_respuesta` (`codigo_respuesta`),
  CONSTRAINT `respuesta_pregunta_ibfk_1` FOREIGN KEY (`num_pregunta`, `codigo_encuesta`) REFERENCES `preguntas_encuesta` (`num_pregunta`, `codigo_encuesta`),
  CONSTRAINT `respuesta_pregunta_ibfk_2` FOREIGN KEY (`codigo_respuesta`) REFERENCES `respuesta_encuesta` (`codigo_respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `respuesta_pregunta` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
