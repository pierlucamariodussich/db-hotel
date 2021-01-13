-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Gen 13, 2021 alle 15:08
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
  `g_id` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `guests`
--

CREATE TABLE `guests` (
  `g_id` int(11) NOT NULL,
  `g_name` varchar(50) NOT NULL,
  `g_surname` varchar(50) NOT NULL,
  `g_email` varchar(50) NOT NULL,
  `g_cel` tinyint(4) NOT NULL,
  `g_tel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Struttura della tabella `rooms_booking`
--

CREATE TABLE `rooms_booking` (
  `r_id` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `r_number` (`r_number`);

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
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `guests`
--
ALTER TABLE `guests`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `rooms`
--
ALTER TABLE `rooms`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

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