-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 06:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `surname`, `email`, `birth_date`, `created_at`, `updated_at`) VALUES
(1, 'Mario', 'Rossi', NULL, NULL, NULL, NULL),
(2, 'Unknown', '', NULL, NULL, NULL, NULL),
(3, ' Alexandre', 'Dumas', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `author_book`
--

CREATE TABLE `author_book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fk_author` bigint(20) UNSIGNED DEFAULT NULL,
  `fk_book` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `author_book`
--

INSERT INTO `author_book` (`id`, `fk_author`, `fk_book`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, NULL),
(2, 2, 7, NULL, NULL),
(4, 2, 8, NULL, NULL),
(5, 3, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `publish_year` year(4) DEFAULT NULL,
  `number_pages` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `fk_category` bigint(20) UNSIGNED DEFAULT NULL,
  `fk_publisher` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `isbn`, `publish_year`, `number_pages`, `language`, `fk_category`, `fk_publisher`, `created_at`, `updated_at`) VALUES
(3, 'Tre io', '1323232', NULL, 300, 'inglese', 2, 1, '2024-11-14 18:41:15', '2024-11-17 22:03:49'),
(5, 'The Count of Monte Cristo', '1323434232', NULL, 300, 'inglese', 3, 1, '2024-11-14 18:41:15', '2024-11-17 21:54:25'),
(7, 'The sword of truth', '45434232', NULL, 10000, 'inglese', 1, 1, '2024-11-14 18:41:15', '2024-11-17 21:55:23'),
(8, 'Pride and prejudice', '1211212', NULL, NULL, NULL, 2, 2, '2024-11-17 21:39:47', '2024-11-17 21:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('042d13457d659ea20bb1beeee37ed8d8', 'i:1;', 1732003818),
('042d13457d659ea20bb1beeee37ed8d8:timer', 'i:1732003818;', 1732003818);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Fantasy', '', NULL, NULL),
(2, 'Novel', '', NULL, NULL),
(3, 'Adventure', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copies`
--

CREATE TABLE `copies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventory` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `condition` smallint(6) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `buy_date` date DEFAULT NULL,
  `fk_book` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `copies`
--

INSERT INTO `copies` (`id`, `inventory`, `status`, `condition`, `position`, `buy_date`, `fk_book`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'A', '2024-10-02', 3, NULL, '2024-11-17 21:29:52'),
(4, 2, 2, 3, '-', '2024-10-02', 3, NULL, NULL),
(6, 3, 1, 1, 'A', '2024-10-02', 5, NULL, NULL),
(1003, 10, 1, 2, 'p', '2012-04-04', 3, '2024-11-15 09:32:22', '2024-11-17 21:29:48'),
(1006, 454342321, 1, 1, NULL, NULL, 7, '2024-11-17 22:00:30', '2024-11-17 22:00:30'),
(1007, 454342322, 1, 1, NULL, NULL, 7, '2024-11-17 22:00:38', '2024-11-17 22:00:38'),
(1008, 12112121, 1, 1, NULL, NULL, 8, '2024-11-17 22:01:06', '2024-11-17 22:01:06'),
(1009, 12112122, 1, 1, NULL, NULL, 8, '2024-11-17 22:01:13', '2024-11-17 22:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `loan_start_date` date NOT NULL,
  `loan_expiration_date` date NOT NULL,
  `loan_real_end_date` date DEFAULT NULL,
  `fk_copy` bigint(20) UNSIGNED DEFAULT NULL,
  `fk_user` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `status`, `loan_start_date`, `loan_expiration_date`, `loan_real_end_date`, `fk_copy`, `fk_user`, `created_at`, `updated_at`) VALUES
(1, 0, '2024-11-15', '2024-12-15', '2024-11-17', 1, 1, '2024-11-15 09:11:53', '2024-11-17 21:29:52'),
(2, 0, '2024-11-14', '2024-12-14', '2024-11-15', 1003, 1, '2024-11-15 09:32:40', '2024-11-15 09:56:12'),
(3, 0, '2024-11-15', '2024-12-15', '2024-11-17', 1003, 1, '2024-11-15 09:59:59', '2024-11-17 21:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(83, '2024_11_05_133437_create_books_table', 2),
(84, '2024_11_05_135106_create_copies_table', 2),
(85, '2024_11_05_140233_create_authors_table', 2),
(86, '2024_11_05_140649_create_publishers_table', 2),
(87, '2024_11_05_140929_create_categories_table', 2),
(88, '2024_11_05_141059_create_personal_data_table', 2),
(89, '2024_11_05_141340_create_loans_table', 2),
(90, '2024_11_05_142213_create_author_book_table', 2),
(91, '2024_11_13_141907_add_two_factor_columns_to_users_table', 3),
(92, '2024_11_15_084733_alter_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_data`
--

CREATE TABLE `personal_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `address`, `website`, `email`, `created_at`, `updated_at`) VALUES
(1, 'NewModern', '', NULL, NULL, NULL, NULL),
(2, 'UnderCoverBooks', '', NULL, NULL, NULL, NULL),
(3, 'CommaLit', '', NULL, NULL, NULL, NULL),
(4, 'GreatReads', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vK5DTlPmZ6d1p5NqBkQd7cLOAOqeGIqQDZJtkE9M', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:132.0) Gecko/20100101 Firefox/132.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoib0g2V1M3RExESUNsbktDMm52SUw0YVlpVHNhMVZGczc0N3hpY3Q0biI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1732011753);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `blocked_until` date DEFAULT NULL,
  `role` smallint(6) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `fk_personal_data` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `created_at`, `updated_at`, `is_blocked`, `blocked_until`, `role`, `status`, `fk_personal_data`) VALUES
(1, 'utenteprova', '748fa66123fd07@inbox.mailtrap.io', '$2y$12$5GBBroErzxy6t9EgtWw8g.BrTXGjnvv4nq.MprtuG2sZwoLi91Faq', NULL, NULL, NULL, '2024-11-14 18:30:46', '2024-11-14 18:30:46', 0, NULL, 1, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_isbn_unique` (`isbn`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `copies_inventory_unique` (`inventory`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_data`
--
ALTER TABLE `personal_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `author_book`
--
ALTER TABLE `author_book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `copies`
--
ALTER TABLE `copies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `personal_data`
--
ALTER TABLE `personal_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
