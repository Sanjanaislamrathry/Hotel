-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2022 at 06:46 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BID` int(11) NOT NULL,
  `Ammount` int(11) DEFAULT NULL,
  `Paydate` date DEFAULT NULL,
  `CID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BID`, `Ammount`, `Paydate`, `CID`) VALUES
(1, 175000, '2022-04-15', 2),
(2, 45000, '2022-04-12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Bdate` date DEFAULT NULL,
  `Endate` date DEFAULT NULL,
  `Exdate` date DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `Hotelname` varchar(30) DEFAULT NULL,
  `Rnum` int(11) DEFAULT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Bdate`, `Endate`, `Exdate`, `CID`, `Hotelname`, `Rnum`, `bid`) VALUES
('2022-04-02', '2022-04-11', '2022-04-15', 2, 'Fiesta', 206, 1),
('2022-05-02', '2022-04-11', '2022-04-15', 3, 'Fiesta', 206, 8),
('2022-05-02', '2022-04-11', '2022-04-15', 1, 'Fiesta', 205, 9);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `F_name` varchar(30) DEFAULT NULL,
  `L_name` varchar(30) DEFAULT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `PhoneNo`, `F_name`, `L_name`, `pass`) VALUES
(1, 437288, 'Mary', 'Jane', '123'),
(2, 230239, 'Kevin', 'Owens', '123'),
(3, 295723, 'steve', 'Gerard', '123'),
(4, 409328, 'Peter', 'walles', '123');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `Hotelname` varchar(30) DEFAULT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EID`, `Name`, `PhoneNo`, `address`, `Hotelname`, `pass`) VALUES
(1, 'David', 473311, 'Mirpur', 'Fiesta', '123'),
(2, 'John', 478239, 'Uttara', 'Fiesta', '123'),
(3, 'Simon', 209709, 'Gulshan', 'Fiesta', '123'),
(4, 'Ethan', 212367, 'Banani', 'Fiesta', '123');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `Hotelname` varchar(30) NOT NULL,
  `location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`Hotelname`, `location`) VALUES
('Fiesta', 'Cox\'s Bazar');

-- --------------------------------------------------------

--
-- Table structure for table `roominfo`
--

CREATE TABLE `roominfo` (
  `Rnum` int(11) NOT NULL,
  `Sclass` varchar(20) DEFAULT NULL,
  `Hotelname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roominfo`
--

INSERT INTO `roominfo` (`Rnum`, `Sclass`, `Hotelname`) VALUES
(201, 'Single', 'Fiesta'),
(202, 'Single', 'Fiesta'),
(203, 'Double', 'Fiesta'),
(204, 'Double', 'Fiesta'),
(205, 'Double', 'Fiesta'),
(206, 'King', 'Fiesta'),
(207, 'KIng', 'Fiesta'),
(208, 'Studio', 'Fiesta');

-- --------------------------------------------------------

--
-- Table structure for table `suitefare`
--

CREATE TABLE `suitefare` (
  `Sclass` varchar(20) NOT NULL,
  `price` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suitefare`
--

INSERT INTO `suitefare` (`Sclass`, `price`) VALUES
('Double', 25000),
('King', 35000),
('Single', 15000),
('Studio', 30000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `CID` (`CID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `CID` (`CID`),
  ADD KEY `Hotelname` (`Hotelname`),
  ADD KEY `Rnum` (`Rnum`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EID`),
  ADD KEY `Hotelname` (`Hotelname`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`Hotelname`);

--
-- Indexes for table `roominfo`
--
ALTER TABLE `roominfo`
  ADD PRIMARY KEY (`Rnum`),
  ADD KEY `Hotelname` (`Hotelname`);

--
-- Indexes for table `suitefare`
--
ALTER TABLE `suitefare`
  ADD PRIMARY KEY (`Sclass`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`Hotelname`) REFERENCES `hotel` (`Hotelname`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`Rnum`) REFERENCES `roominfo` (`Rnum`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Hotelname`) REFERENCES `hotel` (`Hotelname`);

--
-- Constraints for table `roominfo`
--
ALTER TABLE `roominfo`
  ADD CONSTRAINT `roominfo_ibfk_1` FOREIGN KEY (`Hotelname`) REFERENCES `hotel` (`Hotelname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
