/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `Clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Correo_Electronico` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numero_Telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Sexo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` (`ID_Cliente`, `Nombre_Cliente`, `Direccion`, `Correo_Electronico`, `Numero_Telefono`, `Fecha_Nacimiento`, `Sexo`) VALUES
	(1, 'Juan Perez', 'Calle 123, Lima', 'juan.perez@example.com', '999888777', '1985-03-15', 'M'),
	(2, 'Maria Gomez', 'Jr. Paz 451, Tacna', 'maria.gomez@example.com', '999999888', '1990-11-22', 'F'),
	(3, 'Carlos Lopez', 'Calle 8, Ica', 'carlos.lopez@example.com', '999888999', '1988-07-10', 'M'),
	(4, 'Marcos Flores', 'Jr. San Martin, Lima', 'marcos.f26@example.com', '999888990', '1988-06-15', 'M'),
	(5, 'Vilma Sanchez', 'Jr Junin, Ayacucho', 'sanchez.vilma@example.com', '999128999', '1988-07-10', 'F');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `Coberturas` (
  `ID_Cobertura` int(11) NOT NULL,
  `Nombre_Cobertura` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Cobertura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `Coberturas` DISABLE KEYS */;
INSERT INTO `Coberturas` (`ID_Cobertura`, `Nombre_Cobertura`, `Descripcion`) VALUES
	(1, 'Seguro de Vida', 'Cobertura que protege en caso de fallecimiento.'),
	(2, 'Seguro de Salud', 'Cobertura medica para gastos de salud.'),
	(3, 'Seguro de Automovil', 'Cobertura para danos a vehiculos y terceros.');
/*!40000 ALTER TABLE `Coberturas` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `DetallePagos` (
  `ID_Detalle_Pago` int(11) NOT NULL,
  `ID_Pago` int(11) DEFAULT NULL,
  `Monto_Pago_Detalle` decimal(10,2) DEFAULT NULL,
  `Metodo_Pago` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Moneda` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Pago`),
  KEY `ID_Pago` (`ID_Pago`),
  CONSTRAINT `DetallePagos_ibfk_1` FOREIGN KEY (`ID_Pago`) REFERENCES `Pagos` (`ID_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `DetallePagos` DISABLE KEYS */;
INSERT INTO `DetallePagos` (`ID_Detalle_Pago`, `ID_Pago`, `Monto_Pago_Detalle`, `Metodo_Pago`, `Moneda`) VALUES
	(1, 1, 280.00, 'Tarjeta de Debito', 'PEN'),
	(2, 1, 220.00, 'Transferencia Bancaria', 'PEN'),
	(3, 2, 110.00, 'Tarjeta de Debito', 'USD'),
	(4, 2, 90.00, 'Tarjeta de Debito', 'USD'),
	(5, 3, 300.00, 'Tarjeta de Debito', 'PEN'),
	(6, 4, 100.00, 'Tarjeta de Debito', 'USD'),
	(7, 4, 100.00, 'Tarjeta de Debito', 'USD'),
	(8, 5, 300.00, 'Tarjeta de Debito', 'PEN'),
	(9, 6, 300.00, 'Tarjeta de Debito', 'PEN');
/*!40000 ALTER TABLE `DetallePagos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `Pagos` (
  `ID_Pago` int(11) NOT NULL,
  `ID_Poliza` int(11) DEFAULT NULL,
  `Fecha_Pago` date DEFAULT NULL,
  `Total_Pago` decimal(10,2) DEFAULT NULL,
  `Moneda` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Pago`),
  KEY `ID_Poliza` (`ID_Poliza`),
  CONSTRAINT `Pagos_ibfk_1` FOREIGN KEY (`ID_Poliza`) REFERENCES `Polizas` (`ID_Poliza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `Pagos` DISABLE KEYS */;
INSERT INTO `Pagos` (`ID_Pago`, `ID_Poliza`, `Fecha_Pago`, `Total_Pago`, `Moneda`) VALUES
	(1, 1, '2023-01-05', 500.00, 'PEN'),
	(2, 2, '2023-02-20', 200.00, 'USD'),
	(3, 3, '2023-03-12', 300.00, 'PEN'),
	(4, 4, '2023-01-05', 200.00, 'PEN'),
	(5, 5, '2023-02-20', 300.00, 'USD'),
	(6, 6, '2023-03-12', 300.00, 'PEN');
/*!40000 ALTER TABLE `Pagos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `Polizas` (
  `ID_Poliza` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Seguro` int(11) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Vencimiento` date DEFAULT NULL,
  `Estado_Poliza` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Poliza`),
  KEY `ID_Cliente` (`ID_Cliente`),
  KEY `ID_Seguro` (`ID_Seguro`),
  CONSTRAINT `Polizas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`),
  CONSTRAINT `Polizas_ibfk_2` FOREIGN KEY (`ID_Seguro`) REFERENCES `Seguros` (`ID_Seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `Polizas` DISABLE KEYS */;
INSERT INTO `Polizas` (`ID_Poliza`, `ID_Cliente`, `ID_Seguro`, `Fecha_Inicio`, `Fecha_Vencimiento`, `Estado_Poliza`) VALUES
	(1, 1, 1, '2023-01-01', '2024-01-01', 'Activo'),
	(2, 2, 2, '2023-02-15', '2023-03-15', 'Activo'),
	(3, 3, 3, '2023-03-10', '2024-03-10', 'Activo'),
	(4, 4, 2, '2023-02-15', '2023-03-15', 'Activo'),
	(5, 5, 3, '2023-03-10', '2024-03-10', 'Activo'),
	(6, 3, 3, '2023-03-10', '2024-03-10', 'Activo');
/*!40000 ALTER TABLE `Polizas` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `Seguros` (
  `ID_Seguro` int(11) NOT NULL,
  `ID_Cobertura` int(11) DEFAULT NULL,
  `Nombre_Seguro` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Precio` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Moneda` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Duracion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Seguro`),
  KEY `ID_Cobertura` (`ID_Cobertura`),
  CONSTRAINT `Seguros_ibfk_1` FOREIGN KEY (`ID_Cobertura`) REFERENCES `Coberturas` (`ID_Cobertura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `Seguros` DISABLE KEYS */;
INSERT INTO `Seguros` (`ID_Seguro`, `ID_Cobertura`, `Nombre_Seguro`, `Descripcion`, `Precio`, `Moneda`, `Duracion`) VALUES
	(1, 1, 'Vida Total', 'Cobertura completa de seguro de vida.', '500', 'PEN', 'Anual'),
	(2, 2, 'Salud Basico', 'Cobertura medica basica.', '200', 'USD', 'Mensual'),
	(3, 3, 'Auto Terceros', 'Cobertura para danos a terceros.', '300', 'PEN', 'Anual');
/*!40000 ALTER TABLE `Seguros` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
