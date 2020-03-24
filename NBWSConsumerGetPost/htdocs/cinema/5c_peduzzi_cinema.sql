-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 14, 2020 alle 09:01
-- Versione del server: 10.4.6-MariaDB
-- Versione PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5c_peduzzi_cinema`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attori`
--

CREATE TABLE `attori` (
  `CodAttore` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `AnnaNascita` date NOT NULL,
  `Nazionalita` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `attori`
--

INSERT INTO `attori` (`CodAttore`, `Nome`, `AnnaNascita`, `Nazionalita`) VALUES
(1, 'Turati Marco', '2000-07-10', 'Italiana'),
(3, 'Peduzzi Samuele', '2001-04-28', 'Italiana'),
(5, 'Bernard Arnault', '1960-07-19', 'Africana');

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `CodFilm` int(11) NOT NULL,
  `Titolo` varchar(35) NOT NULL,
  `AnnoProduzione` int(4) NOT NULL,
  `Nazionalita` varchar(30) NOT NULL,
  `Regista` varchar(30) NOT NULL,
  `Genere` varchar(30) NOT NULL,
  `Durata` int(11) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`CodFilm`, `Titolo`, `AnnoProduzione`, `Nazionalita`, `Regista`, `Genere`, `Durata`, `url`) VALUES
(1, 'Film1', 2015, 'Americana', 'Turati', 'Fantascienza', 120, 'img1.jpg'),
(2, 'Film2', 2019, 'Inglese', 'Arnold', 'Azione', 250, 'Film2.jpg'),
(3, 'Breaking bad', 2008, 'Americana', 'Vince Gilligan', 'Fantascienza/Azione', 890, 'breakingbad.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `proiezioni`
--

CREATE TABLE `proiezioni` (
  `CodProiezione` int(11) NOT NULL,
  `CodFilm` int(11) NOT NULL,
  `CodSala` int(11) NOT NULL,
  `Incasso` float NOT NULL,
  `DataProiezione` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `proiezioni`
--

INSERT INTO `proiezioni` (`CodProiezione`, `CodFilm`, `CodSala`, `Incasso`, `DataProiezione`) VALUES
(1, 2, 1, 450.25, '2020-02-06 07:30:00'),
(2, 1, 2, 80, '2020-02-08 22:40:00'),
(3, 3, 3, 1500.47, '2020-02-11 15:30:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `recita`
--

CREATE TABLE `recita` (
  `CodAttore` int(11) NOT NULL,
  `CodFilm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `recita`
--

INSERT INTO `recita` (`CodAttore`, `CodFilm`) VALUES
(1, 1),
(3, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `CodSala` int(11) NOT NULL,
  `Posti` int(3) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Citta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sala`
--

INSERT INTO `sala` (`CodSala`, `Posti`, `Nome`, `Citta`) VALUES
(1, 300, 'Arcadia', 'Melzo'),
(2, 50, 'UCI Cinemas', 'Lissone'),
(3, 120, 'Cinelandia', 'Arosio'),
(4, 100, 'Arcadia', 'Melzo');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `UserName` varchar(32) NOT NULL,
  `Password` char(32) NOT NULL,
  `id` int(11) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`UserName`, `Password`, `id`, `isAdmin`) VALUES
('Samuele', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attori`
--
ALTER TABLE `attori`
  ADD PRIMARY KEY (`CodAttore`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`CodFilm`);

--
-- Indici per le tabelle `proiezioni`
--
ALTER TABLE `proiezioni`
  ADD PRIMARY KEY (`CodProiezione`),
  ADD KEY `CodFilm` (`CodFilm`),
  ADD KEY `CodSala` (`CodSala`);

--
-- Indici per le tabelle `recita`
--
ALTER TABLE `recita`
  ADD PRIMARY KEY (`CodAttore`,`CodFilm`),
  ADD KEY `CodFilm` (`CodFilm`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`CodSala`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attori`
--
ALTER TABLE `attori`
  MODIFY `CodAttore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `CodFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `proiezioni`
--
ALTER TABLE `proiezioni`
  MODIFY `CodProiezione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `sala`
--
ALTER TABLE `sala`
  MODIFY `CodSala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `proiezioni`
--
ALTER TABLE `proiezioni`
  ADD CONSTRAINT `proiezioni_ibfk_1` FOREIGN KEY (`CodFilm`) REFERENCES `film` (`CodFilm`),
  ADD CONSTRAINT `proiezioni_ibfk_2` FOREIGN KEY (`CodSala`) REFERENCES `sala` (`CodSala`);

--
-- Limiti per la tabella `recita`
--
ALTER TABLE `recita`
  ADD CONSTRAINT `recita_ibfk_1` FOREIGN KEY (`CodAttore`) REFERENCES `attori` (`CodAttore`),
  ADD CONSTRAINT `recita_ibfk_2` FOREIGN KEY (`CodFilm`) REFERENCES `film` (`CodFilm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
