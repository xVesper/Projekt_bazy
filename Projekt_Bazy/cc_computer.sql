-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Sty 2021, 16:16
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cc_computer`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Klient` (IN `tel` INT(11))  BEGIN
	SELECT * FROM klient WHERE Nr_tel = tel;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Zamowienie` (IN `pro` INT(11))  BEGIN
	SELECT * FROM zamowienie WHERE ID_Zamowienie = pro;
END$$

--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calcProfit` (`cost` FLOAT, `price` FLOAT) RETURNS DECIMAL(9,2) BEGIN
  DECLARE profit DECIMAL(9,2);
  SET profit = price-cost;
  RETURN profit;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dysk`
--

CREATE TABLE `dysk` (
  `ID_Dysku` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Pojemnsc` varchar(200) DEFAULT NULL,
  `Interfejs` varchar(200) DEFAULT NULL,
  `Predkosc_odczytu` varchar(200) DEFAULT NULL,
  `Predkosc_zapisu` varchar(200) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `dysk`
--

INSERT INTO `dysk` (`ID_Dysku`, `Nazwa`, `Pojemnsc`, `Interfejs`, `Predkosc_odczytu`, `Predkosc_zapisu`, `Cena`) VALUES
(1, 'KIOXIA 480GB 2,5\" SATA SSD EXCERIA', '480 GB', 'SATA III (6.0 Gb/s)', '555 MB/s', '540 MB/s', 219),
(2, 'Kingston 500GB M.2 PCIe NVMe A2000', '500 GB', 'M.2 PCIe NVMe 3.0 x4', '2200 MB/s', '2000 MB/s', 269),
(3, 'Crucial 500GB 2,5\" SATA SSD MX500', '500 GB', 'SATA III (6.0 Gb/s)', '560 MB/s', '510 MB/s', 259),
(4, 'Crucial 240GB 2,5\" SATA SSD BX500', '240 GB', 'SATA III (6.0 Gb/s)', '540 MB/s', '500 MB/s', 123),
(5, 'ADATA 1TB M.2 PCIe NVMe XPG SX8200 Pro', '1000 GB', 'M.2 PCIe NVMe 3.0 x4', '3500 MB/s', '3000 MB/s', 549);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grafika`
--

CREATE TABLE `grafika` (
  `ID_KartyGr` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Rodzaj_zlacza` varchar(200) DEFAULT NULL,
  `Pamiec` varchar(200) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `grafika`
--

INSERT INTO `grafika` (`ID_KartyGr`, `Nazwa`, `Rodzaj_zlacza`, `Pamiec`, `Cena`) VALUES
(1, 'XFX Radeon RX 580 GTS XXX Edition OC+ 8GB GDDR5', 'PCI-E x16 3.0', '8 GB', 1079),
(2, 'MSI Radeon RX 5500 XT GAMING X 8GB GDDR6', 'PCI-E x16 4.0', '8 GB', 1259),
(3, 'Zotac GeForce RTX 3090 Gaming Trinity 24GB GDDR6X', 'PCI-E x16 4.0', '24 GB', 7899),
(4, 'Gigabyte GeForce RTX 2060 WindForce 2X OC 6GB GDDR6', 'PCI-E x16 3.0', '6 GB', 1749),
(5, 'Gigabyte GeForce RTX 3060 Ti Gaming OC 8GB GDDR6', 'PCI-E x16 4.0', '8 GB', 2549);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `ID_Klienta` int(11) NOT NULL,
  `Imie` varchar(200) DEFAULT NULL,
  `Nazwisko` varchar(200) DEFAULT NULL,
  `Nr_tel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`ID_Klienta`, `Imie`, `Nazwisko`, `Nr_tel`) VALUES
(1, 'Szymon', 'Mil', 1111994),
(2, 'Paulina', 'Jakubczyk', 7769869),
(3, 'Dagmara', 'Pipczynska', 513393286),
(4, 'Andrzej', 'Kowalski', 3979844),
(5, 'Seba', 'Masno', 7519586);

--
-- Wyzwalacze `klient`
--
DELIMITER $$
CREATE TRIGGER `UPDATEtLogi` AFTER UPDATE ON `klient` FOR EACH ROW INSERT INTO logs VALUES(null, id,'Instert',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertLogi` AFTER INSERT ON `klient` FOR EACH ROW INSERT INTO logs VALUES(null, id,'Inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `obudowa`
--

CREATE TABLE `obudowa` (
  `ID_Obudowy` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Typ_obudowy` varchar(200) DEFAULT NULL,
  `Liczba_wentylatorow` int(11) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `obudowa`
--

INSERT INTO `obudowa` (`ID_Obudowy`, `Nazwa`, `Typ_obudowy`, `Liczba_wentylatorow`, `Cena`) VALUES
(1, 'SilentiumPC Signum SG1 TG', 'Middle Tower', 8, 189),
(2, 'SilentiumPC Signum SG1V EVO TG ARGB', 'Middle Tower', 8, 259),
(3, 'SilentiumPC Regnum RG6V TG Pure Black', 'Middle Tower', 8, 269),
(4, 'SilentiumPC Regnum RG6V EVO TG ARGB', 'Middle Tower', 8, 319),
(5, 'be quiet! Pure Base 500DX Black', 'Middle Tower', 6, 479);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plyty`
--

CREATE TABLE `plyty` (
  `ID_PlytyGl` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Socket` varchar(200) DEFAULT NULL,
  `Chipset` varchar(200) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `plyty`
--

INSERT INTO `plyty` (`ID_PlytyGl`, `Nazwa`, `Socket`, `Chipset`, `Cena`) VALUES
(1, 'MSI B450 TOMAHAWK MAX', 'AM4', 'AMD B450', 449),
(2, 'MSI B450 GAMING PLUS MAX', 'AM4', 'AMD B450', 399),
(3, 'MSI B460M-A PRO', '1200', 'Intel B460', 369),
(4, 'ASRock B450 Pro4', 'AM4', 'AMD B450', 419),
(5, 'MSI B450-A PRO MAX', 'AM4', 'AMD B450', 389);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `procesory`
--

CREATE TABLE `procesory` (
  `ID_Procesory` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Rodzina` varchar(200) DEFAULT NULL,
  `Liczba_rdzeni` int(11) DEFAULT NULL,
  `Liczba_watkow` int(11) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `procesory`
--

INSERT INTO `procesory` (`ID_Procesory`, `Nazwa`, `Rodzina`, `Liczba_rdzeni`, `Liczba_watkow`, `Cena`) VALUES
(1, 'Intel Core i5-10400F', 'Intel Core i5', 6, 12, 699),
(2, 'AMD Ryzen 5 3600', 'AMD Ryzen', 6, 12, 1069),
(3, 'AMD Ryzen 5 2600X', 'AMD Ryzen', 6, 12, 669),
(4, 'Intel Core i7-10700KF', 'Intel Core i7', 8, 16, 1699),
(5, 'Intel Core i3-10100F', 'Intel Core i3', 4, 8, 419);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ram`
--

CREATE TABLE `ram` (
  `ID_Ram` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Seria` varchar(200) DEFAULT NULL,
  `Rodzaj_pamieci` varchar(200) DEFAULT NULL,
  `Pojemnosc` varchar(200) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ram`
--

INSERT INTO `ram` (`ID_Ram`, `Nazwa`, `Seria`, `Rodzaj_pamieci`, `Pojemnosc`, `Cena`) VALUES
(1, 'G.SKILL 16GB (2x8GB) 3000MHz CL16 Aegis', 'Aegis', 'DDR4', '16 GB (2x8 GB)', 279),
(2, 'G.SKILL 16GB (2x8GB) 3200MHz CL16 Ripjaws V Black', 'Ripjaws V', 'DDR4', '16 GB (2x8 GB)', 309),
(3, 'HyperX 16GB (2x8GB) 2666MHz CL16 Fury', 'Fury', 'DDR4', '16 GB (2x8 GB)', 305),
(4, 'HyperX 16GB (2x8GB) 3200MHz CL16 Fury RGB', 'Fury RGB', 'DDR4', '16 GB (2x8 GB)', 369),
(5, 'Patriot 16GB (2x8GB) 3200MHz CL16 Viper 4', 'Viper 4', 'DDR4', '16 GB (2x8 GB)', 299);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok` (
`ID_Dysku` int(11)
,`Nazwa` varchar(200)
,`Pojemnsc` varchar(200)
,`Interfejs` varchar(200)
,`Predkosc_odczytu` varchar(200)
,`Predkosc_zapisu` varchar(200)
,`Cena` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok2`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok2` (
`Numer_telefonu` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok3`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok3` (
`ID_KartyGr` int(11)
,`Nazwa` varchar(200)
,`Rodzaj_zlacza` varchar(200)
,`Pamiec` varchar(200)
,`Cena` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok4` (
`Nazwa` varchar(200)
,`Cena` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok5` (
`ID_PlytyGl` int(11)
,`Nazwa` varchar(200)
,`Socket` varchar(200)
,`Chipset` varchar(200)
,`Cena` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok6` (
`ID_Procesory` int(11)
,`Nazwa` varchar(200)
,`Rodzina` varchar(200)
,`Liczba_rdzeni` int(11)
,`Liczba_watkow` int(11)
,`Cena` int(11)
,`Srednia_Cena` decimal(14,4)
,`Najdrorzszy_produkt` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok7` (
`ID_Ram` int(11)
,`Nazwa` varchar(200)
,`Seria` varchar(200)
,`Rodzaj_pamieci` varchar(200)
,`Pojemnosc` varchar(200)
,`Cena` int(11)
,`Cena_najnizsza` int(11)
,`Rozstep_pozycji_ram` bigint(12)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok8`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok8` (
`Laczna_wartosc_zasilaczy` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok10`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok10` (
`ID_Klienta` int(11)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `ID_Zamowienie` int(11) NOT NULL,
  `ID_Klienta` int(11) DEFAULT NULL,
  `ID_Dysku` int(11) DEFAULT NULL,
  `ID_Grafiki` int(11) DEFAULT NULL,
  `ID_Obudowy` int(11) DEFAULT NULL,
  `ID_Plyty` int(11) DEFAULT NULL,
  `ID_Procesora` int(11) DEFAULT NULL,
  `ID_Ramu` int(11) DEFAULT NULL,
  `ID_Zasilacza` int(11) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`ID_Zamowienie`, `ID_Klienta`, `ID_Dysku`, `ID_Grafiki`, `ID_Obudowy`, `ID_Plyty`, `ID_Procesora`, `ID_Ramu`, `ID_Zasilacza`, `Cena`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 3153),
(2, 2, 2, 2, 2, 2, 2, 2, 2, 3783),
(3, 3, 3, 3, 3, 3, 3, 3, 3, 10039),
(4, 4, 4, 4, 4, 4, 4, 4, 4, 4833),
(5, 5, 5, 5, 5, 5, 5, 5, 5, 5083);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zasilacz`
--

CREATE TABLE `zasilacz` (
  `ID_Zasilacza` int(11) NOT NULL,
  `Nazwa` varchar(200) DEFAULT NULL,
  `Moc_max` varchar(200) DEFAULT NULL,
  `Standard` varchar(200) DEFAULT NULL,
  `Certyfikat` varchar(200) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zasilacz`
--

INSERT INTO `zasilacz` (`ID_Zasilacza`, `Nazwa`, `Moc_max`, `Standard`, `Certyfikat`, `Cena`) VALUES
(1, 'SilentiumPC Vero L3 600W 80 Plus Bronze', '600 W', 'ATX', '80 PLUS Bronze', 239),
(2, 'SilentiumPC Vero L3 500W 80 Plus Bronze', '500 W', 'ATX', '80 PLUS Bronze', 219),
(3, 'SilentiumPC Vero L3 700W 80 Plus Bronze', '700 W', 'ATX', '80 PLUS Bronze', 269),
(4, 'SilentiumPC Elementum E2 450W 80 Plus (BULK)', '450 W', 'ATX', '80 PLUS', 155),
(5, 'SilentiumPC Supremo FM2 650W 80 Plus Gold', '650 W', 'ATX', '80 PLUS Gold', 399);

-- --------------------------------------------------------

--
-- Struktura widoku `widok`
--
DROP TABLE IF EXISTS `widok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok`  AS SELECT `dysk`.`ID_Dysku` AS `ID_Dysku`, `dysk`.`Nazwa` AS `Nazwa`, `dysk`.`Pojemnsc` AS `Pojemnsc`, `dysk`.`Interfejs` AS `Interfejs`, `dysk`.`Predkosc_odczytu` AS `Predkosc_odczytu`, `dysk`.`Predkosc_zapisu` AS `Predkosc_zapisu`, `dysk`.`Cena` AS `Cena` FROM `dysk` ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok2`
--
DROP TABLE IF EXISTS `widok2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok2`  AS SELECT `klient`.`Nr_tel` AS `Numer_telefonu` FROM `klient` WHERE `klient`.`Imie` like 'P%' ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok3`
--
DROP TABLE IF EXISTS `widok3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok3`  AS SELECT `grafika`.`ID_KartyGr` AS `ID_KartyGr`, `grafika`.`Nazwa` AS `Nazwa`, `grafika`.`Rodzaj_zlacza` AS `Rodzaj_zlacza`, `grafika`.`Pamiec` AS `Pamiec`, `grafika`.`Cena` AS `Cena` FROM `grafika` WHERE `grafika`.`Pamiec` like '8 GB' ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok4`
--
DROP TABLE IF EXISTS `widok4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok4`  AS SELECT `obudowa`.`Nazwa` AS `Nazwa`, `obudowa`.`Cena` AS `Cena` FROM `obudowa` ORDER BY `obudowa`.`Cena` DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok5`
--
DROP TABLE IF EXISTS `widok5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok5`  AS SELECT `plyty`.`ID_PlytyGl` AS `ID_PlytyGl`, `plyty`.`Nazwa` AS `Nazwa`, `plyty`.`Socket` AS `Socket`, `plyty`.`Chipset` AS `Chipset`, `plyty`.`Cena` AS `Cena` FROM `plyty` WHERE `plyty`.`Socket` = 'AMD B450' OR `plyty`.`Cena` = '369' ORDER BY `plyty`.`Cena` DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok6`
--
DROP TABLE IF EXISTS `widok6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok6`  AS SELECT `procesory`.`ID_Procesory` AS `ID_Procesory`, `procesory`.`Nazwa` AS `Nazwa`, `procesory`.`Rodzina` AS `Rodzina`, `procesory`.`Liczba_rdzeni` AS `Liczba_rdzeni`, `procesory`.`Liczba_watkow` AS `Liczba_watkow`, `procesory`.`Cena` AS `Cena`, avg(`procesory`.`Cena`) AS `Srednia_Cena`, max(`procesory`.`Cena`) AS `Najdrorzszy_produkt` FROM `procesory` ORDER BY `procesory`.`Cena` DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok7`
--
DROP TABLE IF EXISTS `widok7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok7`  AS SELECT `ram`.`ID_Ram` AS `ID_Ram`, `ram`.`Nazwa` AS `Nazwa`, `ram`.`Seria` AS `Seria`, `ram`.`Rodzaj_pamieci` AS `Rodzaj_pamieci`, `ram`.`Pojemnosc` AS `Pojemnosc`, `ram`.`Cena` AS `Cena`, min(`ram`.`Cena`) AS `Cena_najnizsza`, max(`ram`.`Cena`) - min(`ram`.`Cena`) AS `Rozstep_pozycji_ram` FROM `ram` ORDER BY `ram`.`Cena` DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok8`
--
DROP TABLE IF EXISTS `widok8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok8`  AS SELECT sum(`zasilacz`.`Cena`) AS `Laczna_wartosc_zasilaczy` FROM `zasilacz` ORDER BY `zasilacz`.`Cena` DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok10`
--
DROP TABLE IF EXISTS `widok10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok10`  AS SELECT `zamowienie`.`ID_Klienta` AS `ID_Klienta` FROM `zamowienie` WHERE `zamowienie`.`Cena` = (select max(`zamowienie`.`Cena`) from `zamowienie`) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dysk`
--
ALTER TABLE `dysk`
  ADD PRIMARY KEY (`ID_Dysku`);

--
-- Indeksy dla tabeli `grafika`
--
ALTER TABLE `grafika`
  ADD PRIMARY KEY (`ID_KartyGr`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`ID_Klienta`);

--
-- Indeksy dla tabeli `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `obudowa`
--
ALTER TABLE `obudowa`
  ADD PRIMARY KEY (`ID_Obudowy`);

--
-- Indeksy dla tabeli `plyty`
--
ALTER TABLE `plyty`
  ADD PRIMARY KEY (`ID_PlytyGl`);

--
-- Indeksy dla tabeli `procesory`
--
ALTER TABLE `procesory`
  ADD PRIMARY KEY (`ID_Procesory`);

--
-- Indeksy dla tabeli `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ID_Ram`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`ID_Zamowienie`),
  ADD KEY `ID_Klienta` (`ID_Klienta`),
  ADD KEY `ID_Dysku` (`ID_Dysku`),
  ADD KEY `ID_Grafiki` (`ID_Grafiki`),
  ADD KEY `ID_Obudowy` (`ID_Obudowy`),
  ADD KEY `ID_Plyty` (`ID_Plyty`),
  ADD KEY `ID_Procesora` (`ID_Procesora`),
  ADD KEY `ID_Ramu` (`ID_Ramu`),
  ADD KEY `ID_Zasilacza` (`ID_Zasilacza`);

--
-- Indeksy dla tabeli `zasilacz`
--
ALTER TABLE `zasilacz`
  ADD PRIMARY KEY (`ID_Zasilacza`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dysk`
--
ALTER TABLE `dysk`
  MODIFY `ID_Dysku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `grafika`
--
ALTER TABLE `grafika`
  MODIFY `ID_KartyGr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `ID_Klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `obudowa`
--
ALTER TABLE `obudowa`
  MODIFY `ID_Obudowy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `plyty`
--
ALTER TABLE `plyty`
  MODIFY `ID_PlytyGl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `procesory`
--
ALTER TABLE `procesory`
  MODIFY `ID_Procesory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `ram`
--
ALTER TABLE `ram`
  MODIFY `ID_Ram` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `ID_Zamowienie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `zasilacz`
--
ALTER TABLE `zasilacz`
  MODIFY `ID_Zasilacza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dysk`
--
ALTER TABLE `dysk`
  ADD CONSTRAINT `ID_Dysku` FOREIGN KEY (`ID_Dysku`) REFERENCES `zamowienie` (`ID_Dysku`);

--
-- Ograniczenia dla tabeli `grafika`
--
ALTER TABLE `grafika`
  ADD CONSTRAINT `ID_KartyGr` FOREIGN KEY (`ID_KartyGr`) REFERENCES `zamowienie` (`ID_Grafiki`),
  ADD CONSTRAINT `grafika_ibfk_1` FOREIGN KEY (`ID_KartyGr`) REFERENCES `zamowienie` (`ID_Grafiki`);

--
-- Ograniczenia dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD CONSTRAINT `ID_Klienta` FOREIGN KEY (`ID_Klienta`) REFERENCES `zamowienie` (`ID_Klienta`);

--
-- Ograniczenia dla tabeli `obudowa`
--
ALTER TABLE `obudowa`
  ADD CONSTRAINT `ID_Obudowy` FOREIGN KEY (`ID_Obudowy`) REFERENCES `zamowienie` (`ID_Obudowy`),
  ADD CONSTRAINT `obudowa_ibfk_1` FOREIGN KEY (`ID_Obudowy`) REFERENCES `zamowienie` (`ID_Obudowy`);

--
-- Ograniczenia dla tabeli `plyty`
--
ALTER TABLE `plyty`
  ADD CONSTRAINT `ID_PlytyGl` FOREIGN KEY (`ID_PlytyGl`) REFERENCES `zamowienie` (`ID_Plyty`),
  ADD CONSTRAINT `plyty_ibfk_1` FOREIGN KEY (`ID_PlytyGl`) REFERENCES `zamowienie` (`ID_Plyty`);

--
-- Ograniczenia dla tabeli `procesory`
--
ALTER TABLE `procesory`
  ADD CONSTRAINT `ID_Procesory` FOREIGN KEY (`ID_Procesory`) REFERENCES `zamowienie` (`ID_Procesora`),
  ADD CONSTRAINT `procesory_ibfk_1` FOREIGN KEY (`ID_Procesory`) REFERENCES `zamowienie` (`ID_Procesora`);

--
-- Ograniczenia dla tabeli `ram`
--
ALTER TABLE `ram`
  ADD CONSTRAINT `ID_Ram` FOREIGN KEY (`ID_Ram`) REFERENCES `zamowienie` (`ID_Ramu`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`ID_Ramu`) REFERENCES `ram` (`ID_Ram`),
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`ID_Klienta`) REFERENCES `klient` (`ID_Klienta`),
  ADD CONSTRAINT `zamowienie_ibfk_3` FOREIGN KEY (`ID_Dysku`) REFERENCES `dysk` (`ID_Dysku`);

--
-- Ograniczenia dla tabeli `zasilacz`
--
ALTER TABLE `zasilacz`
  ADD CONSTRAINT `ID_Zasilacza` FOREIGN KEY (`ID_Zasilacza`) REFERENCES `zamowienie` (`ID_Zasilacza`),
  ADD CONSTRAINT `zasilacz_ibfk_1` FOREIGN KEY (`ID_Zasilacza`) REFERENCES `zamowienie` (`ID_Zasilacza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
