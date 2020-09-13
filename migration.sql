-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 13, 2020 at 03:16 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stylight_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_budgets`
--

CREATE TABLE `t_budgets` (
  `a_shop_id` int(11) NOT NULL,
  `a_month` date NOT NULL,
  `a_budget_amount` decimal(10,2) NOT NULL,
  `a_amount_spent` decimal(10,2) NOT NULL,
  `a_notify_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_budgets`
--

INSERT INTO `t_budgets` (`a_shop_id`, `a_month`, `a_budget_amount`, `a_amount_spent`, `a_notify_status`) VALUES
(1, '2020-08-01', '930.00', '725.67', 0),
(1, '2020-09-01', '960.00', '803.67', 0),
(2, '2020-08-01', '990.00', '886.63', 0),
(2, '2020-09-01', '670.00', '715.64', 0),
(3, '2020-08-01', '650.00', '685.91', 0),
(3, '2020-09-01', '890.00', '580.81', 0),
(4, '2020-08-01', '740.00', '746.92', 0),
(4, '2020-09-01', '590.00', '754.93', 0),
(5, '2020-08-01', '630.00', '507.64', 0),
(5, '2020-09-01', '870.00', '505.12', 0),
(6, '2020-08-01', '640.00', '946.32', 0),
(6, '2020-09-01', '700.00', '912.30', 0),
(7, '2020-08-01', '980.00', '640.16', 0),
(7, '2020-09-01', '990.00', '805.15', 0),
(8, '2020-08-01', '790.00', '965.64', 0),
(8, '2020-09-01', '720.00', '504.25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_shops`
--

CREATE TABLE `t_shops` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `a_online` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_shops`
--

INSERT INTO `t_shops` (`a_id`, `a_name`, `a_online`) VALUES
(1, 'Steve McQueen', 1),
(2, 'Fashion Quasar', 0),
(3, 'As Seen On Sale', 1),
(4, 'H&R', 0),
(5, 'Meow Meow', 1),
(6, 'Dole & Cabbage', 0),
(7, 'George Manly', 1),
(8, 'Harrison Ford', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_budgets`
--
ALTER TABLE `t_budgets`
  ADD PRIMARY KEY (`a_shop_id`,`a_month`);

--
-- Indexes for table `t_shops`
--
ALTER TABLE `t_shops`
  ADD PRIMARY KEY (`a_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_shops`
--
ALTER TABLE `t_shops`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
