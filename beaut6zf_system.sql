-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2021 at 04:12 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beaut6zf_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `status` enum('pending','approved','in progress','completed','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_gateway` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `original_amount` double(8,2) DEFAULT NULL,
  `product_amount` double(8,2) DEFAULT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_percent` double NOT NULL,
  `coupon_discount` double DEFAULT NULL,
  `tax_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percent` double(8,2) NOT NULL,
  `tax_amount` double(8,2) NOT NULL,
  `amount_to_pay` double(8,2) NOT NULL,
  `payment_status` enum('pending','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'completed',
  `source` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pos',
  `order_id` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8_unicode_ci,
  `event_id` text COLLATE utf8_unicode_ci,
  `notify_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `company_id`, `coupon_id`, `user_id`, `location_id`, `currency_id`, `date_time`, `status`, `payment_gateway`, `original_amount`, `product_amount`, `discount`, `discount_percent`, `coupon_discount`, `tax_name`, `tax_percent`, `tax_amount`, `amount_to_pay`, `payment_status`, `source`, `order_id`, `additional_notes`, `event_id`, `notify_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, 1, '2021-11-05 06:30:00', 'pending', 'cash', 144.00, NULL, 0.00, 0, NULL, '[\"GST\",\"GST\",\"GST\"]', 54.00, 25.92, 169.92, 'pending', 'online', 'order_IFyWmAPOm25Ude', NULL, NULL, NULL, '2021-10-31 14:23:36', '2021-10-31 14:23:38'),
(2, 1, NULL, 1, 1, 1, '2021-10-31 14:42:17', 'pending', 'RazorPay', 25.00, NULL, 0.00, 0, NULL, '[\"GST\"]', 18.00, 4.50, 29.50, 'completed', 'online', 'order_IFyqVhEdyzsocj', NULL, NULL, NULL, '2021-10-31 14:42:17', '2021-10-31 14:45:08'),
(3, 1, NULL, 4, 1, 1, '2021-11-24 12:00:00', 'pending', 'cash', 18.00, NULL, 0.00, 0, NULL, '[\"GST\"]', 18.00, 3.24, 21.24, 'pending', 'online', 'order_IG2pxkazI6D0TY', 'k.lk;', NULL, NULL, '2021-10-31 18:36:33', '2021-10-31 18:36:34'),
(4, 1, NULL, 5, 1, 1, '2021-11-26 10:30:00', 'pending', 'RazorPay', 54.00, NULL, 0.00, 0, NULL, '[\"GST\",\"GST\"]', 36.00, 9.72, 63.72, 'completed', 'online', 'order_IGcGWaAMgqyoOA', 'I want facial', NULL, NULL, '2021-11-02 05:15:58', '2021-11-02 05:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `booking_items`
--

CREATE TABLE `booking_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `deal_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `business_service_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` tinyint(4) NOT NULL,
  `unit_price` double NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_items`
--

INSERT INTO `booking_items` (`id`, `company_id`, `deal_id`, `booking_id`, `business_service_id`, `product_id`, `quantity`, `unit_price`, `amount`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 2, NULL, NULL, 1, 25, 25, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_notifications`
--

CREATE TABLE `booking_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '1',
  `duration_type` enum('minutes','hours','days','weeks') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'minutes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_times`
--

CREATE TABLE `booking_times` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `day` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `multiple_booking` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `max_booking` int(11) NOT NULL DEFAULT '0',
  `per_day_max_booking` int(11) NOT NULL DEFAULT '0',
  `per_slot_max_booking` int(11) NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `slot_duration` int(11) NOT NULL DEFAULT '30',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_times`
--

INSERT INTO `booking_times` (`id`, `company_id`, `day`, `start_time`, `end_time`, `multiple_booking`, `max_booking`, `per_day_max_booking`, `per_slot_max_booking`, `status`, `slot_duration`, `created_at`, `updated_at`) VALUES
(1, 1, 'monday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL),
(2, 1, 'tuesday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL),
(3, 1, 'wednesday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL),
(4, 1, 'thursday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL),
(5, 1, 'friday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL),
(6, 1, 'saturday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL),
(7, 1, 'sunday', '03:30:00', '12:30:00', 'yes', 0, 0, 0, 'enabled', 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_user`
--

CREATE TABLE `booking_user` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_services`
--

CREATE TABLE `business_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `time` double(8,2) NOT NULL,
  `time_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `net_price` double(8,2) NOT NULL,
  `default_image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_services`
--

INSERT INTO `business_services` (`id`, `company_id`, `category_id`, `location_id`, `image`, `name`, `slug`, `description`, `price`, `time`, `time_type`, `discount`, `discount_type`, `net_price`, `default_image`, `status`, `created_at`, `updated_at`) VALUES
(24, 1, 5, 1, NULL, 'Fruit Facial', 'Fruit Facial', '<p>jugh</p>', 420.00, 45.00, 'minutes', 0.00, 'percent', 420.00, NULL, 'active', '2021-11-02 11:16:45', '2021-11-02 11:16:45'),
(25, 1, 3, 1, NULL, 'Acne Prone Facial', 'Acne Prone Facial', '<p>jgyuyuhi</p>', 655.00, 70.00, 'minutes', 0.00, 'percent', 655.00, NULL, 'active', '2021-11-02 11:18:40', '2021-11-02 11:18:40'),
(26, 1, 5, 1, NULL, 'Fruit Clean-Up', 'fruit-clean-up', '<p>mklmnlo</p>', 200.00, 30.00, 'minutes', 0.00, 'percent', 200.00, NULL, 'active', '2021-11-02 11:21:41', '2021-11-02 11:21:41'),
(27, 1, 5, 1, '[]', 'Acne Spots Facial', 'Acne Spots Facial', '<p>jhuyhbuoihjiouij</p>', 920.00, 80.00, 'minutes', 0.00, 'percent', 920.00, NULL, 'active', '2021-11-02 11:22:06', '2021-11-02 11:35:32'),
(28, 1, 5, 1, NULL, 'Open Pore Clean Up', 'open-pore-clean-up', '<p>aaaa</p>', 320.00, 30.00, 'minutes', 0.00, 'percent', 320.00, NULL, 'active', '2021-11-02 11:23:18', '2021-11-02 11:23:18'),
(29, 1, 5, 1, '[]', 'Open Pore Facial', 'open-pore-facial', '<p>kvhkjnjkcivjimk</p>', 460.00, 45.00, 'minutes', 0.00, 'percent', 460.00, NULL, 'active', '2021-11-02 11:24:04', '2021-11-02 11:35:50'),
(30, 1, 5, 1, '[]', 'Acne Mark Clean Up', 'acne-mark-clean-up', '<p>hhhhh</p>', 437.00, 30.00, 'minutes', 0.00, 'percent', 437.00, NULL, 'active', '2021-11-02 11:24:29', '2021-11-02 11:34:45'),
(31, 1, 5, 1, '[]', 'Anti Aging Clean Up', 'anti-aging-clean-up', '<p>aaaaa</p>', 395.00, 30.00, 'minutes', 0.00, 'percent', 395.00, NULL, 'active', '2021-11-02 11:25:22', '2021-11-02 11:32:45'),
(32, 1, 5, 1, '[]', 'Pigmentation Clean Up', 'pigmentation-clean-up', '<p>aaaa</p>', 510.00, 45.00, 'minutes', 0.00, 'percent', 510.00, NULL, 'active', '2021-11-02 11:26:29', '2021-11-02 11:32:26'),
(33, 1, 5, 1, '[]', 'Anti D-Tan Clean Up', 'anti-d-tan-clean-up', '<p>aaaa</p>', 600.00, 30.00, 'minutes', 0.00, 'percent', 600.00, NULL, 'active', '2021-11-02 11:27:30', '2021-11-02 11:32:07'),
(34, 1, 5, 1, '[]', 'De-Tan Glow Facial', 'de-tan-glow-facial', '<p>jngfkjgbrhnkhkm</p>', 905.00, 90.00, 'minutes', 0.00, 'percent', 905.00, NULL, 'active', '2021-11-02 11:28:11', '2021-11-02 11:31:43'),
(35, 1, 5, 1, '[]', 'Magic Glow Deep Hydrating Facial', 'magic-glow-deep-hydrating-facial', '<p>jgkugbybjhgbj</p>', 895.00, 90.00, 'minutes', 0.00, 'percent', 895.00, NULL, 'active', '2021-11-02 11:30:36', '2021-11-02 11:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `business_service_user`
--

CREATE TABLE `business_service_user` (
  `business_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `parent_id` int(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Hair', 'hair', 'salon.jpg', 'active', 0, '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 'Nails', 'nails', 'nails.jpeg', 'active', 0, '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 'Body', 'body', 'spa.jpg', 'active', 0, '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 'Skin', 'skin', 'skin.jpeg', 'active', 0, '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 'Face', 'face', 'skin.jpg', 'active', 0, '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, 'Medical', 'Medical', 'medical.jpeg', 'active', 0, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(7, 'Soften Skin', 'soften-skin', 'Softer Skin.jpg', 'active', 0, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(8, 'Pain Relief test', 'pain-relief-test', 'Pain Relief.jpg', 'active', 1, '2021-10-29 19:45:11', '2021-11-03 14:50:49'),
(9, 'test', 'test', '4e3fd80709457cffa2e0a85426e125da.png', 'active', 0, '2021-11-03 14:20:43', '2021-11-03 14:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_format` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h:i A',
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` datetime DEFAULT NULL,
  `disable_slot` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `booking_time_type` enum('sum','avg','max','min') COLLATE utf8_unicode_ci NOT NULL,
  `booking_per_day` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_selection` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `multi_task_user` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `popular_store` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `verified` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `stripe_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_type` enum('monthly','annual') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cron_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `duration` int(11) NOT NULL DEFAULT '1',
  `duration_type` enum('minutes','hours','days','weeks') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'minutes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `currency_id`, `package_id`, `company_name`, `slug`, `company_email`, `company_phone`, `logo`, `address`, `date_format`, `time_format`, `website`, `timezone`, `locale`, `latitude`, `longitude`, `trial_ends_at`, `licence_expire_on`, `disable_slot`, `booking_time_type`, `booking_per_day`, `employee_selection`, `multi_task_user`, `popular_store`, `created_at`, `updated_at`, `status`, `verified`, `stripe_id`, `card_brand`, `card_last_four`, `package_type`, `cron_status`, `duration`, `duration_type`) VALUES
(1, 2, 6, 'Beauty Players', 'cut-style-salon', 'hello@beautyplayers.com', '8282829958', '9a6fce7ac404b0e597035d5567491436.png', 'Delhi, India.', 'd-m-Y', 'h:i a', 'http://www.beautyplayers.com', 'Asia/Kolkata', 'en', NULL, NULL, NULL, NULL, 'disabled', 'sum', NULL, 'disabled', NULL, '1', '2021-10-29 19:45:10', '2021-11-03 13:34:37', 'active', 'yes', NULL, NULL, NULL, NULL, 'deactive', 1, 'minutes');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `nicename` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `uses_limit` int(11) DEFAULT NULL,
  `used_time` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `discount_type` enum('percentage','amount') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `minimum_purchase_amount` int(11) NOT NULL DEFAULT '0',
  `days` text COLLATE utf8_unicode_ci,
  `status` enum('active','inactive','expire') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date_time`, `end_date_time`, `uses_limit`, `used_time`, `amount`, `discount_type`, `minimum_purchase_amount`, `days`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'SAVE $20', 'SAVE20', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 20, 'percentage', 20, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'Limited Time Coupon !! HURRY UP.', NULL, NULL),
(2, 'BACK2BEAUTY', 'BACK15', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 15, 'percentage', 10, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'GRAB IT NOW !! HURRY UP.', NULL, NULL),
(3, 'Eazy Saloon ', 'GRAB50', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 10, 'percentage', 10, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'GRAB IT NOW !! HURRY UP.', NULL, NULL),
(4, 'New Year Dhamaka', 'DHAMAKA5', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 5, 'percentage', 10, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'GRAB IT NOW !! HURRY UP.', NULL, NULL),
(5, 'Happy Diwali', 'HAPPY30', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 30, 'percentage', 10, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'GRAB IT NOW !! HURRY UP.', NULL, NULL),
(6, 'Summer Relax', 'SUMMER25', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 25, 'percentage', 10, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'GRAB IT NOW !! HURRY UP.', NULL, NULL),
(7, 'SAVE $10', 'SAVE10', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 10, 'percentage', 20, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'Limited Time Coupon !! HURRY UP.', NULL, NULL),
(8, 'BIG DEAL', 'BIG50', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 50, 'percentage', 20, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'Limited Time Coupon !! HURRY UP.', NULL, NULL),
(9, 'DEAL DAY', 'DEAL70', '2021-09-29 19:45:11', '2021-11-28 19:45:11', 0, 0, 70, 'percentage', 20, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'active', 'Limited Time Coupon !! HURRY UP.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_users`
--

CREATE TABLE `coupon_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `usd_price` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `usd_price`, `is_cryptocurrency`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'US Dollars', '$', 'USD', 1, NULL, 'no', NULL, '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 'Rupee', '₹', 'INR', NULL, NULL, 'no', NULL, '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `currency_format_settings`
--

CREATE TABLE `currency_format_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'right',
  `no_of_decimal` int(10) UNSIGNED NOT NULL,
  `thousand_separator` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_format_settings`
--

INSERT INTO `currency_format_settings` (`id`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`) VALUES
(1, 'right', 2, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `uses_limit` int(11) DEFAULT NULL,
  `used_time` int(11) DEFAULT NULL,
  `original_amount` double DEFAULT NULL,
  `deal_amount` double DEFAULT NULL,
  `days` text COLLATE utf8_unicode_ci,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','expire') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8_unicode_ci,
  `discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `deal_applied_on` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `max_order_per_customer` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `company_id`, `location_id`, `title`, `slug`, `deal_type`, `start_date_time`, `end_date_time`, `open_time`, `close_time`, `uses_limit`, `used_time`, `original_amount`, `deal_amount`, `days`, `image`, `status`, `description`, `discount_type`, `percentage`, `deal_applied_on`, `max_order_per_customer`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Choice Of deep-tissue-massage (50 Mins)', 'deep-tissue-massage', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 50, 16, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'spa.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 20, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(2, 1, 1, 'Deal on Pedicure services (30 Mins)', 'pedicure', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 1, 50, 25, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'pedicure.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 50, 'location', 10, '2021-10-29 19:45:11', '2021-10-31 14:42:17'),
(3, 1, 1, 'Choice of best HairCut (30 Mins)', 'hair-cut', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 60, 48, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'hair-cut.jpeg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 20, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(4, 1, 1, 'Head to Toe full body massage (180 Min)', 'head-to-toe', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 200, 160, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'hair-spa.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 20, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(5, 1, 2, 'Get 70% off on Waxing (40 Mins)', 'waxing', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 300, 90, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'waxing.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 70, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(6, 1, 2, 'Best Choice Manicure (20 Mins)', 'manicure', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 20, 16, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'Manicure.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 20, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(7, 1, 1, 'Get Best Hair Coloring (40 Mins)', 'hair-coloring', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 20, 16, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'hair-coloring.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 20, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(8, 1, 1, 'Best Choice Manicure (20 Mins)', 'manicure', '', '2021-09-29 19:45:11', '2021-11-28 19:45:11', '09:00:00', '21:59:00', 0, 0, 120, 100, '[\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'Manicure.jpg', 'active', '<div class=\"tab-content\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 30px !important; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></div></div><div class=\"tab-content\" open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><div class=\"margin-bottom-xl\" style=\"box-sizing: inherit; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; margin-bottom: 30px !important;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">How to use offer</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; font: inherit; padding: 0px; border: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Carry your deal on phone or access it under the \"booking\" section of the site</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Make prior reservation before you visit the store</li><li class=\"font-lg\" style=\"box-sizing: inherit; font-weight: inherit; font-stretch: inherit; font-style: inherit; color: rgb(45, 45, 45); padding: 0px; margin: 12px 0px 0px; border: 0px; font-variant: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Store verifies the deal&nbsp;or you can redeem it yourself using the site</li></ul></div></div><div open=\"\" sans\",=\"\" sans-serif;=\"\" vertical-align:=\"\" baseline;=\"\" color:=\"\" rgb(102,=\"\" 102,=\"\" 102);\"=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit;\"><h3 class=\"font-xl line-height-xs font-weight-semibold txt-secondary\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline; -webkit-font-smoothing: subpixel-antialiased; font-weight: 600 !important; line-height: 18px !important; color: rgb(102, 102, 102) !important; font-size: 15px !important;\">Things to remember</h3><ul class=\"section\" style=\"box-sizing: inherit; margin: 12px 1em 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: initial; list-style-image: initial;\"><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">All offers are inclusive of taxes &amp; service charges</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Prior appointment mandatory (Upon purchase, you will receive a deal with the booking id)</li><li class=\"font-lg\" style=\"box-sizing: inherit; margin: 12px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 18px; font-family: inherit; vertical-align: baseline; font-size: 14px !important;\">Cannot be clubbed with any other existing offers/promotions</li></ul></div>', 'percentage', 17, 'location', 10, '2021-10-29 19:45:11', '2021-10-29 19:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `deal_items`
--

CREATE TABLE `deal_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `deal_id` int(10) UNSIGNED DEFAULT NULL,
  `business_service_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` tinyint(4) NOT NULL,
  `unit_price` double NOT NULL,
  `discount_amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_groups`
--

CREATE TABLE `employee_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_group_services`
--

CREATE TABLE `employee_group_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_groups_id` int(10) UNSIGNED DEFAULT NULL,
  `business_service_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_schedules`
--

CREATE TABLE `employee_schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `is_working` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `days` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_schedules`
--

INSERT INTO `employee_schedules` (`id`, `company_id`, `employee_id`, `is_working`, `start_time`, `end_time`, `days`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'yes', '09:00:00', '18:00:00', 'monday', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 1, 3, 'yes', '09:00:00', '18:00:00', 'tuesday', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 1, 3, 'yes', '09:00:00', '18:00:00', 'wednesday', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 1, 3, 'yes', '09:00:00', '18:00:00', 'thursday', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 1, 3, 'yes', '09:00:00', '18:00:00', 'friday', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, 1, 3, 'yes', '09:00:00', '18:00:00', 'saturday', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(7, 1, 3, 'yes', '09:00:00', '18:00:00', 'sunday', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `footer_settings`
--

CREATE TABLE `footer_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_links` text COLLATE utf8_unicode_ci,
  `footer_text` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `footer_settings`
--

INSERT INTO `footer_settings` (`id`, `social_links`, `footer_text`, `created_at`, `updated_at`) VALUES
(1, '[{\"name\":\"facebook\",\"link\":\"https:\\/\\/facebook.com\"},{\"name\":\"twitter\",\"link\":\"https:\\/\\/twitter.com\"},{\"name\":\"instagram\",\"link\":\"https:\\/\\/instagram.com\"},{\"name\":\"pinterest\",\"link\":\"https:\\/\\/pinterest.com\"},{\"name\":\"linkedin\",\"link\":\"https:\\/\\/linkedin.com\"}]', 'Froiden Technologies Pvt. Ltd. © 2020 - 2025 All Rights Reserved.', '2021-10-29 19:45:04', '2021-10-29 19:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `front_faqs`
--

CREATE TABLE `front_faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `question` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_faqs`
--

INSERT INTO `front_faqs` (`id`, `language_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'Can i see demo ?', 'Yes, definitely. We would be happy to demonstrate you Appointo-multivendor through a web conference at your convenience. Please submit a query on our contact us page or drop a mail to our mail id appointo-multivendor@froiden.com.', NULL, NULL),
(2, 1, 'How can i update app ?', 'Yes, definitely. We would be happy to demonstrate you Appointo-multivendor through a web conference at your convenience. Please submit a query on our contact us page or drop a mail to our mail id appointo-multivendor@froiden.com.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_theme_settings`
--

CREATE TABLE `front_theme_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `primary_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secondary_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `custom_css` longtext COLLATE utf8_unicode_ci,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `seo_keywords` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customJS` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_theme_settings`
--

INSERT INTO `front_theme_settings` (`id`, `primary_color`, `secondary_color`, `custom_css`, `logo`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`, `title`, `favicon`, `customJS`) VALUES
(1, '#00c1cf', '#373737', '/* Coupon Box */\n.coupon_code_box a {\n    background-color: #ffcc00;\n}\n/* Deals Flag */\n.featuredDealDetail .tag {\n    background-color: #ffcc00;\n}\n/* Cart itme quantity number */\n.cart-badge {\n    background-color: #f72222;\n}', NULL, 'Meta descriptions can have a surprisingly large impact on your search marketing campaigns; find out how...', 'Appointo Multi Vendor,Saas,Manicure', NULL, NULL, 'Appointo Multi Vendor', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `front_widgets`
--

CREATE TABLE `front_widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `code` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_account_details`
--

CREATE TABLE `gateway_account_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `connection_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not_connected',
  `account_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `gateway` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_expire_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_format` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h:i A',
  `website` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sign_up_note` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `terms_note` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `map_option` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `map_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_calendar` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_client_id` text COLLATE utf8_unicode_ci,
  `google_client_secret` text COLLATE utf8_unicode_ci,
  `rating_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `currency_id`, `company_name`, `company_email`, `company_phone`, `contact_email`, `logo`, `address`, `date_format`, `time_format`, `website`, `timezone`, `locale`, `sign_up_note`, `terms_note`, `purchase_code`, `supported_until`, `map_option`, `map_key`, `google_calendar`, `google_client_id`, `google_client_secret`, `rating_status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Beauty Players', 'company@example.com', '1234512345', 'froiden@example.com', '56d1dd4ba60566a286a1d85c8bdd9918.png', 'Jaipur, India', 'Y-m-d', 'h:i A', 'http://beautyplayers.com/', 'Asia/Kolkata', 'en', 'Thank you for registration. Please verify your account via the verification link sent to your email', 'By creating this account, I agree to Term and conditions', 'd1bde6fa-0392-4754-98d3-41e1fb5fe4e5', '2022-04-30 09:29:55', 'active', 'AIzaSyAHy0iVxR_RC3PvBq7NblN_T-ckotaqLVw', 'active', 'admin@example.com', '123456', 'inactive', NULL, '2021-10-31 16:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `google_accounts`
--

CREATE TABLE `google_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `google_captcha_settings`
--

CREATE TABLE `google_captcha_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `v2_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `v2_site_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v2_secret_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v3_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `v3_site_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v3_secret_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_page` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `customer_page` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `vendor_page` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `google_captcha_settings`
--

INSERT INTO `google_captcha_settings` (`id`, `status`, `v2_status`, `v2_site_key`, `v2_secret_key`, `v3_status`, `v3_site_key`, `v3_secret_key`, `login_page`, `customer_page`, `vendor_page`, `created_at`, `updated_at`) VALUES
(1, 'deactive', 'deactive', NULL, NULL, 'deactive', NULL, NULL, 'inactive', 'inactive', 'inactive', '2021-10-29 19:45:03', '2021-10-29 19:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `item_taxes`
--

CREATE TABLE `item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `deal_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_taxes`
--

INSERT INTO `item_taxes` (`id`, `tax_id`, `service_id`, `deal_id`, `product_id`, `company_id`, `created_at`, `updated_at`) VALUES
(24, 1, NULL, 1, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(25, 1, NULL, 2, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(26, 1, NULL, 3, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(27, 1, NULL, 4, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(28, 1, NULL, 5, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(29, 1, NULL, 6, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(30, 1, NULL, 7, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(31, 1, NULL, 8, NULL, NULL, '2021-10-29 19:45:11', '2021-10-29 19:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `language_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_code`, `language_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'enabled', NULL, NULL),
(2, 'es', 'Spanish', 'enabled', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `leave_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_by` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jaipur, India', 99, 'active', '2021-10-29 19:45:10', '2021-10-31 13:50:13'),
(2, 'New York, USA', NULL, 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_content` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `subheading` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `action_button` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_tab` enum('current','new') COLLATE utf8_unicode_ci DEFAULT 'current',
  `content_alignment` enum('left','right') COLLATE utf8_unicode_ci DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `image`, `have_content`, `subheading`, `heading`, `content`, `action_button`, `url`, `open_tab`, `content_alignment`, `created_at`, `updated_at`) VALUES
(1, 'banner.jpg', 'yes', 'Honest Beauty', '20% Discount On All Services', '<p>Also Get E-Gift Cards Up To Rs. 10000</p>', 'login', 'https://beautyplayers.com/public/login', 'current', 'left', NULL, NULL),
(2, 'banner5.jpg', 'yes', 'Honest Beauty', '20% Discount On All Services', '<p>Also Get E-Gift Cards Up To Rs. 10000</p>', 'login', 'https://beautyplayers.com/public/login', 'new', 'right', NULL, NULL),
(3, 'banner3.jpg', 'no', NULL, NULL, '', '', '', '', '', NULL, NULL),
(4, 'banner2.jpg', 'yes', 'Honest Beauty', '20% Discount On All Services', '<p>Also Get E-Gift Cards Up To Rs. 10000</p>', 'login', 'https://beautyplayers.com/public/login', 'current', 'left', NULL, NULL),
(5, 'banner4.jpg', 'no', NULL, NULL, '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_10_130124_create_currencies_table', 1),
(3, '2014_10_10_131417_create_global_settings_table', 1),
(4, '2014_10_11_131417_create_company_settings_table', 1),
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2018_09_05_071516_create_locations_table', 1),
(8, '2018_09_06_071923_create_categories_table', 1),
(9, '2018_09_08_121633_create_coupons_table', 1),
(10, '2018_09_09_121633_create_coupon_users_table', 1),
(11, '2018_09_11_093015_create_business_services_table', 1),
(12, '2018_09_11_173520_create_bookings_table', 1),
(13, '2018_09_11_184348_create_tax_settings_table', 1),
(14, '2018_09_12_151158_create_booking_times_table', 1),
(15, '2018_09_25_112040_create_booking_items_table', 1),
(16, '2018_10_03_182207_create_languages_table', 1),
(17, '2018_10_04_112244_create_smtp_settings_table', 1),
(18, '2018_10_09_121006_create_theme_settings_table', 1),
(19, '2018_10_18_034518_create_stripe_invoices_table', 1),
(20, '2018_12_27_053940_create_payment_gateway_credential_table', 1),
(21, '2018_12_27_064431_create_payments_table', 1),
(22, '2019_03_19_1265158_paypal_invoice_table', 1),
(23, '2019_04_08_053940_create_employee_groups_table', 1),
(24, '2019_05_03_000001_create_customer_columns', 1),
(25, '2019_05_03_000002_create_subscriptions_table', 1),
(26, '2019_05_03_000003_create_subscription_items_table', 1),
(27, '2019_08_06_104829_create_media_table', 1),
(28, '2019_08_14_121322_create_front_theme_settings_table', 1),
(29, '2019_08_27_043810_create_pages_table', 1),
(30, '2019_09_17_083105_create_sms_settings_table', 1),
(31, '2019_09_23_064129_create_universal_search_table', 1),
(32, '2019_11_14_121846_laratrust_setup_tables', 1),
(33, '2019_11_18_121633_create_modules_table', 1),
(34, '2019_12_13_081452_create_todo_items_table', 1),
(35, '2020_03_20_102434_create_booking_user_table', 1),
(36, '2020_03_21_130010_create_business_service_user_table', 1),
(37, '2020_04_10_155242_create_deals_table', 1),
(38, '2020_04_17_083138_create_deal_items_table', 1),
(39, '2020_06_02_031736_create_employee_group_services_table', 1),
(40, '2020_06_05_072656_add_two_columns_to_booking_table', 1),
(41, '2020_06_09_064105_add_5_columns_to_company_settings_table', 1),
(42, '2020_06_18_112053_add_status_column_to_locations_table', 1),
(43, '2020_06_18_122921_add_code_column_to_coupons_table', 1),
(44, '2020_07_15_050501_create_google_captcha_settings_table', 1),
(45, '2020_07_16_065942_add_2_columns_in_company_settings_table', 1),
(46, '2020_07_22_054916_create_packages_table', 1),
(47, '2020_07_22_083021_create_package_modules_table', 1),
(48, '2020_07_28_070859_add_package_id_to_company_setting_table', 1),
(49, '2020_07_29_063646_create_module_settings_table', 1),
(50, '2020_11_12_085711_seo_details_in_front_theme_settings', 1),
(51, '2020_11_12_110924_create_leaves_table', 1),
(52, '2020_11_20_015135_add_package_id_to_stripe_invoices_table', 1),
(53, '2020_11_20_015245_add_package_id_to_paypal_invoices_table', 1),
(54, '2020_11_26_123930_create_spotlight_table', 1),
(55, '2020_12_03_051552_create_footer_settings_table', 1),
(56, '2020_12_10_054301_alter_company_customer_table', 1),
(57, '2020_12_15_081756_create_employee_schedules_table', 1),
(58, '2020_12_18_095816_create_offline_payment_method_table', 1),
(59, '2020_12_18_120145_create_offline_invoices_table', 1),
(60, '2020_12_18_120146_create_offline_plan_changes_table', 1),
(61, '2020_12_18_133900_create_offline_invoice_payments_table', 1),
(62, '2021_01_19_123446_create_gateway_account_details_table', 1),
(63, '2021_01_20_091253_add_order_id_column_in_bookings_table', 1),
(64, '2021_01_21_095950_create_razorpay_subscriptions_table', 1),
(65, '2021_01_21_1534518_create_razorpay_invoices_table', 1),
(66, '2021_01_27_062616_add_role_column_in_theme_settings_table', 1),
(67, '2021_02_04_071848_create_front_faqs_table', 1),
(68, '2021_02_19_060639_create_products_table', 1),
(69, '2021_02_19_064957_add_product_id_in_booking_items', 1),
(70, '2021_03_24_123119_create_sections_table', 1),
(71, '2021_05_06_090747_add_on_delete_and_on_update_on_product_table', 1),
(72, '2021_05_14_054838_add_columns_to_front_theme_settings_table', 1),
(73, '2021_05_18_101523_create_front_widgets_table', 1),
(74, '2021_05_19_171614_add_phone_country_code_column_users_table', 1),
(75, '2021_05_20_040546_add_country_id_to_locations_table', 1),
(76, '2021_05_20_174034_change_secondary_color_value_in_front_theme_settings_table', 1),
(77, '2021_05_24_050406_add_per_day_max_booking_to_booking_times_table', 1),
(78, '2021_05_24_111420_update_column_code_to_front_widgets_table', 1),
(79, '2021_05_26_062014_add_map_key_to_global_settings_table', 1),
(80, '2021_05_26_064820_create_vendor_pages_table', 1),
(81, '2021_05_28_081516_create_office__leaves_table', 1),
(82, '2021_06_01_051926_add_slug_to_companies_table', 1),
(83, '2021_06_01_082501_add_default_image_and_update_description_to_vendor_pages_table', 1),
(84, '2021_06_01_123231_add_custom_css_to_front_theme_settings_table', 1),
(85, '2021_06_03_061734_add_heading_and_subheading_to_media_table', 1),
(86, '2021_06_04_045850_create_vendor_pages_of_companies', 1),
(87, '2021_06_11_043337_add_commission_column_to_payments_table', 1),
(88, '2021_06_11_091833_add_columns_to_companies_table', 1),
(89, '2021_06_14_042736_add_currency_id_column_to_bookings_table', 1),
(90, '2021_06_15_113325_create_currency_format_settings_table', 1),
(91, '2021_06_18_113512_drop_company_id_column_in_tax_settings_table', 1),
(92, '2021_06_18_114435_base_usd_currency_deleted_restore', 1),
(93, '2021_06_20_122110_create_item_taxes_table', 1),
(94, '2021_06_20_122211_change_tax_settings_table_name', 1),
(95, '2021_06_20_122222_add_tax_for_services_and_deal_in_tax_settings_table', 1),
(96, '2021_06_24_103041_create_google_accounts_table', 1),
(97, '2021_06_25_113138_add_google_o_auth_ids_to_global_settings_table', 1),
(98, '2021_06_28_044938_add_google_event_id_to_bookings_table', 1),
(99, '2021_06_28_115119_create_google_calendar_package_module', 1),
(100, '2021_06_30_105507_edit_tax_name_column_in_taxes_table', 1),
(101, '2021_07_05_111439_create_booking_notifactions_table', 1),
(102, '2021_07_09_053020_add_notifaction_column_to_bookings_table', 1),
(103, '2021_07_13_045806_add_msg91_column_to_sms_settings_table', 1),
(104, '2021_07_14_051944_change_booking_notifactions_to_booking_notification_table_name', 1),
(105, '2021_07_16_095336_add_new_role_agent', 1),
(106, '2021_07_20_110531_create_ticket_types_table', 1),
(107, '2021_07_20_110616_create_ticket_priorties_table', 1),
(108, '2021_07_20_110644_create_ticket_templates_table', 1),
(109, '2021_07_22_040331_create_tickets_table', 1),
(110, '2021_07_22_043716_create_ticket_comments_table', 1),
(111, '2021_07_22_055908_add_ticket_module', 1),
(112, '2021_08_09_084604_create_ratings_table', 1),
(113, '2021_08_16_122929_add_choose_options_columns_in_google_captcha_settings_table', 1),
(114, '2021_08_17_091118_add_rating_status_to_global_settings_table', 1),
(115, '2021_08_18_064627_create_social_auth_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'company', 'Company', 'modules.module.companyDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 'package', 'Package', 'modules.module.packageDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 'ticket', 'Ticket', 'modules.module.ticketDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 'location', 'Location', 'modules.module.locationDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 'category', 'Category', 'modules.module.categoryDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, 'business_service', 'Business Service', 'modules.module.businessServiceDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(7, 'customer', 'Customer', 'modules.module.customerDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(8, 'employee', 'Employee', 'modules.module.employeeDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(9, 'coupon', 'Coupon', 'modules.module.couponDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(10, 'deal', 'Deal', 'modules.module.dealDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(11, 'employee_group', 'Employee Group', 'modules.module.employeeGroupDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(12, 'booking', 'Booking', 'modules.module.bookingDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(13, 'report', 'Report', 'modules.module.reportDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(14, 'employee_leave', 'Employee Leave', 'modules.module.employeeLeaveDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(15, 'employee_schedule', 'Employee Schedule', 'modules.module.employeeScheduleDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(16, 'settings', 'Settings', 'modules.module.settingsDescription', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `company_id`, `module_name`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Reports', 'active', 'administrator', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 1, 'Reports', 'deactive', 'employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 1, 'POS', 'active', 'administrator', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 1, 'POS', 'deactive', 'employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 1, 'Employee Leave', 'active', 'administrator', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, 1, 'Employee Leave', 'deactive', 'employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(7, 1, 'Employee Schedule', 'active', 'administrator', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(8, 1, 'Employee Schedule', 'deactive', 'employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(9, 1, 'Google Calendar', 'active', 'administrator', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(10, 1, 'Google Calendar', 'deactive', 'employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `office_leaves`
--

CREATE TABLE `office_leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_invoices`
--

CREATE TABLE `offline_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `offline_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `status` enum('paid','unpaid','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `package_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_invoice_payments`
--

CREATE TABLE `offline_invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approve','reject') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `status` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_plan_changes`
--

CREATE TABLE `offline_plan_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `package_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `offline_method_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('verified','pending','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `max_employees` bigint(20) NOT NULL,
  `max_services` bigint(20) NOT NULL,
  `max_deals` bigint(20) NOT NULL,
  `max_roles` bigint(20) NOT NULL,
  `no_of_days` bigint(20) NOT NULL,
  `notify_before_days` bigint(20) NOT NULL,
  `trial_message` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `monthly_price` double(20,3) NOT NULL,
  `annual_price` double(20,3) NOT NULL,
  `stripe_monthly_plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_annual_plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_monthly_plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_annual_plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_modules` text COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `make_private` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `mark_recommended` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `currency_id`, `name`, `max_employees`, `max_services`, `max_deals`, `max_roles`, `no_of_days`, `notify_before_days`, `trial_message`, `monthly_price`, `annual_price`, `stripe_monthly_plan_id`, `stripe_annual_plan_id`, `razorpay_monthly_plan_id`, `razorpay_annual_plan_id`, `package_modules`, `description`, `type`, `make_private`, `mark_recommended`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Default', 0, 0, 0, 0, 0, 0, '', 0.000, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'default', 'false', 'false', 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 2, 'Trial', 5, 5, 5, 5, 0, 0, '', 0.000, 0.000, NULL, NULL, NULL, NULL, '{\"1\":\"Reports\",\"2\":\"POS\",\"3\":\"Employee Leave\",\"4\":\"Employee Schedule\"}', 'Lorem ipsum kjvfds ds sd  ads sad v adsv ads vsd v sd s f aewg reb dfb', 'trial', 'false', 'false', 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 2, 'Free', 5, 10, 2, 3, 0, 0, '', 0.000, 0.000, NULL, NULL, NULL, NULL, '{\"1\":\"Reports\",\"2\":\"Employee Schedule\"}', 'Lorem ipsum kjvfds ds sd  ads sad v adsv ads vsd v sd s f aewg reb dfb', NULL, 'false', 'false', 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 2, 'Starter', 3, 7, 5, 10, 0, 0, '', 50.000, 500.000, NULL, NULL, NULL, NULL, '{\"1\":\"POS\",\"2\":\"Employee Leave\",\"3\":\"Employee Schedule\"}', 'Lorem ipsum kjvfds ds sd  ads sad v adsv ads vsd v sd s f aewg reb dfb', NULL, 'false', 'false', 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 2, 'Medium', 20, 10, 15, 20, 0, 0, '', 100.000, 1000.000, NULL, NULL, NULL, NULL, '{\"1\":\"Reports\",\"2\":\"POS\",\"3\":\"Employee Leave\",\"4\":\"Employee Schedule\"}', 'Lorem ipsum kjvfds ds sd  ads sad v adsv ads vsd v sd s f aewg reb dfb', NULL, 'false', 'true', 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, 2, 'Larger', 15, 40, 20, 30, 0, 0, '', 500.000, 5000.000, NULL, NULL, NULL, NULL, '{\"1\":\"Reports\",\"2\":\"POS\",\"3\":\"Employee Leave\",\"4\":\"Employee Schedule\",\"5\":\"Google Calendar\"}', 'Lorem ipsum kjvfds ds sd  ads sad v adsv ads vsd v sd s f aewg reb dfb', NULL, 'false', 'false', 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `package_modules`
--

CREATE TABLE `package_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_modules`
--

INSERT INTO `package_modules` (`id`, `name`) VALUES
(1, 'Reports'),
(2, 'POS'),
(3, 'Employee Leave'),
(4, 'Employee Schedule'),
(5, 'Google Calendar');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'About Us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p><br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                ', 'about-us', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 'Contact Us', '<p>How can we help you? We will try to get back to you as soon as possible.</p>', 'contact-us', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 'How It Works', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p><br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                ', 'how-it-works', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 'Privacy Policy', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                <br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p><br />\n                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\n                ', 'privacy-policy', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `commission` double NOT NULL DEFAULT '0',
  `gateway` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('completed','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `transfer_status` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offline_method_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `company_id`, `currency_id`, `booking_id`, `customer_id`, `amount`, `commission`, `gateway`, `transaction_id`, `status`, `transfer_status`, `paid_on`, `event_id`, `created_at`, `updated_at`, `offline_method_id`) VALUES
(1, 1, 1, 2, 1, 29.5, 0, 'RazorPay', 'pay_IFytLcjb3KtSGg', 'completed', 'not_transferred', '2021-10-31 14:45:08', NULL, '2021-10-31 14:45:08', '2021-10-31 14:45:08', NULL),
(2, 1, 1, 4, 5, 63.72, 0, 'RazorPay', 'pay_IGcH9KHsT2T3Ng', 'completed', 'not_transferred', '2021-11-02 05:16:42', NULL, '2021-11-02 05:16:42', '2021-11-02 05:16:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

CREATE TABLE `payment_gateway_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `offline_payment` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `show_payment_options` enum('hide','show') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'show',
  `paypal_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_mode` enum('sandbox','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sandbox',
  `paypal_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `stripe_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_webhook_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `stripe_commission_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `stripe_commission_percentage` int(11) DEFAULT NULL,
  `razorpay_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_webhook_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `razorpay_commission_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `razorpay_commission_percentage` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `company_id`, `offline_payment`, `show_payment_options`, `paypal_client_id`, `paypal_secret`, `paypal_mode`, `paypal_status`, `stripe_client_id`, `stripe_secret`, `stripe_webhook_secret`, `stripe_status`, `stripe_commission_status`, `stripe_commission_percentage`, `razorpay_key`, `razorpay_secret`, `razorpay_webhook_secret`, `razorpay_status`, `razorpay_commission_status`, `razorpay_commission_percentage`, `created_at`, `updated_at`) VALUES
(1, NULL, '1', 'show', NULL, NULL, 'sandbox', 'deactive', NULL, NULL, NULL, 'deactive', 'deactive', NULL, 'rzp_test_MiWZXrH41wQb9D', 'XaVQ9FltUAhlBbfJGLvhupIa', 'http://beautyplayers.com/save-razorpay-invoices', 'active', 'deactive', NULL, NULL, '2021-10-31 14:41:30'),
(2, 1, '1', 'show', NULL, NULL, 'sandbox', 'deactive', NULL, NULL, NULL, 'deactive', 'deactive', NULL, NULL, NULL, NULL, 'deactive', 'deactive', NULL, '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_invoices`
--

CREATE TABLE `paypal_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `recurring` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `status` enum('paid','unpaid','pending') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_on` datetime DEFAULT NULL,
  `type` enum('subscription','booking') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'create_company', 'Create Company', 'Create Company', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, 1, 'read_company', 'Read Company', 'Read Company', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, 1, 'update_company', 'Update Company', 'Update Company', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 1, 'delete_company', 'Delete Company', 'Delete Company', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 2, 'create_package', 'Create Package', 'Create Package', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, 2, 'read_package', 'Read Package', 'Read Package', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(7, 2, 'update_package', 'Update Package', 'Update Package', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(8, 2, 'delete_package', 'Delete Package', 'Delete Package', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(9, 3, 'create_ticket', 'Create Ticket', 'Create Ticket', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(10, 3, 'read_ticket', 'Read Ticket', 'Read Ticket', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(11, 3, 'update_ticket', 'Update Ticket', 'Update Ticket', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(12, 3, 'delete_ticket', 'Delete Ticket', 'Delete Ticket', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(13, 4, 'create_location', 'Create Location', 'Create Location', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(14, 4, 'read_location', 'Read Location', 'Read Location', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(15, 4, 'update_location', 'Update Location', 'Update Location', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(16, 4, 'delete_location', 'Delete Location', 'Delete Location', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(17, 5, 'create_category', 'Create Category', 'Create Category', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(18, 5, 'read_category', 'Read Category', 'Read Category', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(19, 5, 'update_category', 'Update Category', 'Update Category', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(20, 5, 'delete_category', 'Delete Category', 'Delete Category', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(21, 6, 'create_business_service', 'Create Business Service', 'Create Business Service', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(22, 6, 'read_business_service', 'Read Business Service', 'Read Business Service', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(23, 6, 'update_business_service', 'Update Business Service', 'Update Business Service', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(24, 6, 'delete_business_service', 'Delete Business Service', 'Delete Business Service', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(25, 7, 'create_customer', 'Create Customer', 'Create Customer', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(26, 7, 'read_customer', 'Read Customer', 'Read Customer', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(27, 7, 'update_customer', 'Update Customer', 'Update Customer', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(28, 7, 'delete_customer', 'Delete Customer', 'Delete Customer', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(29, 8, 'create_employee', 'Create Employee', 'Create Employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(30, 8, 'read_employee', 'Read Employee', 'Read Employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(31, 8, 'update_employee', 'Update Employee', 'Update Employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(32, 8, 'delete_employee', 'Delete Employee', 'Delete Employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(33, 9, 'create_coupon', 'Create Coupon', 'Create Coupon', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(34, 9, 'read_coupon', 'Read Coupon', 'Read Coupon', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(35, 9, 'update_coupon', 'Update Coupon', 'Update Coupon', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(36, 9, 'delete_coupon', 'Delete Coupon', 'Delete Coupon', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(37, 10, 'create_deal', 'Create Deal', 'Create Deal', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(38, 10, 'read_deal', 'Read Deal', 'Read Deal', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(39, 10, 'update_deal', 'Update Deal', 'Update Deal', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(40, 10, 'delete_deal', 'Delete Deal', 'Delete Deal', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(41, 11, 'create_employee_group', 'Create Employee Group', 'Create Employee Group', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(42, 11, 'read_employee_group', 'Read Employee Group', 'Read Employee Group', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(43, 11, 'update_employee_group', 'Update Employee Group', 'Update Employee Group', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(44, 11, 'delete_employee_group', 'Delete Employee Group', 'Delete Employee Group', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(45, 12, 'create_booking', 'Create Booking', 'Create Booking', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(46, 12, 'read_booking', 'Read Booking', 'Read Booking', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(47, 12, 'update_booking', 'Update Booking', 'Update Booking', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(48, 12, 'delete_booking', 'Delete Booking', 'Delete Booking', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(49, 13, 'create_report', 'Create Report', 'Create Report', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(50, 13, 'read_report', 'Read Report', 'Read Report', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(51, 13, 'update_report', 'Update Report', 'Update Report', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(52, 13, 'delete_report', 'Delete Report', 'Delete Report', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(53, 14, 'create_employee_leave', 'Create Employee Leave', 'Create Employee Leave', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(54, 14, 'read_employee_leave', 'Read Employee Leave', 'Read Employee Leave', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(55, 14, 'update_employee_leave', 'Update Employee Leave', 'Update Employee Leave', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(56, 14, 'delete_employee_leave', 'Delete Employee Leave', 'Delete Employee Leave', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(57, 15, 'create_employee_schedule', 'Create Employee Schedule', 'Create Employee Schedule', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(58, 15, 'read_employee_schedule', 'Read Employee Schedule', 'Read Employee Schedule', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(59, 15, 'update_employee_schedule', 'Update Employee Schedule', 'Update Employee Schedule', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(60, 15, 'delete_employee_schedule', 'Delete Employee Schedule', 'Delete Employee Schedule', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(61, 16, 'manage_settings', 'Manage Settings', 'Manage Settings', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(61, 2),
(46, 3),
(47, 3),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(46, 5),
(47, 5);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `location_id`, `company_id`, `name`, `description`, `price`, `discount`, `discount_type`, `image`, `default_image`, `status`, `created_at`, `updated_at`) VALUES
(7, 1, 1, 'Fruit Facial', '<p>jhihiohio</p>', 420.00, 0.00, 'percent', NULL, NULL, 'active', '2021-11-02 11:14:33', '2021-11-02 11:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `deal_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','inreview') COLLATE utf8_unicode_ci DEFAULT 'inreview',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_invoices`
--

CREATE TABLE `razorpay_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `invoice_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `subscription_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_subscriptions`
--

CREATE TABLE `razorpay_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `subscription_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `razorpay_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `razorpay_plan` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `company_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, NULL, 'agent', 'Agent', 'Agent', '2021-10-29 19:45:08', '2021-10-29 19:45:08'),
(2, NULL, 'superadmin', 'Super Admin', 'Super Admin', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, NULL, 'customer', 'Customer', 'Customer', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, 1, 'administrator', 'Administrator', 'Administrator', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, 1, 'employee', 'Employee', 'Employee', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(2, 1, 'App\\User'),
(3, 4, 'App\\User'),
(3, 5, 'App\\User'),
(4, 2, 'App\\User'),
(5, 3, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `status`) VALUES
(1, 'Slider Section', 'active'),
(2, 'Deal Section', 'active'),
(3, 'Category Section', 'active'),
(4, 'Coupon Section', 'active'),
(5, 'Spotlight Section', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nexmo_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `nexmo_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nexmo_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nexmo_from` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'NEXMO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `msg91_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `msg91_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg91_from` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'msgind'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `nexmo_status`, `nexmo_key`, `nexmo_secret`, `nexmo_from`, `created_at`, `updated_at`, `msg91_status`, `msg91_key`, `msg91_from`) VALUES
(1, 'deactive', NULL, NULL, 'NEXMO', '2021-10-29 19:45:10', '2021-10-29 19:45:10', 'deactive', NULL, 'msgind');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail_driver` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_host` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_port` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_from_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_from_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mail_encryption` enum('none','tls','ssl') COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `mail_encryption`, `verified`, `created_at`, `updated_at`) VALUES
(1, 'mail', 'smtp.gmail.com', '587', 'myemail@gmail.com', '123456', 'Appointo-multi-vendor', 'myemail@gmail.com', 'none', 0, '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `social_id` text COLLATE utf8_unicode_ci NOT NULL,
  `social_service` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_settings`
--

CREATE TABLE `social_auth_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_secret_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `facebook_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_secret_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_auth_settings`
--

INSERT INTO `social_auth_settings` (`id`, `google_client_id`, `google_secret_id`, `google_status`, `facebook_client_id`, `facebook_secret_id`, `facebook_status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'inactive', NULL, NULL, 'inactive', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `spotlight`
--

CREATE TABLE `spotlight` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `deal_id` int(10) UNSIGNED NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `sequence` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `spotlight`
--

INSERT INTO `spotlight` (`id`, `company_id`, `deal_id`, `from_date`, `to_date`, `sequence`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-09-29', '2021-11-28', '1', NULL, NULL),
(2, 1, 2, '2021-09-29', '2021-11-28', '2', NULL, NULL),
(3, 1, 3, '2021-09-29', '2021-11-28', '3', NULL, NULL),
(4, 1, 4, '2021-09-29', '2021-11-28', '4', NULL, NULL),
(5, 1, 5, '2021-09-29', '2021-11-28', '5', NULL, NULL),
(6, 1, 6, '2021-09-29', '2021-11-28', '6', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stripe_invoices`
--

CREATE TABLE `stripe_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `type` enum('subscription','booking') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `percent` double(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `percent`, `status`, `created_at`, `updated_at`) VALUES
(1, 'GST', 18.00, 'active', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'superadmin',
  `primary_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secondary_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sidebar_bg_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sidebar_text_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `topbar_text_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `custom_css` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `company_id`, `role`, `primary_color`, `secondary_color`, `sidebar_bg_color`, `sidebar_text_color`, `topbar_text_color`, `custom_css`, `created_at`, `updated_at`) VALUES
(1, NULL, 'superadmin', '#414552', '#788AE2', '#FFFFFF', '#5C5C62', '#FFFFFF', NULL, NULL, NULL),
(2, NULL, 'administrator', '#414552', '#788AE2', '#FFFFFF', '#5C5C62', '#FFFFFF', NULL, NULL, NULL),
(3, NULL, 'customer', '#414552', '#788AE2', '#FFFFFF', '#5C5C62', '#FFFFFF', NULL, NULL, NULL),
(4, 1, 'administrator', '#414552', '#788AE2', '#FFFFFF', '#5C5C62', '#FFFFFF', NULL, '2021-10-29 19:45:10', '2021-10-29 19:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `priority_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('open','pending','resolved','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priorities`
--

CREATE TABLE `ticket_priorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_templates`
--

CREATE TABLE `ticket_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todo_items`
--

CREATE TABLE `todo_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `todo_items`
--

INSERT INTO `todo_items` (`id`, `user_id`, `company_id`, `title`, `status`, `position`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'test', 'pending', 1, '2021-10-30 17:38:28', '2021-10-30 17:38:43'),
(2, 2, 1, 't', 'pending', 2, '2021-10-30 17:38:58', '2021-10-30 17:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `universal_searches`
--

CREATE TABLE `universal_searches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `searchable_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `searchable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `route_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `type` enum('frontend','backend') COLLATE utf8_unicode_ci DEFAULT 'backend',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `universal_searches`
--

INSERT INTO `universal_searches` (`id`, `company_id`, `location_id`, `searchable_id`, `searchable_type`, `title`, `route_name`, `count`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'about-us', 'Page', 'About Us', 'superadmin.pages.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(2, NULL, NULL, 'contact-us', 'Page', 'Contact Us', 'superadmin.pages.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(3, NULL, NULL, 'how-it-works', 'Page', 'How It Works', 'superadmin.pages.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(4, NULL, NULL, 'privacy-policy', 'Page', 'Privacy Policy', 'superadmin.pages.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(5, NULL, NULL, '1', 'Customer', 'Super Admin', 'admin.customers.show', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(6, NULL, NULL, '1', 'Customer', 'superadmin@example.com', 'admin.customers.show', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(7, NULL, NULL, '1', 'Location', 'Jaipur, India', 'superadmin.locations.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(8, NULL, NULL, '2', 'Location', 'New York, USA', 'superadmin.locations.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(9, NULL, NULL, '1', 'Company', 'Beauty Players', 'superadmin.companies.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-11-03 13:34:37'),
(10, 1, NULL, '2', 'Employee', 'admin', 'admin.employee.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(11, 1, NULL, '2', 'Employee', 'admin@example.com', 'admin.employee.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(12, 1, NULL, '3', 'Employee', 'Malik Griffith', 'admin.employee.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(13, 1, NULL, '3', 'Employee', 'malik@example.com', 'admin.employee.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(14, NULL, NULL, '1', 'Category', 'Hair', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(15, NULL, NULL, '2', 'Category', 'Nails', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(16, NULL, NULL, '3', 'Category', 'Body', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(17, NULL, NULL, '4', 'Category', 'Skin', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:10', '2021-10-29 19:45:10'),
(18, NULL, NULL, '5', 'Category', 'Face', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(19, NULL, NULL, '6', 'Category', 'Medical', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(20, NULL, NULL, '7', 'Category', 'Soften Skin', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(21, NULL, NULL, '8', 'Category', 'Pain Relief test', 'superadmin.categories.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-11-03 14:50:49'),
(45, NULL, 1, 'keywords', 'service', 'hair coloring', 'front.searchServices', 8, 'frontend', '2021-10-29 19:45:11', '2021-11-03 07:59:43'),
(46, NULL, 1, 'keywords', 'service', 'hair spa', 'front.searchServices', 6, 'frontend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(47, NULL, 1, 'keywords', 'service', 'manicure', 'front.searchServices', 5, 'frontend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(48, NULL, 1, 'keywords', 'service', 'facial', 'front.searchServices', 4, 'frontend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(49, NULL, 1, 'keywords', 'service', 'massage', 'front.searchServices', 3, 'frontend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(50, 1, NULL, '1', 'Deal', 'Choice Of deep-tissue-massage (50 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(51, 1, NULL, '2', 'Deal', 'Deal on Pedicure services (30 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(52, 1, NULL, '3', 'Deal', 'Choice of best HairCut (30 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(53, 1, NULL, '4', 'Deal', 'Head to Toe full body massage (180 Min)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(54, 1, NULL, '5', 'Deal', 'Get 70% off on Waxing (40 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(55, 1, NULL, '6', 'Deal', 'Best Choice Manicure (20 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(56, 1, NULL, '7', 'Deal', 'Get Best Hair Coloring (40 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(57, 1, NULL, '8', 'Deal', 'Best Choice Manicure (20 Mins)', 'admin.deals.edit', 0, 'backend', '2021-10-29 19:45:11', '2021-10-29 19:45:11'),
(64, NULL, NULL, '4', 'Customer', 'm,ljk jklkl', 'admin.customers.show', 0, 'backend', '2021-10-31 18:36:32', '2021-10-31 18:36:32'),
(65, NULL, NULL, '4', 'Customer', 'jklj@fff.com', 'admin.customers.show', 0, 'backend', '2021-10-31 18:36:32', '2021-10-31 18:36:32'),
(66, NULL, NULL, '5', 'Customer', 'ashish anand', 'admin.customers.show', 0, 'backend', '2021-11-02 05:15:56', '2021-11-02 05:15:56'),
(67, NULL, NULL, '5', 'Customer', 'ashish.maac7@gmail.com', 'admin.customers.show', 0, 'backend', '2021-11-02 05:15:56', '2021-11-02 05:15:56'),
(68, 1, NULL, '7', 'Product', 'Fruit Facial', 'admin.products.edit', 0, 'backend', '2021-11-02 11:14:33', '2021-11-02 11:14:33'),
(69, 1, NULL, '24', 'Service', 'Fruit Facial', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:16:45', '2021-11-02 11:16:45'),
(70, 1, NULL, '25', 'Service', 'Acne Prone Facial', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:18:40', '2021-11-02 11:18:40'),
(71, 1, NULL, '26', 'Service', 'Fruit Clean-Up', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:21:41', '2021-11-02 11:21:41'),
(72, 1, NULL, '27', 'Service', 'Acne Spots Facial', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:22:06', '2021-11-02 11:22:06'),
(73, 1, NULL, '28', 'Service', 'Open Pore Clean Up', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:23:18', '2021-11-02 11:23:18'),
(74, 1, NULL, '29', 'Service', 'Open Pore Facial', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:24:04', '2021-11-02 11:24:04'),
(75, 1, NULL, '30', 'Service', 'Acne Mark Clean Up', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:24:29', '2021-11-02 11:24:29'),
(76, 1, NULL, '31', 'Service', 'Anti Aging Clean Up', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:25:22', '2021-11-02 11:25:22'),
(77, 1, NULL, '32', 'Service', 'Pigmentation Clean Up', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:26:29', '2021-11-02 11:26:29'),
(78, 1, NULL, '33', 'Service', 'Anti D-Tan Clean Up', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:27:30', '2021-11-02 11:27:30'),
(79, 1, NULL, '34', 'Service', 'De-Tan Glow Facial', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:28:11', '2021-11-02 11:28:11'),
(80, 1, NULL, '35', 'Service', 'Magic Glow Deep Hydrating Facial', 'admin.business-services.edit', 0, 'backend', '2021-11-02 11:30:36', '2021-11-02 11:30:36'),
(81, NULL, NULL, '9', 'Category', 'test', 'superadmin.categories.edit', 0, 'backend', '2021-11-03 14:20:43', '2021-11-03 14:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calling_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `group_id`, `name`, `email`, `calling_code`, `mobile`, `mobile_verified`, `password`, `image`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `country_id`) VALUES
(1, NULL, NULL, 'Super Admin', 'superadmin@example.com', '+91', '1919191919', 0, '$2y$10$QcdFjS3oOF0qfu/q068Ve.HAZhmh0Jr2jzIlb624a8pw4t2dwOzkm', NULL, NULL, '2021-10-29 19:45:10', '2021-10-29 19:45:10', NULL, NULL),
(2, 1, NULL, 'admin', 'admin@example.com', NULL, NULL, 0, '$2y$10$emvupuA7oPFWpBLclZGH3uvSBjLYH81MNmalSXvKI9ERSN/sOF8hK', NULL, 'vBobk2fIgEsTVioiBlif11OTMZkVvnV2S7BWTXw6w53udyBfanhmDqFIWaLf', '2021-10-29 19:45:10', '2021-10-29 19:45:10', NULL, NULL),
(3, 1, NULL, 'Malik Griffith', 'malik@example.com', NULL, '1111', 0, '$2y$10$Unilnsre2dKJh.Y1OU8d5.0bYOGS.18gFzZBch.YE0CMwkDr/1Hdu', NULL, NULL, '2021-10-29 19:45:10', '2021-10-29 19:45:10', NULL, NULL),
(4, NULL, NULL, 'm,ljk jklkl', 'jklj@fff.com', '+91', '07042024020', 0, '$2y$10$r5BMkJXM5EkC2c3cBtGr0OjSKPb3VV7nEt18McsepKQkc.OrP9gra', NULL, NULL, '2021-10-31 18:36:32', '2021-10-31 18:36:32', NULL, NULL),
(5, NULL, NULL, 'ashish anand', 'ashish.maac7@gmail.com', '+91', '7042024020', 0, '$2y$10$AevPT154wZqVTrc6deiBm.KOTib5PiCzflN2MDeGegvtk0yfcB2NG', NULL, NULL, '2021-11-02 05:15:56', '2021-11-02 05:15:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_pages`
--

CREATE TABLE `vendor_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `primary_contact` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_contact` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photos` text COLLATE utf8_unicode_ci,
  `default_image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map_option` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deactive',
  `latitude` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `longitude` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendor_pages`
--

INSERT INTO `vendor_pages` (`id`, `company_id`, `address`, `description`, `primary_contact`, `secondary_contact`, `photos`, `default_image`, `og_image`, `seo_description`, `seo_keywords`, `map_option`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jaipur, India', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1234512345', NULL, NULL, NULL, NULL, NULL, NULL, 'deactive', '0', '0', '2021-10-29 19:45:10', '2021-10-29 19:45:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_company_id_foreign` (`company_id`),
  ADD KEY `bookings_coupon_id_foreign` (`coupon_id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_location_id_foreign` (`location_id`),
  ADD KEY `bookings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `booking_items`
--
ALTER TABLE `booking_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_items_company_id_foreign` (`company_id`),
  ADD KEY `booking_items_booking_id_foreign` (`booking_id`),
  ADD KEY `booking_items_business_service_id_foreign` (`business_service_id`),
  ADD KEY `booking_items_deal_id_foreign` (`deal_id`),
  ADD KEY `booking_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `booking_notifications`
--
ALTER TABLE `booking_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_notifactions_company_id_foreign` (`company_id`);

--
-- Indexes for table `booking_times`
--
ALTER TABLE `booking_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_times_company_id_foreign` (`company_id`);

--
-- Indexes for table `booking_user`
--
ALTER TABLE `booking_user`
  ADD PRIMARY KEY (`booking_id`,`user_id`),
  ADD KEY `booking_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `business_services`
--
ALTER TABLE `business_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_services_company_id_foreign` (`company_id`),
  ADD KEY `business_services_category_id_foreign` (`category_id`),
  ADD KEY `business_services_location_id_foreign` (`location_id`);

--
-- Indexes for table `business_service_user`
--
ALTER TABLE `business_service_user`
  ADD PRIMARY KEY (`business_service_id`,`user_id`),
  ADD KEY `business_service_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_slug_unique` (`slug`),
  ADD KEY `companies_currency_id_foreign` (`currency_id`),
  ADD KEY `companies_package_id_foreign` (`package_id`),
  ADD KEY `companies_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_users`
--
ALTER TABLE `coupon_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_users_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deals_company_id_foreign` (`company_id`),
  ADD KEY `deals_location_id_foreign` (`location_id`);

--
-- Indexes for table `deal_items`
--
ALTER TABLE `deal_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_items_deal_id_foreign` (`deal_id`),
  ADD KEY `deal_items_business_service_id_foreign` (`business_service_id`);

--
-- Indexes for table `employee_groups`
--
ALTER TABLE `employee_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_group_services`
--
ALTER TABLE `employee_group_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_group_services_employee_groups_id_foreign` (`employee_groups_id`),
  ADD KEY `employee_group_services_business_service_id_foreign` (`business_service_id`);

--
-- Indexes for table `employee_schedules`
--
ALTER TABLE `employee_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_schedules_company_id_foreign` (`company_id`),
  ADD KEY `employee_schedules_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `footer_settings`
--
ALTER TABLE `footer_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_faqs`
--
ALTER TABLE `front_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_faqs_language_id_foreign` (`language_id`);

--
-- Indexes for table `front_theme_settings`
--
ALTER TABLE `front_theme_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_widgets`
--
ALTER TABLE `front_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_account_details`
--
ALTER TABLE `gateway_account_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_account_details_company_id_foreign` (`company_id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_settings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `google_accounts`
--
ALTER TABLE `google_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `google_accounts_user_id_foreign` (`user_id`),
  ADD KEY `google_accounts_company_id_foreign` (`company_id`);

--
-- Indexes for table `google_captcha_settings`
--
ALTER TABLE `google_captcha_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_taxes`
--
ALTER TABLE `item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_taxes_tax_id_foreign` (`tax_id`),
  ADD KEY `item_taxes_service_id_foreign` (`service_id`),
  ADD KEY `item_taxes_deal_id_foreign` (`deal_id`),
  ADD KEY `item_taxes_product_id_foreign` (`product_id`),
  ADD KEY `item_taxes_company_id_foreign` (`company_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_employee_id_foreign` (`employee_id`),
  ADD KEY `leaves_company_id_foreign` (`company_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_country_id_foreign` (`country_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `office_leaves`
--
ALTER TABLE `office_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_invoices_company_id_foreign` (`company_id`),
  ADD KEY `offline_invoices_package_id_foreign` (`package_id`),
  ADD KEY `offline_invoices_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `offline_invoice_payments`
--
ALTER TABLE `offline_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_invoice_payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_invoice_payments_client_id_foreign` (`client_id`),
  ADD KEY `offline_invoice_payments_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_plan_changes_company_id_foreign` (`company_id`),
  ADD KEY `offline_plan_changes_package_id_foreign` (`package_id`),
  ADD KEY `offline_plan_changes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_plan_changes_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `package_modules`
--
ALTER TABLE `package_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`),
  ADD UNIQUE KEY `payments_event_id_unique` (`event_id`),
  ADD KEY `payments_company_id_foreign` (`company_id`),
  ADD KEY `payments_currency_id_foreign` (`currency_id`),
  ADD KEY `payments_booking_id_foreign` (`booking_id`),
  ADD KEY `payments_customer_id_foreign` (`customer_id`),
  ADD KEY `payments_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_credentials_company_id_foreign` (`company_id`);

--
-- Indexes for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_invoices_company_id_foreign` (`company_id`),
  ADD KEY `paypal_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_location_id_foreign` (`location_id`),
  ADD KEY `products_company_id_foreign` (`company_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_company_id_foreign` (`company_id`),
  ADD KEY `ratings_booking_id_foreign` (`booking_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_service_id_foreign` (`service_id`),
  ADD KEY `ratings_deal_id_foreign` (`deal_id`),
  ADD KEY `ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `razorpay_invoices_company_id_foreign` (`company_id`),
  ADD KEY `razorpay_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `razorpay_subscriptions`
--
ALTER TABLE `razorpay_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_company_id_name_unique` (`company_id`,`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_auth_settings`
--
ALTER TABLE `social_auth_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spotlight`
--
ALTER TABLE `spotlight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spotlight_company_id_foreign` (`company_id`),
  ADD KEY `spotlight_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_invoices_company_id_foreign` (`company_id`),
  ADD KEY `stripe_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`),
  ADD KEY `subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_vendor_id_foreign` (`vendor_id`),
  ADD KEY `tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `tickets_type_id_foreign` (`type_id`),
  ADD KEY `tickets_priority_id_foreign` (`priority_id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_priorities`
--
ALTER TABLE `ticket_priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_templates`
--
ALTER TABLE `ticket_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo_items`
--
ALTER TABLE `todo_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todo_items_user_id_foreign` (`user_id`),
  ADD KEY `todo_items_company_id_foreign` (`company_id`);

--
-- Indexes for table `universal_searches`
--
ALTER TABLE `universal_searches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universal_searches_company_id_foreign` (`company_id`),
  ADD KEY `universal_searches_location_id_foreign` (`location_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_company_id_foreign` (`company_id`),
  ADD KEY `users_country_id_foreign` (`country_id`);

--
-- Indexes for table `vendor_pages`
--
ALTER TABLE `vendor_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_pages_company_id_foreign` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking_items`
--
ALTER TABLE `booking_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking_notifications`
--
ALTER TABLE `booking_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_times`
--
ALTER TABLE `booking_times`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `business_services`
--
ALTER TABLE `business_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupon_users`
--
ALTER TABLE `coupon_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deal_items`
--
ALTER TABLE `deal_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_groups`
--
ALTER TABLE `employee_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_group_services`
--
ALTER TABLE `employee_group_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_schedules`
--
ALTER TABLE `employee_schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `footer_settings`
--
ALTER TABLE `footer_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_faqs`
--
ALTER TABLE `front_faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_theme_settings`
--
ALTER TABLE `front_theme_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_widgets`
--
ALTER TABLE `front_widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_account_details`
--
ALTER TABLE `gateway_account_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `google_accounts`
--
ALTER TABLE `google_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `google_captcha_settings`
--
ALTER TABLE `google_captcha_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_taxes`
--
ALTER TABLE `item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `office_leaves`
--
ALTER TABLE `office_leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_invoice_payments`
--
ALTER TABLE `offline_invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_modules`
--
ALTER TABLE `package_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_subscriptions`
--
ALTER TABLE `razorpay_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_settings`
--
ALTER TABLE `social_auth_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `spotlight`
--
ALTER TABLE `spotlight`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_priorities`
--
ALTER TABLE `ticket_priorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_templates`
--
ALTER TABLE `ticket_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo_items`
--
ALTER TABLE `todo_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `universal_searches`
--
ALTER TABLE `universal_searches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_pages`
--
ALTER TABLE `vendor_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_items`
--
ALTER TABLE `booking_items`
  ADD CONSTRAINT `booking_items_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_business_service_id_foreign` FOREIGN KEY (`business_service_id`) REFERENCES `business_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_notifications`
--
ALTER TABLE `booking_notifications`
  ADD CONSTRAINT `booking_notifactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_times`
--
ALTER TABLE `booking_times`
  ADD CONSTRAINT `booking_times_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_user`
--
ALTER TABLE `booking_user`
  ADD CONSTRAINT `booking_user_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `business_services`
--
ALTER TABLE `business_services`
  ADD CONSTRAINT `business_services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_services_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_services_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `business_service_user`
--
ALTER TABLE `business_service_user`
  ADD CONSTRAINT `business_service_user_business_service_id_foreign` FOREIGN KEY (`business_service_id`) REFERENCES `business_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_service_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_users`
--
ALTER TABLE `coupon_users`
  ADD CONSTRAINT `coupon_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupon_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deals_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deal_items`
--
ALTER TABLE `deal_items`
  ADD CONSTRAINT `deal_items_business_service_id_foreign` FOREIGN KEY (`business_service_id`) REFERENCES `business_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deal_items_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_groups`
--
ALTER TABLE `employee_groups`
  ADD CONSTRAINT `employee_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_group_services`
--
ALTER TABLE `employee_group_services`
  ADD CONSTRAINT `employee_group_services_business_service_id_foreign` FOREIGN KEY (`business_service_id`) REFERENCES `business_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_group_services_employee_groups_id_foreign` FOREIGN KEY (`employee_groups_id`) REFERENCES `employee_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_schedules`
--
ALTER TABLE `employee_schedules`
  ADD CONSTRAINT `employee_schedules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_schedules_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_faqs`
--
ALTER TABLE `front_faqs`
  ADD CONSTRAINT `front_faqs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gateway_account_details`
--
ALTER TABLE `gateway_account_details`
  ADD CONSTRAINT `gateway_account_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD CONSTRAINT `global_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `google_accounts`
--
ALTER TABLE `google_accounts`
  ADD CONSTRAINT `google_accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `google_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_taxes`
--
ALTER TABLE `item_taxes`
  ADD CONSTRAINT `item_taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_taxes_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_taxes_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `business_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD CONSTRAINT `module_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  ADD CONSTRAINT `offline_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_invoice_payments`
--
ALTER TABLE `offline_invoice_payments`
  ADD CONSTRAINT `offline_invoice_payments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoice_payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `offline_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoice_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD CONSTRAINT `offline_plan_changes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `offline_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD CONSTRAINT `payment_gateway_credentials_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD CONSTRAINT `paypal_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paypal_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `business_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  ADD CONSTRAINT `razorpay_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `razorpay_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spotlight`
--
ALTER TABLE `spotlight`
  ADD CONSTRAINT `spotlight_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spotlight_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD CONSTRAINT `stripe_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stripe_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD CONSTRAINT `theme_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priorities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `ticket_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `todo_items`
--
ALTER TABLE `todo_items`
  ADD CONSTRAINT `todo_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `universal_searches`
--
ALTER TABLE `universal_searches`
  ADD CONSTRAINT `universal_searches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `universal_searches_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vendor_pages`
--
ALTER TABLE `vendor_pages`
  ADD CONSTRAINT `vendor_pages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
