-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creation time: Апр 26 2023 г., 23:42
-- Server version: 8.0.30
-- Version PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Data base`spring_mvc_app`
--

-- --------------------------------------------------------

--
-- Table structure`book`
--

CREATE TABLE `book` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `year` int NOT NULL,
  `person_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table data dump `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `year`, `person_id`) VALUES
(26, 'A Tale of Two Cities', 'Charles Dickens', 1859, 9),
(27, 'The Little Prince', 'A. de Saint-Exupery', 1943, 9),
(28, 'Dream of the Chamber', 'Cao Xueqin', 1791, 11),
(29, 'The Hobbit', 'J.R.R. Tolkien', 1937, 10),
(30, 'The Da Vinci Code', 'Dan Brown', 2003, 14),
(31, 'Heidi', 'Johanna Spyri', 1880, 12),
(32, 'Lolita', 'Vladimir Nabokov', 1955, 10),
(33, 'The Hite Report', 'Shere Hite', 1976, 1);

-- --------------------------------------------------------

--
-- Table structure `person`
--

CREATE TABLE `person` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table data dump `person`
--

INSERT INTO `person` (`id`, `name`, `age`, `email`, `address`) VALUES
(1, 'NONE', 0, 'NONE@', 'NONE'),
(9, 'Tim Jones', 22, 'timjones@gmail.com', 'Heilbronn, Germany, 740720'),
(10, 'Henry Gilbert', 33, 'henrygilber@gmail.com', 'NewYork, USA, 100010'),
(11, 'Grigg Harris', 19, 'harrisgrig@gmail.com', 'Ohatchee, USA, 362710'),
(12, 'Jensen Andersen', 49, 'jensenandersen@gmail.com', 'Copenhagen, Denmark, 105000'),
(14, 'Asahi Hiroshi', 38, 'asashihiroshi@gmail.com', 'Tokyo, Japan, 100005');

--
-- Indexes of saved tables
--

--
-- Indexes of table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `Txt` (`person_id`);

--
-- Indexes of table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for saved tables
--

--
-- AUTO_INCREMENT for table`book`
--
ALTER TABLE `book`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Foreign key constraints for saved tables
--

--
-- Foreign key constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `Txt` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
