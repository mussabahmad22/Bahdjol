-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2022 at 01:42 AM
-- Server version: 5.7.40-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codecoyc_bahdjol`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `subcat_id` bigint(20) UNSIGNED NOT NULL,
  `agent_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `longitude` double NOT NULL,
  `agent_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_avg_rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `cat_id`, `subcat_id`, `agent_name`, `lat`, `longitude`, `agent_phone`, `agent_email`, `password`, `device_token`, `agent_avg_rating`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'Mussab Ahmad CC', 31.467742, 74.280637, '+923039307170', 'mussab1@gmail.com', '11223344', 'dxYxBVDrRciw9y4wv-DcoM:APA91bFlMT4nofdocl_UHfDw2ZTv7Lrm6ghPbBxTUMK63_5SSVeZ0q6vnJfPJciLu6bY0OM1UEYdL5E9cHuOO7ZhiNkm9mM39hyFtyMs4G8bfvd1y46l251rNGIvHTihHJk8l1Y14qq_', NULL, '2022-08-15 06:03:47', '2022-11-08 14:31:41'),
(10, 3, 2, 'Ali', 45.554544, 12.454645, '+923039307170', 'mussab2@gmail.com', '11223344', '', NULL, '2022-08-18 05:14:55', '2022-08-18 05:30:55'),
(11, 3, 2, 'Yasir', 54.456454, 58.545684, '+923039307179', 'mussab3@gmail.com', '11223344', 'e7rlgtpzQ0WdFgdx5x36XJ:APA91bHuconoVxr1q-azjLxNYuageLqgLsFOcFuVxc3J99Mv85ETYySdatvGLWgDwq0SQ0hbxRtVQHYVN1h5tS3nNKC_I9JbNjDcIZ2aAsFW6xNK0jKjKaI9_tUFSEybavavrquZrQYo', NULL, '2022-08-18 05:31:15', '2022-12-02 16:16:42'),
(12, 3, 2, 'Babar Aly', 65.789654, 74.568635, '03039307170', 'mussab4@gmail.com', '11223344', 'enA_XhSfTKK2VVQlKb1jJv:APA91bFwko-paUW7-HQkKitdszOsVi0p_N9mgc7kEeLAc0dOLLQpcI8RDAoZM7EsXBwbMZECX7gpVkymP_dgFLPyuFHUEGgKtCVYPoVcCm1FKrY1ImoDTbwdUFOhClli-ij_rC_x5ee4', '4.2', '2022-08-19 07:01:06', '2022-12-05 16:45:04'),
(13, 3, 4, 'Mussab Ahmad new agent', 31.467019, 74.289341, '+923039307170', 'mussab@gmail.com', '11223344', 'dsukjshfjskdgfsdjhgfsdjhfgj', NULL, '2022-09-06 05:49:21', '2022-12-01 11:53:40'),
(14, 1, 1, 'Mussab Ahmad', 29.498628, 71.727956, '+923039307170', 'admindsafsdaf@admin.com', '11223344', 'fHbSELdkTs6dQ_Z4MiDX67:APA91bFftsaZ9gqItmO_Yx_hYvTTLKGCGWARuFqcG77xwB2R_IFlV5tzezMrn0IJWiPQS6uKzDnMq7pAdpfzhX7luiVPt6Tp8OPVtOLmTrbrYWGoiAISf2T7OlS4azU2BmAHkMMTt0KH', NULL, '2022-10-26 04:41:04', '2022-11-15 00:36:11'),
(15, 1, 2, 'liyana', 31.469131, 74.265437, '726382743345', 'liyana@gmail.com', 'liyana123', NULL, '0', '2022-12-09 11:28:45', '2022-12-09 11:28:45'),
(16, 1, 1, 'rthrth', 31.474489, 74.251633, 'gfhfgh', 'admin@admin.com', 'admin123', NULL, '0', '2022-12-09 11:30:02', '2022-12-09 11:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `agent_details`
--

CREATE TABLE `agent_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_details`
--

INSERT INTO `agent_details` (`id`, `request_id`, `agent_id`, `status`, `created_at`, `updated_at`) VALUES
(52, 41, 12, '2', '2022-12-01 17:56:02', '2022-12-01 17:58:17'),
(56, 42, 12, '2', '2022-12-01 18:01:55', '2022-12-01 18:03:07'),
(59, 43, 12, '2', '2022-12-01 18:18:14', '2022-12-01 18:18:54'),
(62, 44, 12, '2', '2022-12-01 18:53:57', '2022-12-01 18:54:15'),
(65, 45, 12, '2', '2022-12-01 19:04:36', '2022-12-01 19:20:42'),
(68, 46, 12, '2', '2022-12-01 19:20:05', '2022-12-01 19:20:38'),
(71, 47, 12, '2', '2022-12-01 19:46:05', '2022-12-01 19:47:24'),
(74, 48, 12, '2', '2022-12-01 20:37:21', '2022-12-01 20:37:49'),
(77, 49, 12, '2', '2022-12-01 20:40:50', '2022-12-01 20:41:05'),
(80, 50, 12, '2', '2022-12-02 12:06:01', '2022-12-02 12:06:32'),
(83, 51, 12, '2', '2022-12-02 12:23:42', '2022-12-02 12:24:06'),
(86, 52, 12, '2', '2022-12-02 14:43:22', '2022-12-02 14:43:46'),
(88, 53, 11, '0', '2022-12-02 16:17:52', '2022-12-02 16:18:42'),
(89, 53, 12, '2', '2022-12-02 16:17:52', '2022-12-02 16:20:07'),
(91, 54, 11, '2', '2022-12-02 16:46:11', '2022-12-02 16:56:02'),
(92, 54, 12, '0', '2022-12-02 16:46:11', '2022-12-02 16:46:46'),
(95, 55, 12, '2', '2022-12-02 17:31:50', '2022-12-02 17:33:26'),
(98, 56, 12, '2', '2022-12-02 18:19:39', '2022-12-03 18:48:36'),
(101, 57, 12, '2', '2022-12-02 18:25:49', '2022-12-03 18:28:34'),
(104, 58, 12, '2', '2022-12-02 18:27:05', '2022-12-03 18:23:16'),
(107, 59, 12, '2', '2022-12-02 18:32:46', '2022-12-03 18:21:05'),
(110, 60, 12, '2', '2022-12-02 18:34:09', '2022-12-03 18:18:25'),
(113, 61, 12, '2', '2022-12-02 18:39:38', '2022-12-03 17:17:39'),
(116, 62, 12, '2', '2022-12-02 18:42:12', '2022-12-03 17:15:31'),
(119, 63, 12, '2', '2022-12-02 18:48:40', '2022-12-03 16:58:54'),
(122, 64, 12, '2', '2022-12-02 18:54:42', '2022-12-03 17:13:15'),
(125, 65, 12, '2', '2022-12-02 18:58:44', '2022-12-03 16:53:20'),
(128, 66, 12, '2', '2022-12-02 19:00:28', '2022-12-03 16:49:01'),
(131, 67, 12, '2', '2022-12-03 12:40:57', '2022-12-03 16:40:05'),
(134, 68, 12, '2', '2022-12-03 12:58:18', '2022-12-03 16:27:25'),
(137, 69, 12, '2', '2022-12-03 13:22:43', '2022-12-03 16:25:02'),
(140, 70, 12, '2', '2022-12-03 13:46:41', '2022-12-03 15:41:32'),
(143, 71, 12, '2', '2022-12-03 13:48:24', '2022-12-03 15:38:01'),
(146, 72, 12, '2', '2022-12-03 13:53:17', '2022-12-03 15:13:15'),
(149, 73, 12, '2', '2022-12-03 13:56:29', '2022-12-03 14:20:50'),
(152, 74, 12, '2', '2022-12-03 18:59:17', '2022-12-03 19:01:09'),
(155, 75, 12, '2', '2022-12-03 19:19:47', '2022-12-03 19:22:17'),
(158, 76, 12, '2', '2022-12-03 19:23:44', '2022-12-05 15:13:10'),
(159, 77, 14, NULL, '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(162, 78, 12, '2', '2022-12-05 15:32:34', '2022-12-05 15:37:37'),
(165, 79, 12, '2', '2022-12-05 15:35:17', '2022-12-05 15:36:20'),
(168, 80, 12, '2', '2022-12-05 15:42:01', '2022-12-05 15:46:06'),
(171, 81, 12, '2', '2022-12-05 15:48:46', '2022-12-05 16:03:52'),
(174, 82, 12, '2', '2022-12-05 15:52:08', '2022-12-05 16:00:38'),
(177, 83, 12, '2', '2022-12-05 15:54:00', '2022-12-05 15:56:02'),
(180, 84, 12, '2', '2022-12-05 16:10:53', '2022-12-05 16:49:12'),
(183, 85, 12, '2', '2022-12-05 16:28:36', '2022-12-05 16:38:44'),
(186, 86, 12, '2', '2022-12-05 16:37:23', '2022-12-05 16:45:19'),
(189, 87, 12, '2', '2022-12-05 16:53:02', '2022-12-05 16:53:26'),
(190, 88, 1, NULL, '2022-12-05 17:09:37', '2022-12-05 17:09:37'),
(191, 88, 11, NULL, '2022-12-05 17:09:37', '2022-12-05 17:09:37'),
(192, 88, 12, NULL, '2022-12-05 17:09:37', '2022-12-05 17:09:37'),
(195, 89, 12, '2', '2022-12-05 17:14:08', '2022-12-05 17:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `agent_ratings`
--

CREATE TABLE `agent_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `ratings` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_ratings`
--

INSERT INTO `agent_ratings` (`id`, `user_id`, `agent_id`, `ratings`, `agent_desc`, `book_id`, `created_at`, `updated_at`) VALUES
(8, 6, 12, '5', 'hdfhgjd', 208, '2022-12-01 18:04:26', '2022-12-01 18:04:26'),
(9, 6, 12, '5', 'hdfhgjd', 209, '2022-12-01 18:19:31', '2022-12-01 18:19:31'),
(10, 6, 12, '5', 'hdfhgjd', 209, '2022-12-01 18:21:57', '2022-12-01 18:21:57'),
(11, 6, 12, '5.0', 'oshohyos', 208, '2022-12-01 18:38:02', '2022-12-01 18:38:02'),
(12, 6, 12, '3.0', 'ywigweie', 207, '2022-12-01 18:40:59', '2022-12-01 18:40:59'),
(13, 6, 12, '5.0', 'hdjdkdld', 207, '2022-12-01 18:43:01', '2022-12-01 18:43:01'),
(14, 6, 12, '3.0', 'kdkfkrkr', 207, '2022-12-01 18:43:13', '2022-12-01 18:43:13'),
(15, 6, 12, '5.0', 'jfjfjfjfjfj', 210, '2022-12-01 18:55:07', '2022-12-01 18:55:07'),
(16, 6, 12, '4.0', 'kggifjfjf', 212, '2022-12-01 19:21:14', '2022-12-01 19:21:14'),
(17, 6, 12, '4.0', 'kgkggigkgi', 211, '2022-12-01 19:37:05', '2022-12-01 19:37:05'),
(18, 6, 12, '5.0', 'gjffkggjhyf', 213, '2022-12-01 19:48:37', '2022-12-01 19:48:37'),
(19, 6, 12, '5.0', 'jsjdldnbshdh', 214, '2022-12-01 20:38:25', '2022-12-01 20:38:25'),
(20, 6, 12, '4.0', 'hryvff', 215, '2022-12-01 20:41:28', '2022-12-01 20:41:28'),
(21, 6, 12, '4.0', 'khguubv', 216, '2022-12-02 12:07:14', '2022-12-02 12:07:14'),
(22, 6, 12, '4.0', 'vkgjdjgj', 217, '2022-12-02 12:24:28', '2022-12-02 12:24:28'),
(23, 6, 12, '5.0', 'uejejdjjr', 218, '2022-12-02 14:44:14', '2022-12-02 14:44:14'),
(24, 6, 12, '1.0', 'Mussab is 2 no. agent', 219, '2022-12-02 16:22:18', '2022-12-02 16:22:18'),
(25, 6, 11, '4.0', 'vtvthtcrvytb', 220, '2022-12-02 16:59:13', '2022-12-02 16:59:13'),
(26, 6, 12, '4.0', 'kbjcjfchh', 221, '2022-12-03 14:15:40', '2022-12-03 14:15:40'),
(27, 6, 12, '4.0', 'ibucyfygghcycuv', 239, '2022-12-03 14:21:12', '2022-12-03 14:21:12'),
(28, 6, 12, '4.0', 'kgfjiyjufjfuf', 238, '2022-12-03 15:14:13', '2022-12-03 15:14:13'),
(29, 6, 12, '4.0', 'jvfhchc', 236, '2022-12-03 15:41:55', '2022-12-03 15:41:55'),
(30, 6, 12, '4.0', 'fyfyfyyfyyf', 237, '2022-12-03 15:46:39', '2022-12-03 15:46:39'),
(31, 6, 12, '5.0', 'kvkggkgiug', 235, '2022-12-03 16:25:18', '2022-12-03 16:25:18'),
(32, 6, 12, '4.0', 'jfhfh', 234, '2022-12-03 16:33:47', '2022-12-03 16:33:47'),
(33, 6, 12, '4.0', 'kfhdhdy', 233, '2022-12-03 16:40:15', '2022-12-03 16:40:15'),
(34, 6, 12, '4.0', 'kgfjfjfdf', 232, '2022-12-03 16:53:32', '2022-12-03 16:53:32'),
(35, 6, 12, '4.0', 'hxhhdhdfhhf', 229, '2022-12-03 16:59:05', '2022-12-03 16:59:05'),
(36, 6, 12, '4.0', 'bjchcjcchx', 231, '2022-12-03 17:05:38', '2022-12-03 17:05:38'),
(37, 6, 12, '4.0', 'kgjfjjhffj', 230, '2022-12-03 17:13:29', '2022-12-03 17:13:29'),
(38, 6, 12, '4.0', 'fufugkgjgi', 228, '2022-12-03 17:15:48', '2022-12-03 17:15:48'),
(39, 6, 12, '4.0', 'iguurruuffy', 227, '2022-12-03 17:17:50', '2022-12-03 17:17:50'),
(40, 6, 12, '4.0', 'my hfhdhdhdh', 226, '2022-12-03 18:18:44', '2022-12-03 18:18:44'),
(41, 6, 12, '4.0', 'jvjfjfj', 225, '2022-12-03 18:21:22', '2022-12-03 18:21:22'),
(42, 6, 12, '4.0', 'vjfbcxhxhhx', 224, '2022-12-03 18:23:30', '2022-12-03 18:23:30'),
(43, 6, 12, '4.0', 'ogigiguf', 223, '2022-12-03 18:28:46', '2022-12-03 18:28:46'),
(44, 6, 12, '4.0', 'igfufuffuuf', 222, '2022-12-03 18:48:54', '2022-12-03 18:48:54'),
(45, 6, 12, '5.0', 'igigkggjgig', 240, '2022-12-03 19:09:28', '2022-12-03 19:09:28'),
(46, 6, 12, '5.0', 'jsjdjdhdjjf', 241, '2022-12-03 19:22:26', '2022-12-03 19:22:26'),
(47, 6, 12, '5.0', 'igjfrhvffbvg', 242, '2022-12-05 15:13:24', '2022-12-05 15:13:24'),
(48, 6, 12, '4.0', 'Dr hhff g', 245, '2022-12-05 15:36:35', '2022-12-05 15:36:35'),
(49, 6, 12, '4.0', 'rbfbbd', 244, '2022-12-05 15:37:46', '2022-12-05 15:37:46'),
(50, 6, 12, '5.0', 'hfgdvdgdhdh', 246, '2022-12-05 15:46:21', '2022-12-05 15:46:21'),
(51, 6, 12, '4.0', 'jtjfhfjhdhrhdg', 249, '2022-12-05 15:56:12', '2022-12-05 15:56:12'),
(52, 6, 12, '3.0', 'hfbfjjgfj', 248, '2022-12-05 16:01:11', '2022-12-05 16:01:11'),
(53, 6, 12, '4.0', 'tjjfjffhhf', 247, '2022-12-05 16:04:02', '2022-12-05 16:04:02'),
(54, 6, 12, '4.0', 'nchfbhd', 251, '2022-12-05 16:38:55', '2022-12-05 16:38:55'),
(55, 6, 12, '4.0', 'bcxv', 252, '2022-12-05 16:45:33', '2022-12-05 16:45:33'),
(56, 6, 12, '4.0', 'unycevtbd', 250, '2022-12-05 16:49:21', '2022-12-05 16:49:21'),
(57, 6, 12, '5.0', 'my rating', 253, '2022-12-05 16:53:45', '2022-12-05 16:53:45'),
(58, 6, 12, '4.0', 'rufjfjfu', 255, '2022-12-05 17:14:49', '2022-12-05 17:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `agent_requests`
--

CREATE TABLE `agent_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_requests`
--

INSERT INTO `agent_requests` (`id`, `booking_id`, `status`, `created_at`, `updated_at`) VALUES
(41, 207, NULL, '2022-12-01 17:56:02', '2022-12-01 17:56:02'),
(42, 208, NULL, '2022-12-01 18:01:55', '2022-12-01 18:01:55'),
(43, 209, NULL, '2022-12-01 18:18:14', '2022-12-01 18:18:14'),
(44, 210, NULL, '2022-12-01 18:53:56', '2022-12-01 18:53:56'),
(45, 211, NULL, '2022-12-01 19:04:36', '2022-12-01 19:04:36'),
(46, 212, NULL, '2022-12-01 19:20:04', '2022-12-01 19:20:04'),
(47, 213, NULL, '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(48, 214, NULL, '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(49, 215, NULL, '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(50, 216, NULL, '2022-12-02 12:06:00', '2022-12-02 12:06:00'),
(51, 217, NULL, '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(52, 218, NULL, '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(53, 219, NULL, '2022-12-02 16:17:51', '2022-12-02 16:17:51'),
(54, 220, NULL, '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(55, 221, NULL, '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(56, 222, NULL, '2022-12-02 18:19:39', '2022-12-02 18:19:39'),
(57, 223, NULL, '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(58, 224, NULL, '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(59, 225, NULL, '2022-12-02 18:32:45', '2022-12-02 18:32:45'),
(60, 226, NULL, '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(61, 227, NULL, '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(62, 228, NULL, '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(63, 229, NULL, '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(64, 230, NULL, '2022-12-02 18:54:41', '2022-12-02 18:54:41'),
(65, 231, NULL, '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(66, 232, NULL, '2022-12-02 19:00:27', '2022-12-02 19:00:27'),
(67, 233, NULL, '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(68, 234, NULL, '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(69, 235, NULL, '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(70, 236, NULL, '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(71, 237, NULL, '2022-12-03 13:48:24', '2022-12-03 13:48:24'),
(72, 238, NULL, '2022-12-03 13:53:16', '2022-12-03 13:53:16'),
(73, 239, NULL, '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(74, 240, NULL, '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(75, 241, NULL, '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(76, 242, NULL, '2022-12-03 19:23:43', '2022-12-03 19:23:43'),
(77, 243, NULL, '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(78, 244, NULL, '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(79, 245, NULL, '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(80, 246, NULL, '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(81, 247, NULL, '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(82, 248, NULL, '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(83, 249, NULL, '2022-12-05 15:53:59', '2022-12-05 15:53:59'),
(84, 250, NULL, '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(85, 251, NULL, '2022-12-05 16:28:35', '2022-12-05 16:28:35'),
(86, 252, NULL, '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(87, 253, NULL, '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(88, 254, NULL, '2022-12-05 17:09:36', '2022-12-05 17:09:36'),
(89, 255, NULL, '2022-12-05 17:14:08', '2022-12-05 17:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `all_categories`
--

CREATE TABLE `all_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_categories`
--

INSERT INTO `all_categories` (`id`, `category_name`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Nettoyage', 'images/GM1nP7zAQCuTJ7ZDtpoN5lkZiJffbkjxtrWzznsY.png', NULL, '2022-11-07 12:15:21'),
(2, 'Préceptorat', 'images/Cl7GJhRmTYRzBpfyMxArt34nfZ5E3vwYp3zD0R6Y.png', NULL, '2022-08-25 01:45:28'),
(3, 'Cuisine', 'images/QEfGnztuKl33SjRhQuk7X5Skwv8h9NK2IoxJQxn3.png', NULL, '2022-08-25 01:45:35'),
(4, 'Beauté', 'images/Lp1JNQBtK9Mpec9xlaupGcJc6sz9Szufgd1iBD51.png', '2022-11-15 00:15:52', '2022-11-15 00:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `subcat_id` bigint(20) UNSIGNED NOT NULL,
  `booking_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `long` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `cat_id`, `subcat_id`, `booking_desc`, `lat`, `long`, `status`, `date`, `time`, `booking_price`, `agent_id`, `created_at`, `updated_at`) VALUES
(15, 7, 1, 1, 'merci de bien vouloir passer pour ce service', 48.8922472, 2.4366817, 1, '11/14/2022', '8:08 PM', '15', 13, '2022-11-15 00:09:23', '2022-12-05 11:38:58'),
(16, 7, 4, 8, 'passer coiffer mon fils à la maison', 48.8957787, 2.4334609, 0, '11/14/2022', '8:19 PM', '5', 12, '2022-11-15 00:20:37', '2022-11-15 00:20:37'),
(19, 7, 2, 3, 'Merci de venir répéter mes petits', 48.8948506, 2.4326765, 3, '26-08-22', '10:55 am', '11', 12, '2022-11-15 03:17:05', '2022-11-29 01:17:36'),
(20, 7, 3, 2, 'veuillez me livrer un plat de kebab', 48.8912969, 2.4369525, 1, '26-08-22', '10:55 am', '10', 12, '2022-11-17 01:03:38', '2022-11-17 01:03:38'),
(203, 6, 3, 2, 'hi tutjgi', 31.4678585, 74.2657998, 3, '12/01/2022', '11:12 am', '25', 12, '2022-12-01 11:12:43', '2022-12-01 16:39:18'),
(204, 6, 3, 2, 'obkfohiudhidh', 31.4689903, 74.264461, 3, '12/01/2022', '4:42 pm', '25', 12, '2022-12-01 16:43:38', '2022-12-01 16:44:30'),
(205, 6, 3, 2, 'hoohohe', 31.4689916, 74.2644617, 3, '12/01/2022', '5:21 pm', '25', 12, '2022-12-01 17:22:34', '2022-12-01 17:23:27'),
(206, 6, 3, 2, 'jsjdjf', 31.4689963, 74.2644626, 3, '12/01/2022', '5:49 pm', '25', 12, '2022-12-01 17:49:39', '2022-12-01 17:50:19'),
(207, 6, 3, 2, 'I want to repair my motor new', 54.451154, 57.545584, 3, '26-08-2022', '10:55 am', '25', 12, '2022-12-01 17:56:02', '2022-12-01 17:58:17'),
(208, 6, 3, 2, 'jbkgkfgig', 31.4689964, 74.2644661, 3, '12/01/2022', '6:01 pm', '25', 12, '2022-12-01 18:01:54', '2022-12-01 18:03:07'),
(209, 6, 3, 2, 'jsjdhf', 31.4689915, 74.2644639, 3, '12/01/2022', '6:17 pm', '25', 12, '2022-12-01 18:18:14', '2022-12-01 18:18:54'),
(210, 6, 3, 2, 'igvcnfjghhx', 31.4689939, 74.264464, 3, '12/01/2022', '6:53 pm', '25', 12, '2022-12-01 18:53:56', '2022-12-01 18:54:15'),
(211, 6, 3, 2, 'UGG jfjgf', 31.4689938, 74.2644561, 3, '12/01/2022', '7:04 pm', '25', 12, '2022-12-01 19:04:36', '2022-12-01 19:20:42'),
(212, 6, 3, 2, 'mfdgkjhcgdhfjv', 31.468994, 74.2644638, 3, '12/01/2022', '7:19 pm', '25', 12, '2022-12-01 19:20:04', '2022-12-01 19:20:38'),
(213, 6, 3, 2, 'jdjdkdjdjf', 31.4689958, 74.2644589, 3, '12/01/2022', '7:45 pm', '25', 12, '2022-12-01 19:46:05', '2022-12-01 19:47:24'),
(214, 6, 3, 2, 'gejdkdkr', 31.4689948, 74.264459, 3, '12/01/2022', '8:36 pm', '25', 12, '2022-12-01 20:37:21', '2022-12-01 20:37:49'),
(215, 6, 3, 2, 'jskkshdh', 31.4689954, 74.2644565, 3, '12/01/2022', '8:39 pm', '25', 12, '2022-12-01 20:40:50', '2022-12-01 20:41:05'),
(216, 6, 3, 2, 'jjotdbh', 31.4689941, 74.2644658, 3, '12/02/2022', '12:05 pm', '25', 12, '2022-12-02 12:06:00', '2022-12-02 12:06:32'),
(217, 6, 3, 2, 'kvmfjddys', 31.4689948, 74.2644649, 3, '12/02/2022', '12:23 pm', '25', 12, '2022-12-02 12:23:42', '2022-12-02 12:24:06'),
(218, 6, 3, 2, 'ksjsjdjd', 31.4689925, 74.2644638, 3, '12/02/2022', '2:43 pm', '25', 12, '2022-12-02 14:43:22', '2022-12-02 14:43:46'),
(219, 6, 3, 2, 'ksksjsjdjjdd', 31.4689965, 74.2644601, 3, '12/02/2022', '4:17 pm', '25', 12, '2022-12-02 16:17:51', '2022-12-02 16:20:07'),
(220, 6, 3, 2, 'fnxnkgkgj', 31.4689945, 74.2644641, 3, '12/02/2022', '4:45 pm', '25', 11, '2022-12-02 16:46:11', '2022-12-02 16:56:02'),
(221, 6, 3, 2, 'Welcome to Gboard clipboard, any text that you copy will be saved here.', 31.4677204, 74.2646995, 3, '12/02/2022', '5:29 pm', '25', 12, '2022-12-02 17:31:50', '2022-12-02 17:33:26'),
(222, 6, 3, 2, 'uvjfj', 31.468994, 74.2644624, 3, '12/02/2022', '6:19 pm', '25', 12, '2022-12-02 18:19:38', '2022-12-03 18:48:36'),
(223, 6, 3, 2, 'gjgjggjhkfn', 31.4689931, 74.2644644, 3, '12/02/2022', '6:25 pm', '25', 12, '2022-12-02 18:25:49', '2022-12-03 18:28:34'),
(224, 6, 3, 2, 'jfbbhdrgfh', 31.4689936, 74.2644642, 3, '12/02/2022', '6:26 pm', '25', 12, '2022-12-02 18:27:05', '2022-12-03 18:23:16'),
(225, 6, 3, 2, 'jcfhhjdh', 31.468995, 74.2644635, 3, '12/02/2022', '6:32 pm', '25', 12, '2022-12-02 18:32:45', '2022-12-03 18:21:05'),
(226, 6, 3, 2, 'lhxkhduo', 31.4689916, 74.2644634, 3, '12/02/2022', '6:33 pm', '25', 12, '2022-12-02 18:34:09', '2022-12-03 18:18:25'),
(227, 6, 3, 2, 'hfhfhh', 31.4689936, 74.2644643, 3, '12/02/2022', '6:39 pm', '25', 12, '2022-12-02 18:39:38', '2022-12-03 17:17:39'),
(228, 6, 3, 2, 'kvfhig', 31.468994, 74.2644633, 3, '12/02/2022', '6:41 pm', '25', 12, '2022-12-02 18:42:12', '2022-12-03 17:15:31'),
(229, 6, 3, 2, 'hfhddggdh', 31.4689988, 74.264463, 3, '12/02/2022', '6:48 pm', '25', 12, '2022-12-02 18:48:40', '2022-12-03 16:58:54'),
(230, 6, 3, 2, 'jgdg', 31.4689913, 74.2644636, 3, '12/02/2022', '6:54 pm', '25', 12, '2022-12-02 18:54:41', '2022-12-03 17:13:15'),
(231, 6, 3, 2, 'ddhhfjg', 31.468993, 74.2644636, 3, '12/02/2022', '6:58 pm', '25', 12, '2022-12-02 18:58:44', '2022-12-03 16:53:20'),
(232, 6, 3, 2, 'nfnfbdhrht', 31.4689937, 74.2644619, 3, '12/02/2022', '7:00 pm', '25', 12, '2022-12-02 19:00:27', '2022-12-03 16:49:01'),
(233, 6, 3, 2, 'ohgkgjfy', 31.4598132, 74.3492938, 3, '12/03/2022', '12:40 pm', '25', 12, '2022-12-03 12:40:57', '2022-12-03 16:40:05'),
(234, 6, 3, 2, 'jfjfhrhrhrh', 31.4598226, 74.3494334, 3, '12/03/2022', '12:53 pm', '25', 12, '2022-12-03 12:58:18', '2022-12-03 16:27:25'),
(235, 6, 3, 2, 'jfhdhu', 31.4596956, 74.3494374, 3, '12/03/2022', '1:21 pm', '25', 12, '2022-12-03 13:22:43', '2022-12-03 16:25:02'),
(236, 6, 3, 2, 'lhfkh', 31.4597208, 74.3494002, 3, '12/03/2022', '1:45 pm', '25', 12, '2022-12-03 13:46:41', '2022-12-03 15:41:32'),
(237, 6, 3, 2, 'ohifyyyf', 31.4598132, 74.3495524, 3, '12/03/2022', '1:48 pm', '25', 12, '2022-12-03 13:48:23', '2022-12-03 15:38:01'),
(238, 6, 3, 2, 'kbkbuufugugu', 31.4596463, 74.3493931, 3, '12/03/2022', '1:51 pm', '25', 12, '2022-12-03 13:53:16', '2022-12-03 15:13:15'),
(239, 6, 3, 2, 'kvncjjf', 31.4596778, 74.3494068, 3, '12/03/2022', '1:56 pm', '25', 12, '2022-12-03 13:56:28', '2022-12-03 14:20:50'),
(240, 6, 3, 2, 'igkg hi gu', 31.4596795, 74.3493525, 3, '12/03/2022', '6:57 pm', '25', 12, '2022-12-03 18:59:17', '2022-12-03 19:01:09'),
(241, 6, 3, 2, 'jhghhjjj', 31.4597441, 74.3493337, 3, '12/03/2022', '7:19 pm', '25', 12, '2022-12-03 19:19:47', '2022-12-03 19:22:17'),
(242, 6, 3, 2, 'ivaugie', 31.4597323, 74.3495606, 3, '01/03/2023', '7:23 pm', '25', 12, '2022-12-03 19:23:43', '2022-12-05 15:13:10'),
(243, 6, 1, 1, 'dfgdffdhfdh', 37.4220936, -122.083922, 0, '12/05/2022', '3:04 PM', '15', NULL, '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(244, 6, 3, 2, '.vnfjykfu', 31.4689893, 74.2644638, 3, '12/06/2022', '3:32 pm', '25', 12, '2022-12-05 15:32:33', '2022-12-05 15:37:37'),
(245, 6, 3, 2, 'hsjdodlfkf', 31.4689922, 74.2644626, 3, '12/05/2022', '3:34 pm', '25', 12, '2022-12-05 15:35:17', '2022-12-05 15:36:20'),
(246, 6, 3, 2, 'jd try hdczv', 31.4689938, 74.2644648, 3, '12/05/2022', '3:41 pm', '25', 12, '2022-12-05 15:42:01', '2022-12-05 15:46:06'),
(247, 6, 3, 2, 'jfb', 31.4689939, 74.2644643, 3, '12/05/2022', '3:48 pm', '25', 12, '2022-12-05 15:48:46', '2022-12-05 16:03:52'),
(248, 6, 3, 2, 'rjhfbfhhj', 31.468991, 74.2644613, 3, '12/05/2022', '3:51 pm', '25', 12, '2022-12-05 15:52:08', '2022-12-05 16:00:38'),
(249, 6, 3, 2, 'fhfhhkjk', 31.4689897, 74.264461, 3, '12/05/2022', '3:53 pm', '25', 12, '2022-12-05 15:53:59', '2022-12-05 15:56:02'),
(250, 6, 3, 2, 'cbffjfjhffh', 31.4689996, 74.2644594, 3, '12/05/2022', '4:10 pm', '25', 12, '2022-12-05 16:10:53', '2022-12-05 16:49:12'),
(251, 6, 3, 2, 'kgjfjjvj', 31.4689909, 74.2644628, 3, '12/05/2022', '4:28 pm', '25', 12, '2022-12-05 16:28:35', '2022-12-05 16:38:44'),
(252, 6, 3, 2, 'jgjfjjfjfh', 31.4689939, 74.2644624, 3, '12/05/2022', '4:37 pm', '25', 12, '2022-12-05 16:37:23', '2022-12-05 16:45:19'),
(253, 6, 3, 2, 'My Booking', 31.4689918, 74.2644642, 3, '12/05/2022', '4:52 pm', '25', 12, '2022-12-05 16:53:02', '2022-12-05 16:53:26'),
(254, 6, 3, 2, 'gjfjgjjfjffj', 31.4689946, 74.2644541, 0, '12/05/2022', '5:09 pm', '25', NULL, '2022-12-05 17:09:36', '2022-12-05 17:09:36'),
(255, 6, 3, 2, 'jfhfjgkfjrj', 31.4689958, 74.2644601, 3, '12/05/2022', '5:13 pm', '25', 12, '2022-12-05 17:14:08', '2022-12-05 17:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `booking_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`id`, `booking_id`, `booking_img`, `created_at`, `updated_at`) VALUES
(31, 15, 'images/kRnc5mDsQcnNRuQ8RR0bD5UuXfwFa3DwgSUyubkl.jpg', '2022-11-15 00:09:23', '2022-11-15 00:09:23'),
(32, 16, 'images/JDiwq0j6E5UdU56grN0YuZEJ2VDJ8Tebl62KMWhQ.jpg', '2022-11-15 00:20:37', '2022-11-15 00:20:37'),
(38, 20, 'images/SizldVo4P5qLgKR4JcEm0wdJnxq7tZwUXkftVsEN.jpg', '2022-11-17 00:59:43', '2022-11-17 00:59:43'),
(61, 203, 'images/DeoIMxxwwcaYs0BMHYuiZ9njDiY1pubykt1qs0S2.jpg', '2022-12-01 11:12:43', '2022-12-01 11:12:43'),
(62, 204, 'images/IEMrkalSCmmqKIcAw9bp6YwrNX1YaAi09LLtUAMI.jpg', '2022-12-01 16:43:38', '2022-12-01 16:43:38'),
(63, 205, 'images/CvOTXYOXaPcL58wYoCrBWlBt1sKKcrJa9dQUoK9Y.jpg', '2022-12-01 17:22:34', '2022-12-01 17:22:34'),
(64, 206, 'images/H0KeVYJuzvZYuiL2zhSlf9Gi611YmWQHdLi1n44o.jpg', '2022-12-01 17:49:39', '2022-12-01 17:49:39'),
(65, 207, 'table.png', '2022-12-01 17:56:02', '2022-12-01 17:56:02'),
(66, 207, 'truck.png', '2022-12-01 17:56:02', '2022-12-01 17:56:02'),
(67, 207, 'table.png', '2022-12-01 17:56:02', '2022-12-01 17:56:02'),
(68, 208, 'images/luJjjNDPvV62onvmJAhkTsix0qEAmIXye9fvukBw.jpg', '2022-12-01 18:01:55', '2022-12-01 18:01:55'),
(69, 209, 'images/x2Xv4j8rclpt1c8kHGmlDgSQPivJrNu8b9xIrU5j.jpg', '2022-12-01 18:18:14', '2022-12-01 18:18:14'),
(70, 210, 'images/hohRK5Wq4ck32c9E55cZvi1n7fuKoPmPo1oRfJlN.jpg', '2022-12-01 18:53:56', '2022-12-01 18:53:56'),
(71, 211, 'images/wmljo0FAxuqcKcq42xMrxbxMskqYgMHTPjMy4n1t.jpg', '2022-12-01 19:04:36', '2022-12-01 19:04:36'),
(72, 212, 'images/Y68DUOAe2D2NpH3QEYd8CFNVNot3rcEChi8JcA8i.jpg', '2022-12-01 19:20:04', '2022-12-01 19:20:04'),
(73, 213, 'images/aFSxgmMLX5ZgPhJ5ZAUHuNOx1R6ce6mizCkyqwMB.jpg', '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(74, 214, 'images/C6N6T1nqb5pqgeScyxrPxvLa3OsK2Yx5zyy6oMgb.jpg', '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(75, 215, 'images/s6nzR09crKvXJJMD9vXZMEUXZAcUEW88v3GrBvsP.jpg', '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(76, 216, 'images/ONfd4eWG66KyeQl7v8K7ejRnY5DtMX8zizRe3ZMI.jpg', '2022-12-02 12:06:00', '2022-12-02 12:06:00'),
(77, 217, 'images/s5RiufUx1cSanL887Sj0gVSl9RZnxQw6Up9BWqjM.jpg', '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(78, 218, 'images/KVJVHK7XpacAvaEVAJ2qq5f1xrb6KKAadmRLxHBQ.jpg', '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(79, 219, 'images/9UklmBO2baYlUS06Va3RnA8WmKLkicSjbgyR50Ny.jpg', '2022-12-02 16:17:51', '2022-12-02 16:17:51'),
(80, 220, 'images/BIPqUAWJT75vep71TnlFN0Kg74DHfhciwYG7YY9b.jpg', '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(81, 221, 'images/2PVc7BoKKhoKXsZCsGzGl713JtPEo6BhIyK8bQXG.jpg', '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(82, 222, 'images/IXzaVV81XoK8jT4eUlc4fbZV1y3fo9Yp0fJdjEYR.jpg', '2022-12-02 18:19:39', '2022-12-02 18:19:39'),
(83, 223, 'images/n60jC1HGBWFSY8srsAk7dZj89OtyOeCKE20sYwi0.jpg', '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(84, 224, 'images/K4Ipf1uevYKgTEELtVV1f7wMqOnavkVZvqfpsprm.jpg', '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(85, 225, 'images/LHi57KHsYgYeHltAxf7YPqgegTIaO5XoTCkhUXXD.jpg', '2022-12-02 18:32:45', '2022-12-02 18:32:45'),
(86, 226, 'images/uDCDXtDAj5Z7ljtUskDbrL3FWNfAWNFMJ7pdNgQm.jpg', '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(87, 227, 'images/FZVFlA2ebt6rLnKG5vdSvgSyVrdZSY7th6RspR06.jpg', '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(88, 228, 'images/lE8l3WwGKsLumsdkD6HTJCMAdcJEuF1pbceicZkj.jpg', '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(89, 229, 'images/3ivFEFLTefT2f3fseNFGfP9HJp3TlHdopzkzixhv.jpg', '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(90, 230, 'images/ZQRtNhpB8X9Z7pzhcJvNvbQmKFqwxTvHe8jBIUwP.jpg', '2022-12-02 18:54:41', '2022-12-02 18:54:41'),
(91, 231, 'images/2X467JJax2Qy7SHUVE0vwO2LkTL7SaMVqrKAWSW1.jpg', '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(92, 232, 'images/9gzEayrKRdKUWgTAL7A7tZvA4u4biO6UKEbDX1XU.jpg', '2022-12-02 19:00:27', '2022-12-02 19:00:27'),
(93, 233, 'images/uvoDfmAmdfpEhcKJUVgzUt3QVP0HqV4IMhNBmJXJ.jpg', '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(94, 234, 'images/E2A8U1MfUk5rVqwc4dhRL1As1iD0BKNhZWFbWayr.jpg', '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(95, 235, 'images/m3lbyzFwnkGuoRNy1FQWOQsgaFeE1StzkqcueaZS.jpg', '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(96, 236, 'images/ptDldRJlqnC8je4aTnQ08mRN4aPFsEMhpqRExCNi.jpg', '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(97, 237, 'images/VyLKLsKwRKgW6xc6fMPX8i7vP3RdE9Pe4QoBT37w.jpg', '2022-12-03 13:48:24', '2022-12-03 13:48:24'),
(98, 238, 'images/QF4dvGumviWVkY5r5bnmZKkyPqYTx26rSAoJj2b3.jpg', '2022-12-03 13:53:16', '2022-12-03 13:53:16'),
(99, 239, 'images/eeTHHUrOm5bslIHVBfoKep0sshnWfMo0bm8DdxZR.jpg', '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(100, 240, 'images/maivYsW8cToIuS2OHRHMZdJWaxO1ehJGgpTH4XHF.jpg', '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(101, 241, 'images/K2QMvoxtojGX9RnZw7Pg3gTXqSgId8OBo8T3q5rI.jpg', '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(102, 242, 'images/zluiVhmIq9kXJPh21S2wtbgxpA72vAqpe40lnYAy.jpg', '2022-12-03 19:23:43', '2022-12-03 19:23:43'),
(103, 243, 'images/VptmeT7utBeH7nccWrSB0pEIzvdijyl6xynvx2u7.jpg', '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(104, 244, 'images/qPIkxNrpKL4HTkv78asEkmzQw2Jtyy5YzZh86fwz.jpg', '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(105, 245, 'images/dU4irAZgqNszJhNO5myyxJu2cpepq0fBaoWEudWR.jpg', '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(106, 246, 'images/cthMBDmN5kAWyktTJlyCx6ZjIsxWCpwBOFCijHep.jpg', '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(107, 247, 'images/RuVQQ0UhxWH5DvRf15VLIGLbZishOfi6Z9R4aT1f.jpg', '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(108, 248, 'images/gOxtLiG6lysfzDT92SZHPknXbdfMRKzSHSst6Oqr.jpg', '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(109, 249, 'images/2T0K4Dwoo6fNk9ZsU35MZLBiUTj1DD1zx1UNHa2x.jpg', '2022-12-05 15:53:59', '2022-12-05 15:53:59'),
(110, 250, 'images/BRQt8wu2BmCFyOlqoZaAn5OBxrzQ12LR1mzV4hva.jpg', '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(111, 251, 'images/jKcuoyEXTcntSwiKdXDkxtFSRgpxgsYHtyvGdokS.jpg', '2022-12-05 16:28:35', '2022-12-05 16:28:35'),
(112, 252, 'images/Z0WGM5J2GsyRWcXaKgcrvqYBRi6jyhRu0QgCwrR4.jpg', '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(113, 253, 'images/EDkwBQOyJ5vtid2Wv9CVpplBt1uu7kPcfkOrXMi2.jpg', '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(114, 254, 'images/xOChIgOwi4JDrnvfn1VoaEdmLiHcI9IAFMF04pHp.jpg', '2022-12-05 17:09:36', '2022-12-05 17:09:36'),
(115, 255, 'images/tRs2aCHfi1Amu6FYTQ1l6YYkSF3hOIUZsWZANJGd.jpg', '2022-12-05 17:14:08', '2022-12-05 17:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `rating_stars` int(11) NOT NULL,
  `feedback_desc` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_sections`
--

CREATE TABLE `help_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_sections`
--

INSERT INTO `help_sections` (`id`, `first_name`, `last_name`, `phone`, `email`, `description`, `created_at`, `updated_at`) VALUES
(2, 'babar', 'sagheer', '234234234', 'babar@lol.com', 'ajshgjasgjasfdjasghd', '2022-11-03 00:04:55', '2022-11-03 00:04:55'),
(3, 'babar', 'sagheer', '234234234', 'babar@lol.com', 'ajshgjasgjasfdjasghd', '2022-11-04 11:28:27', '2022-11-04 11:28:27'),
(4, 'my  name', 'igjfgkgj', '564465656855', 'hello@gmail.com', 'fhsjyfhjxhf', '2022-11-07 11:06:05', '2022-11-07 11:06:05'),
(5, 'jskskf', 'gsjdjdkf', '64656595', 'bsjdjdkdd@outlok.com', 'hskskskkdkf', '2022-12-01 16:29:42', '2022-12-01 16:29:42');

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
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(21, '2022_08_15_094022_create_agents_table', 2),
(22, '2022_06_30_105417_create_all_categories_table', 3),
(23, '2022_06_30_105620_create_sub_categories_table', 3),
(24, '2022_08_17_052412_create_bookings_table', 4),
(25, '2022_08_25_104328_create_booking_details_table', 5),
(26, '2022_09_09_071832_create_feedback_table', 6),
(27, '2022_10_11_104753_create_wallets_table', 7),
(28, '2022_10_26_050548_create_agent_ratings_table', 8),
(29, '2022_10_26_122505_create_subscriptions_table', 8),
(30, '2022_10_28_063621_create_user_subscriptions_table', 9),
(31, '2022_11_01_071827_create_user_transactions_table', 10),
(32, '2022_11_01_102320_create_help_sections_table', 11),
(33, '2022_10_26_110029_create_user_ratings_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `book_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `description`, `agent_id`, `role`, `status`, `book_id`, `created_at`, `updated_at`) VALUES
(44, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-01 19:04:36', '2022-12-01 19:04:36'),
(45, 6, 'Booking Notification', 'You Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-01 19:05:16', '2022-12-01 19:05:16'),
(46, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-01 19:20:04', '2022-12-01 19:20:04'),
(47, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-01 19:20:04', '2022-12-01 19:20:04'),
(48, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-01 19:20:05', '2022-12-01 19:20:05'),
(49, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-01 19:20:05', '2022-12-01 19:20:05'),
(50, 6, 'Booking Notification', 'You Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-01 19:20:25', '2022-12-01 19:20:25'),
(51, 6, 'Booking Notification', 'You Order Completed Successfully By Agent', 12, 0, 2, 212, '2022-12-01 19:20:38', '2022-12-01 19:21:14'),
(52, 6, 'Booking Notification', 'You Order Completed Successfully By Agent', 12, 0, 2, 211, '2022-12-01 19:20:42', '2022-12-01 19:37:05'),
(53, 6, 'Rating Notification', 'You Have Rated Successfully By User', 12, 1, 0, NULL, '2022-12-01 19:21:14', '2022-12-01 19:21:14'),
(54, 6, 'Rating Notification', 'You Have Rated Successfully By User', 12, 1, 0, NULL, '2022-12-01 19:37:05', '2022-12-01 19:37:05'),
(55, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(56, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(57, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(58, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(59, 6, 'Booking Notification', 'You Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-01 19:47:12', '2022-12-01 19:47:12'),
(60, 6, 'Booking Notification', 'You Order Completed Successfully By Agent', 12, 0, 2, 213, '2022-12-01 19:47:24', '2022-12-01 19:48:37'),
(61, 6, 'Rating Notification', 'You Have Rated Successfully By User', 12, 1, 0, 213, '2022-12-01 19:48:37', '2022-12-01 19:48:37'),
(62, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(63, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(64, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(65, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(66, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-01 20:37:44', '2022-12-01 20:37:44'),
(67, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 214, '2022-12-01 20:37:49', '2022-12-01 20:38:25'),
(68, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 0, 214, '2022-12-01 20:38:25', '2022-12-01 20:38:25'),
(69, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(70, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(71, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(72, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(73, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-01 20:40:59', '2022-12-01 20:40:59'),
(74, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 215, '2022-12-01 20:41:05', '2022-12-01 20:41:28'),
(75, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 215, '2022-12-01 20:41:28', '2022-12-01 20:43:08'),
(76, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 215, '2022-12-01 20:43:08', '2022-12-01 20:43:08'),
(77, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 12:06:00', '2022-12-02 12:06:00'),
(78, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 12:06:00', '2022-12-02 12:06:00'),
(79, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 12:06:00', '2022-12-02 12:06:00'),
(80, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 12:06:01', '2022-12-02 12:06:01'),
(81, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-02 12:06:26', '2022-12-02 12:06:26'),
(82, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 216, '2022-12-02 12:06:32', '2022-12-02 12:07:14'),
(83, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 216, '2022-12-02 12:07:14', '2022-12-02 14:41:35'),
(84, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(85, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(86, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(87, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(88, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-02 12:23:59', '2022-12-02 12:23:59'),
(89, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 217, '2022-12-02 12:24:06', '2022-12-02 12:24:28'),
(90, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 217, '2022-12-02 12:24:28', '2022-12-02 14:41:03'),
(91, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 217, '2022-12-02 14:41:03', '2022-12-02 14:41:03'),
(92, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 216, '2022-12-02 14:41:35', '2022-12-02 14:41:35'),
(93, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(94, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(95, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(96, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(97, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-02 14:43:41', '2022-12-02 14:43:41'),
(98, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 218, '2022-12-02 14:43:46', '2022-12-02 14:44:14'),
(99, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 218, '2022-12-02 14:44:14', '2022-12-02 14:44:28'),
(100, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 218, '2022-12-02 14:44:28', '2022-12-02 14:44:28'),
(101, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 16:17:51', '2022-12-02 16:17:51'),
(102, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 16:17:51', '2022-12-02 16:17:51'),
(103, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 16:17:51', '2022-12-02 16:17:51'),
(104, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 16:17:52', '2022-12-02 16:17:52'),
(105, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-02 16:19:16', '2022-12-02 16:19:16'),
(106, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 219, '2022-12-02 16:20:07', '2022-12-02 16:22:18'),
(107, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 219, '2022-12-02 16:22:18', '2022-12-02 16:23:27'),
(108, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 219, '2022-12-02 16:23:27', '2022-12-02 16:23:27'),
(109, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(110, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(111, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(112, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(113, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 11, 0, 0, NULL, '2022-12-02 16:47:59', '2022-12-02 16:47:59'),
(114, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 11, 0, 2, 220, '2022-12-02 16:56:02', '2022-12-02 16:59:13'),
(115, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 11, 1, 2, 220, '2022-12-02 16:59:13', '2022-12-02 16:59:58'),
(116, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 11, 0, 0, 220, '2022-12-02 16:59:58', '2022-12-02 16:59:58'),
(117, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(118, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(119, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(120, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(121, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-02 17:32:24', '2022-12-02 17:32:24'),
(122, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 221, '2022-12-02 17:33:26', '2022-12-03 14:15:40'),
(123, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:19:38', '2022-12-02 18:19:38'),
(124, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:19:39', '2022-12-02 18:19:39'),
(125, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:19:39', '2022-12-02 18:19:39'),
(126, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:19:39', '2022-12-02 18:19:39'),
(127, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(128, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(129, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(130, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(131, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(132, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(133, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(134, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(135, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:32:45', '2022-12-02 18:32:45'),
(136, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:32:45', '2022-12-02 18:32:45'),
(137, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:32:46', '2022-12-02 18:32:46'),
(138, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:32:46', '2022-12-02 18:32:46'),
(139, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(140, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(141, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(142, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(143, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(144, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(145, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(146, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(147, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(148, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(149, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(150, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(151, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(152, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(153, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(154, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(155, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:54:41', '2022-12-02 18:54:41'),
(156, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:54:41', '2022-12-02 18:54:41'),
(157, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:54:42', '2022-12-02 18:54:42'),
(158, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:54:42', '2022-12-02 18:54:42'),
(159, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(160, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(161, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(162, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(163, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-02 19:00:27', '2022-12-02 19:00:27'),
(164, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-02 19:00:27', '2022-12-02 19:00:27'),
(165, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-02 19:00:28', '2022-12-02 19:00:28'),
(166, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-02 19:00:28', '2022-12-02 19:00:28'),
(167, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(168, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(169, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(170, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(171, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(172, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(173, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(174, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(175, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(176, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(177, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(178, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(179, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(180, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(181, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(182, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(183, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 13:48:23', '2022-12-03 13:48:23'),
(184, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 13:48:24', '2022-12-03 13:48:24'),
(185, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 13:48:24', '2022-12-03 13:48:24'),
(186, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 13:48:24', '2022-12-03 13:48:24'),
(187, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 13:53:16', '2022-12-03 13:53:16'),
(188, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 13:53:16', '2022-12-03 13:53:16'),
(189, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 13:53:17', '2022-12-03 13:53:17'),
(190, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 13:53:17', '2022-12-03 13:53:17'),
(191, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(192, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(193, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(194, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(195, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 221, '2022-12-03 14:15:40', '2022-12-03 14:15:40'),
(196, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 14:20:08', '2022-12-03 14:20:08'),
(197, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 239, '2022-12-03 14:20:50', '2022-12-03 14:21:12'),
(198, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 239, '2022-12-03 14:21:12', '2022-12-03 14:21:12'),
(199, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 15:11:21', '2022-12-03 15:11:21'),
(200, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 238, '2022-12-03 15:13:15', '2022-12-03 15:14:13'),
(201, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 238, '2022-12-03 15:14:13', '2022-12-03 15:14:13'),
(202, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 15:37:48', '2022-12-03 15:37:48'),
(203, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 237, '2022-12-03 15:38:01', '2022-12-03 15:46:39'),
(204, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 15:40:21', '2022-12-03 15:40:21'),
(205, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 236, '2022-12-03 15:41:32', '2022-12-03 15:41:55'),
(206, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 236, '2022-12-03 15:41:55', '2022-12-03 15:41:55'),
(207, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 237, '2022-12-03 15:46:39', '2022-12-03 15:46:39'),
(208, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:24:39', '2022-12-03 16:24:39'),
(209, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:24:55', '2022-12-03 16:24:55'),
(210, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 235, '2022-12-03 16:25:02', '2022-12-03 16:25:18'),
(211, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 235, '2022-12-03 16:25:18', '2022-12-03 16:25:18'),
(212, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 234, '2022-12-03 16:27:25', '2022-12-03 16:33:47'),
(213, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:33:26', '2022-12-03 16:33:26'),
(214, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 234, '2022-12-03 16:33:47', '2022-12-03 16:33:47'),
(215, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:39:59', '2022-12-03 16:39:59'),
(216, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 233, '2022-12-03 16:40:05', '2022-12-03 16:40:15'),
(217, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 233, '2022-12-03 16:40:15', '2022-12-03 16:40:15'),
(218, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 232, '2022-12-03 16:49:01', '2022-12-03 16:53:32'),
(219, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:53:12', '2022-12-03 16:53:12'),
(220, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 231, '2022-12-03 16:53:20', '2022-12-03 17:05:38'),
(221, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 232, '2022-12-03 16:53:32', '2022-12-03 16:53:32'),
(222, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:58:32', '2022-12-03 16:58:32'),
(223, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 16:58:44', '2022-12-03 16:58:44'),
(224, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 229, '2022-12-03 16:58:54', '2022-12-03 16:59:05'),
(225, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 229, '2022-12-03 16:59:05', '2022-12-03 16:59:05'),
(226, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 17:04:49', '2022-12-03 17:04:49'),
(227, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 231, '2022-12-03 17:05:38', '2022-12-03 17:05:38'),
(228, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 17:12:43', '2022-12-03 17:12:43'),
(229, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 230, '2022-12-03 17:13:15', '2022-12-03 17:13:29'),
(230, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 230, '2022-12-03 17:13:29', '2022-12-03 17:13:29'),
(231, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 228, '2022-12-03 17:15:31', '2022-12-03 17:15:48'),
(232, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 228, '2022-12-03 17:15:48', '2022-12-03 17:15:48'),
(233, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 227, '2022-12-03 17:17:39', '2022-12-03 17:17:50'),
(234, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 227, '2022-12-03 17:17:50', '2022-12-03 17:17:50'),
(235, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 17:23:48', '2022-12-03 17:23:48'),
(236, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 18:17:04', '2022-12-03 18:17:04'),
(237, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 226, '2022-12-03 18:18:25', '2022-12-03 18:18:44'),
(238, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 226, '2022-12-03 18:18:44', '2022-12-03 18:18:44'),
(239, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 225, '2022-12-03 18:21:05', '2022-12-03 18:21:22'),
(240, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 225, '2022-12-03 18:21:22', '2022-12-03 18:21:22'),
(241, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 18:22:45', '2022-12-03 18:22:45'),
(242, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 224, '2022-12-03 18:23:16', '2022-12-03 18:23:30'),
(243, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 224, '2022-12-03 18:23:30', '2022-12-03 18:23:30'),
(244, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 18:28:15', '2022-12-03 18:28:15'),
(245, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 223, '2022-12-03 18:28:34', '2022-12-03 18:28:47'),
(246, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 223, '2022-12-03 18:28:47', '2022-12-03 18:28:47'),
(247, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 18:48:06', '2022-12-03 18:48:06'),
(248, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 222, '2022-12-03 18:48:36', '2022-12-03 18:48:54'),
(249, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 222, '2022-12-03 18:48:54', '2022-12-03 19:13:39'),
(250, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(251, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(252, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(253, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(254, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 19:00:41', '2022-12-03 19:00:41'),
(255, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 240, '2022-12-03 19:01:09', '2022-12-03 19:09:28'),
(256, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 240, '2022-12-03 19:09:28', '2022-12-03 19:09:59'),
(257, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 240, '2022-12-03 19:09:59', '2022-12-03 19:09:59'),
(258, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 222, '2022-12-03 19:13:39', '2022-12-03 19:13:39'),
(259, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(260, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(261, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(262, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(263, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-03 19:21:59', '2022-12-03 19:21:59'),
(264, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 241, '2022-12-03 19:22:17', '2022-12-03 19:22:26'),
(265, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 241, '2022-12-03 19:22:26', '2022-12-03 19:22:36'),
(266, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 241, '2022-12-03 19:22:36', '2022-12-03 19:22:36'),
(267, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-03 19:23:43', '2022-12-03 19:23:43'),
(268, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-03 19:23:43', '2022-12-03 19:23:43'),
(269, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-03 19:23:43', '2022-12-03 19:23:43'),
(270, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-03 19:23:44', '2022-12-03 19:23:44'),
(271, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(272, 6, 'Booking Notification', 'You Have New Booking Request', 14, 1, 0, NULL, '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(273, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 15:12:51', '2022-12-05 15:12:51'),
(274, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 242, '2022-12-05 15:13:10', '2022-12-05 15:13:24'),
(275, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 242, '2022-12-05 15:13:24', '2022-12-05 15:13:36'),
(276, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 242, '2022-12-05 15:13:36', '2022-12-05 15:13:36'),
(277, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(278, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(279, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(280, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(281, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(282, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(283, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(284, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(285, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 15:36:01', '2022-12-05 15:36:01'),
(286, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 245, '2022-12-05 15:36:20', '2022-12-05 15:36:35'),
(287, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 245, '2022-12-05 15:36:35', '2022-12-05 15:37:22'),
(288, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 245, '2022-12-05 15:37:22', '2022-12-05 15:37:22'),
(289, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 15:37:33', '2022-12-05 15:37:33'),
(290, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 244, '2022-12-05 15:37:37', '2022-12-05 15:37:46'),
(291, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 244, '2022-12-05 15:37:46', '2022-12-05 15:37:46'),
(292, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(293, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(294, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(295, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(296, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 15:46:01', '2022-12-05 15:46:01'),
(297, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 246, '2022-12-05 15:46:06', '2022-12-05 15:46:21'),
(298, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 246, '2022-12-05 15:46:21', '2022-12-05 15:46:21'),
(299, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(300, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(301, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(302, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(303, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(304, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(305, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(306, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(307, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 15:53:59', '2022-12-05 15:53:59'),
(308, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 15:53:59', '2022-12-05 15:53:59'),
(309, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 15:54:00', '2022-12-05 15:54:00'),
(310, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 15:54:00', '2022-12-05 15:54:00'),
(311, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 15:55:50', '2022-12-05 15:55:50'),
(312, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 249, '2022-12-05 15:56:02', '2022-12-05 15:56:12'),
(313, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 249, '2022-12-05 15:56:12', '2022-12-05 15:56:12'),
(314, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 16:00:32', '2022-12-05 16:00:32'),
(315, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 16:00:34', '2022-12-05 16:00:34'),
(316, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 248, '2022-12-05 16:00:38', '2022-12-05 16:01:11'),
(317, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 248, '2022-12-05 16:01:11', '2022-12-05 16:01:11'),
(318, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 247, '2022-12-05 16:03:52', '2022-12-05 16:04:02'),
(319, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 247, '2022-12-05 16:04:02', '2022-12-05 16:04:02'),
(320, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(321, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(322, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(323, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(324, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 16:28:35', '2022-12-05 16:28:35'),
(325, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 16:28:35', '2022-12-05 16:28:35'),
(326, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 16:28:36', '2022-12-05 16:28:36'),
(327, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 16:28:36', '2022-12-05 16:28:36'),
(328, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 16:30:23', '2022-12-05 16:30:23'),
(329, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(330, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(331, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(332, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(333, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 251, '2022-12-05 16:38:44', '2022-12-05 16:38:55'),
(334, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 251, '2022-12-05 16:38:55', '2022-12-05 16:38:55'),
(335, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 16:45:13', '2022-12-05 16:45:13'),
(336, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 252, '2022-12-05 16:45:19', '2022-12-05 16:45:33'),
(337, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 1, 252, '2022-12-05 16:45:33', '2022-12-05 16:45:33'),
(338, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 16:49:06', '2022-12-05 16:49:06'),
(339, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 250, '2022-12-05 16:49:12', '2022-12-05 16:49:21'),
(340, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 250, '2022-12-05 16:49:21', '2022-12-05 16:49:32'),
(341, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 250, '2022-12-05 16:49:32', '2022-12-05 16:49:32'),
(342, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(343, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(344, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(345, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(346, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 16:53:22', '2022-12-05 16:53:22'),
(347, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 253, '2022-12-05 16:53:26', '2022-12-05 16:53:45'),
(348, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 253, '2022-12-05 16:53:45', '2022-12-05 16:54:01'),
(349, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 253, '2022-12-05 16:54:01', '2022-12-05 16:54:01'),
(350, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 17:09:36', '2022-12-05 17:09:36'),
(351, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 17:09:36', '2022-12-05 17:09:36'),
(352, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 17:09:37', '2022-12-05 17:09:37'),
(353, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 17:09:37', '2022-12-05 17:09:37'),
(354, 6, 'Booking Notification', 'Your Booking Request Send To nearest agents', NULL, 0, 0, NULL, '2022-12-05 17:14:08', '2022-12-05 17:14:08'),
(355, 6, 'Booking Notification', 'You Have New Booking Request', 1, 1, 0, NULL, '2022-12-05 17:14:08', '2022-12-05 17:14:08'),
(356, 6, 'Booking Notification', 'You Have New Booking Request', 11, 1, 0, NULL, '2022-12-05 17:14:08', '2022-12-05 17:14:08'),
(357, 6, 'Booking Notification', 'You Have New Booking Request', 12, 1, 0, NULL, '2022-12-05 17:14:08', '2022-12-05 17:14:08'),
(358, 6, 'Booking Notification', 'Your Booking Request Accepted By Agent', 12, 0, 0, NULL, '2022-12-05 17:14:17', '2022-12-05 17:14:17'),
(359, 6, 'Booking Notification', 'Your Order Completed Successfully By Agent', 12, 0, 2, 255, '2022-12-05 17:14:31', '2022-12-05 17:14:49'),
(360, 6, 'Raqting Notification', 'You Have Rated Successfully By User', 12, 1, 2, 255, '2022-12-05 17:14:49', '2022-12-05 17:14:59'),
(361, 6, 'Rating Notification', 'You Have Successfully Rated By Agent', 12, 0, 0, 255, '2022-12-05 17:14:59', '2022-12-05 17:14:59');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_orders` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `package_name`, `package_price`, `total_orders`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Premium', '150', '20', '1', '2022-10-26 23:57:58', '2022-10-26 23:58:19'),
(2, 'Gold', '200', '40', '1', '2022-11-11 17:36:28', '2022-11-11 17:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_fee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `subcategory_name`, `img`, `price`, `subscription_fee`, `sub_desc`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lavage Voiture', 'images/ErI3tbFqLZCi5lxw5cWzIOe6e8nfLug5h33Ol5sn.png', '15', '50', 'Awsome Cutting okay', NULL, '2022-11-07 11:53:22'),
(2, 3, 'Cuisine domestique', 'images/0Zcr6SQbupyrITOBkQlQdmjURD8PCd0BnoChG6eh.png', '25', '20', 'Cuisine a domicile.', NULL, '2022-09-20 01:51:18'),
(3, 2, 'Francais', 'images/Elyq1IF3Y6TzNarFzWAGxPDbgLtNBeVlBgQd9RDx.png', '11.88', '100', 'Francais, tous les niveaux', NULL, '2022-09-22 06:20:38'),
(4, 1, 'Maison et Bureaux', 'images/9loeKhAYyq1CzPKUIwSyyzMqkMpHqK4VRDTq8K21.png', '12', '34', 'Nettoyage Maison ou Bureau', '2022-08-16 23:53:00', '2022-11-04 14:23:37'),
(7, 2, 'Mathematiques', 'images/9loeKhAYyq1CzPKUIwSyyzMqkMpHqK4VRDTq8K21.png', '10.2', '50', 'Maths', '2022-09-20 01:38:50', '2022-09-22 06:20:59'),
(8, 4, 'Coiffure Enfant', 'images/RjS3537tNc7rywY3axuknYavo8rsOUBxdjdyf5QQ.png', '5', '20', 'Coiffure pour enfants.', '2022-11-15 00:18:15', '2022-11-15 00:18:15'),
(9, 4, 'Coiffure Adulte', 'images/upsyC8fa1yQN8i8b9xVqtt6zcEhxih5r1cqCouGb.png', '10', '35', 'Coiffure pour adultes.', '2022-11-15 00:19:05', '2022-11-15 00:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `subscription_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_avg_rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `profile_img`, `name`, `last_name`, `address`, `phone`, `email`, `email_verified_at`, `password`, `balance`, `subscription_status`, `device_token`, `user_avg_rating`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'images/juCqC2JIuCKOg1yLMqiXIfCYfxnwR6zJ29ltTDzV.png', 'Admin', 'admin', 'h2 Block johar Town', '+92 39387665', 'admin@admin.com', NULL, '$2y$10$/0kw80MZtbNOPZT/g9hrlOTxqqep96OhpIY6pJtiqEnmbswbTR09O', '0', '0', NULL, NULL, '9nkuBGu4t3owikojxg9XZRanNM1lnt4yDIXQOMBdQbYTzzBqB08twLDg5j7B', '2022-08-15 02:58:36', '2022-08-15 02:58:36'),
(2, 'images/juCqC2JIuCKOg1yLMqiXIfCYfxnwR6zJ29ltTDzV.png', 'Abdul ', 'Manan', 'h2 Block johar Town', '+92 39387665', 'manan@gmail.com', NULL, '$2y$10$/0kw80MZtbNOPZT/g9hrlOTxqqep96OhpIY6pJtiqEnmbswbTR09O', '900', '1', NULL, NULL, NULL, '2022-08-15 04:15:25', '2022-11-01 06:03:05'),
(5, 'images/juCqC2JIuCKOg1yLMqiXIfCYfxnwR6zJ29ltTDzV.png', 'Shahbaz', 'shakil', 'h2 Block johar Town', '+92 39387665', 'manan123@gmail.com', NULL, '$2y$10$rQF3bIdnBuRpjfNEVrF.qODjUn5UOf5WZUJGl8zosDDdIvTBvevBG', '205.0', '0', 'kjhghjugdjhfassdsf67356khjk', NULL, NULL, '2022-08-18 03:03:06', '2022-12-01 12:38:34'),
(6, 'images/YO912j4S9Vor7Jjvg5KqSpHiIlG99UVeEwOIbo4s.jpg', 'Mussab', 'Ahmad', 'h2 Block johar Town Lahore', '+92 7171717171', 'test123@gmail.com', NULL, '$2y$10$l9xZPBUa8pcuDwchOCeLvOBVsGuYJ75vk1ENG4zNrYUKP1bAprLye', '767.4', '1', 'e681AefgTXqHH2gtqys6oE:APA91bFByUNWGiLvKjj2VmF-7PWWTaLVNoDBuR0ngEvRxTLSgvIhwR96dpx7YAbcp-khoggr_W1gwg3LbbZr2GT2CFz5mVMQt_eA3yAU2jM4w81Qf01PNWyPtfgewW4pAT8fsQSQedOb', '4.6', NULL, '2022-08-26 00:07:52', '2022-12-09 11:36:23'),
(7, 'images/cKa4UrxEIcmqLzU8vWm3u6j03j52NggiSyOpG3i3.jpg', 'Tchouyabe', 'test', '142 Avenue Gaston Rousselle Romainville 93230', '0753771245', 'tchouyabesebastien@gmail.com', NULL, '$2y$10$FUpcu6anZ5AUKj9nScYfTuyuJvwjc18LUQzFAcFKeqDH58lZdRZ6G', '80.0', '1', NULL, NULL, NULL, '2022-11-14 23:44:33', '2022-11-15 00:20:37'),
(8, 'images/K8u5pQBOvVc8pJd4GTlJIlIQmOr3UShoAWDkD6ly.jpg', 'Constant', 'dummy', '450 Pickle road', '478451284', 'lcpkanyfils@yahoo.fr', NULL, '$2y$10$Wkl6ludSfQAjN6t4/szAHe9yVYh5KJ55KdQzw8wvzQwYmETCgqEwW', '0', '0', 'dgsGZzILR-apBvn1UCBvc3:APA91bEzPiqr9tzyyvTQvYU4U9-N9r0mwpa9q-UJkJmxE8VnRNXcX-cMySCv_BPSjg64DVb7MwzOePkWTgSM-6PX0rx4ktOSLAvdZmnv4AL0s1LOB4AM6TThOAL7a2Ht8dTm1Aad5O72', '0', NULL, '2022-11-15 03:36:07', '2022-12-07 22:07:06'),
(9, 'images/', 'Loving', 'Loops', 'h2 Block johar Town', '+92 39387665', 'loops@gmail.com', NULL, '$2y$10$IcY5njoeFb.Z6JHykmB9zeNA4H/VrzhptbHxAHT/pDH8ADcdrciDC', '225', '0', NULL, NULL, NULL, '2022-11-17 01:03:05', '2022-11-17 01:06:12'),
(10, 'images/', 'Test user', 'dummy', 'h2 Block johar Town', '+92 39387665', 'hello111@gmail.com', NULL, '$2y$10$t6vsbg4Q/L4RmxLbD/ul8ekz6JCFfyUOg5Bzlo6/nefPqInpz7X3a', '0', '0', NULL, NULL, NULL, '2022-12-01 13:16:27', '2022-12-01 13:16:27'),
(11, 'images/', 'huhaaaa', 'Haroon', 'Haroon Ali', 'Haroon Ali', 'aliharoonali69@gmail.com', NULL, '$2y$10$Fpas7j3JYwodNGcYHvpfme4ct8DTmR8XFlQJY/JFiuEUDxt1z7Yda', '0', '0', 'e-jzslmIRZyCg8hWOIBKhY:APA91bGBWtc4tREBhbEYgvTxE51Sd9DJoPucStBKg9Si1wxhVxBbXdAHpxkpFBYoNf6r8sfAcZbG37ielV91_7SWCldwutDGVjZD1e4YxFa7twBuGAtUywPQdFASeUdOdTe672HalWAy', '0', NULL, '2022-12-04 15:17:23', '2022-12-05 15:10:54'),
(12, 'images/', 'Test user babar', 'dummy', 'h2 Block johar Town', '+92 39387665', 'babar123@gmail.com', NULL, '$2y$10$4/0K.WxmU/E52slvia/lJuobShVRb07HZ8ga6toUMsXJQh174Rldi', '0', '0', 'djZ5wt6_QIKTQwl4Q0IrsK:APA91bHYJDKMvBjqK3TyTQ6q9AG9dN7-4WKKw77Z2TimNeNbqvQVemNNV4qRdW_FbboH4W69yG9z_H1Uz8QaOEOgUquncCjV7zoxtTvIN_-Lg_Nt_FSuNIKXjJ8lT2aPVWXY6GQZiORO', '0', NULL, '2022-12-05 11:57:05', '2022-12-05 11:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_ratings`
--

CREATE TABLE `user_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `ratings` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_ratings`
--

INSERT INTO `user_ratings` (`id`, `user_id`, `agent_id`, `ratings`, `user_desc`, `book_id`, `created_at`, `updated_at`) VALUES
(7, 6, 12, '4', 'rating', 215, '2022-12-01 20:43:08', '2022-12-01 20:43:08'),
(8, 6, 12, '5.0', 'chxgjcFdh', 217, '2022-12-02 14:41:03', '2022-12-02 14:41:03'),
(9, 6, 12, '5.0', 'khxgkdhlfgks', 216, '2022-12-02 14:41:35', '2022-12-02 14:41:35'),
(10, 6, 12, '5.0', 'jdjdjfjfjfjfj', 218, '2022-12-02 14:44:28', '2022-12-02 14:44:28'),
(11, 6, 12, '1.0', 'chutiyaa user', 219, '2022-12-02 16:23:27', '2022-12-02 16:23:27'),
(12, 6, 11, '5.0', 'wjtj3t', 220, '2022-12-02 16:59:58', '2022-12-02 16:59:58'),
(13, 6, 12, '5.0', 'vjgjfjgjfjfdh', 240, '2022-12-03 19:09:59', '2022-12-03 19:09:59'),
(14, 6, 12, '5.0', 'jgjggjfjjf', 222, '2022-12-03 19:13:39', '2022-12-03 19:13:39'),
(15, 6, 12, '5.0', 'nsjdjdjdjd', 241, '2022-12-03 19:22:36', '2022-12-03 19:22:36'),
(16, 6, 12, '5.0', ';lkljkhjh', 242, '2022-12-05 15:13:36', '2022-12-05 15:13:36'),
(17, 6, 12, '4.0', 'fhfhfjjdhfhyf', 245, '2022-12-05 15:37:22', '2022-12-05 15:37:22'),
(18, 6, 12, '5.0', 'vrgrvr', 250, '2022-12-05 16:49:32', '2022-12-05 16:49:32'),
(19, 6, 12, '5.0', 'user', 253, '2022-12-05 16:54:01', '2022-12-05 16:54:01'),
(20, 6, 12, '5.0', 'ihgifgifu', 255, '2022-12-05 17:14:59', '2022-12-05 17:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subs_id` bigint(20) UNSIGNED NOT NULL,
  `pkg_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pkg_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subs_id`, `pkg_name`, `pkg_price`, `orders`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(10, 2, 1, 'Premium', '100', '19', '01-11-22', '01-12-22', '1', '2022-11-01 06:03:05', '2022-11-03 02:07:29'),
(11, 6, 1, 'Premium', '100', '20', '03-11-22', '03-12-22', '0', '2022-11-03 02:10:15', '2022-11-15 14:59:48'),
(12, 7, 1, 'Premium', '150.0', '16', '14-11-22', '14-12-22', '1', '2022-11-15 00:07:14', '2022-11-17 00:59:43'),
(13, 6, 1, 'Premium', '150', '20', '17-11-22', '17-12-22', '0', '2022-11-17 15:33:29', '2022-11-17 15:33:29'),
(14, 6, 1, 'Premium', '150.0', '20', '17-11-22', '17-12-22', '0', '2022-11-17 16:04:47', '2022-11-17 16:04:47'),
(15, 6, 2, 'Gold', '200.0', '0', '17-11-22', '17-12-22', '0', '2022-11-17 17:07:37', '2022-12-02 18:31:40'),
(16, 6, 2, 'Gold', '200.0', '38', '05-12-22', '04-01-23', '1', '2022-12-05 17:08:07', '2022-12-05 17:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_transactions`
--

CREATE TABLE `user_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `trans_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_transactions`
--

INSERT INTO `user_transactions` (`id`, `user_id`, `trans_name`, `trans_price`, `trans_date`, `trans_time`, `created_at`, `updated_at`) VALUES
(1, 6, 'Premium', '100', '03-11-22', '07:10:15am', '2022-11-03 02:10:15', '2022-11-03 02:10:15'),
(2, 6, 'Service Booking', '25', '26-08-22', '07:22:21am', '2022-11-03 02:22:21', '2022-11-03 02:22:21'),
(3, 6, 'Balance Added', '15', '03-11-22', '07:41:40am', '2022-11-03 02:41:40', '2022-11-03 02:41:40'),
(4, 6, 'Balance Added', '45', '04-11-22', '05:40:04am', '2022-11-04 09:40:04', '2022-11-04 09:40:04'),
(5, 6, 'Service Booking', '10.2', '11/4/2022', '09:37:24am', '2022-11-04 13:37:24', '2022-11-04 13:37:24'),
(6, 6, 'Remaining Balance', '949.8', '04-11-22', '09:37:25am', '2022-11-04 13:37:25', '2022-11-04 13:37:25'),
(7, 6, 'Service Booking', '25', '11/4/2022', '09:39:34am', '2022-11-04 13:39:34', '2022-11-04 13:39:34'),
(8, 6, 'Remaining Balance', '924.8', '04-11-22', '09:39:35am', '2022-11-04 13:39:35', '2022-11-04 13:39:35'),
(9, 6, 'Service Booking', '25', '26-08-22', '06:47:08am', '2022-11-07 11:47:08', '2022-11-07 11:47:08'),
(10, 6, 'Service Booking', '15', '10/20/2022', '06:51:23am', '2022-11-07 11:51:23', '2022-11-07 11:51:23'),
(11, 6, 'Remaining Balance', '909.8', '07-11-22', '06:51:24am', '2022-11-07 11:51:24', '2022-11-07 11:51:24'),
(12, 6, 'Service Booking', '10.2', '11/7/2022', '11:48:18am', '2022-11-07 16:48:18', '2022-11-07 16:48:18'),
(13, 6, 'Remaining Balance', '899.5999999999999', '07-11-22', '11:48:19am', '2022-11-07 16:48:19', '2022-11-07 16:48:19'),
(14, 6, 'Service Booking', '25', '11/7/2022', '11:58:02am', '2022-11-07 16:58:02', '2022-11-07 16:58:02'),
(15, 6, 'Remaining Balance', '874.5999999999999', '07-11-22', '11:58:03am', '2022-11-07 16:58:03', '2022-11-07 16:58:03'),
(16, 6, 'Service Booking', '15', '11/7/2022', '12:00:35pm', '2022-11-07 17:00:35', '2022-11-07 17:00:35'),
(17, 6, 'Remaining Balance', '859.5999999999999', '07-11-22', '12:00:35pm', '2022-11-07 17:00:35', '2022-11-07 17:00:35'),
(18, 6, 'Service Booking', '25', '26-08-2022', '12:40:04pm', '2022-11-07 17:40:04', '2022-11-07 17:40:04'),
(19, 6, 'Service Booking', '15', '11/07/2022', '12:58:59pm', '2022-11-07 17:58:59', '2022-11-07 17:58:59'),
(20, 6, 'Remaining Balance', '844.5999999999999', '07-11-22', '12:58:59pm', '2022-11-07 17:58:59', '2022-11-07 17:58:59'),
(21, 6, 'Service Booking', '25', '26-08-2022', '01:06:54pm', '2022-11-07 18:06:54', '2022-11-07 18:06:54'),
(22, 6, 'Service Booking', '25', '26-08-2022', '01:07:36pm', '2022-11-07 18:07:36', '2022-11-07 18:07:36'),
(23, 6, 'Service Booking', '25', '11/07/2022', '01:12:21pm', '2022-11-07 18:12:21', '2022-11-07 18:12:21'),
(24, 6, 'Remaining Balance', '819.5999999999999', '07-11-22', '01:12:22pm', '2022-11-07 18:12:22', '2022-11-07 18:12:22'),
(25, 6, 'Service Booking', '10.2', '11/08/2022', '08:00:45am', '2022-11-08 13:00:45', '2022-11-08 13:00:45'),
(26, 6, 'Remaining Balance', '809.3999999999999', '08-11-22', '08:00:45am', '2022-11-08 13:00:45', '2022-11-08 13:00:45'),
(27, 6, 'Service Booking', '25', '11/08/2022', '09:42:23am', '2022-11-08 14:42:23', '2022-11-08 14:42:23'),
(28, 6, 'Remaining Balance', '784.3999999999999', '08-11-22', '09:42:24am', '2022-11-08 14:42:24', '2022-11-08 14:42:24'),
(29, 6, 'Service Booking', '12', '11/08/2022', '10:48:03am', '2022-11-08 15:48:03', '2022-11-08 15:48:03'),
(30, 6, 'Remaining Balance', '772.3999999999999', '08-11-22', '10:48:03am', '2022-11-08 15:48:03', '2022-11-08 15:48:03'),
(31, 6, 'Service Booking', '25', '26-08-2022', '12:36:59pm', '2022-11-08 17:36:59', '2022-11-08 17:36:59'),
(32, 5, 'Balance Added', '230', '10-11-22', '07:01:21am', '2022-11-10 12:01:21', '2022-11-10 12:01:21'),
(33, 5, 'Service Booking', '25', '11/10/2022', '08:01:19am', '2022-11-10 13:01:19', '2022-11-10 13:01:19'),
(34, 5, 'Service Booking', '25', '26-08-22', '08:01:25am', '2022-11-10 13:01:25', '2022-11-10 13:01:25'),
(35, 5, 'Service Booking', '25', '26-08-2022', '08:03:06am', '2022-11-10 13:03:06', '2022-11-10 13:03:06'),
(36, 5, 'Service Booking', '25', '26-08-2022', '08:14:42am', '2022-11-10 13:14:42', '2022-11-10 13:14:42'),
(37, 5, 'Service Booking', '25', '11/10/2022', '08:16:51am', '2022-11-10 13:16:51', '2022-11-10 13:16:51'),
(38, 5, 'Remaining Balance', '180.0', '10-11-22', '08:16:52am', '2022-11-10 13:16:52', '2022-11-10 13:16:52'),
(39, 5, 'Remaining Balance', '155.0', '10-11-22', '08:16:52am', '2022-11-10 13:16:52', '2022-11-10 13:16:52'),
(40, 5, 'Remaining Balance', '205.0', '10-11-22', '08:16:52am', '2022-11-10 13:16:52', '2022-11-10 13:16:52'),
(41, 5, 'Service Booking', '25', '26-08-2022', '09:20:11am', '2022-11-11 14:20:11', '2022-11-11 14:20:11'),
(42, 6, 'Service Booking', '15', '11/11/2022', '09:22:29am', '2022-11-11 14:22:29', '2022-11-11 14:22:29'),
(43, 6, 'Remaining Balance', '757.3999999999999', '11-11-22', '09:22:30am', '2022-11-11 14:22:30', '2022-11-11 14:22:30'),
(44, 5, 'Service Booking', '25', '26-08-2022', '09:26:31am', '2022-11-11 14:26:31', '2022-11-11 14:26:31'),
(45, 6, 'Service Booking', '25', '26-08-2022', '09:27:47am', '2022-11-11 14:27:47', '2022-11-11 14:27:47'),
(46, 5, 'Service Booking', '25', '26-08-2022', '09:28:43am', '2022-11-11 14:28:43', '2022-11-11 14:28:43'),
(47, 7, 'Balance Added', '250', '14-11-22', '07:06:26pm', '2022-11-15 00:06:26', '2022-11-15 00:06:26'),
(48, 7, 'Premium', '150.0', '14-11-22', '07:07:14pm', '2022-11-15 00:07:14', '2022-11-15 00:07:14'),
(49, 7, 'Remaining Balance', '100.0', '14-11-22', '07:07:15pm', '2022-11-15 00:07:15', '2022-11-15 00:07:15'),
(50, 7, 'Service Booking', '15', '11/14/2022', '07:09:23pm', '2022-11-15 00:09:23', '2022-11-15 00:09:23'),
(51, 7, 'Remaining Balance', '85.0', '14-11-22', '07:09:24pm', '2022-11-15 00:09:24', '2022-11-15 00:09:24'),
(52, 7, 'Service Booking', '5', '11/14/2022', '07:20:37pm', '2022-11-15 00:20:37', '2022-11-15 00:20:37'),
(53, 7, 'Remaining Balance', '80.0', '14-11-22', '07:20:37pm', '2022-11-15 00:20:37', '2022-11-15 00:20:37'),
(54, 6, 'Service Booking', '25', '26-08-22', '08:17:05am', '2022-11-15 03:17:05', '2022-11-15 03:17:05'),
(55, 9, 'Balance Added', '250', '17-11-22', '06:05:23am', '2022-11-17 01:05:23', '2022-11-17 01:05:23'),
(56, 9, 'Service Booking', '25', '26-08-22', '06:06:12am', '2022-11-17 01:06:12', '2022-11-17 01:06:12'),
(57, 6, 'Service Booking', '25', '26-08-22', '12:13:32pm', '2022-11-22 07:13:32', '2022-11-22 07:13:32'),
(58, 6, 'Service Booking', '25', '26-08-22', '12:15:57pm', '2022-11-22 07:15:57', '2022-11-22 07:15:57'),
(59, 6, 'Service Booking', '25', '26-08-22', '12:17:58pm', '2022-11-22 07:17:58', '2022-11-22 07:17:58'),
(60, 6, 'Service Booking', '25', '12/01/2022', '06:12:43am', '2022-12-01 11:12:43', '2022-12-01 11:12:43'),
(61, 6, 'Service Booking', '25', '12/01/2022', '11:43:38am', '2022-12-01 16:43:38', '2022-12-01 16:43:38'),
(62, 6, 'Service Booking', '25', '12/01/2022', '12:22:34pm', '2022-12-01 17:22:34', '2022-12-01 17:22:34'),
(63, 6, 'Service Booking', '25', '12/01/2022', '12:49:39pm', '2022-12-01 17:49:39', '2022-12-01 17:49:39'),
(64, 6, 'Service Booking', '25', '26-08-2022', '12:56:02pm', '2022-12-01 17:56:02', '2022-12-01 17:56:02'),
(65, 6, 'Service Booking', '25', '12/01/2022', '01:01:55pm', '2022-12-01 18:01:55', '2022-12-01 18:01:55'),
(66, 6, 'Service Booking', '25', '12/01/2022', '01:18:14pm', '2022-12-01 18:18:14', '2022-12-01 18:18:14'),
(67, 6, 'Service Booking', '25', '12/01/2022', '01:53:56pm', '2022-12-01 18:53:56', '2022-12-01 18:53:56'),
(68, 6, 'Service Booking', '25', '12/01/2022', '02:04:36pm', '2022-12-01 19:04:36', '2022-12-01 19:04:36'),
(69, 6, 'Service Booking', '25', '12/01/2022', '02:20:04pm', '2022-12-01 19:20:04', '2022-12-01 19:20:04'),
(70, 6, 'Service Booking', '25', '12/01/2022', '02:46:05pm', '2022-12-01 19:46:05', '2022-12-01 19:46:05'),
(71, 6, 'Service Booking', '25', '12/01/2022', '03:37:21pm', '2022-12-01 20:37:21', '2022-12-01 20:37:21'),
(72, 6, 'Service Booking', '25', '12/01/2022', '03:40:50pm', '2022-12-01 20:40:50', '2022-12-01 20:40:50'),
(73, 6, 'Service Booking', '25', '12/02/2022', '07:06:00am', '2022-12-02 12:06:00', '2022-12-02 12:06:00'),
(74, 6, 'Service Booking', '25', '12/02/2022', '07:23:42am', '2022-12-02 12:23:42', '2022-12-02 12:23:42'),
(75, 6, 'Service Booking', '25', '12/02/2022', '09:43:22am', '2022-12-02 14:43:22', '2022-12-02 14:43:22'),
(76, 6, 'Service Booking', '25', '12/02/2022', '11:17:51am', '2022-12-02 16:17:51', '2022-12-02 16:17:51'),
(77, 6, 'Service Booking', '25', '12/02/2022', '11:46:11am', '2022-12-02 16:46:11', '2022-12-02 16:46:11'),
(78, 6, 'Service Booking', '25', '12/02/2022', '12:31:50pm', '2022-12-02 17:31:50', '2022-12-02 17:31:50'),
(79, 6, 'Service Booking', '25', '12/02/2022', '01:19:39pm', '2022-12-02 18:19:39', '2022-12-02 18:19:39'),
(80, 6, 'Service Booking', '25', '12/02/2022', '01:25:49pm', '2022-12-02 18:25:49', '2022-12-02 18:25:49'),
(81, 6, 'Service Booking', '25', '12/02/2022', '01:27:05pm', '2022-12-02 18:27:05', '2022-12-02 18:27:05'),
(82, 6, 'Service Booking', '25', '12/02/2022', '01:32:45pm', '2022-12-02 18:32:45', '2022-12-02 18:32:45'),
(83, 6, 'Service Booking', '25', '12/02/2022', '01:34:09pm', '2022-12-02 18:34:09', '2022-12-02 18:34:09'),
(84, 6, 'Service Booking', '25', '12/02/2022', '01:39:38pm', '2022-12-02 18:39:38', '2022-12-02 18:39:38'),
(85, 6, 'Service Booking', '25', '12/02/2022', '01:42:12pm', '2022-12-02 18:42:12', '2022-12-02 18:42:12'),
(86, 6, 'Service Booking', '25', '12/02/2022', '01:48:40pm', '2022-12-02 18:48:40', '2022-12-02 18:48:40'),
(87, 6, 'Service Booking', '25', '12/02/2022', '01:54:41pm', '2022-12-02 18:54:41', '2022-12-02 18:54:41'),
(88, 6, 'Service Booking', '25', '12/02/2022', '01:58:44pm', '2022-12-02 18:58:44', '2022-12-02 18:58:44'),
(89, 6, 'Service Booking', '25', '12/02/2022', '02:00:27pm', '2022-12-02 19:00:27', '2022-12-02 19:00:27'),
(90, 6, 'Service Booking', '25', '12/03/2022', '07:40:57am', '2022-12-03 12:40:57', '2022-12-03 12:40:57'),
(91, 6, 'Service Booking', '25', '12/03/2022', '07:58:18am', '2022-12-03 12:58:18', '2022-12-03 12:58:18'),
(92, 6, 'Service Booking', '25', '12/03/2022', '08:22:43am', '2022-12-03 13:22:43', '2022-12-03 13:22:43'),
(93, 6, 'Service Booking', '25', '12/03/2022', '08:46:41am', '2022-12-03 13:46:41', '2022-12-03 13:46:41'),
(94, 6, 'Service Booking', '25', '12/03/2022', '08:48:24am', '2022-12-03 13:48:24', '2022-12-03 13:48:24'),
(95, 6, 'Service Booking', '25', '12/03/2022', '08:53:16am', '2022-12-03 13:53:16', '2022-12-03 13:53:16'),
(96, 6, 'Service Booking', '25', '12/03/2022', '08:56:28am', '2022-12-03 13:56:28', '2022-12-03 13:56:28'),
(97, 6, 'Service Booking', '25', '12/03/2022', '01:59:17pm', '2022-12-03 18:59:17', '2022-12-03 18:59:17'),
(98, 6, 'Service Booking', '25', '12/03/2022', '02:19:47pm', '2022-12-03 19:19:47', '2022-12-03 19:19:47'),
(99, 6, 'Service Booking', '25', '01/03/2023', '02:23:43pm', '2022-12-03 19:23:43', '2022-12-03 19:23:43'),
(100, 6, 'Service Booking', '15', '12/05/2022', '10:05:07am', '2022-12-05 15:05:07', '2022-12-05 15:05:07'),
(101, 6, 'Service Booking', '25', '12/06/2022', '10:32:33am', '2022-12-05 15:32:33', '2022-12-05 15:32:33'),
(102, 6, 'Service Booking', '25', '12/05/2022', '10:35:17am', '2022-12-05 15:35:17', '2022-12-05 15:35:17'),
(103, 6, 'Service Booking', '25', '12/05/2022', '10:42:01am', '2022-12-05 15:42:01', '2022-12-05 15:42:01'),
(104, 6, 'Service Booking', '25', '12/05/2022', '10:48:46am', '2022-12-05 15:48:46', '2022-12-05 15:48:46'),
(105, 6, 'Service Booking', '25', '12/05/2022', '10:52:08am', '2022-12-05 15:52:08', '2022-12-05 15:52:08'),
(106, 6, 'Service Booking', '25', '12/05/2022', '10:53:59am', '2022-12-05 15:53:59', '2022-12-05 15:53:59'),
(107, 6, 'Service Booking', '25', '12/05/2022', '11:10:53am', '2022-12-05 16:10:53', '2022-12-05 16:10:53'),
(108, 6, 'Service Booking', '25', '12/05/2022', '11:28:35am', '2022-12-05 16:28:35', '2022-12-05 16:28:35'),
(109, 6, 'Balance Added', '1000', '05-12-22', '11:29:31am', '2022-12-05 16:29:31', '2022-12-05 16:29:31'),
(110, 6, 'Service Booking', '25', '12/05/2022', '11:37:23am', '2022-12-05 16:37:23', '2022-12-05 16:37:23'),
(111, 6, 'Service Booking', '25', '12/05/2022', '11:53:02am', '2022-12-05 16:53:02', '2022-12-05 16:53:02'),
(112, 6, 'Gold', '200.0', '05-12-22', '12:08:07pm', '2022-12-05 17:08:07', '2022-12-05 17:08:07'),
(113, 6, 'Service Booking', '25', '12/05/2022', '12:09:36pm', '2022-12-05 17:09:36', '2022-12-05 17:09:36'),
(114, 6, 'Service Booking', '25', '12/05/2022', '12:14:08pm', '2022-12-05 17:14:08', '2022-12-05 17:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `codes`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(2, 'x26g57', '15', '1', '2022-10-18 07:23:49', '2022-11-03 02:41:40'),
(3, 'MXC451', '100', '0', '2022-10-18 07:23:59', '2022-10-19 00:05:46'),
(4, 'test', '230', '0', '2022-11-10 12:00:32', '2022-11-10 12:01:21'),
(5, 'W!C093F04SE', '250', '0', '2022-11-15 00:05:28', '2022-11-17 01:05:23'),
(6, 'babar', '1000', '0', '2022-12-05 16:29:17', '2022-12-05 16:29:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agents_email_unique` (`agent_email`);

--
-- Indexes for table `agent_details`
--
ALTER TABLE `agent_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_details_request_id_foreign` (`request_id`),
  ADD KEY `agent_details_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `agent_ratings`
--
ALTER TABLE `agent_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_ratings_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `agent_requests`
--
ALTER TABLE `agent_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_requests_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `all_categories`
--
ALTER TABLE `all_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_cat_id_foreign` (`cat_id`),
  ADD KEY `bookings_subcat_id_foreign` (`subcat_id`),
  ADD KEY `bookings_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_details_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `help_sections`
--
ALTER TABLE `help_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ratings_user_id_foreign` (`user_id`),
  ADD KEY `user_ratings_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscriptions_user_id_foreign` (`user_id`),
  ADD KEY `user_subscriptions_subs_id_foreign` (`subs_id`);

--
-- Indexes for table `user_transactions`
--
ALTER TABLE `user_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `agent_details`
--
ALTER TABLE `agent_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `agent_ratings`
--
ALTER TABLE `agent_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `agent_requests`
--
ALTER TABLE `agent_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `all_categories`
--
ALTER TABLE `all_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_sections`
--
ALTER TABLE `help_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_ratings`
--
ALTER TABLE `user_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_transactions`
--
ALTER TABLE `user_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_ratings`
--
ALTER TABLE `agent_ratings`
  ADD CONSTRAINT `agent_ratings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  ADD CONSTRAINT `bookings_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `all_categories` (`id`),
  ADD CONSTRAINT `bookings_subcat_id_foreign` FOREIGN KEY (`subcat_id`) REFERENCES `sub_categories` (`id`),
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `all_categories` (`id`);

--
-- Constraints for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD CONSTRAINT `user_ratings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  ADD CONSTRAINT `user_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `user_subscriptions_subs_id_foreign` FOREIGN KEY (`subs_id`) REFERENCES `subscriptions` (`id`),
  ADD CONSTRAINT `user_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_transactions`
--
ALTER TABLE `user_transactions`
  ADD CONSTRAINT `user_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
