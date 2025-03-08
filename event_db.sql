-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2025 at 10:25 PM
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
-- Database: `event_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `otp_code` varchar(6) NOT NULL,
  `checked_in` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_date` date NOT NULL DEFAULT curdate(),
  `end_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `title`, `description`, `created_at`, `start_date`, `end_date`) VALUES
(30, 1, 'Test1', '1', '2025-03-03 23:49:24', '2025-03-04', '2025-03-04'),
(34, 1, 'Test2', '2', '2025-03-04 00:00:52', '2025-03-04', '2025-03-04'),
(35, 1, 'Test3', '3', '2025-03-04 00:17:36', '2025-03-04', '2025-03-04'),
(38, 1, 'Test4', '...........', '2025-03-04 00:57:29', '2025-03-04', '2025-03-11'),
(39, 1, 'Test5', '5', '2025-03-04 01:33:27', '2025-03-12', '2025-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `event_images`
--

CREATE TABLE `event_images` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_images`
--

INSERT INTO `event_images` (`id`, `event_id`, `image_url`) VALUES
(20, 30, 'uploads/1262705.jpg'),
(27, 34, 'uploads/1275093.png'),
(28, 34, 'uploads/1277585.png'),
(29, 35, 'uploads/1307881.jpg'),
(31, 35, 'uploads/1292265.jpg'),
(36, 38, 'uploads/1312523.png'),
(37, 38, 'uploads/1312059.jpg'),
(38, 38, 'uploads/1309781.jpg'),
(40, 39, 'uploads/1262705.jpg'),
(41, 39, 'uploads/1295097.jpg'),
(42, 39, 'uploads/1302684.jpg'),
(43, 35, 'uploads/67c85864a4c18-1308212.png'),
(44, 34, 'uploads/67c8bc8f0a0a9-1315574.jpg'),
(45, 34, 'uploads/67c8bc8f0a9e6-1316098.png');

-- --------------------------------------------------------

--
-- Table structure for table `event_statistics`
--

CREATE TABLE `event_statistics` (
  `event_id` int(11) DEFAULT NULL,
  `total_registrations` int(11) DEFAULT 0,
  `total_checked_in` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `checked_in` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `user_id`, `event_id`, `status`, `created_at`, `checked_in`) VALUES
(17, 2, 30, 'approved', '2025-03-04 00:09:13', 1),
(18, 2, 34, 'approved', '2025-03-04 00:09:16', 1),
(22, 3, 39, 'rejected', '2025-03-05 13:32:47', 0),
(23, 4, 30, 'approved', '2025-03-05 20:51:18', 1),
(24, 5, 30, 'approved', '2025-03-05 20:52:17', 1),
(25, 3, 34, 'rejected', '2025-03-05 20:58:27', 0),
(26, 5, 34, 'rejected', '2025-03-05 20:58:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `role` enum('admin','volunteer') NOT NULL DEFAULT 'volunteer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `gender`, `role`, `created_at`) VALUES
(1, 'alice.johnson@example.com', '$2y$10$NbZPDI8zrOMz0venNJPvn.i6DXDp1nEEU/YGZku6PTTEvvUSqi2/6', 'Alice', 'Johnson', 'female', 'admin', '2025-03-01 21:49:42'),
(2, 'bob.smith@example.com', '$2y$10$.Yh.8y7VKxB5FZRASnJqYOBqFvqGcm3579yKWN7r8h9cig3WYahvW', 'Bob', 'Smith', 'male', 'volunteer', '2025-03-01 21:57:35'),
(3, 'henry.moore@example.com', '$2y$10$98ZrkC60ferj3YwmfFJdyeLaK2jx7hMDjQEUtneZrPIEETVR5K2sG', 'Henry', 'Moore', 'male', 'volunteer', '2025-03-01 22:38:29'),
(4, 'jack.anderson@example.com', '$2y$10$g6MnRkOqAv2iKvrvCj.YPe.vCKpP08.5OBkMMpV8mHbuxWWSf.hvW', 'Jack', 'anderson', 'male', 'volunteer', '2025-03-01 22:48:35'),
(5, 'frank.miller@example.com', '$2y$10$MPouC5l/gCRcMsNjU2t1a.EdbrN/dhy7s5Z5Xg2m8HXceuDB/puOC', 'Frank', 'Miller', 'male', 'volunteer', '2025-03-05 20:52:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_id` (`registration_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event_images`
--
ALTER TABLE `event_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `event_statistics`
--
ALTER TABLE `event_statistics`
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `event_images`
--
ALTER TABLE `event_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_images`
--
ALTER TABLE `event_images`
  ADD CONSTRAINT `event_images_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_statistics`
--
ALTER TABLE `event_statistics`
  ADD CONSTRAINT `event_statistics_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
