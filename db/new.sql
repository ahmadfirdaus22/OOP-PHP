-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 03:02 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `phone` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` int(11) NOT NULL,
  `update_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashiers`
--

CREATE TABLE `cashiers` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('Man','Woman') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_detail`
--

CREATE TABLE `trx_detail` (
  `id` int(11) NOT NULL,
  `id_header` int(100) NOT NULL,
  `goods_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `goods_quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_detail`
--

INSERT INTO `trx_detail` (`id`, `id_header`, `goods_name`, `goods_quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chitato', 1, 5000, '2022-11-11 01:52:19', NULL),
(2, 1, 'Teh Pucuk', 1, 5000, '2022-11-11 01:52:19', NULL),
(3, 1, 'Aqua', 1, 3000, '2022-11-11 01:52:19', NULL),
(4, 1, 'Hexos', 1, 5000, '2022-11-11 01:52:19', NULL),
(5, 2, 'Aqua', 3, 5000, '2022-11-28 02:01:17', NULL),
(6, 3, 'Silverqueen', 1, 26000, '2022-11-28 02:01:17', NULL),
(7, 2, 'Aqua', 3, 5000, '2022-11-28 02:01:26', NULL),
(8, 3, 'Kitkat', 2, 10000, '2022-11-28 02:03:02', NULL),
(9, 3, 'Candy', 1, 6000, '2022-11-28 02:03:02', NULL),
(10, 4, 'Teh Pucuk', 3, 5000, '2022-11-28 02:03:56', NULL),
(11, 4, 'Chitato', 2, 5000, '2022-11-28 02:03:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_header`
--

CREATE TABLE `trx_header` (
  `id` int(11) NOT NULL,
  `id_infos` int(11) NOT NULL,
  `trx_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_discount` double NOT NULL,
  `total_price` double NOT NULL,
  `total_payment` double NOT NULL,
  `total_change` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_header`
--

INSERT INTO `trx_header` (`id`, `id_infos`, `trx_time`, `total_discount`, `total_price`, `total_payment`, `total_change`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-28 01:52:19', 0, 18000, 20000, 2000, '2022-11-11 01:51:01', NULL),
(2, 2, '2022-11-28 01:59:20', 0, 15000, 20000, 5000, '2022-11-28 01:59:20', NULL),
(3, 3, '2022-11-29 02:40:28', 1000, 25000, 35000, 11000, '2022-11-28 01:59:54', '2022-11-28 20:40:28'),
(4, 3, '2022-11-28 02:00:39', 0, 25000, 50000, 25000, '2022-11-28 02:00:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_infos`
--

CREATE TABLE `trx_infos` (
  `id` int(11) NOT NULL,
  `branch_info` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `cashier_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_infos`
--

INSERT INTO `trx_infos` (`id`, `branch_info`, `cashier_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Arcade 2', 'Indah', 1, '2022-11-06 01:48:25', NULL),
(2, 'Arcade 2', 'Dede', 0, '2022-11-08 01:48:25', NULL),
(3, 'Arcade 1', 'Indah', 0, '2022-11-02 01:48:25', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashiers`
--
ALTER TABLE `cashiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx_detail`
--
ALTER TABLE `trx_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_headers_details` (`id_header`);

--
-- Indexes for table `trx_header`
--
ALTER TABLE `trx_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_headers` (`id_infos`);

--
-- Indexes for table `trx_infos`
--
ALTER TABLE `trx_infos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashiers`
--
ALTER TABLE `cashiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_detail`
--
ALTER TABLE `trx_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trx_header`
--
ALTER TABLE `trx_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trx_infos`
--
ALTER TABLE `trx_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trx_detail`
--
ALTER TABLE `trx_detail`
  ADD CONSTRAINT `fk_trx_headers_details` FOREIGN KEY (`id_header`) REFERENCES `trx_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trx_header`
--
ALTER TABLE `trx_header`
  ADD CONSTRAINT `fk_trx_headers` FOREIGN KEY (`id_infos`) REFERENCES `trx_infos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
