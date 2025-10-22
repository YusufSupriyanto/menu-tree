-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2025 at 01:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menu_tree`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `depth`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
('a02a8e7f-9d14-4045-8dc6-2556a5dbd666', 'System Management', 'b3b9b55a-3e0f-4b43-9307-cc4b9fa8e733', 1, 0, 1, '2025-10-20 21:33:18', '2025-10-20 21:33:18'),
('a02a8ee9-76df-472d-97c6-0d0ef00806b3', 'System', 'a02a8e7f-9d14-4045-8dc6-2556a5dbd666', 2, 0, 1, '2025-10-20 21:34:27', '2025-10-20 21:34:27'),
('a02a8f17-d820-4ae3-9040-1dcd210b347c', 'System code', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-20 21:34:57', '2025-10-20 21:34:57'),
('a02a8f6f-bc2f-48f8-a62d-55fddbe13323', 'Code Registration', 'a02a8f17-d820-4ae3-9040-1dcd210b347c', 4, 0, 1, '2025-10-20 21:35:55', '2025-10-20 21:35:55'),
('a02a910b-1326-4012-99dd-9ef9f7fc172a', 'Code Registration-2', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-20 21:40:24', '2025-10-20 21:40:24'),
('a02a9135-7256-4aca-9bdd-a017a9e3607a', 'Property', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-20 21:40:52', '2025-10-20 21:40:52'),
('a02a9146-8f91-4912-84c4-174dddd06e27', 'Menus', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-20 21:41:03', '2025-10-20 21:41:41'),
('a02a9160-57c1-462d-af9e-ef326f62973d', 'Api List', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-20 21:41:20', '2025-10-20 21:41:20'),
('a02a9193-cc8f-47a3-96e7-9474c1cd328e', 'Menu Registration', 'a02a9146-8f91-4912-84c4-174dddd06e27', 4, 0, 1, '2025-10-20 21:41:54', '2025-10-21 12:17:15'),
('a02a9237-0e27-4ffb-9c30-d4b12a3ebcf9', 'Api Registration', 'a02a9160-57c1-462d-af9e-ef326f62973d', 4, 0, 1, '2025-10-20 21:43:41', '2025-10-20 21:43:41'),
('a02a92ce-d180-405c-9a1e-c006b80c7ce5', 'Users & Groups', 'b3b9b55a-3e0f-4b43-9307-cc4b9fa8e733', 1, 0, 1, '2025-10-20 21:45:20', '2025-10-20 21:45:20'),
('a02a931d-8acf-4cf6-9e60-17fc213ced1e', 'User', 'a02a92ce-d180-405c-9a1e-c006b80c7ce5', 2, 0, 1, '2025-10-20 21:46:12', '2025-10-20 21:46:12'),
('a02a9336-3cf2-4bbf-8e1d-b33259b70087', 'Group', 'a02a92ce-d180-405c-9a1e-c006b80c7ce5', 2, 0, 1, '2025-10-20 21:46:28', '2025-10-20 21:46:28'),
('a02a935d-73bc-49a7-be61-e845c37bbff7', 'User Account Registration', 'a02a931d-8acf-4cf6-9e60-17fc213ced1e', 3, 0, 1, '2025-10-20 21:46:54', '2025-10-20 21:46:54'),
('a02a9374-3233-4c66-a5e6-a030924fc2ab', 'Group Account Registration', 'a02a9336-3cf2-4bbf-8e1d-b33259b70087', 3, 0, 1, '2025-10-20 21:47:09', '2025-10-20 21:47:09'),
('a02c929f-50ae-4349-8ba9-df6555822fbc', 'Api Edit', 'a02a9160-57c1-462d-af9e-ef326f62973d', 4, 0, 1, '2025-10-22 04:36:29', '2025-10-22 04:36:29'),
('b3b9b55a-3e0f-4b43-9307-cc4b9fa8e733', 'system management', NULL, 0, 0, 1, '2025-10-20 22:01:06', '2025-10-20 22:01:06');

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
(4, '2025_10_20_231102_create_menus_table', 1);

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
('57e11hebxXtcX6HAVn64CI72OX3Oru4qkhmI3LmA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWF1ZU1CamFpT01ISzVBbUU4N1dLWnNjSFc4QlVheTRFMVE1Qm8wNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tZW51cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761132989);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
