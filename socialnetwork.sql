-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2021 at 11:14 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialnetwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `posted_at` datetime NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `posted_at`, `post_id`) VALUES
(1, 'fawf', 9, '2021-10-24 20:38:55', 2),
(2, 'gawgawga', 9, '2021-10-24 20:41:24', 2),
(3, 'hello', 16, '2021-10-28 07:24:36', 2),
(4, 'gawgwag', 16, '2021-10-28 07:25:52', 2),
(5, 'gawgwag', 16, '2021-10-28 07:27:00', 2),
(6, 'gagesg', 16, '2021-10-28 07:30:02', 2),
(7, 'gawgawg', 16, '2021-10-28 07:30:04', 2),
(8, 'awgagawg', 16, '2021-10-28 07:35:06', 2),
(9, '@\r\n', 8, '2021-10-28 08:01:50', 2),
(10, '@', 8, '2021-10-28 08:01:56', 2),
(11, 'gwagaw', 8, '2021-10-28 08:03:01', 2),
(12, 'gwaga', 8, '2021-10-28 08:03:04', 2),
(13, 'fwafaw', 17, '2021-10-28 08:34:48', 2),
(14, '@PHP ', 17, '2021-10-28 08:41:31', 2),
(15, '@php', 17, '2021-10-28 08:41:36', 2),
(16, '@damir Hello', 17, '2021-10-28 08:43:24', 2),
(17, '@damir tetes', 17, '2021-10-28 08:44:10', 2),
(18, 'gesgs', 17, '2021-10-28 08:44:15', 2),
(19, 'ggseg', 17, '2021-10-28 08:44:36', 5),
(20, '@Haris ee', 17, '2021-10-28 08:45:48', 2),
(21, '@Haris hello', 10, '2021-10-28 08:46:59', 2),
(22, '@Hello heee', 10, '2021-10-28 08:47:10', 2),
(23, '@Haris ggg', 17, '2021-10-28 08:51:06', 2),
(24, '@Hello ', 17, '2021-10-28 08:51:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `user_id`, `follower_id`) VALUES
(16, 9, 10),
(17, 9, 15),
(18, 10, 17);

-- --------------------------------------------------------

--
-- Table structure for table `login_tokens`
--

CREATE TABLE `login_tokens` (
  `id` int(11) NOT NULL,
  `token` char(64) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_tokens`
--

INSERT INTO `login_tokens` (`id`, `token`, `user_id`) VALUES
(12, '39b71ef30b3032e4f311faf26e965ceb9269a0a1', 9),
(15, '12975449cbeef92d5c840e68e9cb338a26d3104b', 10),
(16, '0c5afd2f09dd6b15d14ce9f06336bffa2c083b45', 15),
(18, '5b34902250f72851a1e1f6416485111ea73647cc', 9),
(19, '90145612ce982838c148feb0c46a0c3dcad0b3dd', 9),
(20, '2f87b2bf61a040f5886f242227c19a8fbb67fcec', 16),
(21, '05f2687343f77ac94c10cce02d11b047ebdb02b8', 8),
(27, 'a7ba1e5768d60643dff093f75012780948bf1edc', 10),
(28, 'af620c0e07e767c3f39f7f72af7b4c070be9f9b1', 17),
(29, '9fb816ede5814424086abb7cddc710c750ac100e', 17);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `sender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_tokens`
--

CREATE TABLE `password_tokens` (
  `id` int(11) NOT NULL,
  `token` char(64) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password_tokens`
--

INSERT INTO `password_tokens` (`id`, `token`, `user_id`) VALUES
(3, '3fc2e03fa976fcfae46bcfbc28272ccff91ec498', 8),
(4, '8ed07a1ed591af7c8ca7d9f33eee0496c7018256', 17),
(5, 'ec6385feb26395b8564fa499344249f5c81e48e5', 8);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` varchar(255) NOT NULL,
  `posted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(10) NOT NULL,
  `likes` int(10) NOT NULL,
  `postimg` varchar(255) NOT NULL,
  `topics` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `posted_at`, `user_id`, `likes`, `postimg`, `topics`) VALUES
(1, 'Hello world', '2021-10-20 11:45:11', 8, 0, '', ''),
(2, 'wagaw', '2021-10-29 08:13:46', 9, 5, '', ''),
(3, 'Hello', '2021-10-21 14:14:26', 10, 0, '', ''),
(4, 'Hello', '2021-10-22 14:36:13', 15, 1, '', ''),
(5, 'Hello all, my the second post', '2021-10-28 20:45:43', 9, 1, '', ''),
(6, 'awgwagawg', '2021-10-28 19:30:44', 16, 0, '', ''),
(7, 'gawgagawg', '2021-10-28 19:34:59', 16, 0, '', ''),
(10, 'Hello ', '2021-10-28 20:42:01', 17, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`) VALUES
(9, 2, 15),
(10, 4, 15),
(18, 5, 9),
(61, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `profileimg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `verified`, `profileimg`) VALUES
(8, 'Tarik', '$2y$10$eq6F8QOtaH2X81FBAD4WLut9n5ZN6aB.vBYu6x8UhdQ.hdIxomO/C', 'tarik@gmail.com', 0, ''),
(9, 'damir', '$2y$10$k9chvyPPXYBc6oArcLJgAOqUDNaM9is0SWHhJXguAHDDcgsS6M5ZS', 'faf@gmail.com', 0, ''),
(10, 'Hello', '$2y$10$D6QaLRcXf8ljTeJLMXmT4eJpCXcLUBxAd6JT6iXYglCz/xhpTtgDq', 'tarik2000_karate@hotmail.com', 0, ''),
(11, 'Tarikk', '$2y$10$8HiKzelVp4p4HMRI6P8osOD4amDe2ZayQhjCq3w2gb9Fx9TyJy6/e', 'tarikk@gmail.com', 0, ''),
(12, 'Tarikkk', '$2y$10$2N.TzHkFQ2b8o/aWMyVTXemljptEoH6bL16cUt3SMPPUHAvzXkAYG', 'terzotarik@gmail.com', 0, ''),
(13, 'Mirha', '$2y$10$W4fepnVNj..Qm.NRXWmmt.Mdyv7nTNc3pHSGdsDOEN4FUZc5JzV2S', 'tarikkk@gmail.com', 0, ''),
(14, 'Tarikkkk', '$2y$10$NsDOrrA6W0oLgWocLg4mWej/5elRQfWEPSoLwFQxdnLDvFOeyBW.y', 'wfaf@gmail.com', 0, ''),
(15, 'Nermin', '$2y$10$7.vc2UzNS7oLh6VBqrE6COuc4zpa7O2DEjNV8cUxBqMO/UOQKqekK', 'nerko@gmail.com', 0, ''),
(16, 'Helloo', '$2y$10$DqvyCpUT.bLK4OwH7MPRuu9pjHC8zzamy0/u.YHGbRFqfDs/VN8d6', 'fa@gmail.com', 0, ''),
(17, 'Haris', '$2y$10$fIeOh3DfDsEygDF43YPXz.cYg/37jnEDDZWOHQdcihXnzkdHhXpQu', 'haris@gmail.com', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `receiver` (`receiver`),
  ADD KEY `sender` (`sender`);

--
-- Indexes for table `password_tokens`
--
ALTER TABLE `password_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `likes` (`likes`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `login_tokens`
--
ALTER TABLE `login_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_tokens`
--
ALTER TABLE `password_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD CONSTRAINT `login_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
