-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 05:51 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `document`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id_document` int(11) NOT NULL,
  `name_document` varchar(100) NOT NULL,
  `detaile_document` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `username_post` varchar(100) NOT NULL,
  `status_post` enum('active','inactive','','') NOT NULL DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id_document`, `name_document`, `detaile_document`, `type`, `date`, `username_post`, `status_post`) VALUES
(53, 'saddsafasf', 'ashifhsaifhi', 'png', '2020-05-05 06:14:54', 'admin', 'active'),
(54, 'sasaasfak', 'okasopfkaposk', 'png', '2020-05-02 22:36:56', 'admin', 'active'),
(57, 'test', 'eiei', 'sql', '2020-05-02 22:54:00', 'abcd', 'active'),
(60, 'eieiei', 'kuyyyyy', 'png', '2020-05-05 05:42:38', 'admin', 'active'),
(67, 'hadAHUHUI', 'HUISHFUASF', 'sql', '2020-05-05 07:49:41', 'admin', 'active'),
(68, 'WQEQWE', 'DASDA', 'pka', '2020-05-05 07:49:52', 'admin', 'active'),
(69, 'ASJFASFIJ', 'OIJASIOFJSAOI', 'png', '2020-05-05 07:50:05', 'admin', 'active'),
(70, 'QWDOQKWDOJIO', 'JIOAJSDIOAS', 'pdf', '2020-05-05 07:50:17', 'admin', 'active'),
(71, 'SADJASIOJ', 'IOJASIODJSAOI', 'sql', '2020-05-05 07:50:27', 'admin', 'active'),
(72, 'QWLEOKQWO', 'OAKODA', 'sql', '2020-05-05 07:50:35', 'admin', 'inactive'),
(73, 'ASFKAJSJ', 'JIJSAIOASJFOIJ', 'png', '2020-05-05 07:51:51', 'admin', 'inactive'),
(74, 'OSAFKAOSJO', 'JOIASJFIOASJFIO', 'pdf', '2020-05-05 07:52:07', 'admin', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` enum('0','1','2','') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `email`, `username`, `password`, `status`) VALUES
(1, 'chanaphat@hotmail.com', 'admin', 'admin1234', '1'),
(2, 'saraluk85@gmail.com', 'abcd', 'abcd', '0'),
(5, 'kuy@hotmail.com', 'eieiei', 'eieiei', '0'),
(6, 'saraluk86@gmail.com', 'abccccc', 'safas', '0'),
(8, 'saraluk87@gmail.com', 'adminasfas', 'admin1234', '0'),
(9, 'saralauk85@gmail.com', 'safasfas', 'admin1234', '0'),
(10, 'saasdraluk85@gmail.com', 'aaaaaa', 'admin1234', '0'),
(11, 'admin@hotmail.com', 'adminww', 'admin1234', '0'),
(13, 'saralasdasuk85@gmail.com', 'asasfasfas', 'admin1234', '0'),
(15, 'saraluk70@gmail.com', '1234', '1234', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id_document`),
  ADD UNIQUE KEY `name_document` (`name_document`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id_document` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
