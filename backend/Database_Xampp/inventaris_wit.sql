-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2026 at 02:38 PM
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
-- Database: `inventaris_wit`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `record_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asets`
--

CREATE TABLE `asets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_aset` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `kondisi` enum('baik','rusak_ringan','rusak_berat','maintenance') NOT NULL,
  `penanggung_jawab` varchar(255) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `status` enum('tersedia','dipinjam','maintenance','rusak') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asets`
--

INSERT INTO `asets` (`id`, `kode_aset`, `kategori`, `nama_barang`, `lokasi`, `kondisi`, `penanggung_jawab`, `harga`, `tanggal_pembelian`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ELK-LAP-001', 'Elektronik', 'Laptop Dell Latitude 5420', 'Ruang IT', 'baik', 'IT Department', 15000000.00, '2024-01-15', 'dipinjam', '2025-09-04 09:20:10', '2026-01-29 22:59:07'),
(2, 'ELK-LAP-002', 'Elektronik', 'Laptop Lenovo Thinkpad X1', 'Ruang IT', 'baik', 'IT Department', 18000000.00, '2024-02-20', 'dipinjam', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(3, 'ELK-LAP-003', 'Elektronik', 'Laptop HP EliteBook 840', 'Ruang IT', 'rusak_ringan', 'IT Department', 12000000.00, '2023-11-10', 'maintenance', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(4, 'ELK-PRN-001', 'Elektronik', 'Printer Canon G3010', 'Ruang Admin', 'baik', 'Admin Department', 2500000.00, '2024-03-10', 'dipinjam', '2025-09-04 09:20:10', '2025-09-25 01:48:07'),
(5, 'ELK-PRN-002', 'Elektronik', 'Printer HP LaserJet Pro', 'Ruang HR', 'baik', 'HR Department', 3200000.00, '2024-01-25', 'dipinjam', '2025-09-04 09:20:10', '2026-01-26 09:12:15'),
(6, 'ELK-PRJ-001', 'Elektronik', 'Proyektor Epson EB-X41', 'Ruang Meeting', 'maintenance', 'IT Department', 8000000.00, '2023-12-05', 'maintenance', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(7, 'ELK-PRJ-002', 'Elektronik', 'Proyektor BenQ MW632ST', 'Ruang Meeting', 'baik', 'IT Department', 6500000.00, '2024-02-10', 'dipinjam', '2025-09-04 09:20:10', '2025-09-24 17:51:02'),
(8, 'ELK-MON-001', 'Elektronik', 'Monitor LG UltraWide 29\"', 'Ruang IT', 'baik', 'IT Department', 3500000.00, '2024-01-30', 'dipinjam', '2025-09-04 09:20:10', '2026-02-04 21:08:58'),
(9, 'ELK-MON-002', 'Elektronik', 'Monitor Samsung 24\"', 'Ruang Admin', 'baik', 'Admin Department', 2800000.00, '2024-03-05', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(10, 'ELK-HP-001', 'Elektronik', 'Smartphone Samsung A52', 'Ruang IT', 'baik', 'IT Department', 4500000.00, '2024-02-15', 'dipinjam', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(11, 'ELK-HP-002', 'Elektronik', 'Smartphone iPhone 13', 'Ruang IT', 'baik', 'IT Department', 12000000.00, '2024-01-20', 'dipinjam', '2025-09-04 09:20:10', '2026-02-04 02:43:13'),
(12, 'ELK-AC-001', 'Elektronik', 'AC Daikin 1.5 PK', 'Ruang Meeting', 'baik', 'GA Department', 4500000.00, '2023-10-15', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(13, 'ELK-AC-002', 'Elektronik', 'AC Sharp 2 PK', 'Ruang IT', 'rusak_ringan', 'GA Department', 5500000.00, '2023-09-20', 'maintenance', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(14, 'NEL-MEJ-001', 'Non-Elektronik', 'Meja Kerja Kayu Jati', 'Ruang Admin', 'baik', 'GA Department', 2500000.00, '2023-08-10', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(15, 'NEL-MEJ-002', 'Non-Elektronik', 'Meja Meeting Besar', 'Ruang Meeting', 'baik', 'GA Department', 3500000.00, '2023-07-15', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(16, 'NEL-KUR-001', 'Non-Elektronik', 'Kursi Kantor Ergonomis', 'Ruang Admin', 'baik', 'GA Department', 1800000.00, '2023-08-10', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(17, 'NEL-KUR-002', 'Non-Elektronik', 'Kursi Meeting 12 Set', 'Ruang Meeting', 'baik', 'GA Department', 6000000.00, '2023-07-15', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(18, 'NEL-LEM-001', 'Non-Elektronik', 'Lemari Arsip 4 Pintu', 'Ruang Admin', 'baik', 'Admin Department', 2200000.00, '2023-06-20', 'dipinjam', '2025-09-04 09:20:10', '2026-01-29 23:05:22'),
(19, 'NEL-LEM-002', 'Non-Elektronik', 'Lemari Buku Kayu', 'Ruang IT', 'rusak_ringan', 'IT Department', 1500000.00, '2023-05-25', 'maintenance', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(20, 'NEL-RAK-001', 'Non-Elektronik', 'Rak Server 42U', 'Ruang IT', 'baik', 'IT Department', 8000000.00, '2023-04-10', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(21, 'NEL-WHT-001', 'Non-Elektronik', 'Whiteboard Magnetic 120x80', 'Ruang Meeting', 'baik', 'GA Department', 800000.00, '2023-09-05', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(22, 'NEL-KAR-001', 'Non-Elektronik', 'Karpet Kantor 3x4 meter', 'Ruang Meeting', 'baik', 'GA Department', 1200000.00, '2023-08-30', 'tersedia', '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(23, '1245', 'Elektronik', 'Latop', 'Gedung B', 'baik', 'ahwdha', 66.00, '2025-09-21', 'dipinjam', '2025-09-21 19:48:46', '2026-01-30 01:15:46');

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
(4, '2025_08_30_153608_create_personal_access_tokens_table', 1),
(5, '2025_08_30_153613_create_asets_table', 1),
(6, '2025_08_30_153619_create_mutasi_asets_table', 1),
(7, '2025_08_30_153625_create_activity_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_asets`
--

CREATE TABLE `mutasi_asets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aset_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_mutasi` enum('peminjaman','pengembalian') NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('pending','disetujui','ditolak','selesai') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutasi_asets`
--

INSERT INTO `mutasi_asets` (`id`, `aset_id`, `user_id`, `jenis_mutasi`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'peminjaman', '2025-09-04', '2025-09-10', 'ditolak', NULL, '2025-09-04 09:22:03', '2025-09-04 09:22:23'),
(2, 7, 2, 'peminjaman', '2025-09-25', '2025-09-27', 'disetujui', 'w', '2025-09-24 17:50:39', '2025-09-24 17:51:02'),
(3, 4, 2, 'peminjaman', '2025-09-25', '2025-09-26', 'disetujui', 'wwww', '2025-09-25 01:47:27', '2025-09-25 01:48:07'),
(4, 5, 2, 'peminjaman', '2026-01-26', '2026-01-28', 'disetujui', 'meminnjam printer', '2026-01-26 09:11:42', '2026-01-26 09:12:18'),
(5, 5, 2, 'peminjaman', '2026-01-26', '2026-01-28', 'disetujui', 'meminnjam printer', '2026-01-26 09:11:43', '2026-01-26 09:12:15'),
(6, 1, 2, 'peminjaman', '2026-02-07', '2026-03-14', 'disetujui', NULL, '2026-01-29 22:58:47', '2026-01-29 22:59:17'),
(7, 1, 2, 'peminjaman', '2026-02-07', '2026-03-14', 'disetujui', NULL, '2026-01-29 22:58:48', '2026-01-29 22:59:12'),
(8, 1, 2, 'peminjaman', '2026-02-07', '2026-03-14', 'disetujui', NULL, '2026-01-29 22:58:49', '2026-01-29 22:59:07'),
(9, 18, 2, 'peminjaman', '2026-01-17', '2026-01-27', 'disetujui', NULL, '2026-01-29 23:04:25', '2026-01-29 23:05:22'),
(10, 23, 2, 'peminjaman', '2026-01-22', '2026-01-28', 'disetujui', NULL, '2026-01-30 01:14:45', '2026-01-30 01:15:46'),
(11, 12, 2, 'pengembalian', '2026-02-10', '2026-02-11', 'disetujui', NULL, '2026-02-01 00:20:40', '2026-02-01 00:21:00'),
(12, 11, 2, 'peminjaman', '2026-02-05', '2026-02-07', 'disetujui', 'hhh', '2026-02-04 02:42:39', '2026-02-04 02:43:13'),
(13, 8, 2, 'peminjaman', '2026-02-05', '2026-02-19', 'disetujui', 'wwww', '2026-02-04 21:08:31', '2026-02-04 21:08:58');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth-token', 'a160d323fefd0a1cce142779bae3b64b28972bed8014bb65709008fd20b7a849', '[\"*\"]', '2025-09-04 09:21:05', NULL, '2025-09-04 09:20:52', '2025-09-04 09:21:05'),
(3, 'App\\Models\\User', 1, 'auth-token', '001c724e464d04562089150add3ef73bb331c3df65ddbfeea9fb2eb6aee8cee1', '[\"*\"]', '2025-09-04 09:23:36', NULL, '2025-09-04 09:23:35', '2025-09-04 09:23:36'),
(4, 'App\\Models\\User', 1, 'auth-token', '80cf4465ae8e4784c4a635bbeb8295a007a1698bf281050faf2712e99166b585', '[\"*\"]', '2025-09-04 09:24:18', NULL, '2025-09-04 09:24:16', '2025-09-04 09:24:18'),
(5, 'App\\Models\\User', 1, 'auth-token', '79d090b12405b89df17a470d779134efc96f70bb44981f2721271ac073e6e877', '[\"*\"]', '2025-09-04 09:26:05', NULL, '2025-09-04 09:26:02', '2025-09-04 09:26:05'),
(6, 'App\\Models\\User', 1, 'auth-token', '8188650d92000a9532478b31b653663e115f0d2885073a5266350d245010215a', '[\"*\"]', '2025-09-04 09:27:06', NULL, '2025-09-04 09:27:05', '2025-09-04 09:27:06'),
(7, 'App\\Models\\User', 1, 'auth-token', '3fae78a48a561192f95ef28a54cd6b4bb17ce0c8f578c5ecc0470a10b438806c', '[\"*\"]', '2025-09-04 09:31:12', NULL, '2025-09-04 09:31:07', '2025-09-04 09:31:12'),
(8, 'App\\Models\\User', 1, 'auth-token', '361b5eb92f18667d264c26a377929495914ba37f23fee79955db90cd6ebec113', '[\"*\"]', '2025-09-04 09:36:13', NULL, '2025-09-04 09:34:56', '2025-09-04 09:36:13'),
(9, 'App\\Models\\User', 1, 'auth-token', '66ebbe69a6a9392136993310718f18e0cbc4ba3488b1c951e8837f5a195dee38', '[\"*\"]', '2025-09-11 02:39:50', NULL, '2025-09-11 02:39:30', '2025-09-11 02:39:50'),
(10, 'App\\Models\\User', 1, 'auth-token', '3766215152df42d07c8a977a2d26c23461bd8cbb2c8c7699e32accae596a4466', '[\"*\"]', '2025-09-14 20:48:42', NULL, '2025-09-14 20:46:32', '2025-09-14 20:48:42'),
(11, 'App\\Models\\User', 1, 'auth-token', 'd2306da36e7b041205e7456ae5949668d48e08cfc910dd1c7fc18f2aa7e80190', '[\"*\"]', '2025-09-17 02:11:35', NULL, '2025-09-17 02:10:15', '2025-09-17 02:11:35'),
(12, 'App\\Models\\User', 1, 'auth-token', '938e32f12a1f1305a50d79fdfa7ca500c7dfbdee92be8fabca1cb8edf5ff271e', '[\"*\"]', '2025-09-21 19:50:43', NULL, '2025-09-21 19:45:01', '2025-09-21 19:50:43'),
(14, 'App\\Models\\User', 2, 'auth-token', 'e86a494cc1ec06932d7fff92094ce503da07f569d1a69f21aa62529f4ca8fc7d', '[\"*\"]', '2025-09-24 17:49:35', NULL, '2025-09-24 17:49:32', '2025-09-24 17:49:35'),
(21, 'App\\Models\\User', 1, 'auth-token', '59b98376ce3dd1a6cfc91cf74ac61ea623a7c54105b4dee3c572f9a324eacd48', '[\"*\"]', '2025-09-25 01:49:58', NULL, '2025-09-25 01:47:50', '2025-09-25 01:49:58'),
(22, 'App\\Models\\User', 1, 'auth-token', '10b2afc68a41f5a4034b783280b6d330f04b1e137487329660483d773f8c85cb', '[\"*\"]', '2025-10-05 05:31:27', NULL, '2025-10-05 05:29:37', '2025-10-05 05:31:27'),
(23, 'App\\Models\\User', 1, 'auth-token', '5edf34452c79e37b9da109a8e70c934a97cf0c2b45b997e624987dc35030457c', '[\"*\"]', '2025-12-12 21:29:34', NULL, '2025-12-12 20:50:07', '2025-12-12 21:29:34'),
(27, 'App\\Models\\User', 1, 'auth-token', 'aa195a0fc534502eb066b325b5ef424f088b2d69002fd8285aaed7ec857a8b32', '[\"*\"]', '2026-01-26 09:12:33', NULL, '2026-01-26 09:12:30', '2026-01-26 09:12:33'),
(28, 'App\\Models\\User', 1, 'auth-token', 'f62bec881f7d8f3467c3a8782e93918bee9ad4e297dea842b849215f3d71f69a', '[\"*\"]', '2026-01-28 09:50:40', NULL, '2026-01-28 09:41:59', '2026-01-28 09:50:40'),
(34, 'App\\Models\\User', 1, 'auth-token', '3f8d34eedc25526d9a0cc65c1439c3b7bf1383116689c6b80b46010c7f1c71f8', '[\"*\"]', '2026-01-29 23:09:34', NULL, '2026-01-29 23:06:40', '2026-01-29 23:09:34'),
(38, 'App\\Models\\User', 2, 'auth-token', '813c659f06d094d4760f3aed00fb1f5cea4e0fbf2032d0db1ac36ab11a30a203', '[\"*\"]', '2026-01-30 01:17:17', NULL, '2026-01-30 01:16:03', '2026-01-30 01:17:17'),
(41, 'App\\Models\\User', 1, 'auth-token', 'b9d9706fa6ed43090d2f24399eb78ac476268dd40dc68451f36d4e7704514839', '[\"*\"]', '2026-02-01 00:34:11', NULL, '2026-02-01 00:20:52', '2026-02-01 00:34:11'),
(50, 'App\\Models\\User', 1, 'auth-token', 'b88e84f75e5154611bf5b2a29cd6229848e77ffeacfaff77b05f38a6c5656078', '[\"*\"]', '2026-02-04 22:17:32', NULL, '2026-02-04 22:17:27', '2026-02-04 22:17:32');

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
('0jZp1HqHjdYBLA0NXz9UMezpvQpDsh86KDanouvu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVpQOU1EdnQzanlVY2xESTBidlJhVFR4ZVdPT01sZ3N5RG45b3NLaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769443733),
('GbXULSBU3WZ7Zqtd2Cv7W1Fwgv5YCuE3G1kVQi8O', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnR1a0pBZmREVVR3Z21iNVVvdDd0UnBTWXEyM0NRamR2OVcxQTZYMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765597785),
('rCbOwHcwJgNKP0zDP6ogXkGnnejnPM5yHAgBf20N', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTBsTW9xejZNUFpxMTU5MnZTTFZIMTd5N0JodXVOakNoQnltR3ZKTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769752644);

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
  `role` enum('admin','staff') NOT NULL DEFAULT 'staff',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin WIT', 'admin@wit.id', NULL, '$2y$12$bha4ClAyy2TrjOn4iS/fNedfvJDfl4CIrqlWCca/Suoibq.vB4l1u', 'admin', NULL, '2025-09-04 09:20:10', '2025-09-04 09:20:10'),
(2, 'Staff WIT', 'staff@wit.id', NULL, '$2y$12$LIZdkDuP2tQ9dU5ivsUKR.wDeMHwMPeiBcADZFKUO5bslV44/4Djm', 'staff', NULL, '2025-09-04 09:20:10', '2025-09-04 09:20:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `asets`
--
ALTER TABLE `asets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asets_kode_aset_unique` (`kode_aset`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_asets`
--
ALTER TABLE `mutasi_asets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mutasi_asets_aset_id_foreign` (`aset_id`),
  ADD KEY `mutasi_asets_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asets`
--
ALTER TABLE `asets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mutasi_asets`
--
ALTER TABLE `mutasi_asets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mutasi_asets`
--
ALTER TABLE `mutasi_asets`
  ADD CONSTRAINT `mutasi_asets_aset_id_foreign` FOREIGN KEY (`aset_id`) REFERENCES `asets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mutasi_asets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
