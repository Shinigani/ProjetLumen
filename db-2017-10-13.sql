-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: db_question
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `competences`
--

DROP TABLE IF EXISTS `competences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competences` (
  `idCompetence` int(11) NOT NULL AUTO_INCREMENT,
  `nomCompetence` varchar(255) NOT NULL,
  PRIMARY KEY (`idCompetence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competences`
--

LOCK TABLES `competences` WRITE;
/*!40000 ALTER TABLE `competences` DISABLE KEYS */;
/*!40000 ALTER TABLE `competences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoris`
--

DROP TABLE IF EXISTS `favoris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoris` (
  `idFavoris` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idPost` int(11) NOT NULL,
  PRIMARY KEY (`idFavoris`),
  KEY `fk_favoris_user_idx` (`idUser`),
  KEY `fk_favoris_post_idx` (`idPost`),
  CONSTRAINT `fk_favoris_post` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favoris_user` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoris`
--

LOCK TABLES `favoris` WRITE;
/*!40000 ALTER TABLE `favoris` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe_competence`
--

DROP TABLE IF EXISTS `groupe_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupe_competence` (
  `idGroupe_competence` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idCompetence` int(11) NOT NULL,
  `idNiveau` int(11) NOT NULL,
  PRIMARY KEY (`idGroupe_competence`),
  KEY `idUser_idx` (`idUser`),
  KEY `idCompetence_idx` (`idCompetence`),
  KEY `idNiveau_idx` (`idNiveau`),
  CONSTRAINT `idNiveau` FOREIGN KEY (`idNiveau`) REFERENCES `niveau_competence` (`idNiveau_competence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCompetence` FOREIGN KEY (`idCompetence`) REFERENCES `competences` (`idCompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe_competence`
--

LOCK TABLES `groupe_competence` WRITE;
/*!40000 ALTER TABLE `groupe_competence` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupe_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listeCompPost`
--

DROP TABLE IF EXISTS `listeCompPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listeCompPost` (
  `idListeCompPost` int(11) NOT NULL AUTO_INCREMENT,
  `idCompetence` int(11) NOT NULL,
  `idPost` int(11) NOT NULL,
  PRIMARY KEY (`idListeCompPost`),
  KEY `fk_listeCompPost_post_idx` (`idPost`),
  KEY `fk_listeCompPost_competence_idx` (`idCompetence`),
  CONSTRAINT `fk_listeCompPost_competence` FOREIGN KEY (`idCompetence`) REFERENCES `competences` (`idCompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_listeCompPost_post` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listeCompPost`
--

LOCK TABLES `listeCompPost` WRITE;
/*!40000 ALTER TABLE `listeCompPost` DISABLE KEYS */;
/*!40000 ALTER TABLE `listeCompPost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `textMessage` varchar(45) NOT NULL,
  `idPost` int(11) NOT NULL,
  `isMainMessage` tinyint(1) NOT NULL,
  `dateMessage` datetime NOT NULL,
  `scoreMessage` int(11) NOT NULL,
  PRIMARY KEY (`idMessage`),
  KEY `idUser_idx` (`idUser`),
  KEY `idPost_idx` (`idPost`),
  CONSTRAINT `fk_message_post` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,'Ceci est le message principal',2,1,'2017-01-01 00:00:00',3),(2,1,'Bonjour, consecte',1,0,'2017-10-13 15:40:00',0),(3,1,'Bonjour, Lorem ipsum dolor sit amet, consecte',1,1,'2017-10-13 14:10:00',0),(4,1,'Ceci est la première réponse',2,0,'2017-01-01 10:00:00',10);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau_competence`
--

DROP TABLE IF EXISTS `niveau_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau_competence` (
  `idNiveau_competence` int(11) NOT NULL AUTO_INCREMENT,
  `nomNiveau_competence` varchar(45) NOT NULL,
  PRIMARY KEY (`idNiveau_competence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau_competence`
--

LOCK TABLES `niveau_competence` WRITE;
/*!40000 ALTER TABLE `niveau_competence` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveau_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `idPost` int(11) NOT NULL AUTO_INCREMENT,
  `textePost` varchar(45) DEFAULT NULL,
  `titrePost` varchar(255) DEFAULT NULL,
  `dateLastPost` datetime DEFAULT NULL,
  PRIMARY KEY (`idPost`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'By default, Laravel will use the fully qualif','Custom Polymorphic Types','2017-06-12 00:00:00'),(2,'Ceci est le post n2, il contient 3 messages','post n2','2017-01-01 00:00:00');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `pseudoUser` varchar(45) NOT NULL,
  `emailUser` varchar(255) NOT NULL,
  `passwordUser` varchar(255) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','root@root.dev','root'),(2,'pseudo1','email@email.fr','root');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `idVote` int(11) NOT NULL AUTO_INCREMENT,
  `idMessage` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `boolVote` tinyint(1) NOT NULL,
  PRIMARY KEY (`idVote`),
  KEY `fk_vote_Message_idx` (`idMessage`),
  KEY `fk_vote_user_idx` (`idUser`),
  CONSTRAINT `fk_vote_message` FOREIGN KEY (`idMessage`) REFERENCES `message` (`idMessage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_user` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-13 16:26:14
