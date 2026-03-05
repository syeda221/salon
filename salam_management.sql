-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2026 at 12:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salam_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `status` enum('pending','confirmed','rejected','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) DEFAULT 'unpaid',
  `payment_method` varchar(50) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `client_id`, `service_id`, `staff_id`, `appointment_date`, `slot_id`, `status`, `created_at`, `payment_status`, `payment_method`, `paid_amount`, `paid_at`) VALUES
(1, 1, NULL, 1, '2026-02-28', 4, 'confirmed', '2026-02-27 22:28:51', 'paid', 'card', 1700.00, '2026-02-28 04:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_services`
--

CREATE TABLE `appointment_services` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_services`
--

INSERT INTO `appointment_services` (`id`, `appointment_id`, `service_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`) VALUES
(1, 'qunoot', 's.qunootzehra@gmail.com', '23456789078');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `min_limit` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_name`, `quantity`, `min_limit`) VALUES
(1, 'Hair Color Tube', 20, 5),
(2, 'Shampoo Bottle', 10, 3),
(3, 'Facial Kit', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `appointment_id`, `amount`, `payment_method`, `payment_date`) VALUES
(1, 1, 1700.00, 'card', '2026-02-27 23:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'admin'),
(2, 'receptionist'),
(3, 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `services_img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `services_img`, `price`) VALUES
(1, 'manicures', '1769507860.png', 1700.00);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_img` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_img`, `name`, `user_id`) VALUES
(1, '2-preview-1767624501703.png', 'mahnoor', 4);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `slot_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `slot_time`) VALUES
(1, '11:00:00'),
(2, '11:30:00'),
(3, '12:00:00'),
(4, '12:30:00'),
(5, '14:00:00'),
(6, '14:30:00'),
(7, '15:00:00'),
(8, '15:30:00'),
(9, '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) NOT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `user_name`, `user_email`, `user_img`, `user_password`, `created_at`) VALUES
(1, 1, 'ali', 'ali@gmail.com', '', '$2y$10$o6kKv60H0o3yFrwz3bERCOGenTPCTJl8CcOtW2a1/bT4ZP.FkepM.', '2026-02-27 22:03:26'),
(2, 3, 'hassan', 'hassan@gmail.com', '2-preview-1767624501703.png', '$2y$10$Wt6YO1o3Rxo1aQUvOsF6VuxPjOo4Ydn9W/XgwZ1et9w54iyBFNFxK', '2026-02-27 22:08:35'),
(4, 3, 'mahnoor', 'mahnoor@gmail.com', '2-preview-1767624501703.png', '$2y$10$tL0jYlA6BErgYr6nmARBv.Qt8gpSeYoGKseKZ.DqOBk1BGp7/j9YG', '2026-02-27 22:20:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD danger KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD danger KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD danger KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD danger KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD danger KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD danger KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD danger KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD danger KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD danger KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD danger KEY (`id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_services`
--
ALTER TABLE `appointment_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`slot_id`) REFERENCES `time_slots` (`id`);

--
-- Constraints for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD CONSTRAINT `appointment_services_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
