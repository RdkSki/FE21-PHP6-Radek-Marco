-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Aug 2021 um 14:32
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `crud_login`
--
CREATE DATABASE IF NOT EXISTS `crud_login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud_login`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `fk_supplierId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `picture`, `fk_supplierId`) VALUES
(1, 'test', '12.00', 'product.png', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `supplier`
--

CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `sup_email` varchar(50) DEFAULT NULL,
  `sup_website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `supplier`
--

INSERT INTO `supplier` (`supplierId`, `sup_name`, `sup_email`, `sup_website`) VALUES
(1, 'Shopy International LLC', 'shopy@mail.com', 'shopy.international.com'),
(2, 'Amazon INC', 'amazon@mail.com', 'amazon.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `status` varchar(4) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `date_of_birth`, `email`, `picture`, `status`) VALUES
(3, 'Ghiath', 'Serri', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2021-08-11', 'serri@mail.com', 'avatar.png', 'adm'),
(5, 'acilio', 'netto', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2021-07-28', 'acilio@gmail.com', 'avatar.png', 'user'),
(6, 'irati', 'irat', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2021-07-31', 'irati@gmail.com', 'avatar.png', 'user');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplierId` (`fk_supplierId`);

--
-- Indizes für die Tabelle `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_supplierId`) REFERENCES `supplier` (`supplierId`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
