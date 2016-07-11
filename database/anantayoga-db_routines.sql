-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: anantayoga-db
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `view_users`
--

DROP TABLE IF EXISTS `view_users`;
/*!50001 DROP VIEW IF EXISTS `view_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_users` AS SELECT 
 1 AS `ID_ADMIN_USUARIO`,
 1 AS `NOMBRE`,
 1 AS `APELLIDOS`,
 1 AS `DIRECCION`,
 1 AS `POBLACION`,
 1 AS `PROVINCIA`,
 1 AS `TELEFONO`,
 1 AS `EMAIL`,
 1 AS `VIGENTE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_all_cuota`
--

DROP TABLE IF EXISTS `view_all_cuota`;
/*!50001 DROP VIEW IF EXISTS `view_all_cuota`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_all_cuota` AS SELECT 
 1 AS `ID_ADMIN_CUOTA`,
 1 AS `NOMBRE`,
 1 AS `TIPO`,
 1 AS `DESCRIPCION`,
 1 AS `DIAS_DURACION`,
 1 AS `PRECIO`,
 1 AS `VIGENTE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_all_users`
--

DROP TABLE IF EXISTS `view_all_users`;
/*!50001 DROP VIEW IF EXISTS `view_all_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_all_users` AS SELECT 
 1 AS `ID_ADMIN_USUARIO`,
 1 AS `NOMBRE`,
 1 AS `APELLIDOS`,
 1 AS `DIRECCION`,
 1 AS `POBLACION`,
 1 AS `PROVINCIA`,
 1 AS `TELEFONO`,
 1 AS `EMAIL`,
 1 AS `VIGENTE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_payments`
--

DROP TABLE IF EXISTS `view_payments`;
/*!50001 DROP VIEW IF EXISTS `view_payments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_payments` AS SELECT 
 1 AS `ID_ADMIN_PAGOS`,
 1 AS `ID_ADMIN_USUARIO`,
 1 AS `ID_ADMIN_CONTRATO`,
 1 AS `ID_ADMIN_TIPO_CUOTA`,
 1 AS `NOMBRE_U`,
 1 AS `APELLIDOS`,
 1 AS `NOMBRE`,
 1 AS `FECHA_PAGO`,
 1 AS `FECHA_INICIO`,
 1 AS `FECHA_FIN`,
 1 AS `PRECIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_cuota`
--

DROP TABLE IF EXISTS `view_cuota`;
/*!50001 DROP VIEW IF EXISTS `view_cuota`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_cuota` AS SELECT 
 1 AS `ID_ADMIN_CUOTA`,
 1 AS `NOMBRE`,
 1 AS `TIPO`,
 1 AS `DESCRIPCION`,
 1 AS `DIAS_DURACION`,
 1 AS `PRECIO`,
 1 AS `VIGENTE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_contratos_vigentes`
--

DROP TABLE IF EXISTS `view_contratos_vigentes`;
/*!50001 DROP VIEW IF EXISTS `view_contratos_vigentes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_contratos_vigentes` AS SELECT 
 1 AS `ID`,
 1 AS `NOMBRE`,
 1 AS `APELLIDOS`,
 1 AS `CONTRATO_ID`,
 1 AS `CUOTA_ID`,
 1 AS `TIPO_CUOTA_ID`,
 1 AS `CUOTA_NOMBRE`,
 1 AS `DIAS`,
 1 AS `FECHA`,
 1 AS `PRECIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_users`
--

/*!50001 DROP VIEW IF EXISTS `view_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_users` AS select `admin_usuario`.`ID_ADMIN_USUARIO` AS `ID_ADMIN_USUARIO`,`admin_usuario`.`NOMBRE` AS `NOMBRE`,`admin_usuario`.`APELLIDOS` AS `APELLIDOS`,`admin_usuario`.`DIRECCION` AS `DIRECCION`,`admin_usuario`.`POBLACION` AS `POBLACION`,`admin_usuario`.`PROVINCIA` AS `PROVINCIA`,`admin_usuario`.`TELEFONO` AS `TELEFONO`,`admin_usuario`.`EMAIL` AS `EMAIL`,`admin_usuario`.`VIGENTE` AS `VIGENTE` from `admin_usuario` where (`admin_usuario`.`VIGENTE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_all_cuota`
--

/*!50001 DROP VIEW IF EXISTS `view_all_cuota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_all_cuota` AS select `c`.`ID_ADMIN_CUOTA` AS `ID_ADMIN_CUOTA`,`c`.`NOMBRE` AS `NOMBRE`,`t`.`NOMBRE` AS `TIPO`,`c`.`DESCRIPCION` AS `DESCRIPCION`,`c`.`DIAS_DURACION` AS `DIAS_DURACION`,`c`.`PRECIO` AS `PRECIO`,`c`.`VIGENTE` AS `VIGENTE` from (`admin_cuota` `c` join `admin_tipo_cuota` `t` on((`c`.`ID_ADMIN_TIPO_CUOTA` = `t`.`ID_ADMIN_TIPO_CUOTA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_all_users`
--

/*!50001 DROP VIEW IF EXISTS `view_all_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_all_users` AS select `admin_usuario`.`ID_ADMIN_USUARIO` AS `ID_ADMIN_USUARIO`,`admin_usuario`.`NOMBRE` AS `NOMBRE`,`admin_usuario`.`APELLIDOS` AS `APELLIDOS`,`admin_usuario`.`DIRECCION` AS `DIRECCION`,`admin_usuario`.`POBLACION` AS `POBLACION`,`admin_usuario`.`PROVINCIA` AS `PROVINCIA`,`admin_usuario`.`TELEFONO` AS `TELEFONO`,`admin_usuario`.`EMAIL` AS `EMAIL`,`admin_usuario`.`VIGENTE` AS `VIGENTE` from `admin_usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_payments`
--

/*!50001 DROP VIEW IF EXISTS `view_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_payments` AS select `p`.`ID_ADMIN_PAGOS` AS `ID_ADMIN_PAGOS`,`p`.`ID_ADMIN_USUARIO` AS `ID_ADMIN_USUARIO`,`p`.`ID_ADMIN_CONTRATO` AS `ID_ADMIN_CONTRATO`,`cut`.`ID_ADMIN_TIPO_CUOTA` AS `ID_ADMIN_TIPO_CUOTA`,`u`.`NOMBRE` AS `NOMBRE_U`,`u`.`APELLIDOS` AS `APELLIDOS`,`cu`.`NOMBRE` AS `NOMBRE`,`p`.`FECHA_PAGO` AS `FECHA_PAGO`,`p`.`FECHA_INICIO` AS `FECHA_INICIO`,`p`.`FECHA_FIN` AS `FECHA_FIN`,`p`.`PRECIO` AS `PRECIO` from ((((`admin_pagos` `p` join `admin_contrato` `c` on((`c`.`ID_ADMIN_CONTRATO` = `p`.`ID_ADMIN_CONTRATO`))) join `admin_cuota` `cu` on((`cu`.`ID_ADMIN_CUOTA` = `c`.`ID_ADMIN_CUOTA`))) join `admin_tipo_cuota` `cut` on((`cut`.`ID_ADMIN_TIPO_CUOTA` = `cu`.`ID_ADMIN_TIPO_CUOTA`))) join `admin_usuario` `u` on((`p`.`ID_ADMIN_USUARIO` = `u`.`ID_ADMIN_USUARIO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_cuota`
--

/*!50001 DROP VIEW IF EXISTS `view_cuota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cuota` AS select `c`.`ID_ADMIN_CUOTA` AS `ID_ADMIN_CUOTA`,`c`.`NOMBRE` AS `NOMBRE`,`t`.`NOMBRE` AS `TIPO`,`c`.`DESCRIPCION` AS `DESCRIPCION`,`c`.`DIAS_DURACION` AS `DIAS_DURACION`,`c`.`PRECIO` AS `PRECIO`,`c`.`VIGENTE` AS `VIGENTE` from (`admin_cuota` `c` join `admin_tipo_cuota` `t` on((`c`.`ID_ADMIN_TIPO_CUOTA` = `t`.`ID_ADMIN_TIPO_CUOTA`))) where (`c`.`VIGENTE` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_contratos_vigentes`
--

/*!50001 DROP VIEW IF EXISTS `view_contratos_vigentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_contratos_vigentes` AS select `u`.`ID_ADMIN_USUARIO` AS `ID`,`u`.`NOMBRE` AS `NOMBRE`,`u`.`APELLIDOS` AS `APELLIDOS`,`c`.`ID_ADMIN_CONTRATO` AS `CONTRATO_ID`,`o`.`ID_ADMIN_CUOTA` AS `CUOTA_ID`,`o`.`ID_ADMIN_TIPO_CUOTA` AS `TIPO_CUOTA_ID`,`o`.`NOMBRE` AS `CUOTA_NOMBRE`,`o`.`DIAS_DURACION` AS `DIAS`,`c`.`FECHA` AS `FECHA`,`o`.`PRECIO` AS `PRECIO` from ((`admin_contrato` `c` join `admin_cuota` `o` on((`o`.`ID_ADMIN_CUOTA` = `c`.`ID_ADMIN_CUOTA`))) join `admin_usuario` `u` on((`u`.`ID_ADMIN_USUARIO` = `c`.`ID_ADMIN_USUARIO`))) where ((`c`.`VIGENTE` = 1) and (`u`.`VIGENTE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-11  6:53:16
