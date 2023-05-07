-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2022 at 08:24 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organizator_casova`
--

-- --------------------------------------------------------

--
-- Table structure for table `casovi`
--

CREATE TABLE `casovi` (
  `casID` int(11) NOT NULL,
  `opis` varchar(120) NOT NULL,
  `datum` datetime NOT NULL,
  `predmetID` int(11) NOT NULL,
  `predavacID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `casovi`
--

INSERT INTO `casovi` (`casID`, `opis`, `datum`, `predmetID`, `predavacID`) VALUES
(2, 'Strategija', '2021-12-19 16:08:27', 2, 2),
(5, 'Integrali', '2021-12-18 12:10:36', 1, 1),
(6, 'Laplas', '2021-12-23 13:28:10', 3, 1),
(8, 'Izvodi', '2022-08-21 10:25:57', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `predavaci`
--

CREATE TABLE `predavaci` (
  `predavacID` int(11) NOT NULL,
  `zvanje` enum('asistent','profesor') NOT NULL,
  `ime` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `predavaci`
--

INSERT INTO `predavaci` (`predavacID`, `zvanje`, `ime`) VALUES
(1, 'asistent', 'Dusan Dzamic'),
(2, 'asistent', 'Ivan Todorović'),
(3, 'profesor', 'Nebojsa Nikolic');

-- --------------------------------------------------------

--
-- Table structure for table `predmeti`
--

CREATE TABLE `predmeti` (
  `predmetID` int(11) NOT NULL,
  `naziv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `predmeti`
--

INSERT INTO `predmeti` (`predmetID`, `naziv`) VALUES
(1, 'Matematika 2'),
(2, 'Osnove organizacije'),
(3, 'Matematika 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casovi`
--
ALTER TABLE `casovi`
  ADD PRIMARY KEY (`casID`),
  ADD KEY `predavacID` (`predavacID`),
  ADD KEY `predmetID` (`predmetID`);

--
-- Indexes for table `predavaci`
--
ALTER TABLE `predavaci`
  ADD PRIMARY KEY (`predavacID`);

--
-- Indexes for table `predmeti`
--
ALTER TABLE `predmeti`
  ADD PRIMARY KEY (`predmetID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casovi`
--
ALTER TABLE `casovi`
  MODIFY `casID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `predavaci`
--
ALTER TABLE `predavaci`
  MODIFY `predavacID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `predmeti`
--
ALTER TABLE `predmeti`
  MODIFY `predmetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `casovi`
--
ALTER TABLE `casovi`
  ADD CONSTRAINT `predavacID` FOREIGN KEY (`predavacID`) REFERENCES `predavaci` (`predavacID`),
  ADD CONSTRAINT `predmetID` FOREIGN KEY (`predmetID`) REFERENCES `predmeti` (`predmetID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
