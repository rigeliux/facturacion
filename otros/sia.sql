-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-04-2014 a las 03:24:11
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_listado`
--

DROP TABLE IF EXISTS `categoria_listado`;
CREATE TABLE IF NOT EXISTS `categoria_listado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_tipo_id_fk` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `categoria_listado`
--

INSERT INTO `categoria_listado` (`id`, `sys_tipo_id_fk`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', '2014-04-16 03:43:25', '2014-04-16 03:43:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_listado`
--

DROP TABLE IF EXISTS `cliente_listado`;
CREATE TABLE IF NOT EXISTS `cliente_listado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8_unicode_ci NOT NULL,
  `sys_col_id_fk` int(3) NOT NULL,
  `sys_cid_id_fk` int(3) NOT NULL,
  `sys_edo_id_fk` int(3) NOT NULL,
  `codigo_postal` int(11) NOT NULL,
  `comentarios` text COLLATE utf8_unicode_ci NOT NULL,
  `bday` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cliente_listado`
--

INSERT INTO `cliente_listado` (`id`, `nombre`, `email`, `tel`, `cel`, `direccion`, `sys_col_id_fk`, `sys_cid_id_fk`, `sys_edo_id_fk`, `codigo_postal`, `comentarios`, `bday`, `created_at`, `updated_at`) VALUES
(1, 'Prueba1', 'asd@asd.com', '2147483647', '2147483647', 'mi casa', 0, 0, 0, 0, '', '2013-04-29', '2014-04-16 03:56:30', '2014-04-16 03:56:30'),
(2, 'Prueba2', '', '123464987', '9991484418', 'mi casa', 0, 0, 0, 0, 'Hola, estoy son comentarios extras', '2013-04-29', '2014-04-16 03:56:30', '2014-04-16 03:56:30'),
(3, 'Prueba 3', NULL, '987654', '987654', 'la casa de prueba', 0, 0, 0, 0, '', '0000-00-00', '2014-04-16 03:56:30', '2014-04-16 03:56:30'),
(4, 'Prueba 4', 'asd@sd.com', '987654', '654987', 'ASd', 0, 0, 0, 0, '', '0000-00-00', '2014-04-16 03:56:30', '2014-04-16 03:56:30'),
(5, 'Prueba 10', '', '987654', '123654897', 'mi casita', 0, 0, 0, 0, '', '0000-00-00', '2014-04-16 03:56:30', '2014-04-16 03:56:30'),
(6, 'asd', 'asd@sd.com', 'asd', 'asd', 'asd', 0, 0, 0, 0, 'asdasdasd', '0000-00-00', '2014-04-16 03:56:30', '2014-04-16 03:56:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_listado`
--

DROP TABLE IF EXISTS `factura_listado`;
CREATE TABLE IF NOT EXISTS `factura_listado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_id_fk` int(11) NOT NULL,
  `fac_serie_id_fk` int(11) NOT NULL,
  `folio` int(11) NOT NULL DEFAULT '0',
  `autorizado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_serie`
--

DROP TABLE IF EXISTS `factura_serie`;
CREATE TABLE IF NOT EXISTS `factura_serie` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `ultimo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_listado`
--

DROP TABLE IF EXISTS `producto_listado`;
CREATE TABLE IF NOT EXISTS `producto_listado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id_fk` int(11) NOT NULL DEFAULT '0',
  `unid_id_fk` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `producto_listado`
--

INSERT INTO `producto_listado` (`id`, `cat_id_fk`, `unid_id_fk`, `nombre`, `descripcion`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Castrol gtx 55', 'Aceite castrol multigrado', 0, NULL, '2014-04-16 03:26:56'),
(2, 1, 8, 'Balatas delanteras Tsuru', 'Aplica modelos:\n2000-2010', 0, NULL, '2014-04-16 03:26:56'),
(3, 1, 3, 'Shell Xtm 21', 'Compatibles:\nTsuru 2000-2010\nChevy 2004-2005\nSharam 2010', 10, NULL, '2014-04-16 03:26:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_ciudad`
--

DROP TABLE IF EXISTS `system_ciudad`;
CREATE TABLE IF NOT EXISTS `system_ciudad` (
  `id` int(11) NOT NULL,
  `sys_edo_id_fk` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_colonia`
--

DROP TABLE IF EXISTS `system_colonia`;
CREATE TABLE IF NOT EXISTS `system_colonia` (
  `id` int(11) NOT NULL,
  `sys_cid_id_fk` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_estado`
--

DROP TABLE IF EXISTS `system_estado`;
CREATE TABLE IF NOT EXISTS `system_estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_tipo`
--

DROP TABLE IF EXISTS `system_tipo`;
CREATE TABLE IF NOT EXISTS `system_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `system_tipo`
--

INSERT INTO `system_tipo` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(0, 'Sin categorizar', NULL, '2014-04-16 03:38:30'),
(1, 'Productos', '2014-04-16 03:31:58', '2014-04-16 03:31:58'),
(2, 'Facturas', '2014-04-16 03:39:52', '2014-04-16 03:39:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_unidad`
--

DROP TABLE IF EXISTS `system_unidad`;
CREATE TABLE IF NOT EXISTS `system_unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `system_unidad`
--

INSERT INTO `system_unidad` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Pieza (pza)', '2014-04-16 03:40:35', '2014-04-16 03:40:35'),
(2, 'Metros (mts)', '2014-04-16 03:40:43', '2014-04-16 03:40:43'),
(3, 'No aplica (N/A)', '2014-04-16 03:40:56', '2014-04-16 03:40:56'),
(4, 'Kilogramo (kg)', '2014-04-16 03:41:07', '2014-04-16 03:41:07'),
(5, 'Litros (lts)', '2014-04-16 03:41:23', '2014-04-16 03:41:23'),
(6, 'Gramos (g)', '2014-04-16 03:41:37', '2014-04-16 03:41:37'),
(7, 'Kilometros (km)', '2014-04-16 03:41:45', '2014-04-16 03:41:45'),
(8, 'Grupo (gpo)', '2014-04-16 03:45:33', '2014-04-16 03:45:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `uacc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uacc_group_fk` smallint(5) unsigned NOT NULL,
  `uacc_email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `uacc_username` varchar(15) CHARACTER SET latin1 NOT NULL,
  `uacc_password` varchar(60) CHARACTER SET latin1 NOT NULL,
  `uacc_ip_address` varchar(40) CHARACTER SET latin1 NOT NULL,
  `uacc_salt` varchar(40) CHARACTER SET latin1 NOT NULL,
  `uacc_activation_token` varchar(40) CHARACTER SET latin1 NOT NULL,
  `uacc_forgotten_password_token` varchar(40) CHARACTER SET latin1 NOT NULL,
  `uacc_forgotten_password_expire` datetime NOT NULL,
  `uacc_update_email_token` varchar(40) CHARACTER SET latin1 NOT NULL,
  `uacc_update_email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `uacc_active` tinyint(1) unsigned NOT NULL,
  `uacc_suspend` tinyint(1) unsigned NOT NULL,
  `uacc_fail_login_attempts` smallint(5) NOT NULL,
  `uacc_fail_login_ip_address` varchar(40) CHARACTER SET latin1 NOT NULL,
  `uacc_date_fail_login_ban` datetime NOT NULL COMMENT 'Time user is banned until due to repeated failed logins',
  `uacc_date_last_login` datetime NOT NULL,
  `uacc_date_added` datetime NOT NULL,
  PRIMARY KEY (`uacc_id`),
  UNIQUE KEY `uacc_id` (`uacc_id`),
  KEY `uacc_group_fk` (`uacc_group_fk`),
  KEY `uacc_email` (`uacc_email`),
  KEY `uacc_username` (`uacc_username`),
  KEY `uacc_fail_login_ip_address` (`uacc_fail_login_ip_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `user_accounts`
--

INSERT INTO `user_accounts` (`uacc_id`, `uacc_group_fk`, `uacc_email`, `uacc_username`, `uacc_password`, `uacc_ip_address`, `uacc_salt`, `uacc_activation_token`, `uacc_forgotten_password_token`, `uacc_forgotten_password_expire`, `uacc_update_email_token`, `uacc_update_email`, `uacc_active`, `uacc_suspend`, `uacc_fail_login_attempts`, `uacc_fail_login_ip_address`, `uacc_date_fail_login_ban`, `uacc_date_last_login`, `uacc_date_added`) VALUES
(1, 3, 'hola@ola.com', 'admin', '$2a$08$0I0zy4GlTZB7m1tqlg5uZup84kAANvk96L/OtvgoYLxKugRM.XkfW', '192.168.1.82', 'cTVDqjjFSj', '6a143759f908caabca14be9c151db9fc3d50ad07', '', '0000-00-00 00:00:00', '', '', 1, 0, 0, '', '0000-00-00 00:00:00', '2014-04-16 06:49:04', '2013-03-20 18:51:11'),
(2, 1, 'rigeliux@asd.com', 'rigeliux', '0', '192.168.0.2', 'N58pxMvQWK', '', '', '0000-00-00 00:00:00', '', '', 0, 0, 0, '', '0000-00-00 00:00:00', '2013-03-23 20:47:52', '2013-03-23 20:47:52'),
(3, 2, 'prueba@asd.com', 'prueba', '0', '192.168.0.6', 'qtfFSYwgDg', '', '', '0000-00-00 00:00:00', '', '', 0, 0, 0, '', '0000-00-00 00:00:00', '2013-04-11 00:06:23', '2013-04-11 00:06:23'),
(4, 3, 'beker@asd.com', 'beker', '0', '192.168.0.4', '5wdvbMM5Rn', '', '', '0000-00-00 00:00:00', '', '', 0, 0, 0, '', '0000-00-00 00:00:00', '2013-04-24 23:58:26', '2013-04-24 23:58:26'),
(5, 3, 'admin@asd.com', 'admina', '$2a$08$OuLYm.TJK/SR.OF1uc2saOaq9tDUYipUQWX/q2ucC56L6h5vH.MU6', '192.168.0.4', 'k2GjB4VGhG', '', '', '0000-00-00 00:00:00', '', '', 1, 0, 1, '192.168.1.69', '0000-00-00 00:00:00', '2013-10-01 04:12:22', '2013-07-11 20:41:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE IF NOT EXISTS `user_groups` (
  `ugrp_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `ugrp_name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ugrp_desc` varchar(100) CHARACTER SET latin1 NOT NULL,
  `ugrp_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`ugrp_id`),
  UNIQUE KEY `ugrp_id` (`ugrp_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `user_groups`
--

INSERT INTO `user_groups` (`ugrp_id`, `ugrp_name`, `ugrp_desc`, `ugrp_admin`) VALUES
(1, 'Public', 'Public User : has no admin access rights.', 0),
(2, 'Moderator', 'Admin Moderator : has partial admin access rights.', 1),
(3, 'Master Admin', 'Master Admin : has full admin access rights.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_login_sessions`
--

DROP TABLE IF EXISTS `user_login_sessions`;
CREATE TABLE IF NOT EXISTS `user_login_sessions` (
  `usess_uacc_fk` int(11) NOT NULL,
  `usess_series` varchar(40) CHARACTER SET latin1 NOT NULL,
  `usess_token` varchar(40) CHARACTER SET latin1 NOT NULL,
  `usess_login_date` datetime NOT NULL,
  PRIMARY KEY (`usess_token`),
  UNIQUE KEY `usess_token` (`usess_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user_login_sessions`
--

INSERT INTO `user_login_sessions` (`usess_uacc_fk`, `usess_series`, `usess_token`, `usess_login_date`) VALUES
(5, '', '0c6ec21d38a2f72b6e31df2422705a1609b04745', '2013-10-01 04:12:14'),
(5, '', '115a6c8783e13bb6fe9c341cf9329d840873f97d', '2013-07-19 01:05:28'),
(5, '', '3cda9635cd0a8b103eed0f97c940a0d77506f3ee', '2013-07-11 20:51:22'),
(1, '', '42d7a80236e5db52c4a479598a9711219c80541b', '2013-07-18 00:34:45'),
(5, '', '5c15732f4ff0ee105237642930c969280a8b60e1', '2013-07-31 21:34:28'),
(5, '', '5fef542b92b45b9e4d737f112d16505e08657c48', '2013-10-01 04:01:38'),
(1, '', '706e2a2f1435ce2ece462a0442700b77736ade78', '2014-04-15 07:47:42'),
(5, '', '70c0f8e92f6ed720af3562bad14eb8a7f808a9c7', '2013-07-31 23:10:02'),
(1, '', '9feb7c753d10095a5a4790d314952a9cced229e4', '2013-08-28 21:04:31'),
(5, '', 'a1b8b988418859743df678a87f0fb9db280b2a78', '2013-07-31 20:39:35'),
(5, '', 'a3acbc969a062472057456ddb0125847bfe4fae1', '2013-10-01 04:38:14'),
(1, '', 'd1590f9a45b4783de1b96aa48974a1406ed6d5cc', '2013-07-18 01:41:47'),
(5, '', 'd89758cd1d83dcd7623c31c78c68227112550405', '2013-10-01 07:05:47'),
(5, '', 'de23d021242d3309ab5a91ec4f16a35ee09f9eb4', '2013-10-01 02:49:24'),
(5, '', 'deba224d2709537a3343ee73df1b384253a789ae', '2013-08-01 18:44:13'),
(1, '', 'df79dcccfc620c397ec47a8b5b2cff47a8fcbc5a', '2014-04-16 07:15:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_privileges`
--

DROP TABLE IF EXISTS `user_privileges`;
CREATE TABLE IF NOT EXISTS `user_privileges` (
  `upriv_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `upriv_name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `upriv_desc` varchar(100) CHARACTER SET latin1 NOT NULL,
  `upriv_usec_fk` int(11) NOT NULL,
  PRIMARY KEY (`upriv_id`),
  UNIQUE KEY `upriv_id` (`upriv_id`) USING BTREE,
  KEY `upriv_usec_fk` (`upriv_usec_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `user_privileges`
--

INSERT INTO `user_privileges` (`upriv_id`, `upriv_name`, `upriv_desc`, `upriv_usec_fk`) VALUES
(1, 'Ver Usuarios Sim', 'El usuario puede ver la seccion Usuarios Sim', 1),
(2, 'Insertar Usuarios Si', 'El usuario puede insertar en la seccion Usuarios Sim', 1),
(3, 'Editar Usuarios Sim', 'El usuario puede editar en la seccion Usuarios Sim', 1),
(4, 'Eliminar Usuarios Si', 'El usuario puede eliminar en la seccion Usuarios Sim', 1),
(5, 'Ver Nivel', 'El usuario puede ver la seccion Nivel', 2),
(6, 'Insertar Nivel', 'El usuario puede insertar en la seccion Nivel', 2),
(7, 'Editar Nivel', 'El usuario puede editar en la seccion Nivel', 2),
(8, 'Eliminar Nivel', 'El usuario puede eliminar en la seccion Nivel', 2),
(9, 'Ver Clientes', 'El usuario puede ver la seccion Clientes', 3),
(10, 'Insertar Clientes', 'El usuario puede insertar en la seccion Clientes', 3),
(11, 'Editar Clientes', 'El usuario puede editar en la seccion Clientes', 3),
(12, 'Eliminar Clientes', 'El usuario puede eliminar en la seccion Clientes', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_privilege_groups`
--

DROP TABLE IF EXISTS `user_privilege_groups`;
CREATE TABLE IF NOT EXISTS `user_privilege_groups` (
  `upriv_groups_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `upriv_groups_ugrp_fk` smallint(5) unsigned NOT NULL,
  `upriv_groups_upriv_fk` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`upriv_groups_id`),
  UNIQUE KEY `upriv_groups_id` (`upriv_groups_id`) USING BTREE,
  KEY `upriv_groups_ugrp_fk` (`upriv_groups_ugrp_fk`),
  KEY `upriv_groups_upriv_fk` (`upriv_groups_upriv_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `user_privilege_groups`
--

INSERT INTO `user_privilege_groups` (`upriv_groups_id`, `upriv_groups_ugrp_fk`, `upriv_groups_upriv_fk`) VALUES
(1, 3, 1),
(3, 3, 3),
(4, 3, 4),
(5, 3, 2),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 2, 2),
(13, 2, 4),
(14, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_privilege_users`
--

DROP TABLE IF EXISTS `user_privilege_users`;
CREATE TABLE IF NOT EXISTS `user_privilege_users` (
  `upriv_users_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `upriv_users_uacc_fk` int(11) NOT NULL,
  `upriv_users_upriv_fk` smallint(5) NOT NULL,
  PRIMARY KEY (`upriv_users_id`),
  UNIQUE KEY `upriv_users_id` (`upriv_users_id`) USING BTREE,
  KEY `upriv_users_uacc_fk` (`upriv_users_uacc_fk`),
  KEY `upriv_users_upriv_fk` (`upriv_users_upriv_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `upro_id` int(11) NOT NULL AUTO_INCREMENT,
  `upro_uacc_fk` int(11) NOT NULL,
  `upro_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `upro_phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `upro_newsletter` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`upro_id`),
  UNIQUE KEY `upro_id` (`upro_id`),
  KEY `upro_uacc_fk` (`upro_uacc_fk`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `user_profiles`
--

INSERT INTO `user_profiles` (`upro_id`, `upro_uacc_fk`, `upro_name`, `upro_phone`, `upro_newsletter`) VALUES
(1, 2, 'Rigel', '0', 0),
(2, 1, 'Master Admin', '0', 0),
(3, 3, 'Prueba', '0', 0),
(4, 4, 'Beker Basto B', '0', 0),
(5, 5, 'Administrador', '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_sections`
--

DROP TABLE IF EXISTS `user_sections`;
CREATE TABLE IF NOT EXISTS `user_sections` (
  `usec_id` int(11) NOT NULL AUTO_INCREMENT,
  `usec_name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`usec_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `user_sections`
--

INSERT INTO `user_sections` (`usec_id`, `usec_name`) VALUES
(1, 'Usuarios Sim'),
(2, 'Nivel'),
(3, 'Clientes');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
