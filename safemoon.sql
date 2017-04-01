-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2017 at 10:19 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safemoon`
--

-- --------------------------------------------------------

--
-- Table structure for table `aspirants`
--

CREATE TABLE `aspirants` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `Party` varchar(256) NOT NULL,
  `Position` varchar(40) NOT NULL,
  `About` text NOT NULL,
  `Manifesto` text NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Agent` text NOT NULL,
  `Location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aspirants`
--

INSERT INTO `aspirants` (`ID`, `UserID`, `Party`, `Position`, `About`, `Manifesto`, `Status`, `Agent`, `Location`) VALUES
(6, 'ZGXYJ4', 'COAL', 'sena', '<p>it&#39;s me</p>\r\n\r\n<ul>\r\n	<li>nsdkns</li>\r\n	<li>sdfnaskld</li>\r\n</ul>\r\n', '<p>dskjnflksndf</p>\r\n', 1, '', ''),
(7, 'ABKY7Q', 'COALITION FOR REFOFRS AND DEMOCRACY', 'mp', '<p>hedsa<s>ksmdf;samdamda</s></p>\r\n\r\n<ol>\r\n	<li>samd;mas</li>\r\n	<li>s;ldmas<br />\r\n	&nbsp;</li>\r\n	<li>smdas,</li>\r\n	<li>as</li>\r\n</ol>\r\n', '<p>lkjdsk;fms;df;f</p>\r\n', 1, '', ''),
(8, 'PIYC48', 'COALITION FOR REFOFRS AND DEMOCRACY', 'governor', '<p>khk</p>\r\n', '<p>gh</p>\r\n', 0, 'none', ''),
(9, '8BZ7LV', 'Jubilee', 'governor', '<p>vinny</p>\r\n', '<p>vinny</p>\r\n', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `id` int(11) NOT NULL,
  `county_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='county';

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`id`, `county_name`) VALUES
(1, 'MOMBASA'),
(2, 'KWALE'),
(3, 'KILIFI'),
(4, 'TANA RIVER'),
(5, 'LAMU'),
(6, 'TAITA TAVETA'),
(7, 'GARISSA'),
(8, 'WAJIR'),
(9, 'MANDERA'),
(10, 'MARSABIT'),
(11, 'ISIOLO'),
(12, 'MERU'),
(13, 'THARAKA-NITHI'),
(14, 'EMBU'),
(15, 'KITUI'),
(16, 'MACHAKOS'),
(17, 'MAKUENI'),
(18, 'NYANDARUA'),
(19, 'NYERI'),
(20, 'KIRINYAGA'),
(21, 'MURANG\'A'),
(22, 'KIAMBU'),
(23, 'TURKANA'),
(24, 'WEST POKOT'),
(25, 'SAMBURU'),
(26, 'TRANS NZOIA'),
(27, 'UASIN GISHU'),
(28, 'ELGEYO/MARAKWET'),
(29, 'NANDI'),
(30, 'BARINGO'),
(31, 'LAIKIPIA'),
(32, 'NAKURU'),
(33, 'NAROK'),
(34, 'KAJIADO'),
(35, 'KERICHO'),
(36, 'BOMET'),
(37, 'KAKAMEGA'),
(38, 'VIHIGA'),
(39, 'BUNGOMA'),
(40, 'BUSIA'),
(41, 'SIAYA'),
(42, 'KISUMU'),
(43, 'HOMA BAY'),
(44, 'MIGORI'),
(45, 'KISII'),
(46, 'NYAMIRA'),
(47, 'NAIROBI');

-- --------------------------------------------------------

--
-- Table structure for table `governor`
--

CREATE TABLE `governor` (
  `UserID` varchar(8) NOT NULL,
  `County` varchar(254) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `governor`
--

INSERT INTO `governor` (`UserID`, `County`, `TimeStamp`) VALUES
('8BZ7LV', '12', '2017-03-21 15:15:36'),
('PIYC48', '10', '2017-03-19 19:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `Sender` varchar(6) NOT NULL,
  `Recepient` varchar(6) NOT NULL,
  `Message` text NOT NULL,
  `MessageRead` int(11) NOT NULL DEFAULT '0',
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`ID`, `Sender`, `Recepient`, `Message`, `MessageRead`, `TimeStamp`) VALUES
(1, 'ABKY7Q', 'ZGXYJ4', 'hello there', 1, '2017-03-08 07:20:39'),
(2, 'ZGXYJ4', 'ABKY7Q', 'hello back', 1, '2017-03-08 08:55:07'),
(4, 'ZGXYJ4', 'ABKY7Q', 'hi', 1, '2017-03-08 12:18:27'),
(5, 'ZGXYJ4', 'ABKY7Q', 'wewe, hebu jibu', 1, '2017-03-08 12:22:36'),
(6, 'ZGXYJ4', 'ABKY7Q', 'sasan', 1, '2017-03-08 12:23:34'),
(7, 'ZGXYJ4', 'ABKY7Q', 'sasan', 1, '2017-03-08 12:23:37'),
(8, 'ZGXYJ4', 'ABKY7Q', 'jsdfn', 1, '2017-03-08 12:24:40'),
(9, 'ZGXYJ4', 'ABKY7Q', 'askkjldkas', 1, '2017-03-08 12:24:45'),
(10, 'ZGXYJ4', 'ABKY7Q', 'kasjdlkasd', 1, '2017-03-08 12:24:50'),
(11, 'ZGXYJ4', 'ABKY7Q', 'sasan', 1, '2017-03-08 12:26:52'),
(12, 'ZGXYJ4', 'ABKY7Q', 'sasasn', 1, '2017-03-08 12:27:31'),
(13, 'ZGXYJ4', 'ABKY7Q', 'hellon', 1, '2017-03-08 12:31:30'),
(14, 'ZGXYJ4', 'ABKY7Q', 'hjkl', 1, '2017-03-08 12:32:45'),
(15, 'ZGXYJ4', 'ABKY7Q', 'knjlknlnlk', 1, '2017-03-08 12:33:39'),
(16, 'ZGXYJ4', 'ABKY7Q', 'bkjbkln\n,mn\nkln', 1, '2017-03-08 12:35:12'),
(17, 'ZGXYJ4', 'ABKY7Q', 'kjhkhkjk\niuyiuhyiuh\nuyuyii', 1, '2017-03-08 12:35:28'),
(18, 'ZGXYJ4', 'ZGXYJ4', 'hello', 1, '2017-03-08 16:28:32'),
(19, 'ZGXYJ4', 'ABKY7Q', 'jkadalsa', 1, '2017-03-09 14:18:45'),
(20, 'ZGXYJ4', 'RD23PP', 'asds', 1, '2017-03-09 14:19:03'),
(21, 'ABKY7Q', 'ASTJ8J', 'Hello', 1, '2017-03-12 13:18:48'),
(22, 'ASTJ8J', 'ABKY7Q', 'hi', 1, '2017-03-12 13:22:46'),
(23, 'ABKY7Q', 'ASTJ8J', 'sasa', 1, '2017-03-12 13:23:05'),
(24, 'ZGXYJ4', 'ZGXYJ4', 'hello', 1, '2017-03-27 09:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `mp`
--

CREATE TABLE `mp` (
  `UserID` varchar(8) NOT NULL,
  `County` varchar(254) NOT NULL,
  `Constituency` varchar(254) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `ID` int(11) NOT NULL,
  `Initiator` varchar(16) NOT NULL,
  `Intended` varchar(8) NOT NULL,
  `Notification` text NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Seen` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`ID`, `Initiator`, `Intended`, `Notification`, `TimeStamp`, `Seen`) VALUES
(6, 'Admin', 'ABKY7Q', 'Your account has been deactivated ', '2017-03-09 12:28:31', 0),
(7, 'Admin', 'ABKY7Q', 'Your account has been activated ', '2017-03-10 07:39:49', 0),
(8, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:09:28', 0),
(9, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:46', 0),
(10, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:47', 0),
(11, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:48', 0),
(12, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:48', 0),
(13, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:49', 0),
(14, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:49', 0),
(15, 'Admin', '8BZ7LV', 'Your account has been activated ', '2017-03-30 10:14:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `ID` int(11) NOT NULL,
  `PartyID` varchar(6) NOT NULL,
  `PartyName` varchar(254) NOT NULL,
  `PartyABR` varchar(16) NOT NULL,
  `Patron` text NOT NULL,
  `Color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`ID`, `PartyID`, `PartyName`, `PartyABR`, `Patron`, `Color`) VALUES
(1, 'P5RAFM', 'Jubilee', 'Jubilee', 'Uhuru Kenyatta', ''),
(2, 'PD8NV7', 'COALITION FOR REFOFRS AND DEMOCRACY', 'CORD', 'RAILA ODINGA', '#c9c66e'),
(3, 'PVUBAT', 'National super alliance', 'NASA', 'RAILA ODINGA', '#c9c66e');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `ID` int(11) NOT NULL,
  `Payer` int(11) NOT NULL,
  `TransactionID` varchar(10) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Verified` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`ID`, `Payer`, `TransactionID`, `UserID`, `Amount`, `Verified`, `TimeStamp`) VALUES
(1, 706928631, 'lce1d1u84f', '8BZ7LV', 25000, 0, '2017-03-21 15:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `presidential`
--

CREATE TABLE `presidential` (
  `UserID` varchar(8) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(60) NOT NULL,
  `MiddleName` varchar(60) NOT NULL,
  `LastName` varchar(60) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `ProfilePic` varchar(128) NOT NULL DEFAULT 'default_prof',
  `Ext` varchar(8) NOT NULL DEFAULT 'jpg',
  `Twitter` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`ID`, `FirstName`, `MiddleName`, `LastName`, `UserID`, `ProfilePic`, `Ext`, `Twitter`) VALUES
(4, 'isaac', 'kipkorir', 'tunduny', 'ZGXYJ4', 'FZGXYJ4', 'jpg', 'itunduny'),
(7, 'user', 'user', 'last', 'ABKY7Q', 'FABKY7Q', 'jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `senator`
--

CREATE TABLE `senator` (
  `UserID` varchar(8) NOT NULL,
  `County` varchar(254) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `senator`
--

INSERT INTO `senator` (`UserID`, `County`, `TimeStamp`) VALUES
('ABKY7Q', '8', '2017-03-12 14:14:35'),
('PIYC48', '8', '2017-03-19 19:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `subcounties`
--

CREATE TABLE `subcounties` (
  `id` int(255) NOT NULL,
  `county_id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `alias` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcounties`
--

INSERT INTO `subcounties` (`id`, `county_id`, `name`, `ward`, `alias`) VALUES
(1, 1, 'changamwe', 'port reitz', ''),
(2, 1, 'changamwe', 'kipevu', ''),
(3, 1, 'changamwe', 'airport', ''),
(4, 1, 'changamwe', 'changamwe', ''),
(5, 1, 'changamwe', 'chaani', ''),
(6, 1, 'jomvu', 'jomvu kuu', ''),
(7, 1, 'jomvu', 'miritini', ''),
(8, 1, 'jomvu', 'mikindani', ''),
(9, 1, 'kisauni', 'mjambere', ''),
(10, 1, 'kisauni', 'junda', ''),
(11, 1, 'kisauni', 'bamburi', ''),
(12, 1, 'kisauni', 'mwakirunge', ''),
(13, 1, 'kisauni', 'mtopanga', ''),
(14, 1, 'kisauni', 'magogoni', ''),
(15, 1, 'kisauni', 'shanzu', ''),
(16, 1, 'nyali', 'frere town', ''),
(17, 1, 'nyali', 'ziwa la ng\'ombe', ''),
(18, 1, 'nyali', 'mkomani', ''),
(19, 1, 'nyali', 'kongowea', ''),
(20, 1, 'nyali', 'kadzandani', ''),
(21, 1, 'likoni', 'mtongwe', ''),
(22, 1, 'likoni', 'shika adabu', ''),
(23, 1, 'likoni', 'bofu', ''),
(24, 1, 'likoni', 'likoni', ''),
(25, 1, 'likoni', 'timbwani', ''),
(26, 1, 'mvita', 'mji wa kale/makadara', ''),
(27, 1, 'mvita', 'tudor', ''),
(28, 1, 'mvita', 'tononoka', ''),
(29, 1, 'mvita', 'shimanzi/ganjoni', ''),
(30, 1, 'mvita', 'majengo', ''),
(31, 2, 'msambweni', 'gombatobongwe', ''),
(32, 2, 'msambweni', 'ukunda', ''),
(33, 2, 'msambweni', 'kinondo', ''),
(34, 2, 'msambweni', 'ramisi', ''),
(35, 2, 'lungalunga', 'pongwekikoneni', ''),
(36, 2, 'lungalunga', 'dzombo', ''),
(37, 2, 'lungalunga', 'mwereni', ''),
(38, 2, 'lungalunga', 'vanga', ''),
(39, 2, 'matuga', 'tsimba golini', ''),
(40, 2, 'matuga', 'waa', ''),
(41, 2, 'matuga', 'tiwi', ''),
(42, 2, 'matuga', 'kubo south', ''),
(43, 2, 'matuga', 'mkongani', ''),
(44, 2, 'kinango', 'nadavaya', ''),
(45, 2, 'kinango', 'puma', ''),
(46, 2, 'kinango', 'kinango', ''),
(47, 2, 'kinango', 'mackinnon-road', ''),
(48, 2, 'kinango', 'chengoni/samburu', ''),
(49, 2, 'kinango', 'mwavumbo', ''),
(50, 2, 'kinango', 'kasemeni', ''),
(51, 3, 'kilifi north', 'tezo', ''),
(52, 3, 'kilifi north', 'sokoni', ''),
(53, 3, 'kilifi north', 'kibarani', ''),
(54, 3, 'kilifi north', 'dabaso', ''),
(55, 3, 'kilifi north', 'matsangoni', ''),
(56, 3, 'kilifi north', 'watamu', ''),
(57, 3, 'kilifi north', 'mnarani', ''),
(58, 3, 'kilifi south', 'junju', ''),
(59, 3, 'kilifi south', 'mwarakaya', ''),
(60, 3, 'kilifi south', 'shimo la tewa', ''),
(61, 3, 'kilifi south', 'chasimba', ''),
(62, 3, 'kilifi south', 'mtepeni', ''),
(63, 3, 'kaloleni', 'mariakani', ''),
(64, 3, 'kaloleni', 'kayafungo', ''),
(65, 3, 'kaloleni', 'kaloleni', ''),
(66, 3, 'kaloleni', 'mwanamwinga', ''),
(67, 3, 'rabai', 'mwawesa', ''),
(68, 3, 'rabai', 'ruruma', ''),
(69, 3, 'rabai', 'kambe/ribe', ''),
(70, 3, 'rabai', 'rabai/kisurutini', ''),
(71, 3, 'ganze', 'ganze', ''),
(72, 3, 'ganze', 'bamba', ''),
(73, 3, 'ganze', 'jaribuni', ''),
(74, 3, 'ganze', 'sokoke', ''),
(75, 3, 'malindi', 'jilore', ''),
(76, 3, 'malindi', 'kakuyuni', ''),
(77, 3, 'malindi', 'ganda', ''),
(78, 3, 'malindi', 'malindi town', ''),
(79, 3, 'malindi', 'shella', ''),
(80, 3, 'magarini', 'marafa', ''),
(81, 3, 'magarini', 'magarini', ''),
(82, 3, 'magarini', 'gongoni', ''),
(83, 3, 'magarini', 'adu', ''),
(84, 3, 'magarini', 'garashi', ''),
(85, 3, 'magarini', 'sabaki', ''),
(86, 4, 'garsen', 'kipini east', ''),
(87, 4, 'garsen', 'garsen south', ''),
(88, 4, 'garsen', 'kipini west', ''),
(89, 4, 'garsen', 'garsen central', ''),
(90, 4, 'garsen', 'garsen west', ''),
(91, 4, 'garsen', 'garsen north', ''),
(92, 4, 'galole', 'kinakomba', ''),
(93, 4, 'galole', 'mikinduni', ''),
(94, 4, 'galole', 'chewani', ''),
(95, 4, 'galole', 'wayu', ''),
(96, 4, 'bura', 'chewele', ''),
(97, 4, 'bura', 'bura', ''),
(98, 4, 'bura', 'bangale', ''),
(99, 4, 'bura', 'sala', ''),
(100, 4, 'bura', 'madogo', ''),
(101, 5, 'lamu east', 'faza', ''),
(102, 5, 'lamu east', 'kiunga', ''),
(103, 5, 'lamu east', 'basuba', ''),
(104, 5, 'lamu west', 'shella', ''),
(105, 5, 'lamu west', 'mkomani', ''),
(106, 5, 'lamu west', 'hindi', ''),
(107, 5, 'lamu west', 'mkunumbi', ''),
(108, 5, 'lamu west', 'hongwe', ''),
(109, 5, 'lamu west', 'witu', ''),
(110, 5, 'lamu west', 'bahari', ''),
(111, 6, 'taveta', 'chala', ''),
(112, 6, 'taveta', 'mahoo', ''),
(113, 6, 'taveta', 'bomeni', ''),
(114, 6, 'taveta', 'mboghoni', ''),
(115, 6, 'taveta', 'mata', ''),
(116, 6, 'wundanyi', 'wundanyi/mbale', ''),
(117, 6, 'wundanyi', 'werugha', ''),
(118, 6, 'wundanyi', 'wumingu/kishushe', ''),
(119, 6, 'wundanyi', 'mwanda/mgange', ''),
(120, 6, 'mwatate', 'rong\'e', ''),
(121, 6, 'mwatate', 'mwatate', ''),
(122, 6, 'mwatate', 'bura', ''),
(123, 6, 'mwatate', 'chawia', ''),
(124, 6, 'mwatate', 'wusi/kishamba', ''),
(125, 6, 'voi', 'mbololo', ''),
(126, 6, 'voi', 'sagalla', ''),
(127, 6, 'voi', 'kaloleni', ''),
(128, 6, 'voi', 'marungu', ''),
(129, 6, 'voi', 'kasigau', ''),
(130, 6, 'voi', 'ngolia', ''),
(131, 7, 'garissa township', 'waberi', ''),
(132, 7, 'garissa township', 'galbet', ''),
(133, 7, 'garissa township', 'township', ''),
(134, 7, 'garissa township', 'iftin', ''),
(135, 7, 'balambala', 'balambala', ''),
(136, 7, 'balambala', 'danyere', ''),
(137, 7, 'balambala', 'jara jara', ''),
(138, 7, 'balambala', 'saka', ''),
(139, 7, 'balambala', 'sankuri', ''),
(140, 7, 'lagdera', 'modogashe', ''),
(141, 7, 'lagdera', 'benane', ''),
(142, 7, 'lagdera', 'goreale', ''),
(143, 7, 'lagdera', 'maalimin', ''),
(144, 7, 'lagdera', 'sabena', ''),
(145, 7, 'lagdera', 'baraki', ''),
(146, 7, 'dadaab', 'dertu', ''),
(147, 7, 'dadaab', 'dadaab', ''),
(148, 7, 'dadaab', 'labasigale', ''),
(149, 7, 'dadaab', 'damajale', ''),
(150, 7, 'dadaab', 'liboi', ''),
(151, 7, 'dadaab', 'abakaile', ''),
(152, 7, 'fafi', 'bura', ''),
(153, 7, 'fafi', 'dekaharia', ''),
(154, 7, 'fafi', 'jarajila', ''),
(155, 7, 'fafi', 'fafi', ''),
(156, 7, 'fafi', 'nanighi', ''),
(157, 7, 'ijara', 'hulugho', ''),
(158, 7, 'ijara', 'sangailu', ''),
(159, 7, 'ijara', 'ijara', ''),
(160, 7, 'ijara', 'masalani', ''),
(161, 8, 'wajir north', 'gurar', ''),
(162, 8, 'wajir north', 'bute', ''),
(163, 8, 'wajir north', 'korondile', ''),
(164, 8, 'wajir north', 'malkagufu', ''),
(165, 8, 'wajir north', 'batalu', ''),
(166, 8, 'wajir north', 'danaba', ''),
(167, 8, 'wajir north', 'godoma', ''),
(168, 8, 'wajir east', 'wagberi', ''),
(169, 8, 'wajir east', 'township', ''),
(170, 8, 'wajir east', 'barwago', ''),
(171, 8, 'wajir east', 'khorof/harar', ''),
(172, 8, 'tarbaj', 'elben', ''),
(173, 8, 'tarbaj', 'sarman', ''),
(174, 8, 'tarbaj', 'tarbaj', ''),
(175, 8, 'tarbaj', 'wargadud', ''),
(176, 8, 'wajir west', 'arbajahan', ''),
(177, 8, 'wajir west', 'hadado/athibohol', ''),
(178, 8, 'wajir west', 'ademasajide', ''),
(179, 8, 'wajir west', 'wagalla/ganyure', ''),
(180, 8, 'eldas', 'eldas', ''),
(181, 8, 'eldas', 'della', ''),
(182, 8, 'eldas', 'lakoley south/basir', ''),
(183, 8, 'eldas', 'elnur/tula tula', ''),
(184, 8, 'wajir south', 'benane', ''),
(185, 8, 'wajir south', 'burder', ''),
(186, 8, 'wajir south', 'dadaja bulla', ''),
(187, 8, 'wajir south', 'habasswein', ''),
(188, 8, 'wajir south', 'lagboghol south', ''),
(189, 8, 'wajir south', 'ibrahim ure', ''),
(190, 8, 'wajir south', 'diif', ''),
(191, 9, 'mandera west', 'takaba south', ''),
(192, 9, 'mandera west', 'takaba', ''),
(193, 9, 'mandera west', 'lag sure', ''),
(194, 9, 'mandera west', 'dandu', ''),
(195, 9, 'mandera west', 'gither', ''),
(196, 9, 'banissa', 'banissa', ''),
(197, 9, 'banissa', 'derkhale', ''),
(198, 9, 'banissa', 'guba', ''),
(199, 9, 'banissa', 'malkamari', ''),
(200, 9, 'banissa', 'kiliwehiri', ''),
(201, 9, 'mandera north', 'ashabito', ''),
(202, 9, 'mandera north', 'guticha', ''),
(203, 9, 'mandera north', 'morothile', ''),
(204, 9, 'mandera north', 'rhamu', ''),
(205, 9, 'mandera north', 'rhamu-dimtu', ''),
(206, 9, 'mandera south', 'wargudud', ''),
(207, 9, 'mandera south', 'kutulo', ''),
(208, 9, 'mandera south', 'elwak south', ''),
(209, 9, 'mandera south', 'elwak north', ''),
(210, 9, 'mandera south', 'shimbir fatuma', ''),
(211, 9, 'mandera east', 'arabia', ''),
(212, 9, 'mandera east', 'bulla mpya', ''),
(213, 9, 'mandera east', 'khalalio', ''),
(214, 9, 'mandera east', 'neboi', ''),
(215, 9, 'mandera east', 'township', ''),
(216, 9, 'lafey', 'libehia', ''),
(217, 9, 'lafey', 'fino', ''),
(218, 9, 'lafey', 'lafey', ''),
(219, 9, 'lafey', 'warankara', ''),
(220, 9, 'lafey', 'alungo gof', ''),
(221, 10, 'moyale', 'butiye', ''),
(222, 10, 'moyale', 'sololo', ''),
(223, 10, 'moyale', 'heilu-manyatta', ''),
(224, 10, 'moyale', 'golbo', ''),
(225, 10, 'moyale', 'moyale township', ''),
(226, 10, 'moyale', 'uran', ''),
(227, 10, 'moyale', 'obbu', ''),
(228, 10, 'north horr', 'illeret', ''),
(229, 10, 'north horr', 'north horr', ''),
(230, 10, 'north horr', 'dukana', ''),
(231, 10, 'north horr', 'maikona', ''),
(232, 10, 'north horr', 'turbi', ''),
(233, 10, 'saku', 'sagante/jaldesa', ''),
(234, 10, 'saku', 'karare', ''),
(235, 10, 'saku', 'marsabit central', ''),
(236, 10, 'laisamis', 'loiyangalani', ''),
(237, 10, 'laisamis', 'kargi/south horr', ''),
(238, 10, 'laisamis', 'korr/ngurunit', ''),
(239, 10, 'laisamis', 'log logo', ''),
(240, 10, 'laisamis', 'laisamis', ''),
(241, 11, 'isiolo north', 'wabera', ''),
(242, 11, 'isiolo north', 'bulla pesa', ''),
(243, 11, 'isiolo north', 'chari', ''),
(244, 11, 'isiolo north', 'cherab', ''),
(245, 11, 'isiolo north', 'ngare mara', ''),
(246, 11, 'isiolo north', 'burat', ''),
(247, 11, 'isiolo north', 'oldonyiro', ''),
(248, 11, 'isiolo south', 'garbatulla', ''),
(249, 11, 'isiolo south', 'kinna', ''),
(250, 11, 'isiolo south', 'sericho', ''),
(251, 12, 'igembe south', 'maua', ''),
(252, 12, 'igembe south', 'kiegoi/antubochiu', ''),
(253, 12, 'igembe south', 'athiru gaiti', ''),
(254, 12, 'igembe south', 'akachiu', ''),
(255, 12, 'igembe south', 'kanuni', ''),
(256, 12, 'igembe central', 'akirang\'ondu', ''),
(257, 12, 'igembe central', 'athiru ruujine', ''),
(258, 12, 'igembe central', 'igembe east', ''),
(259, 12, 'igembe central', 'njia', ''),
(260, 12, 'igembe central', 'kangeta', ''),
(261, 12, 'igembe north', 'antuambui', ''),
(262, 12, 'igembe north', 'ntunene', ''),
(263, 12, 'igembe north', 'antubetwe kiongo', ''),
(264, 12, 'igembe north', 'naathu', ''),
(265, 12, 'igembe north', 'amwathi', ''),
(266, 12, 'tigania west', 'athwana', ''),
(267, 12, 'tigania west', 'akithii', ''),
(268, 12, 'tigania west', 'kianjai', ''),
(269, 12, 'tigania west', 'nkomo', ''),
(270, 12, 'tigania west', 'mbeu', ''),
(271, 12, 'tigania east', 'thangatha', ''),
(272, 12, 'tigania east', 'mikinduri', ''),
(273, 12, 'tigania east', 'kiguchwa', ''),
(274, 12, 'tigania east', 'muthara', ''),
(275, 12, 'tigania east', 'karama', ''),
(276, 12, 'north imenti', 'municipality', ''),
(277, 12, 'north imenti', 'ntima east', ''),
(278, 12, 'north imenti', 'ntima west', ''),
(279, 12, 'north imenti', 'nyaki west', ''),
(280, 12, 'north imenti', 'nyaki east', ''),
(281, 12, 'buuri', 'timau', ''),
(282, 12, 'buuri', 'kisima', ''),
(283, 12, 'buuri', 'kiirua/naari', ''),
(284, 12, 'buuri', 'ruiri/rwarera', ''),
(285, 12, 'buuri', 'kibirichia', ''),
(286, 12, 'central imenti', 'mwanganthia', ''),
(287, 12, 'central imenti', 'abothuguchi central', ''),
(288, 12, 'central imenti', 'abothuguchi west', ''),
(289, 12, 'central imenti', 'kiagu', ''),
(290, 12, 'south imenti', 'mitunguu', ''),
(291, 12, 'south imenti', 'igoji east', ''),
(292, 12, 'south imenti', 'igoji west', ''),
(293, 12, 'south imenti', 'abogeta east', ''),
(294, 12, 'south imenti', 'abogeta west', ''),
(295, 12, 'south imenti', 'nkuene', ''),
(296, 13, 'maara', 'mitheru', ''),
(297, 13, 'maara', 'muthambi', ''),
(298, 13, 'maara', 'mwimbi', ''),
(299, 13, 'maara', 'ganga', ''),
(300, 13, 'maara', 'chogoria', ''),
(301, 13, 'chuka/igambang\'om', 'mariani', ''),
(302, 13, 'chuka/igambang\'om', 'karingani', ''),
(303, 13, 'chuka/igambang\'om', 'magumoni', ''),
(304, 13, 'chuka/igambang\'om', 'mugwe', ''),
(305, 13, 'chuka/igambang\'om', 'igambang\'ombe', ''),
(306, 13, 'tharaka', 'gatunga', ''),
(307, 13, 'tharaka', 'mukothima', ''),
(308, 13, 'tharaka', 'nkondi', ''),
(309, 13, 'tharaka', 'chiakariga', ''),
(310, 13, 'tharaka', 'marimanti', ''),
(311, 14, 'manyatta', 'ruguru/ngandori', ''),
(312, 14, 'manyatta', 'kithimu', ''),
(313, 14, 'manyatta', 'nginda', ''),
(314, 14, 'manyatta', 'mbeti north', ''),
(315, 14, 'manyatta', 'kirimari', ''),
(316, 14, 'manyatta', 'gaturi south', ''),
(317, 14, 'runyenjes', 'gaturi north', ''),
(318, 14, 'runyenjes', 'kagaari south', ''),
(319, 14, 'runyenjes', 'central  ward', ''),
(320, 14, 'runyenjes', 'kagaari north', ''),
(321, 14, 'runyenjes', 'kyeni north', ''),
(322, 14, 'runyenjes', 'kyeni south', ''),
(323, 14, 'mbeere south', 'mwea', ''),
(324, 14, 'mbeere south', 'makima', ''),
(325, 14, 'mbeere south', 'mbeti south', ''),
(326, 14, 'mbeere south', 'mavuria', ''),
(327, 14, 'mbeere south', 'kiambere', ''),
(328, 14, 'mbeere north', 'nthawa', ''),
(329, 14, 'mbeere north', 'muminji', ''),
(330, 14, 'mbeere north', 'evurore', ''),
(331, 15, 'mwingi north', 'ngomeni', ''),
(332, 15, 'mwingi north', 'kyuso', ''),
(333, 15, 'mwingi north', 'mumoni', ''),
(334, 15, 'mwingi north', 'tseikuru', ''),
(335, 15, 'mwingi north', 'tharaka', ''),
(336, 15, 'mwingi west', 'kyome/thaana', ''),
(337, 15, 'mwingi west', 'nguutani', ''),
(338, 15, 'mwingi west', 'migwani', ''),
(339, 15, 'mwingi west', 'kiomo/kyethani', ''),
(340, 15, 'mwingi central', 'central', ''),
(341, 15, 'mwingi central', 'kivou', ''),
(342, 15, 'mwingi central', 'nguni', ''),
(343, 15, 'mwingi central', 'nuu', ''),
(344, 15, 'mwingi central', 'mui', ''),
(345, 15, 'mwingi central', 'waita', ''),
(346, 15, 'kitui west', 'mutonguni', ''),
(347, 15, 'kitui west', 'kauwi', ''),
(348, 15, 'kitui west', 'matinyani', ''),
(349, 15, 'kitui west', 'kwa mutonga/kithumula', ''),
(350, 15, 'kitui rural', 'kisasi', ''),
(351, 15, 'kitui rural', 'mbitini', ''),
(352, 15, 'kitui rural', 'kwavonza/yatta', ''),
(353, 15, 'kitui rural', 'kanyangi', ''),
(354, 15, 'kitui central', 'miambani', ''),
(355, 15, 'kitui central', 'township', ''),
(356, 15, 'kitui central', 'kyangwithya west', ''),
(357, 15, 'kitui central', 'mulango', ''),
(358, 15, 'kitui central', 'kyangwithya east', ''),
(359, 15, 'kitui east', 'zombe/mwitika', ''),
(360, 15, 'kitui east', 'chuluni', ''),
(361, 15, 'kitui east', 'nzambani', ''),
(362, 15, 'kitui east', 'voo/kyamatu', ''),
(363, 15, 'kitui east', 'endau/malalani', ''),
(364, 15, 'kitui east', 'mutito/kaliku', ''),
(365, 15, 'kitui south', 'ikanga/kyatune', ''),
(366, 15, 'kitui south', 'mutomo', ''),
(367, 15, 'kitui south', 'mutha', ''),
(368, 15, 'kitui south', 'ikutha', ''),
(369, 15, 'kitui south', 'kanziko', ''),
(370, 15, 'kitui south', 'athi', ''),
(371, 16, 'masinga', 'kivaa', ''),
(372, 16, 'masinga', 'masinga central', ''),
(373, 16, 'masinga', 'ekalakala', ''),
(374, 16, 'masinga', 'muthesya', ''),
(375, 16, 'masinga', 'ndithini', ''),
(376, 16, 'yatta', 'ndalani', ''),
(377, 16, 'yatta', 'matuu', ''),
(378, 16, 'yatta', 'kithimani', ''),
(379, 16, 'yatta', 'ikombe', ''),
(380, 16, 'yatta', 'katangi', ''),
(381, 16, 'kangundo', 'kangundo north', ''),
(382, 16, 'kangundo', 'kangundo central', ''),
(383, 16, 'kangundo', 'kangundo east', ''),
(384, 16, 'kangundo', 'kangundo west', ''),
(385, 16, 'matungulu', 'tala', ''),
(386, 16, 'matungulu', 'matungulu north', ''),
(387, 16, 'matungulu', 'matungulu east', ''),
(388, 16, 'matungulu', 'matungulu west', ''),
(389, 16, 'matungulu', 'kyeleni', ''),
(390, 16, 'kathiani', 'mitaboni', ''),
(391, 16, 'kathiani', 'kathiani central', ''),
(392, 16, 'kathiani', 'upper kaewa/iveti', ''),
(393, 16, 'kathiani', 'lower kaewa/kaani', ''),
(394, 16, 'mavoko', 'athi river', ''),
(395, 16, 'mavoko', 'kinanie', ''),
(396, 16, 'mavoko', 'muthwani', ''),
(397, 16, 'mavoko', 'syokimau/mulolongo', ''),
(398, 16, 'machakos town', 'kalama', ''),
(399, 16, 'machakos town', 'mua', ''),
(400, 16, 'machakos town', 'mutituni', ''),
(401, 16, 'machakos town', 'machakos central', ''),
(402, 16, 'machakos town', 'mumbuni north', ''),
(403, 16, 'machakos town', 'muvuti/kiima-kimwe', ''),
(404, 16, 'machakos town', 'kola', ''),
(405, 16, 'mwala', 'mbiuni', ''),
(406, 16, 'mwala', 'makutano/ mwala', ''),
(407, 16, 'mwala', 'masii', ''),
(408, 16, 'mwala', 'muthetheni', ''),
(409, 16, 'mwala', 'wamunyu', ''),
(410, 16, 'mwala', 'kibauni', ''),
(411, 17, 'mbooni', 'tulimani', ''),
(412, 17, 'mbooni', 'mbooni', ''),
(413, 17, 'mbooni', 'kithungo/kitundu', ''),
(414, 17, 'mbooni', 'kisau/kiteta', ''),
(415, 17, 'mbooni', 'waia/kako', ''),
(416, 17, 'mbooni', 'kalawa', ''),
(417, 17, 'kilome', 'kasikeu', ''),
(418, 17, 'kilome', 'mukaa', ''),
(419, 17, 'kilome', 'kiima kiu/kalanzoni', ''),
(420, 17, 'kaiti', 'ukia', ''),
(421, 17, 'kaiti', 'kee', ''),
(422, 17, 'kaiti', 'kilungu', ''),
(423, 17, 'kaiti', 'ilima', ''),
(424, 17, 'makueni', 'wote', ''),
(425, 17, 'makueni', 'muvau/kikuumini', ''),
(426, 17, 'makueni', 'mavindini', ''),
(427, 17, 'makueni', 'kitise/kithuki', ''),
(428, 17, 'makueni', 'kathonzweni', ''),
(429, 17, 'makueni', 'nzaui/kilili/kalamba', ''),
(430, 17, 'makueni', 'mbitini', ''),
(431, 17, 'kibwezi west', 'makindu', ''),
(432, 17, 'kibwezi west', 'nguumo', ''),
(433, 17, 'kibwezi west', 'kikumbulyu north', ''),
(434, 17, 'kibwezi west', 'kikumbulyu south', ''),
(435, 17, 'kibwezi west', 'nguu/masumba', ''),
(436, 17, 'kibwezi west', 'emali/mulala', ''),
(437, 17, 'kibwezi east', 'masongaleni', ''),
(438, 17, 'kibwezi east', 'mtito andei', ''),
(439, 17, 'kibwezi east', 'thange', ''),
(440, 17, 'kibwezi east', 'ivingoni/nzambani', ''),
(441, 18, 'kinangop', 'engineer', ''),
(442, 18, 'kinangop', 'gathara', ''),
(443, 18, 'kinangop', 'north kinangop', ''),
(444, 18, 'kinangop', 'murungaru', ''),
(445, 18, 'kinangop', 'njabini\\kiburu', ''),
(446, 18, 'kinangop', 'nyakio', ''),
(447, 18, 'kinangop', 'githabai', ''),
(448, 18, 'kinangop', 'magumu', ''),
(449, 18, 'kipipiri', 'wanjohi', ''),
(450, 18, 'kipipiri', 'kipipiri', ''),
(451, 18, 'kipipiri', 'geta', ''),
(452, 18, 'kipipiri', 'githioro', ''),
(453, 18, 'ol kalou', 'karau', ''),
(454, 18, 'ol kalou', 'kanjuiri ridge', ''),
(455, 18, 'ol kalou', 'mirangine', ''),
(456, 18, 'ol kalou', 'kaimbaga', ''),
(457, 18, 'ol kalou', 'rurii', ''),
(458, 18, 'ol jorok', 'gathanji', ''),
(459, 18, 'ol jorok', 'gatimu', ''),
(460, 18, 'ol jorok', 'weru', ''),
(461, 18, 'ol jorok', 'charagita', ''),
(462, 18, 'ndaragwa', 'leshau pondo', ''),
(463, 18, 'ndaragwa', 'kiriita', ''),
(464, 18, 'ndaragwa', 'central', ''),
(465, 18, 'ndaragwa', 'shamata', ''),
(466, 19, 'tetu', 'dedan kimanthi', ''),
(467, 19, 'tetu', 'wamagana', ''),
(468, 19, 'tetu', 'aguthi/gaaki', ''),
(469, 19, 'kieni', 'mweiga', ''),
(470, 19, 'kieni', 'naromoru kiamathaga', ''),
(471, 19, 'kieni', 'mwiyogo/endarasha', ''),
(472, 19, 'kieni', 'mugunda', ''),
(473, 19, 'kieni', 'gatarakwa', ''),
(474, 19, 'kieni', 'thegu river', ''),
(475, 19, 'kieni', 'kabaru', ''),
(476, 19, 'kieni', 'gakawa', ''),
(477, 19, 'mathira', 'ruguru', ''),
(478, 19, 'mathira', 'magutu', ''),
(479, 19, 'mathira', 'iriaini', ''),
(480, 19, 'mathira', 'konyu', ''),
(481, 19, 'mathira', 'kirimukuyu', ''),
(482, 19, 'mathira', 'karatina town', ''),
(483, 19, 'othaya', 'mahiga', ''),
(484, 19, 'othaya', 'iria-ini', ''),
(485, 19, 'othaya', 'chinga', ''),
(486, 19, 'othaya', 'karima', ''),
(487, 19, 'mukurweini', 'gikondi', ''),
(488, 19, 'mukurweini', 'rugi', ''),
(489, 19, 'mukurweini', 'mukurwe-ini west', ''),
(490, 19, 'mukurweini', 'mukurwe-ini central', ''),
(491, 19, 'nyeri town', 'kiganjo/mathari', ''),
(492, 19, 'nyeri town', 'rware', ''),
(493, 19, 'nyeri town', 'gatitu/muruguru', ''),
(494, 19, 'nyeri town', 'ruring\'u', ''),
(495, 19, 'nyeri town', 'kamakwa/mukaro', ''),
(496, 20, 'mwea', 'mutithi', ''),
(497, 20, 'mwea', 'kangai', ''),
(498, 20, 'mwea', 'thiba', ''),
(499, 20, 'mwea', 'wamumu', ''),
(500, 20, 'mwea', 'nyangati', ''),
(501, 20, 'mwea', 'murinduko', ''),
(502, 20, 'mwea', 'gathigiriri', ''),
(503, 20, 'mwea', 'tebere', ''),
(504, 20, 'gichugu', 'kabare', ''),
(505, 20, 'gichugu', 'baragwi', ''),
(506, 20, 'gichugu', 'njukiini', ''),
(507, 20, 'gichugu', 'ngariama', ''),
(508, 20, 'gichugu', 'karumandi', ''),
(509, 20, 'ndia', 'mukure', ''),
(510, 20, 'ndia', 'kiine', ''),
(511, 20, 'ndia', 'kariti', ''),
(512, 20, 'kirinyaga central', 'mutira', ''),
(513, 20, 'kirinyaga central', 'kanyeki-ini', ''),
(514, 20, 'kirinyaga central', 'kerugoya', ''),
(515, 20, 'kirinyaga central', 'inoi', ''),
(516, 21, 'kangema', 'kanyenyaini', ''),
(517, 21, 'kangema', 'muguru', ''),
(518, 21, 'kangema', 'rwathia', ''),
(519, 21, 'mathioya', 'gitugi', ''),
(520, 21, 'mathioya', 'kiru', ''),
(521, 21, 'mathioya', 'kamacharia', ''),
(522, 21, 'kiharu', 'wangu', ''),
(523, 21, 'kiharu', 'mugoiri', ''),
(524, 21, 'kiharu', 'mbiri', ''),
(525, 21, 'kiharu', 'township', ''),
(526, 21, 'kiharu', 'murarandia', ''),
(527, 21, 'kiharu', 'gaturi', ''),
(528, 21, 'kigumo', 'kahumbu', ''),
(529, 21, 'kigumo', 'muthithi', ''),
(530, 21, 'kigumo', 'kigumo', ''),
(531, 21, 'kigumo', 'kangari', ''),
(532, 21, 'kigumo', 'kinyona', ''),
(533, 21, 'maragwa', 'kimorori/wempa', ''),
(534, 21, 'maragwa', 'makuyu', ''),
(535, 21, 'maragwa', 'kambiti', ''),
(536, 21, 'maragwa', 'kamahuha', ''),
(537, 21, 'maragwa', 'ichagaki', ''),
(538, 21, 'maragwa', 'nginda', ''),
(539, 21, 'kandara', 'ng\'araria', ''),
(540, 21, 'kandara', 'muruka', ''),
(541, 21, 'kandara', 'kagundu-ini', ''),
(542, 21, 'kandara', 'gaichanjiru', ''),
(543, 21, 'kandara', 'ithiru', ''),
(544, 21, 'kandara', 'ruchu', ''),
(545, 21, 'gatanga', 'ithanga', ''),
(546, 21, 'gatanga', 'kakuzi/mitubiri', ''),
(547, 21, 'gatanga', 'mugumo-ini', ''),
(548, 21, 'gatanga', 'kihumbu-ini', ''),
(549, 21, 'gatanga', 'gatanga', ''),
(550, 21, 'gatanga', 'kariara', ''),
(551, 22, 'gatundu south', 'kiamwangi', ''),
(552, 22, 'gatundu south', 'kiganjo', ''),
(553, 22, 'gatundu south', 'ndarugu', ''),
(554, 22, 'gatundu south', 'ngenda', ''),
(555, 22, 'gatundu north', 'gituamba', ''),
(556, 22, 'gatundu north', 'githobokoni', ''),
(557, 22, 'gatundu north', 'chania', ''),
(558, 22, 'gatundu north', 'mang\'u', ''),
(559, 22, 'juja', 'murera', ''),
(560, 22, 'juja', 'theta', ''),
(561, 22, 'juja', 'juja', ''),
(562, 22, 'juja', 'witeithie', ''),
(563, 22, 'juja', 'kalimoni', ''),
(564, 22, 'thika town', 'township', ''),
(565, 22, 'thika town', 'kamenu', ''),
(566, 22, 'thika town', 'hospital', ''),
(567, 22, 'thika town', 'gatuanyaga', ''),
(568, 22, 'thika town', 'ngoliba', ''),
(569, 22, 'ruiru', 'gitothua', ''),
(570, 22, 'ruiru', 'biashara', ''),
(571, 22, 'ruiru', 'gatongora', ''),
(572, 22, 'ruiru', 'kahawa sukari', ''),
(573, 22, 'ruiru', 'kahawa wendani', ''),
(574, 22, 'ruiru', 'kiuu', ''),
(575, 22, 'ruiru', 'mwiki', ''),
(576, 22, 'ruiru', 'mwihoko', ''),
(577, 22, 'githunguri', 'githunguri', ''),
(578, 22, 'githunguri', 'githiga', ''),
(579, 22, 'githunguri', 'ikinu', ''),
(580, 22, 'githunguri', 'ngewa', ''),
(581, 22, 'githunguri', 'komothai', ''),
(582, 22, 'kiambu', 'ting\'ang\'a', ''),
(583, 22, 'kiambu', 'ndumberi', ''),
(584, 22, 'kiambu', 'riabai', ''),
(585, 22, 'kiambu', 'township', ''),
(586, 22, 'kiambaa', 'cianda', ''),
(587, 22, 'kiambaa', 'karuri', ''),
(588, 22, 'kiambaa', 'ndenderu', ''),
(589, 22, 'kiambaa', 'muchatha', ''),
(590, 22, 'kiambaa', 'kihara', ''),
(591, 22, 'kabete', 'gitaru', ''),
(592, 22, 'kabete', 'muguga', ''),
(593, 22, 'kabete', 'nyadhuna', ''),
(594, 22, 'kabete', 'kabete', ''),
(595, 22, 'kabete', 'uthiru', ''),
(596, 22, 'kikuyu', 'karai', ''),
(597, 22, 'kikuyu', 'nachu', ''),
(598, 22, 'kikuyu', 'sigona', ''),
(599, 22, 'kikuyu', 'kikuyu', ''),
(600, 22, 'kikuyu', 'kinoo', ''),
(601, 22, 'limuru', 'bibirioni', ''),
(602, 22, 'limuru', 'limuru central', ''),
(603, 22, 'limuru', 'ndeiya', ''),
(604, 22, 'limuru', 'limuru east', ''),
(605, 22, 'limuru', 'ngecha tigoni', ''),
(606, 22, 'lari', 'kinale', ''),
(607, 22, 'lari', 'kijabe', ''),
(608, 22, 'lari', 'nyanduma', ''),
(609, 22, 'lari', 'kamburu', ''),
(610, 22, 'lari', 'lari/kirenga', ''),
(611, 23, 'turkana north', 'kaeris', ''),
(612, 23, 'turkana north', 'lake zone', ''),
(613, 23, 'turkana north', 'lapur', ''),
(614, 23, 'turkana north', 'kaaleng/kaikor', ''),
(615, 23, 'turkana north', 'kibish', ''),
(616, 23, 'turkana north', 'nakalale', ''),
(617, 23, 'turkana west', 'kakuma', ''),
(618, 23, 'turkana west', 'lopur', ''),
(619, 23, 'turkana west', 'letea', ''),
(620, 23, 'turkana west', 'songot', ''),
(621, 23, 'turkana west', 'kalobeyei', ''),
(622, 23, 'turkana west', 'lokichoggio', ''),
(623, 23, 'turkana west', 'nanaam', ''),
(624, 23, 'turkana central', 'kerio delta', ''),
(625, 23, 'turkana central', 'kang\'atotha', ''),
(626, 23, 'turkana central', 'kalokol', ''),
(627, 23, 'turkana central', 'lodwar township', ''),
(628, 23, 'turkana central', 'kanamkemer', ''),
(629, 23, 'loima', 'kotaruk/lobei', ''),
(630, 23, 'loima', 'turkwel', ''),
(631, 23, 'loima', 'loima', ''),
(632, 23, 'loima', 'lokiriama/lorengippi', ''),
(633, 23, 'turkana south', 'kaputir', ''),
(634, 23, 'turkana south', 'katilu', ''),
(635, 23, 'turkana south', 'lobokat', ''),
(636, 23, 'turkana south', 'kalapata', ''),
(637, 23, 'turkana south', 'lokichar', ''),
(638, 23, 'turkana east', 'kapedo/napeitom', ''),
(639, 23, 'turkana east', 'katilia', ''),
(640, 23, 'turkana east', 'lokori/kochodin', ''),
(641, 24, 'kapenguria', 'riwo', ''),
(642, 24, 'kapenguria', 'kapenguria', ''),
(643, 24, 'kapenguria', 'mnagei', ''),
(644, 24, 'kapenguria', 'siyoi', ''),
(645, 24, 'kapenguria', 'endugh', ''),
(646, 24, 'kapenguria', 'sook', ''),
(647, 24, 'sigor', 'sekerr', ''),
(648, 24, 'sigor', 'masool', ''),
(649, 24, 'sigor', 'lomut', ''),
(650, 24, 'sigor', 'weiwei', ''),
(651, 24, 'kacheliba', 'suam', ''),
(652, 24, 'kacheliba', 'kodich', ''),
(653, 24, 'kacheliba', 'kapckok', ''),
(654, 24, 'kacheliba', 'kasei', ''),
(655, 24, 'kacheliba', 'kiwawa', ''),
(656, 24, 'kacheliba', 'alale', ''),
(657, 24, 'pokot south', 'chepareria', ''),
(658, 24, 'pokot south', 'batei', ''),
(659, 24, 'pokot south', 'lelan', ''),
(660, 24, 'pokot south', 'tapach', ''),
(661, 25, 'samburu west', 'lodokejek', ''),
(662, 25, 'samburu west', 'suguta marmar', ''),
(663, 25, 'samburu west', 'maralal', ''),
(664, 25, 'samburu west', 'loosuk', ''),
(665, 25, 'samburu west', 'poro', ''),
(666, 25, 'samburu north', 'el-barta', ''),
(667, 25, 'samburu north', 'nachola', ''),
(668, 25, 'samburu north', 'ndoto', ''),
(669, 25, 'samburu north', 'nyiro', ''),
(670, 25, 'samburu north', 'angata nanyokie', ''),
(671, 25, 'samburu north', 'baawa', ''),
(672, 25, 'samburu east', 'waso', ''),
(673, 25, 'samburu east', 'wamba west', ''),
(674, 25, 'samburu east', 'wamba east', ''),
(675, 25, 'samburu east', 'wamba north', ''),
(676, 26, 'kwanza', 'kapomboi', ''),
(677, 26, 'kwanza', 'kwanza', ''),
(678, 26, 'kwanza', 'keiyo', ''),
(679, 26, 'kwanza', 'bidii', ''),
(680, 26, 'endebess', 'chepchoina', ''),
(681, 26, 'endebess', 'endebess', ''),
(682, 26, 'endebess', 'matumbei', ''),
(683, 26, 'saboti', 'kinyoro', ''),
(684, 26, 'saboti', 'matisi', ''),
(685, 26, 'saboti', 'tuwani', ''),
(686, 26, 'saboti', 'saboti', ''),
(687, 26, 'saboti', 'machewa', ''),
(688, 26, 'kiminini', 'kiminini', ''),
(689, 26, 'kiminini', 'waitaluk', ''),
(690, 26, 'kiminini', 'sirende', ''),
(691, 26, 'kiminini', 'hospital', ''),
(692, 26, 'kiminini', 'sikhendu', ''),
(693, 26, 'kiminini', 'nabiswa', ''),
(694, 26, 'cherangany', 'sinyerere', ''),
(695, 26, 'cherangany', 'makutano', ''),
(696, 26, 'cherangany', 'kaplamai', ''),
(697, 26, 'cherangany', 'motosiet', ''),
(698, 26, 'cherangany', 'cherangany/suwerwa', ''),
(699, 26, 'cherangany', 'chepsiro/kiptoror', ''),
(700, 26, 'cherangany', 'sitatunga', ''),
(701, 27, 'soy', 'moi\'s bridge', ''),
(702, 27, 'soy', 'kapkures', ''),
(703, 27, 'soy', 'ziwa', ''),
(704, 27, 'soy', 'segero/barsombe', ''),
(705, 27, 'soy', 'kipsomba', ''),
(706, 27, 'soy', 'soy', ''),
(707, 27, 'soy', 'kuinet/kapsuswa', ''),
(708, 27, 'turbo', 'ngenyilel', ''),
(709, 27, 'turbo', 'tapsagoi', ''),
(710, 27, 'turbo', 'kamagut', ''),
(711, 27, 'turbo', 'kiplombe', ''),
(712, 27, 'turbo', 'kapsaos', ''),
(713, 27, 'turbo', 'huruma', ''),
(714, 27, 'moiben', 'tembelio', ''),
(715, 27, 'moiben', 'sergoit', ''),
(716, 27, 'moiben', 'karuna/meibeki', ''),
(717, 27, 'moiben', 'moiben', ''),
(718, 27, 'moiben', 'kimumu', ''),
(719, 27, 'ainabkoi', 'kapsoya', ''),
(720, 27, 'ainabkoi', 'kaptagat', ''),
(721, 27, 'ainabkoi', 'ainabkoi/olare', ''),
(722, 27, 'kapseret', 'simat/kapseret', ''),
(723, 27, 'kapseret', 'kipkenyo', ''),
(724, 27, 'kapseret', 'ngeria', ''),
(725, 27, 'kapseret', 'megun', ''),
(726, 27, 'kapseret', 'langas', ''),
(727, 27, 'kesses', 'racecourse', ''),
(728, 27, 'kesses', 'cheptiret/kipchamo', ''),
(729, 27, 'kesses', 'tulwet/chuiyat', ''),
(730, 27, 'kesses', 'tarakwa', ''),
(731, 28, 'marakwet east', 'kapyego', ''),
(732, 28, 'marakwet east', 'sambirir', ''),
(733, 28, 'marakwet east', 'endo', ''),
(734, 28, 'marakwet east', 'embobut / embulot', ''),
(735, 28, 'marakwet west', 'lelan', ''),
(736, 28, 'marakwet west', 'sengwer', ''),
(737, 28, 'marakwet west', 'cherang\'any/chebororwa', ''),
(738, 28, 'marakwet west', 'moiben/kuserwo', ''),
(739, 28, 'marakwet west', 'kapsowar', ''),
(740, 28, 'marakwet west', 'arror', ''),
(741, 28, 'keiyo north', 'emsoo', ''),
(742, 28, 'keiyo north', 'kamariny', ''),
(743, 28, 'keiyo north', 'kapchemutwa', ''),
(744, 28, 'keiyo north', 'tambach', ''),
(745, 28, 'keiyo south', 'kaptarakwa', ''),
(746, 28, 'keiyo south', 'chepkorio', ''),
(747, 28, 'keiyo south', 'soy north', ''),
(748, 28, 'keiyo south', 'soy south', ''),
(749, 28, 'keiyo south', 'kabiemit', ''),
(750, 28, 'keiyo south', 'metkei', ''),
(751, 29, 'tinderet', 'songhor/soba', ''),
(752, 29, 'tinderet', 'tindiret', ''),
(753, 29, 'tinderet', 'chemelil/chemase', ''),
(754, 29, 'tinderet', 'kapsimotwo', ''),
(755, 29, 'aldai', 'kabwareng', ''),
(756, 29, 'aldai', 'terik', ''),
(757, 29, 'aldai', 'kemeloi-maraba', ''),
(758, 29, 'aldai', 'kobujoi', ''),
(759, 29, 'aldai', 'kaptumo-kaboi', ''),
(760, 29, 'aldai', 'koyo-ndurio', ''),
(761, 29, 'nandi hills', 'nandi hills', ''),
(762, 29, 'nandi hills', 'chepkunyuk', ''),
(763, 29, 'nandi hills', 'ol\'lessos', ''),
(764, 29, 'nandi hills', 'kapchorua', ''),
(765, 29, 'chesumei', 'chemundu/kapng\'etuny', ''),
(766, 29, 'chesumei', 'kosirai', ''),
(767, 29, 'chesumei', 'lelmokwo/ngechek', ''),
(768, 29, 'chesumei', 'kaptel/kamoiywo', ''),
(769, 29, 'chesumei', 'kiptuya', ''),
(770, 29, 'emgwen', 'chepkumia', ''),
(771, 29, 'emgwen', 'kapkangani', ''),
(772, 29, 'emgwen', 'kapsabet', ''),
(773, 29, 'emgwen', 'kilibwoni', ''),
(774, 29, 'mosop', 'chepterwai', ''),
(775, 29, 'mosop', 'kipkaren', ''),
(776, 29, 'mosop', 'kurgung/surungai', ''),
(777, 29, 'mosop', 'kabiyet', ''),
(778, 29, 'mosop', 'ndalat', ''),
(779, 29, 'mosop', 'kabisaga', ''),
(780, 29, 'mosop', 'sangalo/kebulonik', ''),
(781, 30, 'tiaty', 'tirioko', ''),
(782, 30, 'tiaty', 'kolowa', ''),
(783, 30, 'tiaty', 'ribkwo', ''),
(784, 30, 'tiaty', 'silale', ''),
(785, 30, 'tiaty', 'loiyamorock', ''),
(786, 30, 'tiaty', 'tangulbei/korossi', ''),
(787, 30, 'tiaty', 'churo/amaya', ''),
(788, 30, 'baringo  north', 'barwessa', ''),
(789, 30, 'baringo  north', 'kabartonjo', ''),
(790, 30, 'baringo  north', 'saimo/kipsaraman', ''),
(791, 30, 'baringo  north', 'saimo/soi', ''),
(792, 30, 'baringo  north', 'bartabwa', ''),
(793, 30, 'baringo central', 'kabarnet', ''),
(794, 30, 'baringo central', 'sacho', ''),
(795, 30, 'baringo central', 'tenges', ''),
(796, 30, 'baringo central', 'ewalel chapchap', ''),
(797, 30, 'baringo central', 'kapropita', ''),
(798, 30, 'baringo south', 'marigat', ''),
(799, 30, 'baringo south', 'ilchamus', ''),
(800, 30, 'baringo south', 'mochongoi', ''),
(801, 30, 'baringo south', 'mukutani', ''),
(802, 30, 'mogotio', 'mogotio', ''),
(803, 30, 'mogotio', 'emining', ''),
(804, 30, 'mogotio', 'kisanana', ''),
(805, 30, 'eldama ravine', 'lembus', ''),
(806, 30, 'eldama ravine', 'lembus kwen', ''),
(807, 30, 'eldama ravine', 'ravine', ''),
(808, 30, 'eldama ravine', 'mumberes/maji mazuri', ''),
(809, 30, 'eldama ravine', 'lembus/perkerra', ''),
(810, 30, 'eldama ravine', 'koibatek', ''),
(811, 31, 'laikipia west', 'olmoran', ''),
(812, 31, 'laikipia west', 'rumuruti township', ''),
(813, 31, 'laikipia west', 'kinamba', ''),
(814, 31, 'laikipia west', 'marmanet', ''),
(815, 31, 'laikipia west', 'igwamiti', ''),
(816, 31, 'laikipia west', 'salama', ''),
(817, 31, 'laikipia east', 'ngobit', ''),
(818, 31, 'laikipia east', 'tigithi', ''),
(819, 31, 'laikipia east', 'thingithu', ''),
(820, 31, 'laikipia east', 'nanyuki', ''),
(821, 31, 'laikipia east', 'umande', ''),
(822, 31, 'laikipia north', 'sosian', ''),
(823, 31, 'laikipia north', 'segera', ''),
(824, 31, 'laikipia north', 'mukogondo west', ''),
(825, 31, 'laikipia north', 'mukogondo east', ''),
(826, 32, 'molo', 'mariashoni', ''),
(827, 32, 'molo', 'elburgon', ''),
(828, 32, 'molo', 'turi', ''),
(829, 32, 'molo', 'molo', ''),
(830, 32, 'njoro', 'maunarok', ''),
(831, 32, 'njoro', 'mauche', ''),
(832, 32, 'njoro', 'kihingo', ''),
(833, 32, 'njoro', 'nessuit', ''),
(834, 32, 'njoro', 'lare', ''),
(835, 32, 'njoro', 'njoro', ''),
(836, 32, 'naivasha', 'biashara', ''),
(837, 32, 'naivasha', 'hells gate', ''),
(838, 32, 'naivasha', 'lakeview', ''),
(839, 32, 'naivasha', 'maai-mahiu', ''),
(840, 32, 'naivasha', 'maiella', ''),
(841, 32, 'naivasha', 'olkaria', ''),
(842, 32, 'naivasha', 'naivasha east', ''),
(843, 32, 'naivasha', 'viwandani', ''),
(844, 32, 'gilgil', 'gilgil', ''),
(845, 32, 'gilgil', 'elementaita', ''),
(846, 32, 'gilgil', 'mbaruk/eburu', ''),
(847, 32, 'gilgil', 'malewa west', ''),
(848, 32, 'gilgil', 'murindati', ''),
(849, 32, 'kuresoi south', 'amalo', ''),
(850, 32, 'kuresoi south', 'keringet', ''),
(851, 32, 'kuresoi south', 'kiptagich', ''),
(852, 32, 'kuresoi south', 'tinet', ''),
(853, 32, 'kuresoi north', 'kiptororo', ''),
(854, 32, 'kuresoi north', 'nyota', ''),
(855, 32, 'kuresoi north', 'sirikwa', ''),
(856, 32, 'kuresoi north', 'kamara', ''),
(857, 32, 'subukia', 'subukia', ''),
(858, 32, 'subukia', 'waseges', ''),
(859, 32, 'subukia', 'kabazi', ''),
(860, 32, 'rongai', 'menengai west', ''),
(861, 32, 'rongai', 'soin', ''),
(862, 32, 'rongai', 'visoi', ''),
(863, 32, 'rongai', 'mosop', ''),
(864, 32, 'rongai', 'solai', ''),
(865, 32, 'bahati', 'dundori', ''),
(866, 32, 'bahati', 'kabatini', ''),
(867, 32, 'bahati', 'kiamaina', ''),
(868, 32, 'bahati', 'lanet/umoja', ''),
(869, 32, 'bahati', 'bahati', ''),
(870, 32, 'nakuru town west', 'barut', ''),
(871, 32, 'nakuru town west', 'london', ''),
(872, 32, 'nakuru town west', 'kaptembwo', ''),
(873, 32, 'nakuru town west', 'kapkures', ''),
(874, 32, 'nakuru town west', 'rhoda', ''),
(875, 32, 'nakuru town west', 'shaabab', ''),
(876, 32, 'nakuru town east', 'biashara', ''),
(877, 32, 'nakuru town east', 'kivumbini', ''),
(878, 32, 'nakuru town east', 'flamingo', ''),
(879, 32, 'nakuru town east', 'menengai', ''),
(880, 32, 'nakuru town east', 'nakuru east', ''),
(881, 33, 'kilgoris', 'kilgoris central', ''),
(882, 33, 'kilgoris', 'keyian', ''),
(883, 33, 'kilgoris', 'angata barikoi', ''),
(884, 33, 'kilgoris', 'shankoe', ''),
(885, 33, 'kilgoris', 'kimintet', ''),
(886, 33, 'kilgoris', 'lolgorian', ''),
(887, 33, 'emurua dikirr', 'ilkerin', ''),
(888, 33, 'emurua dikirr', 'ololmasani', ''),
(889, 33, 'emurua dikirr', 'mogondo', ''),
(890, 33, 'emurua dikirr', 'kapsasian', ''),
(891, 33, 'narok north', 'olpusimoru', ''),
(892, 33, 'narok north', 'olokurto', ''),
(893, 33, 'narok north', 'narok town', ''),
(894, 33, 'narok north', 'nkareta', ''),
(895, 33, 'narok north', 'olorropil', ''),
(896, 33, 'narok north', 'melili', ''),
(897, 33, 'narok east', 'mosiro', ''),
(898, 33, 'narok east', 'ildamat', ''),
(899, 33, 'narok east', 'keekonyokie', ''),
(900, 33, 'narok east', 'suswa', ''),
(901, 33, 'narok south', 'majimoto/naroosura', ''),
(902, 33, 'narok south', 'ololulung\'a', ''),
(903, 33, 'narok south', 'melelo', ''),
(904, 33, 'narok south', 'loita', ''),
(905, 33, 'narok south', 'sogoo', ''),
(906, 33, 'narok south', 'sagamian', ''),
(907, 33, 'narok west', 'ilmotiok', ''),
(908, 33, 'narok west', 'mara', ''),
(909, 33, 'narok west', 'siana', ''),
(910, 33, 'narok west', 'naikarra', ''),
(911, 34, 'kajiado north', 'olkeri', ''),
(912, 34, 'kajiado north', 'ongata rongai', ''),
(913, 34, 'kajiado north', 'nkaimurunya', ''),
(914, 34, 'kajiado north', 'oloolua', ''),
(915, 34, 'kajiado north', 'ngong', ''),
(916, 34, 'kajiado central', 'purko', ''),
(917, 34, 'kajiado central', 'ildamat', ''),
(918, 34, 'kajiado central', 'dalalekutuk', ''),
(919, 34, 'kajiado central', 'matapato north', ''),
(920, 34, 'kajiado central', 'matapato south', ''),
(921, 34, 'kajiado east', 'kaputiei north', ''),
(922, 34, 'kajiado east', 'kitengela', ''),
(923, 34, 'kajiado east', 'oloosirkon/sholinke', ''),
(924, 34, 'kajiado east', 'kenyawa-poka', ''),
(925, 34, 'kajiado east', 'imaroro', ''),
(926, 34, 'kajiado west', 'keekonyokie', ''),
(927, 34, 'kajiado west', 'iloodokilani', ''),
(928, 34, 'kajiado west', 'magadi', ''),
(929, 34, 'kajiado west', 'ewuaso oonkidong\'i', ''),
(930, 34, 'kajiado west', 'mosiro', ''),
(931, 34, 'kajiado south', 'entonet/lenkisim', ''),
(932, 34, 'kajiado south', 'mbirikani/eselenkei', ''),
(933, 34, 'kajiado south', 'kuku', ''),
(934, 34, 'kajiado south', 'rombo', ''),
(935, 34, 'kajiado south', 'kimana', ''),
(936, 35, 'kipkelion east', 'londiani', ''),
(937, 35, 'kipkelion east', 'kedowa/kimugul', ''),
(938, 35, 'kipkelion east', 'chepseon', ''),
(939, 35, 'kipkelion east', 'tendeno/sorget', ''),
(940, 35, 'kipkelion west', 'kunyak', ''),
(941, 35, 'kipkelion west', 'kamasian', ''),
(942, 35, 'kipkelion west', 'kipkelion', ''),
(943, 35, 'kipkelion west', 'chilchila', ''),
(944, 35, 'ainamoi', 'kapsoit', ''),
(945, 35, 'ainamoi', 'ainamoi', ''),
(946, 35, 'ainamoi', 'kapkugerwet', ''),
(947, 35, 'ainamoi', 'kipchebor', ''),
(948, 35, 'ainamoi', 'kipchimchim', ''),
(949, 35, 'ainamoi', 'kapsaos', ''),
(950, 35, 'bureti', 'kisiara', ''),
(951, 35, 'bureti', 'tebesonik', ''),
(952, 35, 'bureti', 'cheboin', ''),
(953, 35, 'bureti', 'chemosot', ''),
(954, 35, 'bureti', 'litein', ''),
(955, 35, 'bureti', 'cheplanget', ''),
(956, 35, 'bureti', 'kapkatet', ''),
(957, 35, 'belgut', 'waldai', ''),
(958, 35, 'belgut', 'kabianga', ''),
(959, 35, 'belgut', 'cheptororiet/seretut', ''),
(960, 35, 'belgut', 'chaik', ''),
(961, 35, 'belgut', 'kapsuser', ''),
(962, 35, 'sigowet/soin', 'sigowet', ''),
(963, 35, 'sigowet/soin', 'kaplelartet', ''),
(964, 35, 'sigowet/soin', 'soliat', ''),
(965, 35, 'sigowet/soin', 'soin', ''),
(966, 36, 'sotik', 'ndanai/abosi', ''),
(967, 36, 'sotik', 'chemagel', ''),
(968, 36, 'sotik', 'kipsonoi', ''),
(969, 36, 'sotik', 'kapletundo', ''),
(970, 36, 'sotik', 'rongena/manaret', ''),
(971, 36, 'chepalungu', 'kong\'asis', ''),
(972, 36, 'chepalungu', 'nyangores', ''),
(973, 36, 'chepalungu', 'sigor', ''),
(974, 36, 'chepalungu', 'chebunyo', ''),
(975, 36, 'chepalungu', 'siongiroi', ''),
(976, 36, 'bomet east', 'merigi', ''),
(977, 36, 'bomet east', 'kembu', ''),
(978, 36, 'bomet east', 'longisa', ''),
(979, 36, 'bomet east', 'kipreres', ''),
(980, 36, 'bomet east', 'chemaner', ''),
(981, 36, 'bomet central', 'silibwet township', ''),
(982, 36, 'bomet central', 'ndaraweta', ''),
(983, 36, 'bomet central', 'singorwet', ''),
(984, 36, 'bomet central', 'chesoen', ''),
(985, 36, 'bomet central', 'mutarakwa', ''),
(986, 36, 'konoin', 'chepchabas', ''),
(987, 36, 'konoin', 'kimulot', ''),
(988, 36, 'konoin', 'mogogosiek', ''),
(989, 36, 'konoin', 'boito', ''),
(990, 36, 'konoin', 'embomos', ''),
(991, 37, 'lugari', 'mautuma', ''),
(992, 37, 'lugari', 'lugari', ''),
(993, 37, 'lugari', 'lumakanda', ''),
(994, 37, 'lugari', 'chekalini', ''),
(995, 37, 'lugari', 'chevaywa', ''),
(996, 37, 'lugari', 'lwandeti', ''),
(997, 37, 'likuyani', 'likuyani', ''),
(998, 37, 'likuyani', 'sango', ''),
(999, 37, 'likuyani', 'kongoni', ''),
(1000, 37, 'likuyani', 'nzoia', ''),
(1001, 37, 'likuyani', 'sinoko', ''),
(1002, 37, 'malava', 'west kabras', ''),
(1003, 37, 'malava', 'chemuche', ''),
(1004, 37, 'malava', 'east kabras', ''),
(1005, 37, 'malava', 'butali/chegulo', ''),
(1006, 37, 'malava', 'manda-shivanga', ''),
(1007, 37, 'malava', 'shirugu-mugai', ''),
(1008, 37, 'malava', 'south kabras', ''),
(1009, 37, 'lurambi', 'butsotso east', ''),
(1010, 37, 'lurambi', 'butsotso south', ''),
(1011, 37, 'lurambi', 'butsotso central', ''),
(1012, 37, 'lurambi', 'sheywe', ''),
(1013, 37, 'lurambi', 'mahiakalo', ''),
(1014, 37, 'lurambi', 'shirere', ''),
(1015, 37, 'navakholo', 'ingostse-mathia', ''),
(1016, 37, 'navakholo', 'shinoyi-shikomari-', ''),
(1017, 37, 'navakholo', 'bunyala west', ''),
(1018, 37, 'navakholo', 'bunyala east', ''),
(1019, 37, 'navakholo', 'bunyala central', ''),
(1020, 37, 'mumias west', 'mumias central', ''),
(1021, 37, 'mumias west', 'mumias north', ''),
(1022, 37, 'mumias west', 'etenje', ''),
(1023, 37, 'mumias west', 'musanda', ''),
(1024, 37, 'mumias east', 'lubinu/lusheya', ''),
(1025, 37, 'mumias east', 'isongo/makunga/malaha', ''),
(1026, 37, 'mumias east', 'east wanga', ''),
(1027, 37, 'matungu', 'koyonzo', ''),
(1028, 37, 'matungu', 'kholera', ''),
(1029, 37, 'matungu', 'khalaba', ''),
(1030, 37, 'matungu', 'mayoni', ''),
(1031, 37, 'matungu', 'namamali', ''),
(1032, 37, 'butere', 'marama west', ''),
(1033, 37, 'butere', 'marama central', ''),
(1034, 37, 'butere', 'marenyo - shianda', ''),
(1035, 37, 'butere', 'marama north', ''),
(1036, 37, 'butere', 'marama south', ''),
(1037, 37, 'khwisero', 'kisa north', ''),
(1038, 37, 'khwisero', 'kisa east', ''),
(1039, 37, 'khwisero', 'kisa west', ''),
(1040, 37, 'khwisero', 'kisa central', ''),
(1041, 37, 'shinyalu', 'isukha north', ''),
(1042, 37, 'shinyalu', 'murhanda', ''),
(1043, 37, 'shinyalu', 'isukha central', ''),
(1044, 37, 'shinyalu', 'isukha south', ''),
(1045, 37, 'shinyalu', 'isukha east', ''),
(1046, 37, 'shinyalu', 'isukha west', ''),
(1047, 37, 'ikolomani', 'idakho south', ''),
(1048, 37, 'ikolomani', 'idakho east', ''),
(1049, 37, 'ikolomani', 'idakho north', ''),
(1050, 37, 'ikolomani', 'idakho central', ''),
(1051, 38, 'vihiga', 'lugaga-wamuluma', ''),
(1052, 38, 'vihiga', 'south maragoli', ''),
(1053, 38, 'vihiga', 'central maragoli', ''),
(1054, 38, 'vihiga', 'mungoma', ''),
(1055, 38, 'sabatia', 'lyaduywa/izava', ''),
(1056, 38, 'sabatia', 'west sabatia', ''),
(1057, 38, 'sabatia', 'chavakali', ''),
(1058, 38, 'sabatia', 'north maragoli', ''),
(1059, 38, 'sabatia', 'wodanga', ''),
(1060, 38, 'sabatia', 'busali', ''),
(1061, 38, 'hamisi', 'shiru', ''),
(1062, 38, 'hamisi', 'muhudu', ''),
(1063, 38, 'hamisi', 'shamakhokho', ''),
(1064, 38, 'hamisi', 'gisambai', ''),
(1065, 38, 'hamisi', 'banja', ''),
(1066, 38, 'hamisi', 'tambua', ''),
(1067, 38, 'hamisi', 'jepkoyai', ''),
(1068, 38, 'luanda', 'luanda township', ''),
(1069, 38, 'luanda', 'wemilabi', ''),
(1070, 38, 'luanda', 'mwibona', ''),
(1071, 38, 'luanda', 'luanda south', ''),
(1072, 38, 'luanda', 'emabungo', ''),
(1073, 38, 'emuhaya', 'north east bunyore', ''),
(1074, 38, 'emuhaya', 'central bunyore', ''),
(1075, 38, 'emuhaya', 'west bunyore', ''),
(1076, 39, 'mt.elgon', 'cheptais', ''),
(1077, 39, 'mt.elgon', 'chesikaki', ''),
(1078, 39, 'mt.elgon', 'chepyuk', ''),
(1079, 39, 'mt.elgon', 'kapkateny', ''),
(1080, 39, 'mt.elgon', 'kaptama', ''),
(1081, 39, 'mt.elgon', 'elgon', ''),
(1082, 39, 'sirisia', 'namwela', ''),
(1083, 39, 'sirisia', 'malakisi/south kulisiru', ''),
(1084, 39, 'sirisia', 'lwandanyi', ''),
(1085, 39, 'kabuchai', 'kabuchai/chwele', ''),
(1086, 39, 'kabuchai', 'west nalondo', ''),
(1087, 39, 'kabuchai', 'bwake/luuya', ''),
(1088, 39, 'kabuchai', 'mukuyuni', ''),
(1089, 39, 'bumula', 'south bukusu', ''),
(1090, 39, 'bumula', 'bumula', ''),
(1091, 39, 'bumula', 'khasoko', ''),
(1092, 39, 'bumula', 'kabula', ''),
(1093, 39, 'bumula', 'kimaeti', ''),
(1094, 39, 'bumula', 'west bukusu', ''),
(1095, 39, 'bumula', 'siboti', ''),
(1096, 39, 'kanduyi', 'bukembe west', ''),
(1097, 39, 'kanduyi', 'bukembe east', ''),
(1098, 39, 'kanduyi', 'township', ''),
(1099, 39, 'kanduyi', 'khalaba', ''),
(1100, 39, 'kanduyi', 'musikoma', ''),
(1101, 39, 'kanduyi', 'east sang\'alo', ''),
(1102, 39, 'kanduyi', 'marakaru/tuuti', ''),
(1103, 39, 'kanduyi', 'sang\'alo west', ''),
(1104, 39, 'webuye east', 'mihuu', ''),
(1105, 39, 'webuye east', 'ndivisi', ''),
(1106, 39, 'webuye east', 'maraka', ''),
(1107, 39, 'webuye west', 'misikhu', ''),
(1108, 39, 'webuye west', 'sitikho', ''),
(1109, 39, 'webuye west', 'matulo', ''),
(1110, 39, 'webuye west', 'bokoli', ''),
(1111, 39, 'kimilili', 'kimilili', ''),
(1112, 39, 'kimilili', 'kibingei', ''),
(1113, 39, 'kimilili', 'maeni', ''),
(1114, 39, 'kimilili', 'kamukuywa', ''),
(1115, 39, 'tongaren', 'mbakalo', ''),
(1116, 39, 'tongaren', 'naitiri/kabuyefwe', ''),
(1117, 39, 'tongaren', 'milima', ''),
(1118, 39, 'tongaren', 'ndalu/ tabani', ''),
(1119, 39, 'tongaren', 'tongaren', ''),
(1120, 39, 'tongaren', 'soysambu/ mitua', ''),
(1121, 40, 'teso north', 'malaba central', ''),
(1122, 40, 'teso north', 'malaba north', ''),
(1123, 40, 'teso north', 'ang\'urai south', ''),
(1124, 40, 'teso north', 'ang\'urai north', ''),
(1125, 40, 'teso north', 'ang\'urai east', ''),
(1126, 40, 'teso north', 'malaba south', ''),
(1127, 40, 'teso south', 'ang\'orom', ''),
(1128, 40, 'teso south', 'chakol south', ''),
(1129, 40, 'teso south', 'chakol north', ''),
(1130, 40, 'teso south', 'amukura west', ''),
(1131, 40, 'teso south', 'amukura east', ''),
(1132, 40, 'teso south', 'amukura central', ''),
(1133, 40, 'nambale', 'nambale township', ''),
(1134, 40, 'nambale', 'bukhayo north/waltsi', ''),
(1135, 40, 'nambale', 'bukhayo east', ''),
(1136, 40, 'nambale', 'bukhayo central', ''),
(1137, 40, 'matayos', 'bukhayo west', ''),
(1138, 40, 'matayos', 'mayenje', ''),
(1139, 40, 'matayos', 'matayos south', ''),
(1140, 40, 'matayos', 'busibwabo', ''),
(1141, 40, 'matayos', 'burumba', ''),
(1142, 40, 'butula', 'marachi west', ''),
(1143, 40, 'butula', 'kingandole', ''),
(1144, 40, 'butula', 'marachi central', ''),
(1145, 40, 'butula', 'marachi east', ''),
(1146, 40, 'butula', 'marachi north', ''),
(1147, 40, 'butula', 'elugulu', ''),
(1148, 40, 'funyula', 'namboboto nambuku', ''),
(1149, 40, 'funyula', 'nangina', ''),
(1150, 40, 'funyula', 'ageng\'a nanguba', ''),
(1151, 40, 'funyula', 'bwiri', ''),
(1152, 40, 'budalangi', 'bunyala central', ''),
(1153, 40, 'budalangi', 'bunyala north', ''),
(1154, 40, 'budalangi', 'bunyala west', ''),
(1155, 40, 'budalangi', 'bunyala south', ''),
(1156, 41, 'ugenya', 'west ugenya', ''),
(1157, 41, 'ugenya', 'ukwala', ''),
(1158, 41, 'ugenya', 'north ugenya', ''),
(1159, 41, 'ugenya', 'east ugenya', ''),
(1160, 41, 'ugunja', 'sidindi', ''),
(1161, 41, 'ugunja', 'sigomere', ''),
(1162, 41, 'ugunja', 'ugunja', ''),
(1163, 41, 'alego usonga', 'usonga', ''),
(1164, 41, 'alego usonga', 'west alego', ''),
(1165, 41, 'alego usonga', 'central alego', ''),
(1166, 41, 'alego usonga', 'siaya township', ''),
(1167, 41, 'alego usonga', 'north alego', ''),
(1168, 41, 'alego usonga', 'south east alego', ''),
(1169, 41, 'gem', 'north gem', ''),
(1170, 41, 'gem', 'west gem', ''),
(1171, 41, 'gem', 'central gem', ''),
(1172, 41, 'gem', 'yala township', ''),
(1173, 41, 'gem', 'east gem', ''),
(1174, 41, 'gem', 'south gem', ''),
(1175, 41, 'bondo', 'west yimbo', ''),
(1176, 41, 'bondo', 'central sakwa', ''),
(1177, 41, 'bondo', 'south sakwa', ''),
(1178, 41, 'bondo', 'yimbo east', ''),
(1179, 41, 'bondo', 'west sakwa', ''),
(1180, 41, 'bondo', 'north sakwa', ''),
(1181, 41, 'rarieda', 'east asembo', ''),
(1182, 41, 'rarieda', 'west asembo', ''),
(1183, 41, 'rarieda', 'north uyoma', ''),
(1184, 41, 'rarieda', 'south uyoma', ''),
(1185, 41, 'rarieda', 'west uyoma', ''),
(1186, 42, 'kisumu east', 'kajulu', ''),
(1187, 42, 'kisumu east', 'kolwa east', ''),
(1188, 42, 'kisumu east', 'manyatta \'b\'', ''),
(1189, 42, 'kisumu east', 'nyalenda \'a\'', ''),
(1190, 42, 'kisumu east', 'kolwa central', ''),
(1191, 42, 'kisumu west', 'south west kisumu', ''),
(1192, 42, 'kisumu west', 'central kisumu', ''),
(1193, 42, 'kisumu west', 'kisumu north', ''),
(1194, 42, 'kisumu west', 'west kisumu', ''),
(1195, 42, 'kisumu west', 'north west kisumu', ''),
(1196, 42, 'kisumu central', 'railways', ''),
(1197, 42, 'kisumu central', 'migosi', ''),
(1198, 42, 'kisumu central', 'shaurimoyo kaloleni', ''),
(1199, 42, 'kisumu central', 'market milimani', ''),
(1200, 42, 'kisumu central', 'kondele', ''),
(1201, 42, 'kisumu central', 'nyalenda b', ''),
(1202, 42, 'seme', 'west seme', ''),
(1203, 42, 'seme', 'central seme', ''),
(1204, 42, 'seme', 'east seme', ''),
(1205, 42, 'seme', 'north seme', ''),
(1206, 42, 'nyando', 'east kano/wawidhi', ''),
(1207, 42, 'nyando', 'awasi/onjiko', ''),
(1208, 42, 'nyando', 'ahero', ''),
(1209, 42, 'nyando', 'kabonyo/kanyagwal', ''),
(1210, 42, 'nyando', 'kobura', ''),
(1211, 42, 'muhoroni', 'miwani', ''),
(1212, 42, 'muhoroni', 'ombeyi', ''),
(1213, 42, 'muhoroni', 'masogo/nyang\'oma', ''),
(1214, 42, 'muhoroni', 'chemelil', ''),
(1215, 42, 'muhoroni', 'muhoroni/koru', ''),
(1216, 42, 'nyakach', 'south west nyakach', ''),
(1217, 42, 'nyakach', 'north nyakach', ''),
(1218, 42, 'nyakach', 'central nyakach', ''),
(1219, 42, 'nyakach', 'west nyakach', ''),
(1220, 42, 'nyakach', 'south east nyakach', ''),
(1221, 43, 'kasipul', 'west kasipul', ''),
(1222, 43, 'kasipul', 'south kasipul', ''),
(1223, 43, 'kasipul', 'central kasipul', ''),
(1224, 43, 'kasipul', 'east kamagak', ''),
(1225, 43, 'kasipul', 'west kamagak', ''),
(1226, 43, 'kabondo kasipul', 'kabondo east', ''),
(1227, 43, 'kabondo kasipul', 'kabondo west', ''),
(1228, 43, 'kabondo kasipul', 'kokwanyo/kakelo', ''),
(1229, 43, 'kabondo kasipul', 'kojwach', ''),
(1230, 43, 'karachuonyo', 'west karachuonyo', ''),
(1231, 43, 'karachuonyo', 'north karachuonyo', ''),
(1232, 43, 'karachuonyo', 'central', ''),
(1233, 43, 'karachuonyo', 'kanyaluo', ''),
(1234, 43, 'karachuonyo', 'kibiri', ''),
(1235, 43, 'karachuonyo', 'wangchieng', ''),
(1236, 43, 'karachuonyo', 'kendu bay town', ''),
(1237, 43, 'rangwe', 'west gem', ''),
(1238, 43, 'rangwe', 'east gem', ''),
(1239, 43, 'rangwe', 'kagan', ''),
(1240, 43, 'rangwe', 'kochia', ''),
(1241, 43, 'homa bay town', 'homa bay central', ''),
(1242, 43, 'homa bay town', 'homa bay arujo', ''),
(1243, 43, 'homa bay town', 'homa bay west', ''),
(1244, 43, 'homa bay town', 'homa bay east', ''),
(1245, 43, 'ndhiwa', 'kwabwai', ''),
(1246, 43, 'ndhiwa', 'kanyadoto', ''),
(1247, 43, 'ndhiwa', 'kanyikela', ''),
(1248, 43, 'ndhiwa', 'north kabuoch', ''),
(1249, 43, 'ndhiwa', 'kabuoch south/pala', ''),
(1250, 43, 'ndhiwa', 'kanyamwa kologi', ''),
(1251, 43, 'ndhiwa', 'kanyamwa kosewe', ''),
(1252, 43, 'mbita', 'mfangano island', ''),
(1253, 43, 'mbita', 'rusinga island', ''),
(1254, 43, 'mbita', 'kasgunga', ''),
(1255, 43, 'mbita', 'gembe', ''),
(1256, 43, 'mbita', 'lambwe', ''),
(1257, 43, 'suba', 'gwassi south', ''),
(1258, 43, 'suba', 'gwassi north', ''),
(1259, 43, 'suba', 'kaksingri west', ''),
(1260, 43, 'suba', 'ruma kaksingri east', ''),
(1261, 44, 'rongo', 'north kamagambo', ''),
(1262, 44, 'rongo', 'central kamagambo', ''),
(1263, 44, 'rongo', 'east kamagambo', ''),
(1264, 44, 'rongo', 'south kamagambo', ''),
(1265, 44, 'awendo', 'north sakwa', ''),
(1266, 44, 'awendo', 'south sakwa', ''),
(1267, 44, 'awendo', 'west sakwa', ''),
(1268, 44, 'awendo', 'central sakwa', ''),
(1269, 44, 'suna east', 'god jope', ''),
(1270, 44, 'suna east', 'suna central', ''),
(1271, 44, 'suna east', 'kakrao', ''),
(1272, 44, 'suna east', 'kwa', ''),
(1273, 44, 'suna west', 'wiga', ''),
(1274, 44, 'suna west', 'wasweta ii', ''),
(1275, 44, 'suna west', 'ragana-oruba', ''),
(1276, 44, 'suna west', 'wasimbete', ''),
(1277, 44, 'uriri', 'west kanyamkago', ''),
(1278, 44, 'uriri', 'north kanyamkago', ''),
(1279, 44, 'uriri', 'central kanyamkago', ''),
(1280, 44, 'uriri', 'south kanyamkago', ''),
(1281, 44, 'uriri', 'east kanyamkago', ''),
(1282, 44, 'nyatike', 'kachien\'g', ''),
(1283, 44, 'nyatike', 'kanyasa', ''),
(1284, 44, 'nyatike', 'north kadem', ''),
(1285, 44, 'nyatike', 'macalder/kanyarwanda', ''),
(1286, 44, 'nyatike', 'kaler', ''),
(1287, 44, 'nyatike', 'got kachola', ''),
(1288, 44, 'nyatike', 'muhuru', ''),
(1289, 44, 'kuria west', 'bukira east', ''),
(1290, 44, 'kuria west', 'bukira centrl/ikerege', ''),
(1291, 44, 'kuria west', 'isibania', '');
INSERT INTO `subcounties` (`id`, `county_id`, `name`, `ward`, `alias`) VALUES
(1292, 44, 'kuria west', 'makerero', ''),
(1293, 44, 'kuria west', 'masaba', ''),
(1294, 44, 'kuria west', 'tagare', ''),
(1295, 44, 'kuria west', 'nyamosense/komosoko', ''),
(1296, 44, 'kuria east', 'gokeharaka/getambwega', ''),
(1297, 44, 'kuria east', 'ntimaru west', ''),
(1298, 44, 'kuria east', 'ntimaru east', ''),
(1299, 44, 'kuria east', 'nyabasi east', ''),
(1300, 44, 'kuria east', 'nyabasi west', ''),
(1301, 45, 'bonchari', 'bomariba', ''),
(1302, 45, 'bonchari', 'bogiakumu', ''),
(1303, 45, 'bonchari', 'bomorenda', ''),
(1304, 45, 'bonchari', 'riana', ''),
(1305, 45, 'south mugirango', 'tabaka', ''),
(1306, 45, 'south mugirango', 'boikang\'a', ''),
(1307, 45, 'south mugirango', 'bogetenga', ''),
(1308, 45, 'south mugirango', 'borabu / chitago', ''),
(1309, 45, 'south mugirango', 'moticho', ''),
(1310, 45, 'south mugirango', 'getenga', ''),
(1311, 45, 'bomachoge borabu', 'bombaba borabu', ''),
(1312, 45, 'bomachoge borabu', 'boochi borabu', ''),
(1313, 45, 'bomachoge borabu', 'bokimonge', ''),
(1314, 45, 'bomachoge borabu', 'magenche', ''),
(1315, 45, 'bobasi', 'masige west', ''),
(1316, 45, 'bobasi', 'masige east', ''),
(1317, 45, 'bobasi', 'bobasi central', ''),
(1318, 45, 'bobasi', 'nyacheki', ''),
(1319, 45, 'bobasi', 'bobasi bogetaorio', ''),
(1320, 45, 'bobasi', 'bobasi chache', ''),
(1321, 45, 'bobasi', 'sameta/mokwerero', ''),
(1322, 45, 'bobasi', 'bobasi boitangare', ''),
(1323, 45, 'bomachoge chache', 'majoge', ''),
(1324, 45, 'bomachoge chache', 'boochi/tendere', ''),
(1325, 45, 'bomachoge chache', 'bosoti/sengera', ''),
(1326, 45, 'nyaribari masaba', 'ichuni', ''),
(1327, 45, 'nyaribari masaba', 'nyamasibi', ''),
(1328, 45, 'nyaribari masaba', 'masimba', ''),
(1329, 45, 'nyaribari masaba', 'gesusu', ''),
(1330, 45, 'nyaribari masaba', 'kiamokama', ''),
(1331, 45, 'nyaribari chache', 'bobaracho', ''),
(1332, 45, 'nyaribari chache', 'kisii central', ''),
(1333, 45, 'nyaribari chache', 'keumbu', ''),
(1334, 45, 'nyaribari chache', 'kiogoro', ''),
(1335, 45, 'nyaribari chache', 'birongo', ''),
(1336, 45, 'nyaribari chache', 'ibeno', ''),
(1337, 45, 'kitutu chache north', 'monyerero', ''),
(1338, 45, 'kitutu chache north', 'sensi', ''),
(1339, 45, 'kitutu chache north', 'marani', ''),
(1340, 45, 'kitutu chache north', 'kegogi', ''),
(1341, 45, 'kitutu chache south', 'bogusero', ''),
(1342, 45, 'kitutu chache south', 'bogeka', ''),
(1343, 45, 'kitutu chache south', 'nyakoe', ''),
(1344, 45, 'kitutu chache south', 'kitutu   central', ''),
(1345, 45, 'kitutu chache south', 'nyatieko', ''),
(1346, 46, 'kitutu masaba', 'rigoma', ''),
(1347, 46, 'kitutu masaba', 'gachuba', ''),
(1348, 46, 'kitutu masaba', 'kemera', ''),
(1349, 46, 'kitutu masaba', 'magombo', ''),
(1350, 46, 'kitutu masaba', 'manga', ''),
(1351, 46, 'kitutu masaba', 'gesima', ''),
(1352, 46, 'west mugirango', 'nyamaiya', ''),
(1353, 46, 'west mugirango', 'bogichora', ''),
(1354, 46, 'west mugirango', 'bosamaro', ''),
(1355, 46, 'west mugirango', 'bonyamatuta', ''),
(1356, 46, 'west mugirango', 'township', ''),
(1357, 46, 'north mugirango', 'itibo', ''),
(1358, 46, 'north mugirango', 'bomwagamo', ''),
(1359, 46, 'north mugirango', 'bokeira', ''),
(1360, 46, 'north mugirango', 'magwagwa', ''),
(1361, 46, 'north mugirango', 'ekerenyo', ''),
(1362, 46, 'borabu', 'mekenene', ''),
(1363, 46, 'borabu', 'kiabonyoru', ''),
(1364, 46, 'borabu', 'nyansiongo', ''),
(1365, 46, 'borabu', 'esise', ''),
(1366, 47, 'westlands', 'kitisuru', ''),
(1367, 47, 'westlands', 'parklands/highridge', ''),
(1368, 47, 'westlands', 'karura', ''),
(1369, 47, 'westlands', 'kangemi', ''),
(1370, 47, 'westlands', 'mountain view', ''),
(1371, 47, 'dagoretti north', 'kilimani', ''),
(1372, 47, 'dagoretti north', 'kawangware', ''),
(1373, 47, 'dagoretti north', 'gatina', ''),
(1374, 47, 'dagoretti north', 'kileleshwa', ''),
(1375, 47, 'dagoretti north', 'kabiro', ''),
(1376, 47, 'dagoretti south', 'mutuini', ''),
(1377, 47, 'dagoretti south', 'ngando', ''),
(1378, 47, 'dagoretti south', 'riruta', ''),
(1379, 47, 'dagoretti south', 'uthiru/ruthimitu', ''),
(1380, 47, 'dagoretti south', 'waithaka', ''),
(1381, 47, 'langata', 'karen', ''),
(1382, 47, 'langata', 'nairobi west', ''),
(1383, 47, 'langata', 'mugumo-ini', ''),
(1384, 47, 'langata', 'south-c', ''),
(1385, 47, 'langata', 'nyayo highrise', ''),
(1386, 47, 'kibra', 'laini saba', ''),
(1387, 47, 'kibra', 'lindi', ''),
(1388, 47, 'kibra', 'makina', ''),
(1389, 47, 'kibra', 'woodley/kenyatta golf', ''),
(1390, 47, 'kibra', 'sarangombe', ''),
(1391, 47, 'roysambu', 'githurai', ''),
(1392, 47, 'roysambu', 'kahawa west', ''),
(1393, 47, 'roysambu', 'zimmerman', ''),
(1394, 47, 'roysambu', 'roysambu', ''),
(1395, 47, 'roysambu', 'kahawa', ''),
(1396, 47, 'kasarani', 'claycity', ''),
(1397, 47, 'kasarani', 'mwiki', ''),
(1398, 47, 'kasarani', 'kasarani', ''),
(1399, 47, 'kasarani', 'njiru', ''),
(1400, 47, 'kasarani', 'ruai', ''),
(1401, 47, 'ruaraka', 'baba dogo', ''),
(1402, 47, 'ruaraka', 'utalii', ''),
(1403, 47, 'ruaraka', 'mathare north', ''),
(1404, 47, 'ruaraka', 'lucky summer', ''),
(1405, 47, 'ruaraka', 'korogocho', ''),
(1406, 47, 'embakasi south', 'imara daima', ''),
(1407, 47, 'embakasi south', 'kwa njenga', ''),
(1408, 47, 'embakasi south', 'kwa reuben', ''),
(1409, 47, 'embakasi south', 'pipeline', ''),
(1410, 47, 'embakasi south', 'kware', ''),
(1411, 47, 'embakasi north', 'kariobangi north', ''),
(1412, 47, 'embakasi north', 'dandora area i', ''),
(1413, 47, 'embakasi north', 'dandora area ii', ''),
(1414, 47, 'embakasi north', 'dandora area iii', ''),
(1415, 47, 'embakasi north', 'dandora area iv', ''),
(1416, 47, 'embakasi central', 'kayole north', ''),
(1417, 47, 'embakasi central', 'kayole central', ''),
(1418, 47, 'embakasi central', 'kayole south', ''),
(1419, 47, 'embakasi central', 'komarock', ''),
(1420, 47, 'embakasi central', 'matopeni', ''),
(1421, 47, 'embakasi east', 'upper savannah', ''),
(1422, 47, 'embakasi east', 'lower savannah', ''),
(1423, 47, 'embakasi east', 'embakasi', ''),
(1424, 47, 'embakasi east', 'utawala', ''),
(1425, 47, 'embakasi east', 'mihango', ''),
(1426, 47, 'embakasi west', 'umoja i', ''),
(1427, 47, 'embakasi west', 'umoja ii', ''),
(1428, 47, 'embakasi west', 'mowlem', ''),
(1429, 47, 'embakasi west', 'kariobangi south', ''),
(1430, 47, 'makadara', 'makongeni', ''),
(1431, 47, 'makadara', 'maringo/hamza', ''),
(1432, 47, 'makadara', 'harambee', ''),
(1433, 47, 'makadara', 'viwandani', ''),
(1434, 47, 'kamukunji', 'pumwani', ''),
(1435, 47, 'kamukunji', 'eastleigh north', ''),
(1436, 47, 'kamukunji', 'eastleigh south', ''),
(1437, 47, 'kamukunji', 'airbase', ''),
(1438, 47, 'kamukunji', 'california', ''),
(1439, 47, 'starehe', 'nairobi central', ''),
(1440, 47, 'starehe', 'ngara', ''),
(1441, 47, 'starehe', 'ziwani/kariokor', ''),
(1442, 47, 'starehe', 'pangani', ''),
(1443, 47, 'starehe', 'landimawe', ''),
(1444, 47, 'starehe', 'nairobi south', ''),
(1445, 47, 'mathare', 'hospital', ''),
(1446, 47, 'mathare', 'mabatini', ''),
(1447, 47, 'mathare', 'huruma', ''),
(1448, 47, 'mathare', 'ngei', ''),
(1449, 47, 'mathare', 'mlango kubwa', ''),
(1450, 47, 'mathare', 'kiamaiko', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Username` varchar(60) NOT NULL,
  `Password` text NOT NULL,
  `Contact` int(11) NOT NULL,
  `Role` int(11) NOT NULL,
  `Shared` int(11) NOT NULL,
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `UserID`, `Email`, `Username`, `Password`, `Contact`, `Role`, `Shared`, `Created`) VALUES
(1, 'ZGXYJ4', 'isopat.pat@gmail.com', 'isaac', '$2y$12$lyF.Gu95KdkSy6sH.SZ2J.xAo5kVnZp41p11wu2guwbq6s8URDmtS', 706928631, 1, 1, '2017-03-03 05:20:41'),
(2, 'ABKY7Q', 'user@gmail.com', 'user', '$2y$12$YKyY745A4XbyNSytYJiQLePpWuTj.5wYGV.CHR2LCVrytXEPTVj9.', 720000001, 3, 1, '2017-03-04 12:19:43'),
(3, 'ASTJ8J', 'itcyborg@outlook.com', 'itcyborg', '$2y$12$4lRYOykV8qNsdQylxmJ9J.t694BSjFCoL9MswJduZjaao.Kj9j.i2', 720156456, 3, 1, '2017-03-06 15:49:00'),
(4, 'RD23PP', 'user1@gmail.com', 'user1', '$2y$12$POGsjTuGQc2dFZLYicE/6Oq72uGyTtjosnPKWMWL66PmCw9ZUUh02', 720112456, 3, 1, '2017-03-07 08:45:28'),
(5, '4IEC4I', 'one@gmail.com', 'one', '$2y$12$CiSzDnnV/xCKRthBtIDab.Jq6T14sjB6wNKkPdM2QmUqmV9V/pL4G', 754682131, 3, 1, '2017-03-10 04:24:46'),
(6, 'PIYC48', 'i@g.com', 'i', '$2y$12$7PE9CI1NpmP1pdOetg6KJevu7DK80IgpGAy6qJhNw2Rrbsh9jq7n6', 705236123, 3, 1, '2017-03-19 19:09:03'),
(7, '8BZ7LV', 'vinny@gmail.com', 'vinny', '$2y$12$Szelglmty2XU.FT7pyBBOOtW4NwC/JPnjQaGT6S9gRnRL9d.WMnJy', 711215612, 3, 1, '2017-03-21 15:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `vertable`
--

CREATE TABLE `vertable` (
  `ID` int(11) NOT NULL,
  `Payer` int(11) NOT NULL,
  `TransactionID` varchar(10) NOT NULL,
  `Amount` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vertable`
--

INSERT INTO `vertable` (`ID`, `Payer`, `TransactionID`, `Amount`, `TimeStamp`) VALUES
(3, 706928631, 'lce1d1u84f', 25000, '2017-03-21 15:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `wrep`
--

CREATE TABLE `wrep` (
  `UserID` varchar(8) NOT NULL,
  `County` varchar(254) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aspirants`
--
ALTER TABLE `aspirants`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `governor`
--
ALTER TABLE `governor`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mp`
--
ALTER TABLE `mp`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `PartyID` (`PartyID`),
  ADD UNIQUE KEY `PartyName` (`PartyName`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `presidential`
--
ALTER TABLE `presidential`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `senator`
--
ALTER TABLE `senator`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `subcounties`
--
ALTER TABLE `subcounties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `vertable`
--
ALTER TABLE `vertable`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `wrep`
--
ALTER TABLE `wrep`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aspirants`
--
ALTER TABLE `aspirants`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `counties`
--
ALTER TABLE `counties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `subcounties`
--
ALTER TABLE `subcounties`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1451;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vertable`
--
ALTER TABLE `vertable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
