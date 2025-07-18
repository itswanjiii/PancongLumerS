-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2025 at 04:08 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pancong`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_addon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_addon` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `nama_addon`, `harga_addon`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Keju Cheddar', '2000.00', 1, '2025-06-24 23:35:45', '2025-07-14 02:37:15'),
(2, 'Milo', '2000.00', 1, '2025-06-24 23:35:45', '2025-07-14 02:37:24'),
(4, 'Mesis', '2000.00', 1, '2025-06-24 23:35:45', '2025-07-09 06:51:57'),
(5, 'Choco Crunchy', '3000.00', 1, '2025-06-24 23:35:45', '2025-07-14 02:37:37'),
(9, 'Oreo', '2000.00', 1, '2025-06-24 23:35:45', '2025-07-14 02:36:11'),
(11, 'Choco Chip', '2000.00', 1, '2025-07-14 02:37:53', '2025-07-14 02:37:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(6, 'Pancong Spesial', '2025-07-09 02:44:09', '2025-07-09 02:44:09'),
(7, 'Pancong Premium', '2025-07-14 02:15:01', '2025-07-14 02:15:01'),
(8, 'Pancong Polos', '2025-07-14 03:48:33', '2025-07-14 03:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `custom_order_items`
--

CREATE TABLE `custom_order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `base_menu_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `addons_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL,
  `selected_addons` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `judul`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'foto-galleries/test.png', '2025-06-24 23:51:18', '2025-06-24 23:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id_item` bigint UNSIGNED NOT NULL,
  `nama_item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id_item`, `nama_item`, `harga`, `gambar`, `kategori_id`, `created_at`, `updated_at`) VALUES
(4, 'Pancong Original', '5000.00', 'gambar-menu/pancong-original.jpeg', 7, '2025-07-14 02:15:36', '2025-07-14 11:09:36'),
(5, 'Pancong Mesis + Susu', '7000.00', 'gambar-menu/pancong-mesis-susu.jpeg', 7, '2025-07-14 02:16:02', '2025-07-14 11:09:49'),
(6, 'Pancong Keju + Susu', '7000.00', 'gambar-menu/pancong-keju-susu.jpeg', 7, '2025-07-14 02:16:25', '2025-07-14 11:10:03'),
(7, 'Pancong Milo + Susu', '7000.00', 'gambar-menu/pancong-milo-susu.jpeg', 7, '2025-07-14 02:18:31', '2025-07-14 11:10:20'),
(8, 'Pancong Oreo + Susu', '8000.00', 'gambar-menu/pancong-oreo-susu.jpeg', 7, '2025-07-14 02:18:49', '2025-07-14 11:11:19'),
(9, 'Pancong Taro', '8000.00', 'gambar-menu/pancong-taro.jpeg', 7, '2025-07-14 02:19:11', '2025-07-14 11:11:32'),
(10, 'Pancong Strawberry', '8000.00', 'gambar-menu/pancong-strawberry.jpeg', 7, '2025-07-14 02:19:31', '2025-07-14 11:11:44'),
(11, 'Pancong Greentea', '8000.00', 'gambar-menu/pancong-greentea.jpeg', 7, '2025-07-14 02:19:51', '2025-07-14 11:12:00'),
(12, 'Pancong Tiramisu', '8000.00', 'gambar-menu/pancong-tiramisu.jpeg', 7, '2025-07-14 02:20:10', '2025-07-14 11:12:23'),
(13, 'Pancong Blueberry', '8000.00', 'gambar-menu/pancong-blueberry.jpeg', 7, '2025-07-14 02:20:29', '2025-07-14 11:12:42'),
(14, 'Pancong Choco Cruncy', '10000.00', 'gambar-menu/pancong-choco-cruncy.jpeg', 7, '2025-07-14 02:20:50', '2025-07-14 11:13:43'),
(15, 'Pancong Taro + Keju + Susu', '11000.00', 'gambar-menu/pancong-taro-keju-susu.jpeg', 6, '2025-07-14 02:21:29', '2025-07-14 11:15:34'),
(16, 'Pancong Strawberry + Keju + Susu', '11000.00', 'gambar-menu/pancong-strawberry-keju-susu.jpeg', 6, '2025-07-14 02:21:56', '2025-07-14 11:16:20'),
(17, 'Pancong Greentea + Keju + Susu', '11000.00', 'gambar-menu/pancong-greentea-keju-susu.jpeg', 6, '2025-07-14 02:22:20', '2025-07-14 11:16:39'),
(18, 'Pancong Oreo + Keju + Susu', '11000.00', 'gambar-menu/pancong-oreo-keju-susu.jpeg', 6, '2025-07-14 02:22:54', '2025-07-14 11:15:55'),
(19, 'Pancong Choco Cruncy + Keju + Susu', '11000.00', 'gambar-menu/pancong-choco-cruncy-keju-susu.jpeg', 6, '2025-07-14 02:23:16', '2025-07-14 11:14:05'),
(20, 'Pancong Tiramisu + Keju + Susu', '11000.00', 'gambar-menu/pancong-tiramisu-keju-susu.jpeg', 6, '2025-07-14 02:24:22', '2025-07-14 11:17:06'),
(23, 'Pancong Nutella', '8000.00', 'gambar-menu/pancong-nutella.jpeg', 7, '2025-07-14 11:19:04', '2025-07-14 11:19:04'),
(24, 'Pancong Nutella + Keju', '11000.00', 'gambar-menu/pancong-nutella-keju.jpeg', 6, '2025-07-14 11:20:48', '2025-07-14 11:21:20'),
(25, 'Pancong Polos', '5000.00', 'gambar-menu/pancong-polos.png', 8, '2025-07-14 11:23:18', '2025-07-14 11:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `menu_addons`
--

CREATE TABLE `menu_addons` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `addon_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2025_06_20_063634_create_galleries_table', 1),
(5, '2025_06_20_063644_create_addons_table', 1),
(6, '2025_06_20_063645_create_categories_table', 1),
(7, '2025_06_20_063646_create_menus_table', 1),
(8, '2025_06_20_063647_create_menu_addons_table', 1),
(9, '2025_06_20_065200_create_users_table', 1),
(10, '2025_06_20_065326_create_orders_table', 1),
(11, '2025_06_20_065335_create_order_items_table', 1),
(12, '2025_06_22_123006_create_custom_order_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_pesanan` bigint UNSIGNED NOT NULL,
  `pelanggan_id` bigint UNSIGNED NOT NULL,
  `waktu_pesanan` date NOT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `no_meja` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Paid','Process','Ready','Done') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_pesanan`, `pelanggan_id`, `waktu_pesanan`, `total_harga`, `no_meja`, `catatan`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '2025-06-25', '44000.00', 'B2', 'test', 'Done', '2025-06-25 02:01:31', '2025-06-25 09:14:29'),
(2, 2, '2025-06-25', '26000.00', 'B2', NULL, 'Done', '2025-06-25 09:40:46', '2025-07-09 06:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `qty` int DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_akun` bigint UNSIGNED NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_akun`, `username`, `email`, `nama`, `no_telepon`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', 'Super Admin', '08123456789', 'admin', '$2y$12$S3AGDgOfQB7TTeJuARkKSuv9m15LPqd5KWBtAM4v5Vd/.VbHZbSei', NULL, '2025-06-24 23:35:45', '2025-06-24 23:35:45'),
(2, 'customer', 'customer@test.com', 'Customer Test', '08987654321', 'user', '$2y$12$OKJNB2b2SlcTxvZF08aKEu5xXNQitIBURlPW2HoqbD1.ayTcJvQqq', NULL, '2025-06-24 23:35:45', '2025-06-24 23:35:45'),
(3, 'test', 'test@gmail.com', 'test', '087883496544', 'user', '$2y$12$IchhjQl1zrrq9m7Yd9K1aeetA0zHSIZ5k0Tik6cz1ZLcXHdL0Ogmq', NULL, '2025-07-14 15:45:07', '2025-07-14 15:45:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_order_items`
--
ALTER TABLE `custom_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_order_items_order_id_foreign` (`order_id`),
  ADD KEY `custom_order_items_base_menu_id_foreign` (`base_menu_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `menus_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `menu_addons`
--
ALTER TABLE `menu_addons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_addons_menu_id_addon_id_unique` (`menu_id`,`addon_id`),
  ADD KEY `menu_addons_addon_id_foreign` (`addon_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `orders_pelanggan_id_foreign` (`pelanggan_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_menu_id_foreign` (`menu_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_akun`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `custom_order_items`
--
ALTER TABLE `custom_order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id_item` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `menu_addons`
--
ALTER TABLE `menu_addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_pesanan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_akun` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_order_items`
--
ALTER TABLE `custom_order_items`
  ADD CONSTRAINT `custom_order_items_base_menu_id_foreign` FOREIGN KEY (`base_menu_id`) REFERENCES `menus` (`id_item`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_pesanan`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_addons`
--
ALTER TABLE `menu_addons`
  ADD CONSTRAINT `menu_addons_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_addons_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id_item`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `users` (`id_akun`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id_item`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_pesanan`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
