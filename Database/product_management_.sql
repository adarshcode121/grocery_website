-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 17, 2025 at 05:15 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `address`, `image`, `created_at`) VALUES
(1, 'Akash Prajapati', 'ap91579601@gmail.com', '123', 'Silvassa, India', 'admin.jpg', '2025-03-16 11:40:23'),
(3, 'Akash Prajapati', 'ap9157@gmail.com', '$2y$10$RvyKRlG8rQe8rA8h26cIT.wbud3cvy5nla7/8coR3UvhNa1rEBN76', 'K.C Powertracks company Dokmardi Silvassa', NULL, '2025-03-17 03:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `child_categories`
--

DROP TABLE IF EXISTS `child_categories`;
CREATE TABLE IF NOT EXISTS `child_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `child_categories`
--

INSERT INTO `child_categories` (`id`, `parent_id`, `name`, `image`) VALUES
(27, 18, 'Rusks & Wafers', 'Rusks & Wafers.jpg'),
(26, 18, 'Chips & Ctisps', 'Chips & Crispa.webp'),
(25, 17, 'Mango Drinks', 'Mango Drinks.webp'),
(24, 17, 'Fruit & juices', 'Fruit juices.webp'),
(23, 17, 'Soft Drinks', 'Soft Drinks.webp'),
(28, 18, 'Energy Bars ', 'Energy Bars.png'),
(29, 15, 'Milk ', 'Milk.webp'),
(30, 15, 'Bread & Pav ', 'Bread & Pav.webp'),
(31, 15, 'Eggs ', 'Eggs.webp'),
(32, 16, 'Fresh Vegetables ', 'fresh Vegetables.png'),
(33, 16, 'Fresh Fruits ', 'Fresh Fruits.png'),
(34, 16, 'Mangoes & Melons', 'Mangoes & Melons.png'),
(35, 19, 'Noodles ', 'Noodles.webp'),
(37, 19, 'Frozen Veg Snacks ', 'Frozen Veg Snacks.webp'),
(38, 19, 'Frozen Non - Veg Snacks ', 'non veg.webp'),
(39, 20, 'Indian Sweets ', 'indian Sweets.webp'),
(40, 20, 'Chocolate Gift Pack ', 'Chocolate & Gits Pack.webp'),
(41, 20, 'Ice cream & Frozen Dessert ', 'Ice Cream & Frozen Dessert.webp'),
(43, 21, 'Diapers & more ', 'Diapers & More.webp'),
(44, 21, 'Bathing Needs ', 'Bathing Needs.webp'),
(45, 21, 'Baby Wipes', 'Baby Wipes.webp'),
(46, 23, 'Fresh  Meat ', 'Fresh Meat.webp'),
(49, 23, 'Fish & Seafood ', 'Fish & Seafood.jpg'),
(48, 23, 'Chicken', 'Chicken.jpg'),
(50, 22, 'Digestive Care ', 'Digestive Care.webp'),
(51, 22, 'Cough & Cold ', 'Cough & Cold.webp'),
(52, 22, 'Protein & Sports Supplements ', 'Protein & Sports Supplements.webp'),
(53, 24, 'Fresheners ', 'Fresheners.webp'),
(54, 24, 'Toilet & Bathroom Cleaners ', 'Toilet & Bathroom Cleaners.jpg'),
(55, 24, 'Detergents Power & Bars ', 'Detergents Power.webp');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `offer` varchar(50) DEFAULT NULL,
  `weight` text,
  `old_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `name`, `description`, `price`, `image`, `offer`, `weight`, `old_price`) VALUES
(41, 25, 'Maaza Mango Drink ', '', 73.00, 'mango Drinks.webp', '', '1.2 ltr ', 73.00),
(40, 29, 'Amul cow Fresh Milk ', '', 28.35, 'milk7.avif', '19% OFF', '500 ml', 35.00),
(39, 29, 'Mother Dairy Toned Fresh Milk ', '', 28.00, 'milk4.avif', '', '500 ml', 28.00),
(38, 29, 'Amul Taaza Toned Fresh Milk + Baby Banana ', '', 58.50, 'milk14.avif', '10% OFF', '4 pieces + 500 ml ', 65.00),
(36, 29, 'Amil Taaza Toned Fresh Milk ', '', 52.25, 'milk2.avif', '5% OFF', '1 ltr ', 55.00),
(37, 29, 'Amul Gold Full Cream Milk ', '', 34.00, 'milk1.avif', '', '500 ml', 34.00),
(42, 25, 'Frooti Mango Drink ', '', 80.00, '2 frooti.avif', '', '600 + 600 ml ', 80.00),
(43, 25, 'Frooti ', '', 10.00, 'Frooti.avif', '', '125 ml ', 10.00),
(44, 25, 'Slice Mango Drink ', '', 83.16, 'Slice.avif', '16% OFF', '1.75', 99.00),
(45, 24, 'Real Orange Juice ', '', 67.50, 'Real fruit power.avif', '10% OFF', '1 ltr ', 75.00),
(46, 24, 'Apple juice ', '', 10.00, 'Apple Juce.avif', '', '125 ml', 10.00),
(47, 24, 'Berry Blast Juice ', '', 148.80, 'yu berry.avif', '7% OFF', '3 *  250 ml ', 160.00),
(48, 24, 'Mix Juicee ', '', 60.00, 'Mix Juce.avif', '', '100 ml', 60.00),
(49, 24, 'Real Juice ( Cran berry ) ', '', 80.00, 'Real Juce.avif', '', '100ml', 80.00),
(50, 23, 'Sprite ( 750 ml ) ', '', 79.00, 'sprite.avif', '', '2 * 750 ml ', 79.00),
(51, 23, 'Thums Up Cola ', '', 72.00, 'pepsi.avif', '20% OFF', '2 * 750', 90.00),
(52, 23, '7 UP Nimbooz juice', '', 25.00, '7up.avif', '', '350', 25.00),
(53, 23, 'Fanta Orange Drink ', '', 45.00, 'fanta.avif', '', '750', 45.00),
(54, 23, 'Coco - Cola Diet Coke ', '', 39.00, 'coco-cola.avif', '', '300 ml ', 39.00),
(55, 32, 'Onion ( Kanda ) ', '', 56.70, 'f1.avif', '10% OFF', '1 kg ', 63.00),
(56, 32, 'Potato ', '', 45.00, 'f2.avif', '10% OFF', '1 kg ', 50.00),
(57, 32, 'Hybrid Tomato ', '', 19.25, 'f3.avif', '23% OFF', '500 g ', 25.00),
(58, 32, 'Green Chilli ', '', 27.00, 'f4.avif', '25% OFF', '200 g', 36.00),
(59, 32, 'Desi Tomato ', '', 36.00, 'f5.avif', '', '2 * 500 g ', 36.00),
(60, 33, 'Banana (keli) ', '', 45.00, 'fr1.avif', '', '3 pieces ', 45.00),
(63, 33, 'Brown Coconut  ( Naral) ', '', 44.80, 'fr2.avif', '20% OFF', '1 peice ', 56.00),
(62, 33, 'Baby Banana ', '', 28.00, 'fr3.avif', '', '4 pieces ', 28.00),
(64, 33, 'Kiran Watermelon ', '', 74.40, 'fr5.avif', '20% OFF', '3 kg ', 93.00),
(65, 34, 'Muskmelon ', '', 53.60, 'ft1.avif', '20% OFF', '5000 g', 67.00),
(67, 33, 'Desi Mango ', '', 60.00, 'ft2.avif', '', '4 pieces ', 60.00),
(68, 34, 'Watermelon', '', 50.00, 'fr5.avif', '', '2 kg ', 50.00),
(69, 34, 'Sindhura mango ', '', 150.40, 'ft4.avif', '20% OFF', '3 pieces ', 188.00),
(70, 30, 'The Health Factory', '', 52.25, 'The Health Factory.avif', '5% OFF', '250 ', 55.00),
(71, 30, 'Britannia Vatarich Bread ', '', 40.00, 'Britannia.avif', '', '100g', 40.00),
(72, 31, 'Table White Eggs ', '', 192.80, 'Table White.avif', '20% OFF', '30 pieces ', 241.00),
(73, 31, 'Yojaana Poultry ', '', 104.50, 'Yojana Poultry.avif', '5% OFF', '12 pieces ', 110.00),
(74, 27, 'Britannia Rusk ', '', 40.00, 'r2.avif', '20% OFF', '100g', 50.00),
(75, 27, 'Malpani\'s Bake  lite', '', 85.00, 'r4.avif', '', '100g', 85.00),
(76, 26, 'Lay\'s Wafer', '', 20.00, 'c2.avif', '', '48 g ', 20.00),
(77, 26, 'Uncle Chips Spicy ', '', 20.00, 'c4.avif', '', '48 g', 20.00),
(78, 26, 'Kurkure Masala Munch ', '', 20.00, 'c5.avif', '', '75 g ', 20.00),
(79, 28, 'Avolt Birthday cake ', '', 130.00, 'e1.avif', '', '100g', 130.00),
(80, 28, 'Yoga Bar ', '', 50.00, 'e2.avif', '', '35 g ', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payment_status` enum('Paid','Failed') DEFAULT 'Failed',
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `address`, `email`, `product_name`, `quantity`, `total_price`, `payment_id`, `payment_status`, `order_date`, `status`) VALUES
(10, 3, 'Akash Prajapati', 'K.C Powertracks company Dokmardi Silvassa', 'adofficial121@gmail.com', 'Thums Up Cola ', 1, 72.00, 'pay_Q7m5jjVkNPKolB', '', '2025-03-17 07:26:44', 'Processing'),
(9, 3, 'Akash Prajapati', 'K.C Powertracks company Dokmardi Silvassa', 'adofficial121@gmail.com', 'Desi Tomato ', 1, 36.00, 'pay_Q7lqnwFdg98Ph1', '', '2025-03-17 07:12:35', 'Pending'),
(8, 4, 'Akash Prajapati', 'K.C Powertracks company Dokmardi Silvassa', 'bca20252025@gmail.com', 'Coco - Cola Diet Coke ', 1, 39.00, 'pay_Q7lXTx9lTH8IHZ', '', '2025-03-17 06:54:17', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `otp_verification`
--

DROP TABLE IF EXISTS `otp_verification`;
CREATE TABLE IF NOT EXISTS `otp_verification` (
  `otp_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `otp` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`otp_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `otp_verification`
--

INSERT INTO `otp_verification` (`otp_id`, `user_id`, `otp`, `created_at`) VALUES
(26, 3, 246015, '2025-03-17 07:21:06'),
(25, 3, 177121, '2025-03-17 07:21:01'),
(24, 3, 577996, '2025-03-17 07:09:21');

-- --------------------------------------------------------

--
-- Table structure for table `parent_categories`
--

DROP TABLE IF EXISTS `parent_categories`;
CREATE TABLE IF NOT EXISTS `parent_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parent_categories`
--

INSERT INTO `parent_categories` (`id`, `name`, `image`) VALUES
(17, 'Cold Drinks & Juices', 'Cold Drink & Juices.avif'),
(16, 'Fruits & Vegetables', 'Fruits & Vegetables.avif'),
(15, 'Dairy , Bread &  Eggs', 'Dairy, Bread & Eggs.avif'),
(18, 'Snacks & Munchies', 'Snacks & Munchies.avif'),
(19, 'Breakfast & Insstant Food', 'Breakfast & Insstant Food.avif'),
(20, 'Sweet Tooth', 'Sweet Tooth.avif'),
(21, 'Baby Care', 'Baby Care.avif'),
(22, 'Pharma & Wellness', 'Pharma & Wellness.avif'),
(23, 'Chicken , Meat & Fish ', 'Chicken, Meat & Fish.avif'),
(24, 'Cleaning Essentials', 'Cleaning Essentials.avif');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `shop` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('pending','approved','denied') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `firstname`, `shop`, `email`, `mobile`, `address`, `image`, `password`, `status`, `created_at`) VALUES
(6, 'Akash', 'food market', 'ap9157@gmail.com', '09157960138', 'K.C Powertracks company Dokmardi Silvassa', 'upload/logo2.png', '$2y$10$1hC/zMS9FkyJvBkjFag5ker0MuB0NybSQEbNIDBg34yURhW0gBSWC', 'approved', '2025-03-17 06:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `status` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `mobile`, `address`, `image`, `created_at`, `password`, `status`) VALUES
(1, 'Akash Prajapati', '', 'demowork10001@gmail.com', '', 'K.C Powertracks company Dokmardi Silvassa', '', '2025-03-15 13:56:24', '', 'inactive'),
(2, 'Akash ', 'Prajapati', 'ap91579601@gmail.com', '09157960138', 'K.C Powertracks company Dokmardi Silvassa', '', '2025-03-15 18:06:35', '', 'inactive'),
(3, 'Akash ', 'Prajapati', 'adofficial121@gmail.com', '', 'K.C Powertracks company Dokmardi Silvassa', 'uploads/logo2.png', '2025-03-17 02:53:45', '', 'active'),
(4, 'Akash Prajapati', '', 'bca20252025@gmail.com', '', 'K.C Powertracks company Dokmardi Silvassa', '', '2025-03-17 03:33:46', '', 'inactive');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
