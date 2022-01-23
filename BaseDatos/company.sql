-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2022 a las 00:12:21
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `company`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camp_emp`
--

CREATE TABLE `camp_emp` (
  `emp_no` int(11) NOT NULL,
  `cod_campus` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `camp_emp`
--

INSERT INTO `camp_emp` (`emp_no`, `cod_campus`, `from_date`, `to_date`) VALUES
(1, 27688, '2022-02-25', '2022-03-30'),
(1, 27445, '2022-04-01', '2022-04-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`dept_no`, `dept_name`) VALUES
('1', 'recursos humanos'),
('2', 'Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dept_emp`
--

CREATE TABLE `dept_emp` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dept_emp`
--

INSERT INTO `dept_emp` (`emp_no`, `dept_no`, `from_date`, `to_date`) VALUES
(1, '1', '2022-01-23', '2022-01-31'),
(2, '2', '2022-01-23', '2022-01-31'),
(3, '1', '2022-01-23', '2022-01-31'),
(5, '2', '2022-01-23', '2022-01-31'),
(4, '2', '2022-01-23', '2022-01-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dept_manager`
--

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dept_manager`
--

INSERT INTO `dept_manager` (`emp_no`, `dept_no`, `from_date`, `to_date`) VALUES
(5, '1', '2022-01-01', '2022-01-22'),
(3, '2', '2022-01-01', '2022-01-22'),
(2, '1', '2022-01-01', '2022-01-22'),
(1, '2', '2022-01-01', '2022-01-22'),
(4, '1', '2022-01-01', '2022-01-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) VALUES
(1, '1987-07-30', 'sebas', 'tamayo', 'M', '2022-01-22'),
(2, '1987-07-30', 'juan', 'atehortua', 'M', '2022-01-22'),
(3, '1987-07-29', 'cata', 'amado', 'F', '2022-01-21'),
(4, '1987-07-31', 'yoly', 'atehortua', 'F', '2022-01-18'),
(5, '1987-04-15', 'alex', 'lopez', 'M', '2022-01-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salaries`
--

CREATE TABLE `salaries` (
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salaries`
--

INSERT INTO `salaries` (`emp_no`, `salary`, `from_date`, `to_date`) VALUES
(1, 2500000, '2022-01-01', '2022-01-22'),
(2, 1000000, '2022-01-02', '2022-01-22'),
(3, 2400000, '2022-01-03', '2022-01-22'),
(4, 1500000, '2022-01-04', '2022-01-22'),
(5, 2100000, '2022-01-05', '2022-01-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titles`
--

CREATE TABLE `titles` (
  `emp_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `titles`
--

INSERT INTO `titles` (`emp_no`, `title`, `from_date`, `to_date`) VALUES
(1, 'Desarrollador software jr', '2022-01-01', '2022-01-31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camp_emp`
--
ALTER TABLE `camp_emp`
  ADD PRIMARY KEY (`from_date`),
  ADD KEY `FK_emp_no_4` (`emp_no`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_no`);

--
-- Indices de la tabla `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD KEY `FK_dept_no_1` (`dept_no`),
  ADD KEY `FK_emp_no_1` (`emp_no`);

--
-- Indices de la tabla `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD KEY `FK_dept_no` (`dept_no`),
  ADD KEY `FK_emp_no` (`emp_no`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_no`);

--
-- Indices de la tabla `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`from_date`),
  ADD KEY `FK_emp_no_2` (`emp_no`);

--
-- Indices de la tabla `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title`,`from_date`),
  ADD KEY `FK_emp_no_3` (`emp_no`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `camp_emp`
--
ALTER TABLE `camp_emp`
  ADD CONSTRAINT `FK_emp_no_4` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

--
-- Filtros para la tabla `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD CONSTRAINT `FK_dept_no_1` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`),
  ADD CONSTRAINT `FK_emp_no_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

--
-- Filtros para la tabla `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD CONSTRAINT `FK_dept_no` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`),
  ADD CONSTRAINT `FK_emp_no` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

--
-- Filtros para la tabla `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `FK_emp_no_2` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

--
-- Filtros para la tabla `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `FK_emp_no_3` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
