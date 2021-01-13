-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Gen 13, 2021 alle 17:33
-- Versione del server: 5.7.32
-- Versione PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `rooms`
--

CREATE TABLE `rooms` (
  `r_id` int(11) NOT NULL,
  `r_number` smallint(6) NOT NULL,
  `r_max_guest` tinyint(4) NOT NULL,
  `r_num_single` tinyint(4) DEFAULT NULL,
  `r_num_queen` tinyint(4) DEFAULT NULL,
  `r_num_sofabed` tinyint(4) DEFAULT NULL,
  `r_children` tinyint(1) DEFAULT NULL,
  `r_pet` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `rooms`
--

INSERT INTO `rooms` (`r_id`, `r_number`, `r_max_guest`, `r_num_single`, `r_num_queen`, `r_num_sofabed`, `r_children`, `r_pet`) VALUES
(1, 101, 6, 2, 2, 0, 0, 1),
(2, 102, 6, 4, 1, 0, 1, 1),
(3, 103, 6, 3, 1, 1, 0, 1),
(4, 104, 6, 3, 1, 1, 0, 1),
(5, 105, 6, 3, 1, 1, 0, 1),
(6, 106, 6, 3, 1, 1, 0, 1),
(7, 110, 4, 2, 1, 0, 1, 1),
(8, 111, 4, 4, 0, 0, 1, 1),
(9, 112, 4, 0, 2, 0, 1, 1),
(10, 113, 4, 1, 1, 1, 1, 1),
(11, 114, 4, 1, 1, 1, 1, 1),
(12, 115, 4, 1, 1, 1, 1, 1),
(13, 116, 4, 1, 1, 1, 1, 1),
(14, 120, 3, 1, 1, 0, 1, 1),
(15, 121, 3, 0, 1, 1, 1, 1),
(16, 122, 3, 0, 1, 1, 1, 1),
(17, 123, 3, 0, 1, 1, 1, 1),
(18, 124, 3, 0, 1, 1, 1, 1),
(19, 125, 3, 0, 1, 1, 1, 1),
(20, 126, 3, 0, 1, 1, 1, 1),
(21, 130, 2, 0, 1, 0, 0, 1),
(22, 131, 2, 2, 0, 0, 0, 1),
(23, 132, 2, 1, 0, 1, 0, 1),
(24, 133, 2, 0, 1, 0, 0, 1),
(25, 134, 2, 2, 0, 0, 0, 1),
(26, 135, 2, 1, 0, 1, 0, 1),
(27, 136, 2, 1, 0, 1, 0, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`r_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `rooms`
--
ALTER TABLE `rooms`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
