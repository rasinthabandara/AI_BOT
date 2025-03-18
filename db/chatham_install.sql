-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 08:20 PM
-- Server version: 10.6.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u687661449_chatham`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

CREATE TABLE `ad` (
  `id` int(11) NOT NULL,
  `title` varchar(999) DEFAULT NULL,
  `type` varchar(999) DEFAULT NULL,
  `propsdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `view` bigint(20) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `role` varchar(999) NOT NULL DEFAULT 'admin',
  `password` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uid`, `email`, `role`, `password`, `createdAt`) VALUES
(1, 'RJtrcU1PVDECDqk0AD7T55mSn876E67o1675061674859', 'admin@admin.com', 'admin', '$2b$10$ppdiEuHT2DIeKtoY5GfKu.AyU2GfewbWhGUMOPtc2AMm1XsKw7SRG', '2023-03-31 14:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` int(11) NOT NULL,
  `openai_key` varchar(999) DEFAULT NULL,
  `twilio_ssid` varchar(999) DEFAULT NULL,
  `twilio_auth` varchar(999) DEFAULT NULL,
  `whatsapp_number` varchar(999) DEFAULT NULL,
  `smtp_host` varchar(999) DEFAULT NULL,
  `smtp_port` varchar(999) DEFAULT NULL,
  `smtp_email` varchar(999) DEFAULT NULL,
  `smtp_pass` varchar(999) DEFAULT NULL,
  `telegram_api` varchar(999) DEFAULT NULL,
  `facebook_api` varchar(999) DEFAULT NULL,
  `facebook_page_id` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `openai_key`, `twilio_ssid`, `twilio_auth`, `whatsapp_number`, `smtp_host`, `smtp_port`, `smtp_email`, `smtp_pass`, `telegram_api`, `facebook_api`, `facebook_page_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `command` varchar(999) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `que` longtext DEFAULT NULL,
  `ans` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `ad` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ad`)),
  `ad_id` bigint(20) DEFAULT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'pending',
  `visit_type` varchar(999) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `type` varchar(999) DEFAULT NULL,
  `amount` varchar(999) DEFAULT NULL,
  `user` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `meta` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `name` varchar(999) DEFAULT NULL,
  `plan_limit` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `des` text DEFAULT NULL,
  `ad` int(1) NOT NULL DEFAULT 0,
  `dalle` int(11) NOT NULL DEFAULT 0,
  `remind_ad_msg` int(11) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(999) DEFAULT NULL,
  `position` varchar(999) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `type` varchar(999) DEFAULT NULL,
  `plan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`plan`)),
  `left_limit` bigint(20) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web`
--

CREATE TABLE `web` (
  `id` int(11) NOT NULL,
  `rz_active` int(1) NOT NULL DEFAULT 0,
  `rz_key` varchar(999) DEFAULT NULL,
  `rz_id` varchar(999) DEFAULT NULL,
  `offline_active` int(11) NOT NULL DEFAULT 0,
  `offline_msg` longtext DEFAULT NULL,
  `paypal_active` int(11) NOT NULL DEFAULT 0,
  `paypal_client_id` varchar(999) DEFAULT NULL,
  `paypal_secret` varchar(999) DEFAULT NULL,
  `currency_symbol` varchar(999) DEFAULT NULL,
  `exchange_rate` int(11) DEFAULT NULL,
  `paystack_active` int(11) NOT NULL DEFAULT 0,
  `paystack_public` varchar(999) DEFAULT NULL,
  `paystack_key` varchar(999) DEFAULT NULL,
  `theme_color` varchar(999) DEFAULT NULL,
  `app_name` varchar(999) DEFAULT NULL,
  `logo` varchar(999) DEFAULT NULL,
  `home_video` varchar(999) DEFAULT NULL,
  `message_balance` bigint(20) DEFAULT NULL,
  `whatsapp_status` int(1) NOT NULL DEFAULT 0,
  `telegram_status` int(1) NOT NULL DEFAULT 0,
  `facebook_status` int(1) NOT NULL DEFAULT 0,
  `fb_bot_link` varchar(999) DEFAULT NULL,
  `tele_bot_link` varchar(999) DEFAULT NULL,
  `wa_bot_link` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web`
--

INSERT INTO `web` (`id`, `rz_active`, `rz_key`, `rz_id`, `offline_active`, `offline_msg`, `paypal_active`, `paypal_client_id`, `paypal_secret`, `currency_symbol`, `exchange_rate`, `paystack_active`, `paystack_public`, `paystack_key`, `theme_color`, `app_name`, `logo`, `home_video`, `message_balance`, `whatsapp_status`, `telegram_status`, `facebook_status`, `fb_bot_link`, `tele_bot_link`, `wa_bot_link`) VALUES
(1, 1, NULL, NULL, 1, 'offline\nmessage', 0, NULL, NULL, '$', 1, 0, NULL, NULL, NULL, 'ChatHam', '035821681916881450000002_396427490_kdpmpp2m15_PS13.0_img2img-1.0_make_his_half_face_a_cyborg_[generated].jpg', 'https://www.youtube.com/watch?v=ZFfarXDW-FM&ab_channel=Codeyon.com', 100, 0, 0, 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web`
--
ALTER TABLE `web`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `web`
--
ALTER TABLE `web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
