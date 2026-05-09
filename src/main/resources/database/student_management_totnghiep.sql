-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student_management
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a35a2d81-17c8-11f1-8870-6c2b59632347:1-265';

--
-- Table structure for table `totnghiep`
--

DROP TABLE IF EXISTS `totnghiep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totnghiep` (
  `SoCMND` varchar(20) NOT NULL,
  `MaTruong` varchar(20) NOT NULL,
  `MaNganh` varchar(20) NOT NULL,
  `HeTN` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NgayTN` date NOT NULL,
  `LoaiTN` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`SoCMND`,`MaTruong`,`MaNganh`),
  KEY `MaTruong` (`MaTruong`),
  KEY `MaNganh` (`MaNganh`),
  CONSTRAINT `totnghiep_ibfk_1` FOREIGN KEY (`SoCMND`) REFERENCES `sinhvien` (`SoCMND`),
  CONSTRAINT `totnghiep_ibfk_2` FOREIGN KEY (`MaTruong`) REFERENCES `truong` (`MaTruong`),
  CONSTRAINT `totnghiep_ibfk_3` FOREIGN KEY (`MaNganh`) REFERENCES `nganh` (`MaNganh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totnghiep`
--

LOCK TABLES `totnghiep` WRITE;
/*!40000 ALTER TABLE `totnghiep` DISABLE KEYS */;
INSERT INTO `totnghiep` VALUES ('123456789','FPTU','KTPM','Đại học','2023-05-20','Giỏi'),('555666756','FPTU','KTPM','Liên thông','0026-05-04','Xuất sắc'),('555666773','FPTU','KTPM',NULL,'2026-05-07',NULL),('555666777','HUST','NET','Đại học','2023-11-30','Xuất sắc'),('987654321','HUST','KTPM','Văn bằng 2','2024-01-10','Trung bình'),('987654321','UEH','QTKD','Đại học','2022-12-15','Khá');
/*!40000 ALTER TABLE `totnghiep` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-07 15:01:14
