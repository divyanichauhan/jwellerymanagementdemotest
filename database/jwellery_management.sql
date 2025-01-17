-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2020 at 08:38 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jwellery_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quntity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quntity`, `created_at`, `updated_at`, `cat_id`) VALUES
(3, 1, 6, 2, '2020-05-27 00:43:41', '2020-05-27 00:43:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `price`) VALUES
(1, 'silver', '100'),
(2, 'gold', '200');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_26_060710_add_votes_to_users_table', 1),
(5, '2020_05_26_090346_category', 1),
(6, '2020_05_26_095155_product', 2),
(7, '2020_05_26_104058_add_votes_to_product_table', 3),
(8, '2016_06_01_000001_create_oauth_auth_codes_table', 4),
(9, '2016_06_01_000002_create_oauth_access_tokens_table', 4),
(10, '2016_06_01_000003_create_oauth_refresh_tokens_table', 4),
(11, '2016_06_01_000004_create_oauth_clients_table', 4),
(12, '2016_06_01_000005_create_oauth_personal_access_clients_table', 4),
(13, '2020_05_26_104916_product_depend_category', 5),
(14, '2020_05_27_052333_cart', 5),
(15, '2020_05_27_054030_add_paid_to_cart_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '0UpYggoFn8ab0LWZZSaRVv5w2eGAsLHd5tQn8zmv', NULL, 'http://localhost', 1, 0, 0, '2020-05-26 23:42:54', '2020-05-26 23:42:54'),
(2, NULL, 'Laravel Password Grant Client', 'YTktPQUTY4TGrE5FvPQqO3Jvqv2n3EazEdxEO5Zj', 'users', 'http://localhost', 0, 1, 0, '2020-05-26 23:42:54', '2020-05-26 23:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-26 23:42:54', '2020-05-26 23:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `cat_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `cat_id`, `description`, `image`, `created_at`, `updated_at`) VALUES
(6, 'test', '34.00', '[\"1\",\"2\"]', 'test', '[\"5ecdea576925b1590553175.jpeg\",\"5ecdea577f1f11590553175.jpeg\",\"5ecdea57815191590553175.jpeg\"]', '2020-05-26 09:42:37', '2020-05-26 22:49:35'),
(7, 'dev', '23.00', '[\"1\",\"2\"]', 'teat', '[\"1590505977.jpeg\",\"1590505977.jpeg\",\"1590505977.jpeg\"]', '2020-05-26 09:42:57', '2020-05-26 09:42:57'),
(8, 'dev', '23.00', '[\"1\",\"2\"]', 'teat', '[\"1590505980.jpeg\",\"1590505980.jpeg\",\"1590505980.jpeg\"]', '2020-05-26 09:43:00', '2020-05-26 09:43:00'),
(9, 'cdcd', '34.00', '[\"1\",\"2\"]', '43', '[\"1590506073.jpeg\",\"1590506073.jpeg\"]', '2020-05-26 09:44:33', '2020-05-26 09:44:33'),
(10, 'test343', '34.00', '[\"1\",\"2\"]', '344', '[\"1590506128.jpeg\",\"1590506128.jpeg\"]', '2020-05-26 09:45:28', '2020-05-26 09:45:28'),
(11, 'test343', '34.00', '[\"1\",\"2\"]', '344', '[\"1590506144.jpeg\",\"1590506144.jpeg\"]', '2020-05-26 09:45:44', '2020-05-26 09:45:44'),
(12, 'cdcdcdcdc', '344.00', '[\"1\",\"2\"]', '3434344', '[\"1590506231.jpeg\",\"1590506232.jpeg\",\"1590506232.jpeg\",\"1590506232.jpeg\"]', '2020-05-26 09:47:12', '2020-05-26 09:47:12'),
(13, 'cdcdcdcdc', '344.00', '[\"1\",\"2\"]', '3434344', '[\"1590506244.jpeg\",\"1590506244.jpeg\",\"1590506244.jpeg\",\"1590506244.jpeg\"]', '2020-05-26 09:47:24', '2020-05-26 09:47:24'),
(14, 'eeeeeeeeeeeeee', '33.00', '[\"1\"]', 'eeeeeeeeeee', '[\"1590506269.jpeg\"]', '2020-05-26 09:47:49', '2020-05-26 09:47:49'),
(15, '111111111', '111.00', '[\"1\"]', '11111', '[\"1590506317.jpeg\",\"1590506317.jpeg\"]', '2020-05-26 09:48:37', '2020-05-26 09:48:37'),
(16, '111', '111.00', '[\"1\"]', '11', '[\"1590506389.jpeg\"]', '2020-05-26 09:49:49', '2020-05-26 09:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_depend_category`
--

CREATE TABLE `product_depend_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_depend_category`
--

INSERT INTO `product_depend_category` (`id`, `cat_id`, `product_id`, `updated_at`, `created_at`) VALUES
(32, 1, 1, '2020-05-26 09:37:00', '2020-05-26 09:37:00'),
(33, 2, 1, '2020-05-26 09:37:00', '2020-05-26 09:37:00'),
(34, 1, 2, '2020-05-26 09:39:56', '2020-05-26 09:39:56'),
(35, 1, 3, '2020-05-26 09:40:20', '2020-05-26 09:40:20'),
(36, 2, 3, '2020-05-26 09:40:20', '2020-05-26 09:40:20'),
(37, 1, 4, '2020-05-26 09:40:54', '2020-05-26 09:40:54'),
(38, 1, 5, '2020-05-26 09:41:17', '2020-05-26 09:41:17'),
(39, 2, 5, '2020-05-26 09:41:17', '2020-05-26 09:41:17'),
(42, 1, 7, '2020-05-26 09:42:57', '2020-05-26 09:42:57'),
(43, 2, 7, '2020-05-26 09:42:57', '2020-05-26 09:42:57'),
(44, 1, 8, '2020-05-26 09:43:00', '2020-05-26 09:43:00'),
(45, 2, 8, '2020-05-26 09:43:00', '2020-05-26 09:43:00'),
(46, 1, 9, '2020-05-26 09:44:33', '2020-05-26 09:44:33'),
(47, 2, 9, '2020-05-26 09:44:33', '2020-05-26 09:44:33'),
(48, 1, 10, '2020-05-26 09:45:28', '2020-05-26 09:45:28'),
(49, 2, 10, '2020-05-26 09:45:29', '2020-05-26 09:45:29'),
(50, 1, 11, '2020-05-26 09:45:45', '2020-05-26 09:45:45'),
(51, 2, 11, '2020-05-26 09:45:45', '2020-05-26 09:45:45'),
(52, 1, 12, '2020-05-26 09:47:12', '2020-05-26 09:47:12'),
(53, 2, 12, '2020-05-26 09:47:12', '2020-05-26 09:47:12'),
(54, 1, 13, '2020-05-26 09:47:24', '2020-05-26 09:47:24'),
(55, 2, 13, '2020-05-26 09:47:24', '2020-05-26 09:47:24'),
(56, 1, 14, '2020-05-26 09:47:49', '2020-05-26 09:47:49'),
(57, 1, 15, '2020-05-26 09:48:37', '2020-05-26 09:48:37'),
(58, 1, 16, '2020-05-26 09:49:49', '2020-05-26 09:49:49'),
(59, 1, 6, '2020-05-26 22:49:35', '2020-05-26 22:49:35'),
(60, 2, 6, '2020-05-26 22:49:35', '2020-05-26 22:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `is_admin`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@gmail.com', 0, NULL, '$2y$10$H3qlQM26V/tyhHD3vO5x5.zHtULz7mbMWx1fJsGwELr6gE2Hg56nC', NULL, '2020-05-26 03:54:31', '2020-05-26 03:54:31'),
(2, 'admin', 'admin@gmail.com', 1, NULL, '$2y$10$7J49fmA0Z1vUbWB4CypTnO1rBWzhH9PrHbJzTDLder/g7kRbJBdi6', NULL, '2020-05-26 03:58:21', '2020-05-26 03:58:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_depend_category`
--
ALTER TABLE `product_depend_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_depend_category`
--
ALTER TABLE `product_depend_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
