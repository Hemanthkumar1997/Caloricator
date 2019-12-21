-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2017 at 05:58 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caloricator`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `del30` ()  NO SQL
BEGIN
DELETE from tracker WHERE tracker.date < DATE_SUB(NOW(),INTERVAL 30 DAY);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `del7` ()  NO SQL
BEGIN
  delete from history where history.date < DATE_SUB(NOW(),INTERVAL 7 DAY);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `habits`
--

CREATE TABLE `habits` (
  `userid` varchar(50) NOT NULL,
  `type` int(20) NOT NULL,
  `exercise` int(50) NOT NULL,
  `want to` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `Email` varchar(50) NOT NULL,
  `food1` varchar(25) NOT NULL,
  `food2` varchar(25) NOT NULL,
  `food3` varchar(25) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `history`
--
DELIMITER $$
CREATE TRIGGER `deleteold` AFTER INSERT ON `history` FOR EACH ROW BEGIN
call del7();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `non-veg`
--

CREATE TABLE `non-veg` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `snacks`
--

CREATE TABLE `snacks` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE `tracker` (
  `userid` varchar(50) NOT NULL,
  `weight` float NOT NULL,
  `height` int(5) NOT NULL,
  `date` date NOT NULL,
  `tcalories` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `tracker`
--
DELIMITER $$
CREATE TRIGGER `del1` AFTER INSERT ON `tracker` FOR EACH ROW BEGIN
call del30();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Name` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Age` int(4) NOT NULL,
  `Height` int(5) NOT NULL,
  `Weight` float NOT NULL,
  `phone` varchar(10) NOT NULL,
  `photo` longblob NOT NULL,
  `sex` varchar(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `vegetables-and-fruits` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  `calories` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `habits`
--
ALTER TABLE `habits`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`userid`,`date`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
