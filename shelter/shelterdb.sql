-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 05 Ιαν 2023 στις 11:19:36
-- Έκδοση διακομιστή: 10.4.27-MariaDB
-- Έκδοση PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `shelterdb`
--

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `anazitisi_chamenou_zoou`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `anazitisi_chamenou_zoou` (
`Fotografia_Zoou` varchar(100)
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `donation`
--

CREATE TABLE `donation` (
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Donation Amount` bigint(20) NOT NULL,
  `Method` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `donation`
--

INSERT INTO `donation` (`Name`, `Email`, `Donation Amount`, `Method`) VALUES
('1', '1@gmail.com', 1, ''),
('1', 'panagiotisskaki@yahoo.gr', 1, 'credit-card'),
('vroom', '1@gmail.com', 1, 'credit-card'),
('1', '1@gmail.com', 1, 'credit-card'),
('vroom', 'welovethemis@gmail.com', 1000, 'credit-card'),
('vroom', 'panagiotisskaki@yahoo.gr', 200, 'paypal');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ergazomenos`
--

CREATE TABLE `ergazomenos` (
  `Er_Kodikos_Ergazomenou` char(5) NOT NULL,
  `Er_Posto` varchar(25) DEFAULT NULL,
  `Pp_AMKA` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `ergazomenos`
--

INSERT INTO `ergazomenos` (`Er_Kodikos_Ergazomenou`, `Er_Posto`, `Pp_AMKA`) VALUES
('E4345', 'Ekpaideftis', '10039090050'),
('E1215', 'Katharistis', '10057532934'),
('E0202', 'Ekpaideftis', '12127011231'),
('E2111', 'Grammateas', '12127011233'),
('E9875', 'Fylakas', '20057532134'),
('E5611', 'Fylakas', '20057532934');

--
-- Δείκτες `ergazomenos`
--
DELIMITER $$
CREATE TRIGGER `Ergazomenos_BEFORE_INSERT` BEFORE INSERT ON `ergazomenos` FOR EACH ROW BEGIN
     IF ((char_length(NEW.Er_Kodikos_Ergazomenou)!=5) OR (LEFT(NEW.Er_Kodikos_Ergazomenou,1)!='E')) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id number of Employees should be like: ECHCHCHCh, where X is a number ' ;
	 END IF ;
     
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ethelontis`
--

CREATE TABLE `ethelontis` (
  `E_Onomateponymo` varchar(25) NOT NULL,
  `E_Patronymo` varchar(25) NOT NULL,
  `E_Tilefono` char(10) DEFAULT NULL,
  `F_Arithmos_Mitroou` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `ethelontis`
--

INSERT INTO `ethelontis` (`E_Onomateponymo`, `E_Patronymo`, `E_Tilefono`, `F_Arithmos_Mitroou`) VALUES
('Anastasios Pavlidis', 'Petrou', '6968255312', 'F1235'),
('Athina Konstantinidi', 'Georgiou', '6934534544', 'F9357'),
('Georgios Athanasiou', 'Vasileiou', '6934534534', 'F8426'),
('Giannis Natsios', 'Panagiotou', '6945464535', 'F4850'),
('Konstantinos Christou', 'Dimitriou', '6945464535', 'F0483'),
('Marianthi Danezi', 'Georgiou', '6968255312', 'F1235');

--
-- Δείκτες `ethelontis`
--
DELIMITER $$
CREATE TRIGGER `Ethelontis_BEFORE_INSERT` BEFORE INSERT ON `ethelontis` FOR EACH ROW BEGIN
     IF (char_length(NEW.E_Tilefono)!=10) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'E_Telephone number should have 10 digits' ;
	 END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `filozoiki`
--

CREATE TABLE `filozoiki` (
  `F_Arithmos_Mitroou` char(5) NOT NULL,
  `Diefthynsi` varchar(50) NOT NULL,
  `Eponymia` varchar(25) NOT NULL,
  `Tilefono` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `filozoiki`
--

INSERT INTO `filozoiki` (`F_Arithmos_Mitroou`, `Diefthynsi`, `Eponymia`, `Tilefono`) VALUES
('F0483', 'Panepistimiou 1, Agios Pavlos 546 36', 'Adespotos Planitis', '6945678900'),
('F1235', 'Komninon 47, Kalamaria 551 32', 'Noiazomai', '6912445678'),
('F2738', 'Kon. Palaiologou 25 Pylaia 5355 5', 'Adespoti Matia', '6900404830'),
('F4850', 'Vermiou 6, Sykies 566 26', 'I Agapi', '6911223344'),
('F8426', 'Olympou 5, Thessaloniki 546 30', 'O Seirios', '6912568905'),
('F9357', 'Romanou 2, Thessaloniki 546 21', 'SCARS', '6934829259');

--
-- Δείκτες `filozoiki`
--
DELIMITER $$
CREATE TRIGGER `Filozoiki_BEFORE_INSERT` BEFORE INSERT ON `filozoiki` FOR EACH ROW BEGIN
     IF (char_length(NEW.Tilefono)!=10) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Telephone number should have 10 digits' ;
	 END IF ;
     
     IF ((char_length(NEW.F_Arithmos_Mitroou)!=5) OR (LEFT(NEW.F_Arithmos_Mitroou,1)!='F')) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Protocol number of Shelter should be like: FCHCHCHCh, where X is a number ' ;
	 END IF ;
     
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `found`
--

CREATE TABLE `found` (
  `Pet Name` text NOT NULL,
  `Pet Breed` text NOT NULL,
  `Pet Description` text NOT NULL,
  `Location Found` text NOT NULL,
  `Phone Number` bigint(20) NOT NULL,
  `Email` text NOT NULL,
  `Photo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `found`
--

INSERT INTO `found` (`Pet Name`, `Pet Breed`, `Pet Description`, `Location Found`, `Phone Number`, `Email`, `Photo`) VALUES
('panos pro', 'chihuahua', 'my dog is orange', 'tsimiski', 6941842353, 'panagiotisskaki@yahoo.gr', 0x62696f2e706e67);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `frontizei`
--

CREATE TABLE `frontizei` (
  `Pp_AMKA` char(11) NOT NULL,
  `Z_Id` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `frontizei`
--

INSERT INTO `frontizei` (`Pp_AMKA`, `Z_Id`) VALUES
('10127012721', '00363'),
('11127011221', '00505'),
('12127010231', '00506'),
('12127011221', '00543'),
('15127019921', '00736'),
('19127015521', '01002');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ktiniatros`
--

CREATE TABLE `ktiniatros` (
  `Pp_AMKA` char(11) NOT NULL,
  `K_Kodikos` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `ktiniatros`
--

INSERT INTO `ktiniatros` (`Pp_AMKA`, `K_Kodikos`) VALUES
('10127012721', 'K1449'),
('11127011221', 'K1234'),
('12127010231', 'K2044'),
('12127011221', 'K3256'),
('15127019921', 'K0245'),
('19127015521', 'K5846');

--
-- Δείκτες `ktiniatros`
--
DELIMITER $$
CREATE TRIGGER `Ktiniatros_BEFORE_INSERT` BEFORE INSERT ON `ktiniatros` FOR EACH ROW BEGIN
     IF ((char_length(NEW.K_Kodikos)!=5) OR (LEFT(NEW.K_Kodikos,1)!='K')) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id number of Employees should be like: KCHCHCHCh, where X is a number ' ;
	 END IF ;
     
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `lost`
--

CREATE TABLE `lost` (
  `Pet Name` text NOT NULL,
  `Pet Breed` text NOT NULL,
  `Pet Description` text NOT NULL,
  `Last Known Location` text NOT NULL,
  `Phone Number` bigint(11) NOT NULL,
  `Email` text NOT NULL,
  `Photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `lost`
--

INSERT INTO `lost` (`Pet Name`, `Pet Breed`, `Pet Description`, `Last Known Location`, `Phone Number`, `Email`, `Photo`) VALUES
('panos pro', 'chiuaua', 'My dog is orange', 'Tsimiski', 6941854862, 'panagiotisskaki@yahoo.gr', 'a.png');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `nadopt`
--

CREATE TABLE `nadopt` (
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Phone` bigint(20) NOT NULL,
  `Address` text NOT NULL,
  `Preference` text NOT NULL,
  `Experience` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `nadopt`
--

INSERT INTO `nadopt` (`Name`, `Email`, `Phone`, `Address`, `Preference`, `Experience`) VALUES
('vroom', 'panagiotisskaki@yahoo.gr', 6948824546, 'Egnatia 2', 'Chihuahua', 'No experience'),
('Themhs', 'welovethemis@gmail.com', 6948344545, 'Tsimiski 1', 'Small 1 month old puppy', 'I had a dog for 10 years'),
('panos pro', 'panjimpro@gmail.com', 6948775324, 'V.Olgas 1', 'Labrador Retriever', 'No experience');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `nvolunteers`
--

CREATE TABLE `nvolunteers` (
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Phone` bigint(20) NOT NULL,
  `Availability` text NOT NULL,
  `Experience` text NOT NULL,
  `Skills` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `nvolunteers`
--

INSERT INTO `nvolunteers` (`Name`, `Email`, `Phone`, `Availability`, `Experience`, `Skills`) VALUES
('vroom', 'panagiotisskaki@yahoo.gr', 694882, 'Always', 'No exprerience', 'I love animals'),
('vroom', 'welovethemis@gmail.com', 6948824546, 'Mondays', 'I had a dog for 10 years', 'I love cleaning animals');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `politis`
--

CREATE TABLE `politis` (
  `P_Arithmos_Taftotitas` char(9) NOT NULL,
  `P_Diefthynsi_Katoikias` varchar(50) DEFAULT NULL,
  `P_Onomateponymo` varchar(25) NOT NULL,
  `P_Diagogi` enum('1','2','3','4','5','6','7','8','9','10') DEFAULT NULL,
  `E_Onomateponymo` varchar(25) DEFAULT NULL,
  `E_Patronymo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `politis`
--

INSERT INTO `politis` (`P_Arithmos_Taftotitas`, `P_Diefthynsi_Katoikias`, `P_Onomateponymo`, `P_Diagogi`, `E_Onomateponymo`, `E_Patronymo`) VALUES
('AI 491245', 'Agias Sofias 42, Thessaloniki 54623', 'Konstantinos Athanasiou', '2', 'Georgios Athanasiou', 'Vasileiou'),
('AI 493752', 'Agapis 1, Thessaloniki 54622', 'Konstantinos Natsios', '2', 'Giannis Natsios', 'Panagiotou'),
('AK 121326', '26is Oktovriou 5, Thessaloniki 54646', 'Christina Danezi', '8', NULL, NULL),
('AK 654134', '25is MARTIOU 3, Thessaloniki 54646', 'Christos Pavlidis', '7', 'Marianthi Danezi', 'Georgiou'),
('AM 123163', 'Aiolou 1, Thessaloniki 54634', 'Georgios Christou', '6', 'Anastasios Pavlidis', 'Petrou'),
('AV 573592', 'Analipseos 2, Thessaloniki 54643', 'Athina Tsiouki', '10', NULL, NULL);

--
-- Δείκτες `politis`
--
DELIMITER $$
CREATE TRIGGER `Politis_BEFORE_INSERT` BEFORE INSERT ON `politis` FOR EACH ROW BEGIN
     IF (char_length(NEW.P_Arithmos_Taftotitas)!=9) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID card number should have 9 digits f.e: AB 134567 ' ;
	 END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `promitheftis`
--

CREATE TABLE `promitheftis` (
  `Pro_Eponymia` varchar(25) NOT NULL,
  `Pro_Tilefono` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `promitheftis`
--

INSERT INTO `promitheftis` (`Pro_Eponymia`, `Pro_Tilefono`) VALUES
('Barron', '6951234464'),
('Mojestic', '6946343864'),
('Nativa', '6915324465'),
('Woofy', '6913644168'),
('Yammi', '6948324484'),
('ZeeDog', '6916235441');

--
-- Δείκτες `promitheftis`
--
DELIMITER $$
CREATE TRIGGER `Promitheftis_BEFORE_INSERT` BEFORE INSERT ON `promitheftis` FOR EACH ROW BEGIN
     IF (char_length(NEW.Pro_Tilefono)!=10) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pro_Telephone number should have 10 digits' ;
	 END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `promitheies`
--

CREATE TABLE `promitheies` (
  `Pr_Onoma` varchar(25) NOT NULL,
  `Pro_Eponymia` varchar(25) NOT NULL,
  `Pou_Posotita` char(15) DEFAULT NULL,
  `Pr_timi` varchar(25) DEFAULT NULL,
  `Pr_Katigoria` varchar(25) DEFAULT NULL,
  `F_Arithmos_Mitroou` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `promitheies`
--

INSERT INTO `promitheies` (`Pr_Onoma`, `Pro_Eponymia`, `Pou_Posotita`, `Pr_timi`, `Pr_Katigoria`, `F_Arithmos_Mitroou`) VALUES
('Kolaro', 'ZeeDog', '30', '5', 'Axesouar', 'F2738'),
('Kolles A4', 'Barron', '10', '4', 'Grafiki Yli', 'F0483'),
('Kolles A4', 'Yammi', '10', '4', 'Grafiki Yli', 'F1235'),
('Skylotrofi', 'Barron', '1000', '6', 'Trofi', 'F0483'),
('Skylotrofi', 'Yammi', '1000', '5', 'Trofi', 'F1235'),
('Skylotrofi', 'ZeeDog', '1000', '5', 'Trofi', 'F4850');

--
-- Δείκτες `promitheies`
--
DELIMITER $$
CREATE TRIGGER `Promitheies_BEFORE_INSERT` BEFORE INSERT ON `promitheies` FOR EACH ROW BEGIN
     IF (NEW.Pr_Timi<=0) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The price of a product cannot be <=0 euros' ;
	 END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `promitheies_filozoikis`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `promitheies_filozoikis` (
`Onoma_Promitheias` varchar(25)
,`Timi_Promitheias` varchar(25)
,`Posotita_Pros_Poulisei` char(15)
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `prosopiko`
--

CREATE TABLE `prosopiko` (
  `Pp_AMKA` char(11) NOT NULL,
  `Pp_Onomateponymo` varchar(25) NOT NULL,
  `Pp_Imerominia_Proslipsis` date NOT NULL,
  `Pp_Email` varchar(50) NOT NULL,
  `F_Arithmos_Mitroou` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `prosopiko`
--

INSERT INTO `prosopiko` (`Pp_AMKA`, `Pp_Onomateponymo`, `Pp_Imerominia_Proslipsis`, `Pp_Email`, `F_Arithmos_Mitroou`) VALUES
('10039090050', 'Eleanna Georgiou', '2020-03-10', 'eleanna19@gmail.com', 'F2738'),
('10057532934', 'Georgios Papadopoulos', '2015-11-11', 'giorgos@yahoo.com', 'F9357'),
('10097588931', 'Nikos Panou', '2012-08-15', 'panou@gmail.com', 'F1235'),
('10097589322', 'Panagiotis Lemonis', '2013-05-01', 'parpt@hotmail.com', 'F1235'),
('10097589341', 'Georgios Konstantinou', '2010-02-05', 'giorgos1@gmail.com', 'F1235'),
('10127012721', 'Matilnta Nikita	', '2008-07-06', 'lydia@yahoo.gr', 'F4850'),
('11127011221', 'Katerina Mavridou', '2020-05-04', 'kate@gmail.com', 'F0483'),
('12127010231', 'Eleni Nikou', '2015-09-11', 'lena@gmail.com', 'F0483'),
('12127011221', 'Ilias Tasidis', '2013-05-01', 'lakis@gmail.com', 'F0483'),
('12127011231', 'Nikos Papatzis', '2007-08-05', 'natassa@gmail.com', 'F8426'),
('12127011233', 'Konstantinos Christou', '2012-12-02', 'kostas1990@gmail.com', 'F8426'),
('13057588324', 'Marina Nikolaou', '2011-02-05', 'marina@gmail.com', 'F1235'),
('13456676899', 'Maria Lamprou', '2020-12-16', 'mary@gmail.com', 'F1235'),
('15127019921', 'Lydia Nikita', '2009-08-06', 'matil@yahoo.gr', 'F4850'),
('15890087425', 'Anastasia Pavlou', '2019-09-09', 'tasa@gmail.com', 'F1235'),
('19127015521', 'Anna Papi', '2010-07-06', 'annie@gmail.com', 'F4850'),
('20057532134', 'Stamatia Pavlopoulou', '2022-09-22', 'stamatia@gmail.com', 'F2738'),
('20057532934', 'Alexandros Xanthos', '2005-11-16', 'alexis@gmail.com', 'F9357');

--
-- Δείκτες `prosopiko`
--
DELIMITER $$
CREATE TRIGGER `Prosopiko_BEFORE_INSERT` BEFORE INSERT ON `prosopiko` FOR EACH ROW BEGIN
     IF (char_length(NEW.Pp_AMKA)!=11) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'AMKA should have 11 digits' ;
	 END IF ;
     

     
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `prosopiko_filozoikis`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `prosopiko_filozoikis` (
`Onomateponymo_Prosopikou` varchar(25)
,`AMKA_Prosopikou` char(11)
);

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `prosopiko_gia_ypefthyno`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `prosopiko_gia_ypefthyno` (
`Onomateponymo_Prosopikou` varchar(25)
,`AMKA_Prosopikou` char(11)
);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tilefono_politi`
--

CREATE TABLE `tilefono_politi` (
  `P_Arithmos_Taftotitas` char(9) NOT NULL,
  `P_Tilefono` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `tilefono_politi`
--

INSERT INTO `tilefono_politi` (`P_Arithmos_Taftotitas`, `P_Tilefono`) VALUES
('AI 491245', '6912345678'),
('AI 493752', '6913456789'),
('AK 121326', '6914567890'),
('AK 654134', '6915678901'),
('AM 123163', '6916789012'),
('AV 573592', '6912345672');

--
-- Δείκτες `tilefono_politi`
--
DELIMITER $$
CREATE TRIGGER `Tilefono_Politi_BEFORE_INSERT` BEFORE INSERT ON `tilefono_politi` FOR EACH ROW BEGIN
     IF (char_length(NEW.P_Tilefono)!=10) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'P_Telephone number should have 10 digits' ;
	 END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ypefthynos`
--

CREATE TABLE `ypefthynos` (
  `Pp_AMKA` char(11) NOT NULL,
  `Y_Kodikos_Ypefthynou` char(5) NOT NULL,
  `Di_Apo_Imerominia` date NOT NULL,
  `Di_Mechri_Imerominia` date DEFAULT NULL,
  `F_Arithmos_Mitroou` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `ypefthynos`
--

INSERT INTO `ypefthynos` (`Pp_AMKA`, `Y_Kodikos_Ypefthynou`, `Di_Apo_Imerominia`, `Di_Mechri_Imerominia`, `F_Arithmos_Mitroou`) VALUES
('10039090050', 'Y1267', '2008-07-06', '2009-07-06', 'F4850'),
('10057532934', 'Y7869', '2020-09-09', '2022-09-10', 'F9357'),
('12127011233', 'Y8888', '2020-03-10', '2021-03-10', 'F2738'),
('13456676899', 'Y0003', '2015-05-01', '2016-05-01', 'F1235'),
('15890087425', 'Y5789', '2013-05-01', '2014-05-01', 'F1235'),
('20057532134', 'Y9999', '2015-08-10', '2016-08-10', 'F0483');

--
-- Δείκτες `ypefthynos`
--
DELIMITER $$
CREATE TRIGGER `Ypefthynos_BEFORE_INSERT` BEFORE INSERT ON `ypefthynos` FOR EACH ROW BEGIN
     IF ((char_length(NEW.Y_Kodikos_Ypefthynou)!=5) OR (LEFT(NEW.Y_Kodikos_Ypefthynou,1)!='Y')) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id number of Employees should be like: YCHCHCHCh, where X is a number ' ;
	 END IF ;
     
     IF ((NEW.Di_Apo_Imerominia)>=(NEW.Di_Mechri_Imerominia)) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'I cannot have starting date later than end date for the Adminstrator' ;
	 END IF ;
     
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `zoo`
--

CREATE TABLE `zoo` (
  `Z_Id` char(5) NOT NULL,
  `Z_Onoma` varchar(25) DEFAULT NULL,
  `Z_Link_Fotografias` varchar(100) DEFAULT NULL,
  `Z_Fylo` enum('F','M') NOT NULL,
  `Z_Chroma` varchar(15) NOT NULL,
  `Z_Ratsa` varchar(25) DEFAULT NULL,
  `Z_Imerominia_Gennisis` date DEFAULT NULL,
  `Z_Steirosi` tinyint(1) NOT NULL,
  `Z_Emvoliasmos` tinyint(1) NOT NULL,
  `Z_Yiothesia` tinyint(1) NOT NULL,
  `Z_Chathike` enum('L','F') DEFAULT NULL,
  `E_Onomateponymo` varchar(25) DEFAULT NULL,
  `E_Patronymo` varchar(25) DEFAULT NULL,
  `P_Arithmos_Taftotitas` char(9) DEFAULT NULL,
  `F_Arithmos_Mitroou` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `zoo`
--

INSERT INTO `zoo` (`Z_Id`, `Z_Onoma`, `Z_Link_Fotografias`, `Z_Fylo`, `Z_Chroma`, `Z_Ratsa`, `Z_Imerominia_Gennisis`, `Z_Steirosi`, `Z_Emvoliasmos`, `Z_Yiothesia`, `Z_Chathike`, `E_Onomateponymo`, `E_Patronymo`, `P_Arithmos_Taftotitas`, `F_Arithmos_Mitroou`) VALUES
('00363', 'Tzak', 'https://drive.google.com/file/d/1PB8R21Pv0wKYttq7CgG7gZrYUe-Jq6sJ/view?usp=sharing', 'M', 'Mavro', 'Germanikos Poimenikos', '2019-05-12', 1, 1, 0, 'F', 'Georgios Athanasiou', 'Vasileiou', 'AI 491245', 'F8426'),
('00505', 'Liza', 'https://drive.google.com/file/d/1z77xxq1dL6ox-Yy8yd4pPfjkv0suO8Ht/view?usp=sharing', 'F', 'Portokali', 'Pomeranian', '2020-01-10', 1, 1, 1, 'L', NULL, NULL, 'AI 491245', 'F0483'),
('00506', 'Tsarli', 'https://drive.google.com/file/d/1FrUgjK5ax5W3MpazD_CQYcbSYCZKNS64/view?usp=sharing', 'M', 'Aspro', 'Akita', '2022-09-02', 0, 0, 1, 'F', 'Georgios Athanasiou', 'Vasileiou', 'AI 491245', 'F0483'),
('00543', 'Polina', 'https://drive.google.com/file/d/1Sfle-2z6hl9m4JO-jQBZKcS4hRkEf3Wj/view?usp=sharing', 'F', 'Kafe', 'Boxer', '2021-06-19', 1, 1, 1, 'F', 'Konstantinos Christou', 'Dimitriou', 'AI 493752', 'F2738'),
('00736', 'Laidi', 'https://drive.google.com/file/d/15ufR0kvt45AGy5ZDDjpLB15rE5ZFQcLz/view?usp=sharing', 'F', 'Kafe', 'Koker Spaniel', '2022-04-10', 1, 1, 0, 'L', NULL, NULL, 'AK 121326', 'F9357'),
('01002', 'Max', 'https://drive.google.com/file/d/1h72gPS1bvOl_GpPEy899qDabRi95C8-Y/view?usp=sharing', 'M', 'Bez', 'Pagk', '2021-10-22', 1, 1, 0, NULL, NULL, NULL, NULL, 'F1235');

--
-- Δείκτες `zoo`
--
DELIMITER $$
CREATE TRIGGER `Zoo_BEFORE_INSERT` BEFORE INSERT ON `zoo` FOR EACH ROW BEGIN
     IF ((char_length(NEW.Z_Id)!=5)) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id number of Animal should have 5 number digits ' ;
	 END IF ;
     
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `zoo_pros_yiothesia`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `zoo_pros_yiothesia` (
`Fotografia_Zoou` varchar(100)
,`Id_Zoou` char(5)
,`Eponymia_Filozoikis` varchar(25)
);

-- --------------------------------------------------------

--
-- Δομή για προβολή `anazitisi_chamenou_zoou`
--
DROP TABLE IF EXISTS `anazitisi_chamenou_zoou`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `anazitisi_chamenou_zoou`  AS SELECT `zoo`.`Z_Link_Fotografias` AS `Fotografia_Zoou` FROM `zoo` WHERE `zoo`.`Z_Chathike` = 'F' AND `zoo`.`Z_Emvoliasmos` = 1 AND `zoo`.`Z_Steirosi` = 11  ;

-- --------------------------------------------------------

--
-- Δομή για προβολή `promitheies_filozoikis`
--
DROP TABLE IF EXISTS `promitheies_filozoikis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promitheies_filozoikis`  AS SELECT `promitheies`.`Pr_Onoma` AS `Onoma_Promitheias`, `promitheies`.`Pr_timi` AS `Timi_Promitheias`, `promitheies`.`Pou_Posotita` AS `Posotita_Pros_Poulisei` FROM (`filozoiki` join `promitheies` on(`filozoiki`.`F_Arithmos_Mitroou` = `promitheies`.`F_Arithmos_Mitroou`))  ;

-- --------------------------------------------------------

--
-- Δομή για προβολή `prosopiko_filozoikis`
--
DROP TABLE IF EXISTS `prosopiko_filozoikis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prosopiko_filozoikis`  AS SELECT `prosopiko`.`Pp_Onomateponymo` AS `Onomateponymo_Prosopikou`, `prosopiko`.`Pp_AMKA` AS `AMKA_Prosopikou` FROM (`prosopiko` join `filozoiki` on(`prosopiko`.`F_Arithmos_Mitroou` = `filozoiki`.`F_Arithmos_Mitroou`))  ;

-- --------------------------------------------------------

--
-- Δομή για προβολή `prosopiko_gia_ypefthyno`
--
DROP TABLE IF EXISTS `prosopiko_gia_ypefthyno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prosopiko_gia_ypefthyno`  AS SELECT `prosopiko`.`Pp_Onomateponymo` AS `Onomateponymo_Prosopikou`, `prosopiko`.`Pp_AMKA` AS `AMKA_Prosopikou` FROM (`ypefthynos` join `prosopiko` on(`ypefthynos`.`Pp_AMKA` = `prosopiko`.`Pp_AMKA`))  ;

-- --------------------------------------------------------

--
-- Δομή για προβολή `zoo_pros_yiothesia`
--
DROP TABLE IF EXISTS `zoo_pros_yiothesia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zoo_pros_yiothesia`  AS SELECT `zoo`.`Z_Link_Fotografias` AS `Fotografia_Zoou`, `zoo`.`Z_Id` AS `Id_Zoou`, `filozoiki`.`Eponymia` AS `Eponymia_Filozoikis` FROM (`zoo` join `filozoiki` on(`zoo`.`F_Arithmos_Mitroou` = `filozoiki`.`F_Arithmos_Mitroou`)) WHERE `zoo`.`Z_Yiothesia` = 0 AND `zoo`.`Z_Emvoliasmos` = 1 AND `zoo`.`Z_Steirosi` = 11  ;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `ergazomenos`
--
ALTER TABLE `ergazomenos`
  ADD PRIMARY KEY (`Pp_AMKA`);

--
-- Ευρετήρια για πίνακα `ethelontis`
--
ALTER TABLE `ethelontis`
  ADD PRIMARY KEY (`E_Onomateponymo`,`E_Patronymo`),
  ADD KEY `fk_Ethelontis_Filozoiki1_idx` (`F_Arithmos_Mitroou`);

--
-- Ευρετήρια για πίνακα `filozoiki`
--
ALTER TABLE `filozoiki`
  ADD PRIMARY KEY (`F_Arithmos_Mitroou`);

--
-- Ευρετήρια για πίνακα `found`
--
ALTER TABLE `found`
  ADD PRIMARY KEY (`Phone Number`);

--
-- Ευρετήρια για πίνακα `frontizei`
--
ALTER TABLE `frontizei`
  ADD PRIMARY KEY (`Pp_AMKA`,`Z_Id`),
  ADD KEY `fk_Frontizei_Zoo1_idx` (`Z_Id`);

--
-- Ευρετήρια για πίνακα `ktiniatros`
--
ALTER TABLE `ktiniatros`
  ADD PRIMARY KEY (`Pp_AMKA`);

--
-- Ευρετήρια για πίνακα `lost`
--
ALTER TABLE `lost`
  ADD PRIMARY KEY (`Phone Number`);

--
-- Ευρετήρια για πίνακα `politis`
--
ALTER TABLE `politis`
  ADD PRIMARY KEY (`P_Arithmos_Taftotitas`),
  ADD KEY `fk_Politis_Ethelontis1_idx` (`E_Onomateponymo`,`E_Patronymo`);

--
-- Ευρετήρια για πίνακα `promitheftis`
--
ALTER TABLE `promitheftis`
  ADD PRIMARY KEY (`Pro_Eponymia`);

--
-- Ευρετήρια για πίνακα `promitheies`
--
ALTER TABLE `promitheies`
  ADD PRIMARY KEY (`Pr_Onoma`,`Pro_Eponymia`),
  ADD KEY `fk_Promitheies_Promitheftis1_idx` (`Pro_Eponymia`),
  ADD KEY `fk_Promitheies_Filozoiki1_idx` (`F_Arithmos_Mitroou`);

--
-- Ευρετήρια για πίνακα `prosopiko`
--
ALTER TABLE `prosopiko`
  ADD PRIMARY KEY (`Pp_AMKA`),
  ADD KEY `fk_Prosopiko_Filozoiki1_idx` (`F_Arithmos_Mitroou`);

--
-- Ευρετήρια για πίνακα `tilefono_politi`
--
ALTER TABLE `tilefono_politi`
  ADD PRIMARY KEY (`P_Arithmos_Taftotitas`,`P_Tilefono`);

--
-- Ευρετήρια για πίνακα `ypefthynos`
--
ALTER TABLE `ypefthynos`
  ADD PRIMARY KEY (`Pp_AMKA`),
  ADD KEY `fk_Ypefthynos_Filozoiki1_idx` (`F_Arithmos_Mitroou`);

--
-- Ευρετήρια για πίνακα `zoo`
--
ALTER TABLE `zoo`
  ADD PRIMARY KEY (`Z_Id`),
  ADD UNIQUE KEY `Z_Link_Fotografias_UNIQUE` (`Z_Link_Fotografias`),
  ADD KEY `fk_Zoo_Ethelontis_idx` (`E_Onomateponymo`,`E_Patronymo`),
  ADD KEY `fk_Zoo_Politis1_idx` (`P_Arithmos_Taftotitas`),
  ADD KEY `fk_Zoo_Filozoiki1_idx` (`F_Arithmos_Mitroou`);

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `ergazomenos`
--
ALTER TABLE `ergazomenos`
  ADD CONSTRAINT `fk_Ergazomenos_Prosopiko1` FOREIGN KEY (`Pp_AMKA`) REFERENCES `prosopiko` (`Pp_AMKA`);

--
-- Περιορισμοί για πίνακα `ethelontis`
--
ALTER TABLE `ethelontis`
  ADD CONSTRAINT `fk_Ethelontis_Filozoiki1` FOREIGN KEY (`F_Arithmos_Mitroou`) REFERENCES `filozoiki` (`F_Arithmos_Mitroou`);

--
-- Περιορισμοί για πίνακα `frontizei`
--
ALTER TABLE `frontizei`
  ADD CONSTRAINT `fk_Frontizei_Ktiniatros1` FOREIGN KEY (`Pp_AMKA`) REFERENCES `ktiniatros` (`Pp_AMKA`),
  ADD CONSTRAINT `fk_Frontizei_Zoo1` FOREIGN KEY (`Z_Id`) REFERENCES `zoo` (`Z_Id`);

--
-- Περιορισμοί για πίνακα `ktiniatros`
--
ALTER TABLE `ktiniatros`
  ADD CONSTRAINT `fk_Ktiniatros_Prosopiko1` FOREIGN KEY (`Pp_AMKA`) REFERENCES `prosopiko` (`Pp_AMKA`);

--
-- Περιορισμοί για πίνακα `politis`
--
ALTER TABLE `politis`
  ADD CONSTRAINT `fk_Politis_Ethelontis1` FOREIGN KEY (`E_Onomateponymo`,`E_Patronymo`) REFERENCES `ethelontis` (`E_Onomateponymo`, `E_Patronymo`);

--
-- Περιορισμοί για πίνακα `promitheies`
--
ALTER TABLE `promitheies`
  ADD CONSTRAINT `fk_Promitheies_Filozoiki1` FOREIGN KEY (`F_Arithmos_Mitroou`) REFERENCES `filozoiki` (`F_Arithmos_Mitroou`),
  ADD CONSTRAINT `fk_Promitheies_Promitheftis1` FOREIGN KEY (`Pro_Eponymia`) REFERENCES `promitheftis` (`Pro_Eponymia`);

--
-- Περιορισμοί για πίνακα `prosopiko`
--
ALTER TABLE `prosopiko`
  ADD CONSTRAINT `fk_Prosopiko_Filozoiki1` FOREIGN KEY (`F_Arithmos_Mitroou`) REFERENCES `filozoiki` (`F_Arithmos_Mitroou`);

--
-- Περιορισμοί για πίνακα `tilefono_politi`
--
ALTER TABLE `tilefono_politi`
  ADD CONSTRAINT `fk_Tilefono_Politi_Politis1` FOREIGN KEY (`P_Arithmos_Taftotitas`) REFERENCES `politis` (`P_Arithmos_Taftotitas`);

--
-- Περιορισμοί για πίνακα `ypefthynos`
--
ALTER TABLE `ypefthynos`
  ADD CONSTRAINT `fk_Ypefthynos_Filozoiki1` FOREIGN KEY (`F_Arithmos_Mitroou`) REFERENCES `filozoiki` (`F_Arithmos_Mitroou`),
  ADD CONSTRAINT `fk_Ypefthynos_Prosopiko1` FOREIGN KEY (`Pp_AMKA`) REFERENCES `prosopiko` (`Pp_AMKA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
