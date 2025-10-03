-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2025 a las 02:16:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stealapresidente`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amistad`
--

CREATE TABLE `amistad` (
  `id_usuario_1` int(11) NOT NULL,
  `id_usuario_2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base`
--

CREATE TABLE `base` (
  `id_base` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `slots` int(11) DEFAULT 0,
  `multiplicador` decimal(10,2) DEFAULT 1.00,
  `Row3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expositor`
--

CREATE TABLE `expositor` (
  `id_expositor` int(11) NOT NULL,
  `id_base` int(11) DEFAULT NULL,
  `id_presidente` int(11) DEFAULT NULL,
  `Row3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_objetos`
--

CREATE TABLE `inventario_objetos` (
  `id_inventario_objetos` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_objeto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1,
  `fecha_obtencion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

CREATE TABLE `objeto` (
  `id_objeto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido_politico`
--

CREATE TABLE `partido_politico` (
  `id_partido_politico` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `siglas` varchar(20) DEFAULT NULL,
  `breve_descripcion_historica` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presidente`
--

CREATE TABLE `presidente` (
  `id_presidente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_partido_politico` int(11) DEFAULT NULL,
  `ppm` decimal(10,2) DEFAULT NULL,
  `valor_venta` decimal(10,2) DEFAULT NULL,
  `breve_descripcion_historica` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `regresiones` int(11) DEFAULT 0,
  `dinero` decimal(10,2) DEFAULT 0.00,
  `ultima_conexion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amistad`
--
ALTER TABLE `amistad`
  ADD PRIMARY KEY (`id_usuario_1`,`id_usuario_2`),
  ADD KEY `id_usuario_2` (`id_usuario_2`);

--
-- Indices de la tabla `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`id_base`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `expositor`
--
ALTER TABLE `expositor`
  ADD PRIMARY KEY (`id_expositor`),
  ADD KEY `id_base` (`id_base`),
  ADD KEY `id_presidente` (`id_presidente`);

--
-- Indices de la tabla `inventario_objetos`
--
ALTER TABLE `inventario_objetos`
  ADD PRIMARY KEY (`id_inventario_objetos`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_objeto` (`id_objeto`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`id_objeto`);

--
-- Indices de la tabla `partido_politico`
--
ALTER TABLE `partido_politico`
  ADD PRIMARY KEY (`id_partido_politico`);

--
-- Indices de la tabla `presidente`
--
ALTER TABLE `presidente`
  ADD PRIMARY KEY (`id_presidente`),
  ADD KEY `id_partido_politico` (`id_partido_politico`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `base`
--
ALTER TABLE `base`
  MODIFY `id_base` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expositor`
--
ALTER TABLE `expositor`
  MODIFY `id_expositor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_objetos`
--
ALTER TABLE `inventario_objetos`
  MODIFY `id_inventario_objetos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `objeto`
--
ALTER TABLE `objeto`
  MODIFY `id_objeto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partido_politico`
--
ALTER TABLE `partido_politico`
  MODIFY `id_partido_politico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presidente`
--
ALTER TABLE `presidente`
  MODIFY `id_presidente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amistad`
--
ALTER TABLE `amistad`
  ADD CONSTRAINT `amistad_ibfk_1` FOREIGN KEY (`id_usuario_1`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `amistad_ibfk_2` FOREIGN KEY (`id_usuario_2`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `base`
--
ALTER TABLE `base`
  ADD CONSTRAINT `base_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `expositor`
--
ALTER TABLE `expositor`
  ADD CONSTRAINT `expositor_ibfk_1` FOREIGN KEY (`id_base`) REFERENCES `base` (`id_base`),
  ADD CONSTRAINT `expositor_ibfk_2` FOREIGN KEY (`id_presidente`) REFERENCES `presidente` (`id_presidente`);

--
-- Filtros para la tabla `inventario_objetos`
--
ALTER TABLE `inventario_objetos`
  ADD CONSTRAINT `inventario_objetos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `inventario_objetos_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `objeto` (`id_objeto`);

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `presidente`
--
ALTER TABLE `presidente`
  ADD CONSTRAINT `presidente_ibfk_1` FOREIGN KEY (`id_partido_politico`) REFERENCES `partido_politico` (`id_partido_politico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
