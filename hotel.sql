-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Gen 13, 2021 alle 17:04
-- Versione del server: 5.7.32
-- Versione PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `booking`
--

CREATE TABLE `booking` (
  `b_id` int(11) NOT NULL,
  `b_checkin` date NOT NULL,
  `b_checkout` date NOT NULL,
  `b_number_of_rooms` tinyint(4) NOT NULL,
  `b_numbers_guests` tinyint(4) NOT NULL,
  `b_numbers_childs` tinyint(4) DEFAULT NULL,
  `b_numebers_pets` int(11) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `booking`
--

INSERT INTO `booking` (`b_id`, `b_checkin`, `b_checkout`, `b_number_of_rooms`, `b_numbers_guests`, `b_numbers_childs`, `b_numebers_pets`, `g_id`) VALUES
(1, '2021-01-13', '2021-01-16', 2, 4, 2, 0, 1),
(2, '2021-01-21', '2021-01-28', 1, 6, 3, 1, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `guests`
--

CREATE TABLE `guests` (
  `g_id` int(11) NOT NULL,
  `g_name` varchar(50) NOT NULL,
  `g_surname` varchar(50) NOT NULL,
  `g_email` varchar(50) NOT NULL,
  `g_cel` varchar(10) NOT NULL,
  `g_tel` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `guests`
--

INSERT INTO `guests` (`g_id`, `g_name`, `g_surname`, `g_email`, `g_cel`, `g_tel`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.it', '3333333333', '0001000000'),
(2, 'Andrea', 'Bianchi', 'andrea.bianchi@email.it', '3283333333', '0002000000');

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
  `r_children` tinyint(4) DEFAULT NULL,
  `r_pet` tinyint(4) DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Struttura della tabella `rooms_booking`
--

CREATE TABLE `rooms_booking` (
  `r_id` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `rooms_booking`
--

INSERT INTO `rooms_booking` (`r_id`, `b_id`) VALUES
(23, 1),
(24, 1),
(2, 2);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`b_id`),
  ADD KEY `g_id` (`g_id`);

--
-- Indici per le tabelle `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`g_id`);

--
-- Indici per le tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`r_id`);

--
-- Indici per le tabelle `rooms_booking`
--
ALTER TABLE `rooms_booking`
  ADD KEY `r_id` (`r_id`),
  ADD KEY `b_id` (`b_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `booking`
--
ALTER TABLE `booking`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `guests`
--
ALTER TABLE `guests`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `rooms`
--
ALTER TABLE `rooms`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `guests` (`g_id`);

--
-- Limiti per la tabella `rooms_booking`
--
ALTER TABLE `rooms_booking`
  ADD CONSTRAINT `rooms_booking_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `rooms` (`r_id`),
  ADD CONSTRAINT `rooms_booking_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `booking` (`b_id`);
