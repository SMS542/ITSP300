-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2020 at 12:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itsp300db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `User_UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `DeliveryID` int(11) NOT NULL,
  `RecipientName` varchar(45) NOT NULL,
  `BussinessName` varchar(45) DEFAULT NULL,
  `AddressLine1` varchar(45) NOT NULL,
  `AddressLine2` varchar(45) DEFAULT NULL,
  `Suburb` varchar(45) NOT NULL,
  `City/Town` varchar(45) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `ContactNumber` varchar(10) NOT NULL,
  `Cargo` varchar(45) NOT NULL,
  `CurrentLocation` varchar(45) NOT NULL,
  `Vehicle_VehicleNo` int(11) NOT NULL,
  `Route_RouteID` int(11) NOT NULL,
  `DriverInfo_DriverInfoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `driverinfo`
--

CREATE TABLE `driverinfo` (
  `DriverInfoID` int(11) NOT NULL,
  `DriverSuggestions` varchar(145) DEFAULT NULL,
  `DriverLocation` varchar(45) DEFAULT NULL,
  `DriverAllowance` varchar(45) DEFAULT NULL,
  `User_UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `RouteID` int(11) NOT NULL,
  `Path` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) NOT NULL,
  `UserSurname` varchar(45) NOT NULL,
  `UserLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleNo` int(11) NOT NULL,
  `RegistrationNumber` varchar(45) NOT NULL,
  `Maintenance` int(11) DEFAULT NULL,
  `AdditionalNotes` varchar(45) DEFAULT NULL,
  `Cargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `User_UserID` (`User_UserID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD KEY `DriverInfo_DriverInfoID` (`DriverInfo_DriverInfoID`),
  ADD KEY `Route_RouteID` (`Route_RouteID`),
  ADD KEY `Vehicle_VehicleNo` (`Vehicle_VehicleNo`);

--
-- Indexes for table `driverinfo`
--
ALTER TABLE `driverinfo`
  ADD PRIMARY KEY (`DriverInfoID`),
  ADD KEY `User_UserID` (`User_UserID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`RouteID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driverinfo`
--
ALTER TABLE `driverinfo`
  MODIFY `DriverInfoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `VehicleNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Route_RouteID`) REFERENCES `route` (`RouteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`DriverInfo_DriverInfoID`) REFERENCES `driverinfo` (`DriverInfoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_ibfk_4` FOREIGN KEY (`Vehicle_VehicleNo`) REFERENCES `vehicle` (`VehicleNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `driverinfo`
--
ALTER TABLE `driverinfo`
  ADD CONSTRAINT `driverinfo_ibfk_1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
