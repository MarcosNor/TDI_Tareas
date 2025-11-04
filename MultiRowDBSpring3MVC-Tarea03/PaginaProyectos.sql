-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ProyectosEscolares
--

CREATE DATABASE IF NOT EXISTS ProyectosEscolares;
USE ProyectosEscolares;

--
-- Definition of table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
CREATE TABLE `ofertas` (
  `id_oferta` int(10) unsigned NOT NULL auto_increment,
  `id_persona` int(10) unsigned default NULL,
  `id_proyecto` int(10) unsigned default NULL,
  `precio` varchar(45) default NULL,
  `titulo` varchar(45) default NULL,
  `mensaje` varchar(50000) default NULL,
  `tiempo_entrega` varchar(45) default NULL,
  PRIMARY KEY  (`id_oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ofertas`
--

/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
INSERT INTO `ofertas` (`id_oferta`,`id_persona`,`id_proyecto`,`precio`,`titulo`,`mensaje`,`tiempo_entrega`) VALUES 
 (1,7,7,'4234','fsdfsd','wqeewq','fdsfds'),
 (2,8,7,'432432','fdsfdsfsd','eqwewq','dsfsd'),
 (3,9,7,'32423','fdgfdgfd','gfdgfdgfd','fsd'),
 (4,0,7,'etretre','fdsadsa','dasdasdasd',NULL);
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;


--
-- Definition of table `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id_persona` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(45) default NULL,
  `apellidos` varchar(150) default NULL,
  `telefono` varchar(45) default NULL,
  `celular` varchar(45) default NULL,
  `correo` varchar(100) default NULL,
  `skype` varchar(45) default NULL,
  `tipo_persona` varchar(45) default NULL,
  `fecha_alta` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nickname` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `curriculum` longtext,
  `titulo_del_anuncio` varchar(300) default NULL,
  PRIMARY KEY  (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persona`
--

/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`id_persona`,`nombre`,`apellidos`,`telefono`,`celular`,`correo`,`skype`,`tipo_persona`,`fecha_alta`,`nickname`,`password`,`curriculum`,`titulo_del_anuncio`) VALUES 
 (8,'Joel','Romero Rubio','321321321321','6546546777','jromero@cursospersonalizados.com','joelromero','PUBLICADORPROYECTOS','2009-09-28 16:30:20','joel','1234','Busco empleo de programador Tengo 2 años de experiencia como programador en Java y Java Móvil con Netbeans, 6 Meses con Java web con Framework Visual JSF para paginas JSP en Netbeans, Manejo de Base de Datos Mysql conocimiento de consultas basicas y procedimientos almacenados.Experiencia con sistemas administrativos como puntos de venta, ingles 60%(escrito y un poco hablado) ','Programador Java, Java Movil y Jsp con Visual JSF'),
 (9,'Janet','Esteban Ramirez','321321321456','6546546546','jesteban@cursospersonalizados.com','janetesteban','PROVEEDOR','2009-09-28 17:51:24','janet','1234','-Líder de proyecto -Experiencia Java 5 años en aplicaciones web ,1 Año en PHP en desarrollo de Software -Licenciado en Informática -Sun Certified Java Programmer -Inglés 80% ','Líder Tecnico Java /Desarrollador Java Certificado'),
 (10,'Juan','Gonzales Perez','654657868752','6546546546','jgonzales@cursospersonalizados.com','juangonzales','PROVEEDOR','2009-09-28 17:51:24','juan','1234','Alejandro es diseñador, analista y desarrollador Java (J2EE 1.4). Experto en tecnologías Java (Java Servlets, Java Server Pages, EJB). Cuenta con alrededor de 6 años de experiencia trabajando en desarrollo de aplicaciones para Web. Experiencia en herramientas RUP, UML y Java HTML con proyectos basados en Web, tales como: B2C e-Banking www.bbvapr.com, B2B e-Banking autos.bbvapr.com, y algunas aplicaciones de intranet para BBVA Puerto Rico (Evaluaciones de las actuaciones, Directorio). ','Consultor Java');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


--
-- Definition of table `pago`
--

DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fecha` varchar(45) default NULL,
  `mes` varchar(200) default NULL,
  `tarjeta` varchar(10000) default NULL,
  `transaccion` varchar(45) default NULL,
  `gastos` varchar(200) default NULL,
  `pagos` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

insert into `pago` (`fecha`, `mes`, `tarjeta`,`transaccion`,`gastos`,`pagos`) values
	('1/1/2021','enero','VISA','Peluqueria','$1.000.000',''),
	('6/1/2021','enero','MASTERCARD','Pago Mastercard','','$2.670,000');
	
	
DROP TABLE IF EXISTS `credito`;
CREATE TABLE credito (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  moneda VARCHAR(20),
  monto DECIMAL(10,2),
  periodoMeses INT,
  cuota DECIMAL(10,2),
  tea DECIMAL(5,2),
  fechaVenc DATE
);


--
-- Dumping data for table `proyecto`
--

/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` (`id_proyecto`,`id_creador`,`nombre`,`descripcion`,`tipo_proyecto`,`presupuesto`,`fecha`,`status`) VALUES 
 (5,'1','dasdsads','BASE','dasdas','dasdaswerwerwer','2009-09-13 12:02:26','ABIERTO'),
 (6,'2','dasdsads','BASE','dasdas','dasdaswerwerwer','2009-09-13 12:02:53','ABIERTO'),
 (7,'3','dasdsads','BASE','dasdas','dasdaswerwerwer','2009-09-13 12:04:55','ABIERTO'),
 (8,'4','rwerwe','BASE','rwe','dasdaswerwerwer','2009-09-13 12:06:38','ABIERTO'),
 (9,'5','rwerwe','BASE','wrwe','dasdaswerwerwer','2009-09-13 12:07:08','ABIERTO'),
 (10,'6','dasdsadarwe','dasdsadsrwewer','BASE','dasdaswerwerwer','2009-09-13 12:14:59','ABIERTO'),
 (11,'7','ytrytrytr','ytrytr','BASE','trytrytr','2009-09-13 12:16:34','ABIERTO');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id_rol` int(10) unsigned NOT NULL auto_increment,
  `usuario` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY  (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id_rol`,`usuario`,`rol`) VALUES 
 (1,'joe','ROLE_ADMIN'),
 (2,'joe','ROLE_USER'),
 (3,'edith','ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(10) unsigned NOT NULL auto_increment,
  `nombre_completo` varchar(150) default NULL,
  `usuario` varchar(45) default NULL,
  `password` varchar(45) default NULL,
  `activo` tinyint(1) default NULL,
  PRIMARY KEY  (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id_usuario`,`nombre_completo`,`usuario`,`password`,`activo`) VALUES 
 (1,'Joe Sanchez','joe','1234',1),
 (2,'Edith Salas','edith','1234',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
