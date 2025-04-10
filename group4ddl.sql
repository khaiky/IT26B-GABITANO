-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2025 at 06:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `group4ddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(5) NOT NULL,
  `employee_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `shipper_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_dtl`
--

CREATE TABLE `tbl_order_dtl` (
  `product_id` int(20) NOT NULL,
  `order_id` int(20) NOT NULL,
  `quantity` int(3) DEFAULT NULL,
  `unit_price` decimal(10,10) DEFAULT NULL,
  `discount` decimal(10,10) DEFAULT NULL,
  `status_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(20) NOT NULL,
  `product_code` int(20) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `standard_cost` decimal(10,10) DEFAULT NULL,
  `list_price` decimal(10,10) DEFAULT NULL,
  `reorder_lvl` decimal(10,10) DEFAULT NULL,
  `target_level` decimal(10,10) DEFAULT NULL,
  `quant_per_unit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_dtl`
--
ALTER TABLE `tbl_order_dtl`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD UNIQUE KEY `status_id` (`status_id`),
  ADD KEY `fk_order` (`order_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order_dtl`
--
ALTER TABLE `tbl_order_dtl`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`),
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
