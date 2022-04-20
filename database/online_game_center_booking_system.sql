-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2022 at 01:40 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_game_center_booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `timeslot_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `customer_id`, `timeslot_id`, `amount`, `date`, `status`) VALUES
(1, 1, 2, '1000', '2022-02-25', 'paid'),
(2, 1, 1, '1000', '2022-02-28', 'Accepted'),
(3, 3, 81, '2000', '2022-04-06', 'paid'),
(4, 3, 291, '3000', '2022-04-06', 'pending'),
(5, 3, 301, '3000', '2022-04-06', 'pending'),
(6, 3, 305, '3000', '2022-04-06', 'paid'),
(7, 4, 306, '3000', '2022-04-06', 'paid'),
(8, 3, 302, '3000', '2022-04-06', 'pending'),
(9, 1, 19, '1000', '2022-04-08', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaint_id`, `customer_id`, `complaint`, `reply`, `date`) VALUES
(1, 1, 'hhhh', 'asd', '2022-02-09 22:57:16');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `username`, `first_name`, `last_name`, `place`, `phone`, `email`) VALUES
(1, 'aleen@gmail.com', 'anna', 'rose', 'kochii', '1232123212', 'aleenatresa8@gmail.com'),
(2, 'asd@gmail.com', 'jinu', 'mary', 'kochi', '8787678980', 'asd@gmail.com'),
(3, 'harishkrish119@gmail.com', 'harish', 'krishna', 'Kottaym', '9895572217', 'harishkrish119@gmail.com'),
(4, 'goutham@gmail.com', 'goutham', 'krishna', 'Kottaym', '0484253658', 'goutham@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `user_type`) VALUES
('admin', 'admin', 'admin'),
('aleee@gmail.com', 'aleena@1234', 'staff'),
('aleen@gmail.com', 'cus1', 'customer'),
('aleena@gmail.com', 'aleena@123', 'staff'),
('aleenatresa8@gmail.com', 'aleena@444', 'staff'),
('anna123@gmail.com', 'anna123', 'staff'),
('asd@gmail.com', 'jinu@123', 'customer'),
('goutham@gmail.com', 'Harish@119', 'customer'),
('harishkrish119@gmail.com', '123456', 'customer'),
('istealyourkitties@gmail.com', 'HarishHarish', 'staff'),
('staff1@gmai.com', '123', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `booking_id`, `amount`, `date`) VALUES
(1, 1, '1000', '2022-02-25'),
(2, 3, '2000', '2022-04-06'),
(3, 6, '3000', '2022-04-06'),
(4, 7, '3000', '2022-04-06');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fstatus` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `username`, `first_name`, `last_name`, `house_name`, `place`, `phone`, `email`, `fstatus`) VALUES
(1, 'anna123@gmail.com', 'rio', 'pp', 'ggggggg', 'vypin', '9999999999', 'anna123@gmail.com', 'active'),
(2, 'aleee@gmail.com', 'alan', 'thomas', 'kalarikkal', 'kochi', '7876765676', 'aleee@gmail.com', 'active'),
(3, 'ale@gmail.com', 'Anu', 'thomas', 'kalarikkal', 'vypin', '7890987890', 'ale@gmail.com', 'active'),
(6, 'aleenatresa8@gmail.com', 'Ammu', 'KP', 'kalarikkal', 'alappuzha', '9999999999', 'aleenatresa8@gmail.com', 'active'),
(7, 'staff1@gmai.com', 'Harish', 'Krishna', 'Radhas', 'Kottayam', '9895464505', 'staff1@gmai.com', 'active'),
(9, 'istealyourkitties@gmail.com', 'Harish', 'Krishna', 'Radhas', 'Kottayam', '9745912021', 'istealyourkitties@gmail.com', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `timeslot_id` int(11) NOT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `mstatus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`timeslot_id`, `venue_id`, `date`, `time`, `mstatus`) VALUES
(1, 1, '2022-02-24', '8.00AM-9.00AM', 'active'),
(2, 1, '2022-02-24', '9.00AM-10.00AM', 'active'),
(3, 1, '2022-02-24', '5.00PM-6.00PM', 'active'),
(4, 1, '2022-02-18', '5.00PM-6.00PM', 'active'),
(5, 2, '2022-02-18', '5.00PM-6.00PM', 'active'),
(6, 4, '2022-02-18', '10.00AM-11.00AM', 'active'),
(7, 4, '2022-02-25', '10.00AM-11.00AM', 'active'),
(8, 4, '2022-02-25', '10.00AM-11.00AM', 'active'),
(9, 5, '2022-02-25', '5.00PM-6.00PM', 'active'),
(10, 1, '2022-02-24', '5.00AM-6.00AM', 'active'),
(11, 1, '2022-02-23', '5.00PM-6.00PM', 'active'),
(12, 1, '2022-02-25', '8.00PM-9.00PM', 'active'),
(13, 2, '2022-02-25', '5.00PM-6.00PM', 'active'),
(14, 2, '2022-02-25', '6.00PM-7.00PM', 'active'),
(15, 2, '2022-02-19', '4.00AM-5.00AM', 'active'),
(16, 4, '2022-02-16', '7.00PM-8.00PM', 'active'),
(17, 4, '2022-02-25', '5.00PM-6.00PM', 'active'),
(18, 1, '2022-04-06', '12.00AM-1.00AM', 'active'),
(19, 1, '2022-04-06', '1.00AM-2.00AM', 'active'),
(20, 1, '2022-04-06', '3.00AM-4.00AM', 'active'),
(21, 1, '2022-04-06', '4.00AM-5.00AM', 'active'),
(22, 1, '2022-04-06', '5.00AM-6.00AM', 'active'),
(23, 1, '2022-04-06', '6.00AM-7.00AM', 'active'),
(24, 1, '2022-04-06', '7.00AM-8.00AM', 'active'),
(25, 1, '2022-04-06', '8.00AM-9.00AM', 'active'),
(26, 1, '2022-04-06', '9.00AM-10.00AM', 'active'),
(27, 1, '2022-04-06', '10.00AM-11.00AM', 'active'),
(28, 1, '2022-04-06', '11.00AM-12.00PM', 'active'),
(29, 1, '2022-04-06', '12.00PM-1.00PM', 'active'),
(30, 1, '2022-04-06', '1.00PM-2.00PM', 'active'),
(31, 1, '2022-04-06', '3.00PM-4.00PM', 'active'),
(32, 1, '2022-04-06', '4.00PM-5.00PM', 'active'),
(33, 1, '2022-04-06', '5.00PM-6.00PM', 'active'),
(34, 1, '2022-04-06', '6.00PM-7.00PM', 'active'),
(35, 1, '2022-04-06', '7.00PM-8.00PM', 'active'),
(36, 1, '2022-04-06', '8.00PM-9.00PM', 'active'),
(37, 1, '2022-04-06', '9.00PM-10.00PM', 'active'),
(38, 1, '2022-04-06', '11.00PM-12.00PM', 'active'),
(39, 1, '2022-04-07', '12.00AM-1.00AM', 'active'),
(40, 1, '2022-04-07', '1.00AM-2.00AM', 'active'),
(41, 1, '2022-04-07', '3.00AM-4.00AM', 'active'),
(42, 1, '2022-04-07', '4.00AM-5.00AM', 'active'),
(43, 1, '2022-04-07', '5.00AM-6.00AM', 'active'),
(44, 1, '2022-04-07', '6.00AM-7.00AM', 'active'),
(45, 1, '2022-04-07', '7.00AM-8.00AM', 'active'),
(46, 1, '2022-04-07', '8.00AM-9.00AM', 'active'),
(47, 1, '2022-04-07', '9.00AM-10.00AM', 'active'),
(48, 1, '2022-04-07', '10.00AM-11.00AM', 'active'),
(49, 1, '2022-04-07', '11.00AM-12.00PM', 'active'),
(50, 1, '2022-04-07', '12.00PM-1.00PM', 'active'),
(51, 1, '2022-04-07', '1.00PM-2.00PM', 'active'),
(52, 1, '2022-04-07', '3.00PM-4.00PM', 'active'),
(53, 1, '2022-04-07', '4.00PM-5.00PM', 'active'),
(54, 1, '2022-04-07', '5.00PM-6.00PM', 'active'),
(55, 1, '2022-04-07', '6.00PM-7.00PM', 'active'),
(56, 1, '2022-04-07', '7.00PM-8.00PM', 'active'),
(57, 1, '2022-04-07', '8.00PM-9.00PM', 'active'),
(58, 1, '2022-04-07', '9.00PM-10.00PM', 'active'),
(59, 1, '2022-04-07', '11.00PM-12.00PM', 'active'),
(60, 1, '2022-04-08', '12.00AM-1.00AM', 'active'),
(61, 1, '2022-04-08', '1.00AM-2.00AM', 'active'),
(62, 1, '2022-04-08', '3.00AM-4.00AM', 'active'),
(63, 1, '2022-04-08', '4.00AM-5.00AM', 'active'),
(64, 1, '2022-04-08', '5.00AM-6.00AM', 'active'),
(65, 1, '2022-04-08', '6.00AM-7.00AM', 'active'),
(66, 1, '2022-04-08', '7.00AM-8.00AM', 'active'),
(67, 1, '2022-04-08', '8.00AM-9.00AM', 'active'),
(68, 1, '2022-04-08', '9.00AM-10.00AM', 'active'),
(69, 1, '2022-04-08', '10.00AM-11.00AM', 'active'),
(70, 1, '2022-04-08', '11.00AM-12.00PM', 'active'),
(71, 1, '2022-04-08', '12.00PM-1.00PM', 'active'),
(72, 1, '2022-04-08', '1.00PM-2.00PM', 'active'),
(73, 1, '2022-04-08', '3.00PM-4.00PM', 'active'),
(74, 1, '2022-04-08', '4.00PM-5.00PM', 'active'),
(75, 1, '2022-04-08', '5.00PM-6.00PM', 'active'),
(76, 1, '2022-04-08', '6.00PM-7.00PM', 'active'),
(77, 1, '2022-04-08', '7.00PM-8.00PM', 'active'),
(78, 1, '2022-04-08', '8.00PM-9.00PM', 'active'),
(79, 1, '2022-04-08', '9.00PM-10.00PM', 'active'),
(80, 1, '2022-04-08', '11.00PM-12.00PM', 'active'),
(81, 2, '2022-04-06', '12.00AM-1.00AM', 'active'),
(82, 2, '2022-04-06', '1.00AM-2.00AM', 'active'),
(83, 2, '2022-04-06', '3.00AM-4.00AM', 'active'),
(84, 2, '2022-04-06', '4.00AM-5.00AM', 'active'),
(85, 2, '2022-04-06', '5.00AM-6.00AM', 'active'),
(86, 2, '2022-04-06', '6.00AM-7.00AM', 'active'),
(87, 2, '2022-04-06', '7.00AM-8.00AM', 'active'),
(88, 2, '2022-04-06', '8.00AM-9.00AM', 'active'),
(89, 2, '2022-04-06', '9.00AM-10.00AM', 'active'),
(90, 2, '2022-04-06', '10.00AM-11.00AM', 'active'),
(91, 2, '2022-04-06', '11.00AM-12.00PM', 'active'),
(92, 2, '2022-04-06', '12.00PM-1.00PM', 'active'),
(93, 2, '2022-04-06', '1.00PM-2.00PM', 'active'),
(94, 2, '2022-04-06', '3.00PM-4.00PM', 'active'),
(95, 2, '2022-04-06', '4.00PM-5.00PM', 'active'),
(96, 2, '2022-04-06', '5.00PM-6.00PM', 'active'),
(97, 2, '2022-04-06', '6.00PM-7.00PM', 'active'),
(98, 2, '2022-04-06', '7.00PM-8.00PM', 'active'),
(99, 2, '2022-04-06', '8.00PM-9.00PM', 'active'),
(100, 2, '2022-04-06', '9.00PM-10.00PM', 'active'),
(101, 2, '2022-04-06', '11.00PM-12.00PM', 'active'),
(102, 2, '2022-04-07', '12.00AM-1.00AM', 'active'),
(103, 2, '2022-04-07', '1.00AM-2.00AM', 'active'),
(104, 2, '2022-04-07', '3.00AM-4.00AM', 'active'),
(105, 2, '2022-04-07', '4.00AM-5.00AM', 'active'),
(106, 2, '2022-04-07', '5.00AM-6.00AM', 'active'),
(107, 2, '2022-04-07', '6.00AM-7.00AM', 'active'),
(108, 2, '2022-04-07', '7.00AM-8.00AM', 'active'),
(109, 2, '2022-04-07', '8.00AM-9.00AM', 'active'),
(110, 2, '2022-04-07', '9.00AM-10.00AM', 'active'),
(111, 2, '2022-04-07', '10.00AM-11.00AM', 'active'),
(112, 2, '2022-04-07', '11.00AM-12.00PM', 'active'),
(113, 2, '2022-04-07', '12.00PM-1.00PM', 'active'),
(114, 2, '2022-04-07', '1.00PM-2.00PM', 'active'),
(115, 2, '2022-04-07', '3.00PM-4.00PM', 'active'),
(116, 2, '2022-04-07', '4.00PM-5.00PM', 'active'),
(117, 2, '2022-04-07', '5.00PM-6.00PM', 'active'),
(118, 2, '2022-04-07', '6.00PM-7.00PM', 'active'),
(119, 2, '2022-04-07', '7.00PM-8.00PM', 'active'),
(120, 2, '2022-04-07', '8.00PM-9.00PM', 'active'),
(121, 2, '2022-04-07', '9.00PM-10.00PM', 'active'),
(122, 2, '2022-04-07', '11.00PM-12.00PM', 'active'),
(123, 2, '2022-04-08', '12.00AM-1.00AM', 'active'),
(124, 2, '2022-04-08', '1.00AM-2.00AM', 'active'),
(125, 2, '2022-04-08', '3.00AM-4.00AM', 'active'),
(126, 2, '2022-04-08', '4.00AM-5.00AM', 'active'),
(127, 2, '2022-04-08', '5.00AM-6.00AM', 'active'),
(128, 2, '2022-04-08', '6.00AM-7.00AM', 'active'),
(129, 2, '2022-04-08', '7.00AM-8.00AM', 'active'),
(130, 2, '2022-04-08', '8.00AM-9.00AM', 'active'),
(131, 2, '2022-04-08', '9.00AM-10.00AM', 'active'),
(132, 2, '2022-04-08', '10.00AM-11.00AM', 'active'),
(133, 2, '2022-04-08', '11.00AM-12.00PM', 'active'),
(134, 2, '2022-04-08', '12.00PM-1.00PM', 'active'),
(135, 2, '2022-04-08', '1.00PM-2.00PM', 'active'),
(136, 2, '2022-04-08', '3.00PM-4.00PM', 'active'),
(137, 2, '2022-04-08', '4.00PM-5.00PM', 'active'),
(138, 2, '2022-04-08', '5.00PM-6.00PM', 'active'),
(139, 2, '2022-04-08', '6.00PM-7.00PM', 'active'),
(140, 2, '2022-04-08', '7.00PM-8.00PM', 'active'),
(141, 2, '2022-04-08', '8.00PM-9.00PM', 'active'),
(142, 2, '2022-04-08', '9.00PM-10.00PM', 'active'),
(143, 2, '2022-04-08', '11.00PM-12.00PM', 'active'),
(144, 2, '2022-04-09', '12.00AM-1.00AM', 'active'),
(145, 2, '2022-04-09', '1.00AM-2.00AM', 'active'),
(146, 2, '2022-04-09', '3.00AM-4.00AM', 'active'),
(147, 2, '2022-04-09', '4.00AM-5.00AM', 'active'),
(148, 2, '2022-04-09', '5.00AM-6.00AM', 'active'),
(149, 2, '2022-04-09', '6.00AM-7.00AM', 'active'),
(150, 2, '2022-04-09', '7.00AM-8.00AM', 'active'),
(151, 2, '2022-04-09', '8.00AM-9.00AM', 'active'),
(152, 2, '2022-04-09', '9.00AM-10.00AM', 'active'),
(153, 2, '2022-04-09', '10.00AM-11.00AM', 'active'),
(154, 2, '2022-04-09', '11.00AM-12.00PM', 'active'),
(155, 2, '2022-04-09', '12.00PM-1.00PM', 'active'),
(156, 2, '2022-04-09', '1.00PM-2.00PM', 'active'),
(157, 2, '2022-04-09', '3.00PM-4.00PM', 'active'),
(158, 2, '2022-04-09', '4.00PM-5.00PM', 'active'),
(159, 2, '2022-04-09', '5.00PM-6.00PM', 'active'),
(160, 2, '2022-04-09', '6.00PM-7.00PM', 'active'),
(161, 2, '2022-04-09', '7.00PM-8.00PM', 'active'),
(162, 2, '2022-04-09', '8.00PM-9.00PM', 'active'),
(163, 2, '2022-04-09', '9.00PM-10.00PM', 'active'),
(164, 2, '2022-04-09', '11.00PM-12.00PM', 'active'),
(165, 3, '2022-04-06', '12.00AM-1.00AM', 'active'),
(166, 3, '2022-04-06', '1.00AM-2.00AM', 'active'),
(167, 3, '2022-04-06', '3.00AM-4.00AM', 'active'),
(168, 3, '2022-04-06', '4.00AM-5.00AM', 'active'),
(169, 3, '2022-04-06', '5.00AM-6.00AM', 'active'),
(170, 3, '2022-04-06', '6.00AM-7.00AM', 'active'),
(171, 3, '2022-04-06', '7.00AM-8.00AM', 'active'),
(172, 3, '2022-04-06', '8.00AM-9.00AM', 'active'),
(173, 3, '2022-04-06', '9.00AM-10.00AM', 'active'),
(174, 3, '2022-04-06', '10.00AM-11.00AM', 'active'),
(175, 3, '2022-04-06', '11.00AM-12.00PM', 'active'),
(176, 3, '2022-04-06', '12.00PM-1.00PM', 'active'),
(177, 3, '2022-04-06', '1.00PM-2.00PM', 'active'),
(178, 3, '2022-04-06', '3.00PM-4.00PM', 'active'),
(179, 3, '2022-04-06', '4.00PM-5.00PM', 'active'),
(180, 3, '2022-04-06', '5.00PM-6.00PM', 'active'),
(181, 3, '2022-04-06', '6.00PM-7.00PM', 'active'),
(182, 3, '2022-04-06', '7.00PM-8.00PM', 'active'),
(183, 3, '2022-04-06', '8.00PM-9.00PM', 'active'),
(184, 3, '2022-04-06', '9.00PM-10.00PM', 'active'),
(185, 3, '2022-04-06', '11.00PM-12.00PM', 'active'),
(186, 3, '2022-04-07', '12.00AM-1.00AM', 'active'),
(187, 3, '2022-04-07', '1.00AM-2.00AM', 'active'),
(188, 3, '2022-04-07', '3.00AM-4.00AM', 'active'),
(189, 3, '2022-04-07', '4.00AM-5.00AM', 'active'),
(190, 3, '2022-04-07', '5.00AM-6.00AM', 'active'),
(191, 3, '2022-04-07', '6.00AM-7.00AM', 'active'),
(192, 3, '2022-04-07', '7.00AM-8.00AM', 'active'),
(193, 3, '2022-04-07', '8.00AM-9.00AM', 'active'),
(194, 3, '2022-04-07', '9.00AM-10.00AM', 'active'),
(195, 3, '2022-04-07', '10.00AM-11.00AM', 'active'),
(196, 3, '2022-04-07', '11.00AM-12.00PM', 'active'),
(197, 3, '2022-04-07', '12.00PM-1.00PM', 'active'),
(198, 3, '2022-04-07', '1.00PM-2.00PM', 'active'),
(199, 3, '2022-04-07', '3.00PM-4.00PM', 'active'),
(200, 3, '2022-04-07', '4.00PM-5.00PM', 'active'),
(201, 3, '2022-04-07', '5.00PM-6.00PM', 'active'),
(202, 3, '2022-04-07', '6.00PM-7.00PM', 'active'),
(203, 3, '2022-04-07', '7.00PM-8.00PM', 'active'),
(204, 3, '2022-04-07', '8.00PM-9.00PM', 'active'),
(205, 3, '2022-04-07', '9.00PM-10.00PM', 'active'),
(206, 3, '2022-04-07', '11.00PM-12.00PM', 'active'),
(207, 3, '2022-04-08', '12.00AM-1.00AM', 'active'),
(208, 3, '2022-04-08', '1.00AM-2.00AM', 'active'),
(209, 3, '2022-04-08', '3.00AM-4.00AM', 'active'),
(210, 3, '2022-04-08', '4.00AM-5.00AM', 'active'),
(211, 3, '2022-04-08', '5.00AM-6.00AM', 'active'),
(212, 3, '2022-04-08', '6.00AM-7.00AM', 'active'),
(213, 3, '2022-04-08', '7.00AM-8.00AM', 'active'),
(214, 3, '2022-04-08', '8.00AM-9.00AM', 'active'),
(215, 3, '2022-04-08', '9.00AM-10.00AM', 'active'),
(216, 3, '2022-04-08', '10.00AM-11.00AM', 'active'),
(217, 3, '2022-04-08', '11.00AM-12.00PM', 'active'),
(218, 3, '2022-04-08', '12.00PM-1.00PM', 'active'),
(219, 3, '2022-04-08', '1.00PM-2.00PM', 'active'),
(220, 3, '2022-04-08', '3.00PM-4.00PM', 'active'),
(221, 3, '2022-04-08', '4.00PM-5.00PM', 'active'),
(222, 3, '2022-04-08', '5.00PM-6.00PM', 'active'),
(223, 3, '2022-04-08', '6.00PM-7.00PM', 'active'),
(224, 3, '2022-04-08', '7.00PM-8.00PM', 'active'),
(225, 3, '2022-04-08', '8.00PM-9.00PM', 'active'),
(226, 3, '2022-04-08', '9.00PM-10.00PM', 'active'),
(227, 3, '2022-04-08', '11.00PM-12.00PM', 'active'),
(228, 4, '2022-04-07', '12.00AM-1.00AM', 'active'),
(229, 4, '2022-04-07', '1.00AM-2.00AM', 'active'),
(230, 4, '2022-04-07', '3.00AM-4.00AM', 'active'),
(231, 4, '2022-04-07', '4.00AM-5.00AM', 'active'),
(232, 4, '2022-04-07', '5.00AM-6.00AM', 'active'),
(233, 4, '2022-04-07', '6.00AM-7.00AM', 'active'),
(234, 4, '2022-04-07', '7.00AM-8.00AM', 'active'),
(235, 4, '2022-04-07', '8.00AM-9.00AM', 'active'),
(236, 4, '2022-04-07', '9.00AM-10.00AM', 'active'),
(237, 4, '2022-04-07', '10.00AM-11.00AM', 'active'),
(238, 4, '2022-04-07', '11.00AM-12.00PM', 'active'),
(239, 4, '2022-04-07', '12.00PM-1.00PM', 'active'),
(240, 4, '2022-04-07', '1.00PM-2.00PM', 'active'),
(241, 4, '2022-04-07', '3.00PM-4.00PM', 'active'),
(242, 4, '2022-04-07', '4.00PM-5.00PM', 'active'),
(243, 4, '2022-04-07', '5.00PM-6.00PM', 'active'),
(244, 4, '2022-04-07', '6.00PM-7.00PM', 'active'),
(245, 4, '2022-04-07', '7.00PM-8.00PM', 'active'),
(246, 4, '2022-04-07', '8.00PM-9.00PM', 'active'),
(247, 4, '2022-04-07', '9.00PM-10.00PM', 'active'),
(248, 4, '2022-04-07', '11.00PM-12.00PM', 'active'),
(249, 4, '2022-04-06', '12.00AM-1.00AM', 'active'),
(250, 4, '2022-04-06', '1.00AM-2.00AM', 'active'),
(251, 4, '2022-04-06', '3.00AM-4.00AM', 'active'),
(252, 4, '2022-04-06', '4.00AM-5.00AM', 'active'),
(253, 4, '2022-04-06', '5.00AM-6.00AM', 'active'),
(254, 4, '2022-04-06', '6.00AM-7.00AM', 'active'),
(255, 4, '2022-04-06', '7.00AM-8.00AM', 'active'),
(256, 4, '2022-04-06', '8.00AM-9.00AM', 'active'),
(257, 4, '2022-04-06', '9.00AM-10.00AM', 'active'),
(258, 4, '2022-04-06', '10.00AM-11.00AM', 'active'),
(259, 4, '2022-04-06', '11.00AM-12.00PM', 'active'),
(260, 4, '2022-04-06', '12.00PM-1.00PM', 'active'),
(261, 4, '2022-04-06', '1.00PM-2.00PM', 'active'),
(262, 4, '2022-04-06', '3.00PM-4.00PM', 'active'),
(263, 4, '2022-04-06', '4.00PM-5.00PM', 'active'),
(264, 4, '2022-04-06', '5.00PM-6.00PM', 'active'),
(265, 4, '2022-04-06', '6.00PM-7.00PM', 'active'),
(266, 4, '2022-04-06', '7.00PM-8.00PM', 'active'),
(267, 4, '2022-04-06', '8.00PM-9.00PM', 'active'),
(268, 4, '2022-04-06', '9.00PM-10.00PM', 'active'),
(269, 4, '2022-04-06', '11.00PM-12.00PM', 'active'),
(270, 4, '2022-04-08', '12.00AM-1.00AM', 'active'),
(271, 4, '2022-04-08', '1.00AM-2.00AM', 'active'),
(272, 4, '2022-04-08', '3.00AM-4.00AM', 'active'),
(273, 4, '2022-04-08', '4.00AM-5.00AM', 'active'),
(274, 4, '2022-04-08', '5.00AM-6.00AM', 'active'),
(275, 4, '2022-04-08', '6.00AM-7.00AM', 'active'),
(276, 4, '2022-04-08', '7.00AM-8.00AM', 'active'),
(277, 4, '2022-04-08', '8.00AM-9.00AM', 'active'),
(278, 4, '2022-04-08', '9.00AM-10.00AM', 'active'),
(279, 4, '2022-04-08', '10.00AM-11.00AM', 'active'),
(280, 4, '2022-04-08', '11.00AM-12.00PM', 'active'),
(281, 4, '2022-04-08', '12.00PM-1.00PM', 'active'),
(282, 4, '2022-04-08', '1.00PM-2.00PM', 'active'),
(283, 4, '2022-04-08', '3.00PM-4.00PM', 'active'),
(284, 4, '2022-04-08', '4.00PM-5.00PM', 'active'),
(285, 4, '2022-04-08', '5.00PM-6.00PM', 'active'),
(286, 4, '2022-04-08', '6.00PM-7.00PM', 'active'),
(287, 4, '2022-04-08', '7.00PM-8.00PM', 'active'),
(288, 4, '2022-04-08', '8.00PM-9.00PM', 'active'),
(289, 4, '2022-04-08', '9.00PM-10.00PM', 'active'),
(290, 4, '2022-04-08', '11.00PM-12.00PM', 'active'),
(291, 12, '2022-04-06', '12.00AM-1.00AM', 'active'),
(292, 12, '2022-04-06', '1.00AM-2.00AM', 'active'),
(293, 12, '2022-04-06', '3.00AM-4.00AM', 'active'),
(294, 12, '2022-04-06', '4.00AM-5.00AM', 'active'),
(295, 12, '2022-04-06', '5.00AM-6.00AM', 'active'),
(296, 12, '2022-04-06', '6.00AM-7.00AM', 'active'),
(297, 12, '2022-04-06', '7.00AM-8.00AM', 'active'),
(298, 12, '2022-04-06', '8.00AM-9.00AM', 'active'),
(299, 12, '2022-04-06', '9.00AM-10.00AM', 'active'),
(300, 12, '2022-04-06', '10.00AM-11.00AM', 'active'),
(301, 12, '2022-04-06', '11.00AM-12.00PM', 'active'),
(302, 12, '2022-04-06', '12.00PM-1.00PM', 'active'),
(303, 12, '2022-04-06', '1.00PM-2.00PM', 'active'),
(304, 12, '2022-04-06', '3.00PM-4.00PM', 'active'),
(305, 12, '2022-04-06', '4.00PM-5.00PM', 'active'),
(306, 12, '2022-04-06', '5.00PM-6.00PM', 'active'),
(307, 12, '2022-04-06', '6.00PM-7.00PM', 'active'),
(308, 12, '2022-04-06', '7.00PM-8.00PM', 'active'),
(309, 12, '2022-04-06', '8.00PM-9.00PM', 'active'),
(310, 12, '2022-04-06', '9.00PM-10.00PM', 'active'),
(311, 12, '2022-04-06', '11.00PM-12.00PM', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venue_id` int(11) NOT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `vstatus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venue_id`, `venue`, `place`, `amount`, `details`, `vstatus`) VALUES
(1, '5S FO0OTBALLL TRUF', 'ernakulam', '1000', 'cchhgcghcg', 'active'),
(2, '9S FO0OTBALLL TRUF', 'kochi', '2000', 'dfsdf', 'active'),
(3, '11S FO0OTBALLL TRUF', 'kochi', '3000', 'adfsf', 'active'),
(4, 'Basket  ball Court indoor', 'kochi', '1000', 'gjkgjhgyjfguyf', 'active'),
(5, 'Indoor Tennis Court', 'ernakulam', '2000', 'bbbbbbbbbb', 'active'),
(6, 'Indoor Badminton Court', 'kochi', '2000', 'gjkgjhgyjfguyf', 'active'),
(7, 'Indoor Criket Court', 'ernakulam', '2000', 'kkkkkkk', 'active'),
(8, 'Indoor Volleyball Court', 'kochi', '2000', 'bbbbbbbbbb', 'active'),
(11, '5s Futsal grount indoor', 'kochi', '2000', 'gjkgjhgyjfguyf', 'active'),
(12, 'Test Venue', 'Kakkanad', '3000', 'Test booking', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`timeslot_id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `timeslot`
--
ALTER TABLE `timeslot`
  MODIFY `timeslot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
