-- Active: 1687477140158@@127.0.0.1@3306@api_productos
-- drop schema api_productos;
-- create schema api_productos;
-- Active: 1687477140158@@127.0.0.1@3306@api_productos
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2021 at 07:21 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_productos`
--

-- --------------------------------------------------------


--
CREATE TABLE `productos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int  NOT NULL,
  `categoria` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--

--


CREATE TABLE `categorias` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_cat` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar datos en la tabla `categorias`
INSERT INTO `categorias` (nombre_cat) VALUES
('Herramientas Manuales'),
('Materiales Básicos'),
('Equipos de Seguridad'),
('Tornillos y Anclajes'),
('Fijaciones y Adhesivos'),
('Equipos de Medición');

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `categoria`) 
VALUES 
    (1, 'Martillo', 'Martillo de acero forjado', 2999, 50, 'Herramientas Manuales'),
    (2, 'Destornillador', 'Destornillador Phillips de punta magnética', 9990, 100, 'Herramientas Manuales'),
    (3, 'Juego de Llaves', 'Juego de llaves Allen métricas', 19699, 30, 'Herramientas Manuales'),
    (4, 'Taladro Percutor', 'Taladro percutor de 18V con maletín', 99990, 20, 'Herramientas Manuales'),
    (5, 'Sierra Circular', 'Sierra circular eléctrica de 1800W', 14999, 15, 'Herramientas Manuales'),
    (6, 'Lijadora Orbital', 'Lijadora orbital eléctrica de 300W', 49990, 25, 'Herramientas Manuales'),
    (7, 'Bolsa de Cemento', 'Bolsa de cemento Portland', 2999, 100, 'Materiales Básicos'),
    (8, 'Bolsa de Arena', 'Bolsa de arena gruesa', 7290, 200, 'Materiales Básicos'),
    (9, 'Ladrillo Cerámico', 'Ladrillo cerámico estándar', 199, 500, 'Materiales Básicos'),
    (10, 'Lata de Pintura Blanca', 'Pintura acrílica blanca de interior', 1999, 50, 'Materiales Básicos'),
    (11, 'Barniz para Madera', 'Barniz transparente para madera', 1499, 30, 'Materiales Básicos'),
    (12, 'Azulejo Cerámico', 'Azulejo cerámico de 20x20 cm', 199, 100, 'Materiales Básicos'),
    (13, 'Casco de Seguridad', 'casco de seguridad con antiparra', 16990, 10, 'Equipos de Seguridad'),
    (14, 'Guantes de Trabajo', 'Par de guantes de trabajo de cuero', 1290, 50, 'Equipos de Seguridad'),
    (15, 'Lentes de Seguridad', 'Lentes de seguridad antirrayaduras', 4790, 100, 'Equipos de Seguridad'),
    (16, 'Kit de Accesorios de Seguridad', 'Kit de accesorios de seguridad varios', 29990, 20, 'Equipos de Seguridad'),
    (17, 'Clavos', 'Clavos de acero galvanizado', 499, 100, 'Tornillos y Anclajes'),
    (18, 'Tornillo', 'Tornillo de acero inoxidable', 199, 100, 'Tornillos y Anclajes'),
    (19, 'Pegamento', 'Pegamento para madera', 599, 20, 'Fijaciones y Adhesivos'),
    (20, 'Calibrador Digital', 'Calibrador digital de precisión con pantalla LCD', 4999, 20, 'Equipos de Medición'),
    (21, 'Micrómetro Exterior', 'Micrómetro exterior de rango 0-25 mm', 7999, 15, 'Equipos de Medición'),
    (22, 'Termómetro Infrarrojo', 'Termómetro infrarrojo sin contacto', 1999, 30, 'Equipos de Medición'),
    (23, 'Nivel de Burbuja', 'Nivel de burbuja magnético de 9 pulgadas', 999, 50, 'Equipos de Medición'),
    (24, 'Medidor de Distancia Láser', 'Medidor de distancia láser con rango de 40 metros', 3999, 10, 'Equipos de Medición');

ALTER TABLE `productos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


