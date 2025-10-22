-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.4.3 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk menu-tree
DROP DATABASE IF EXISTS `menu-tree`;
CREATE DATABASE IF NOT EXISTS `menu-tree` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `menu-tree`;

-- membuang struktur untuk table menu-tree.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.cache: ~0 rows (lebih kurang)

-- membuang struktur untuk table menu-tree.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.cache_locks: ~0 rows (lebih kurang)

-- membuang struktur untuk table menu-tree.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table menu-tree.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table menu-tree.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.job_batches: ~0 rows (lebih kurang)

-- membuang struktur untuk table menu-tree.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` int NOT NULL DEFAULT '1',
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.menus: ~0 rows (lebih kurang)
INSERT INTO `menus` (`id`, `name`, `parent_id`, `depth`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
	('a02a8e7f-9d14-4045-8dc6-2556a5dbd666', 'System Management', 'b3b9b55a-3e0f-4b43-9307-cc4b9fa8e733', 1, 0, 1, '2025-10-21 04:33:18', '2025-10-21 04:33:18'),
	('a02a8ee9-76df-472d-97c6-0d0ef00806b3', 'System', 'a02a8e7f-9d14-4045-8dc6-2556a5dbd666', 2, 0, 1, '2025-10-21 04:34:27', '2025-10-21 04:34:27'),
	('a02a8f17-d820-4ae3-9040-1dcd210b347c', 'System code', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-21 04:34:57', '2025-10-21 04:34:57'),
	('a02a8f6f-bc2f-48f8-a62d-55fddbe13323', 'Code Registration', 'a02a8f17-d820-4ae3-9040-1dcd210b347c', 4, 0, 1, '2025-10-21 04:35:55', '2025-10-21 04:35:55'),
	('a02a910b-1326-4012-99dd-9ef9f7fc172a', 'Code Registration-2', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-21 04:40:24', '2025-10-21 04:40:24'),
	('a02a9135-7256-4aca-9bdd-a017a9e3607a', 'Property', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-21 04:40:52', '2025-10-21 04:40:52'),
	('a02a9146-8f91-4912-84c4-174dddd06e27', 'Menus', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-21 04:41:03', '2025-10-21 04:41:41'),
	('a02a9160-57c1-462d-af9e-ef326f62973d', 'Api List', 'a02a8ee9-76df-472d-97c6-0d0ef00806b3', 3, 0, 1, '2025-10-21 04:41:20', '2025-10-21 04:41:20'),
	('a02a9193-cc8f-47a3-96e7-9474c1cd328e', 'Menu Registration', 'a02a9146-8f91-4912-84c4-174dddd06e27', 4, 0, 1, '2025-10-21 04:41:54', '2025-10-21 19:17:15'),
	('a02a9237-0e27-4ffb-9c30-d4b12a3ebcf9', 'Api Registration', 'a02a9160-57c1-462d-af9e-ef326f62973d', 4, 0, 1, '2025-10-21 04:43:41', '2025-10-21 04:43:41'),
	('a02a92ce-d180-405c-9a1e-c006b80c7ce5', 'Users & Groups', 'b3b9b55a-3e0f-4b43-9307-cc4b9fa8e733', 1, 0, 1, '2025-10-21 04:45:20', '2025-10-21 04:45:20'),
	('a02a931d-8acf-4cf6-9e60-17fc213ced1e', 'User', 'a02a92ce-d180-405c-9a1e-c006b80c7ce5', 2, 0, 1, '2025-10-21 04:46:12', '2025-10-21 04:46:12'),
	('a02a9336-3cf2-4bbf-8e1d-b33259b70087', 'Group', 'a02a92ce-d180-405c-9a1e-c006b80c7ce5', 2, 0, 1, '2025-10-21 04:46:28', '2025-10-21 04:46:28'),
	('a02a935d-73bc-49a7-be61-e845c37bbff7', 'User Account Registration', 'a02a931d-8acf-4cf6-9e60-17fc213ced1e', 3, 0, 1, '2025-10-21 04:46:54', '2025-10-21 04:46:54'),
	('a02a9374-3233-4c66-a5e6-a030924fc2ab', 'Group Account Registration', 'a02a9336-3cf2-4bbf-8e1d-b33259b70087', 3, 0, 1, '2025-10-21 04:47:09', '2025-10-21 04:47:09'),
	('b3b9b55a-3e0f-4b43-9307-cc4b9fa8e733', 'system management', NULL, 0, 0, 1, '2025-10-21 05:01:06', '2025-10-21 05:01:06');

-- membuang struktur untuk table menu-tree.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.migrations: ~1 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_10_20_231102_create_menus_table', 1);

-- membuang struktur untuk table menu-tree.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.password_reset_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table menu-tree.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.sessions: ~0 rows (lebih kurang)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('bdYLhoTjw9NLdBnUKjCq3B08dMhq3qexlPvynBSe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmJSRnlUUXdPdHFSYnBMNVRGWkFWOFdDUGI0R2Faaks2aERvV0pQUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tZW51cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761048576),
	('MduKgusJPDNzWPVjZKWFXfAq5SfR1e3xh6nctgZ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXRoOEpORTR4Y0hqWGk0QjVwOWtmV1Q0a1J2SVF3aXJVUUtacTFSMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tZW51cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1761099737);

-- membuang struktur untuk table menu-tree.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel menu-tree.users: ~0 rows (lebih kurang)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
