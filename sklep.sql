-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Maj 2016, 12:59
-- Wersja serwera: 10.1.13-MariaDB
-- Wersja PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres_klienta`
--

CREATE TABLE `adres_klienta` (
  `id_adresu_klienta` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `panstwo` text COLLATE utf8_polish_ci NOT NULL,
  `miasto` text COLLATE utf8_polish_ci NOT NULL,
  `ulica` text COLLATE utf8_polish_ci NOT NULL,
  `nr_domu` text COLLATE utf8_polish_ci NOT NULL,
  `nr_mieszkania` int(11) NOT NULL,
  `kod_pocztowy` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cena`
--

CREATE TABLE `cena` (
  `cena_obowiazujaca` decimal(9,2) NOT NULL,
  `id_szefa` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `cena_z_hurtowni` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa_kategorii` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id_klienta` int(11) NOT NULL,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `login` text COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `id_pracownika` int(11) NOT NULL,
  `pesel` bigint(20) NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`id_klienta`, `imie`, `nazwisko`, `login`, `haslo`, `id_zamowienia`, `id_pracownika`, `pesel`, `email`) VALUES
(9, 'Lukasz', 'Kowalski', 'lukassz', '202cb962ac59075b964b07152d234b70', 0, 0, 0, 'lukasz@wp.pl'),
(10, 'Andrzej', 'Duda', 'duda', '81dc9bdb52d04dc20036dbd8313ed055', 0, 0, 0, 'duda@o2.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurier`
--

CREATE TABLE `kurier` (
  `id_dostawcy` int(11) NOT NULL,
  `nazwa_dostawcy` text COLLATE utf8_polish_ci NOT NULL,
  `rodzaj_przesylki` text COLLATE utf8_polish_ci NOT NULL,
  `cena_dostawy` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kurier`
--

INSERT INTO `kurier` (`id_dostawcy`, `nazwa_dostawcy`, `rodzaj_przesylki`, `cena_dostawy`) VALUES
(1, 'DHL', 'szybka', '20.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `magazyn`
--

CREATE TABLE `magazyn` (
  `id_magazynu` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `ilosc_produktow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opinia`
--

CREATE TABLE `opinia` (
  `id_opinii` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `data_wystawienia` datetime NOT NULL,
  `id_produktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platnosc`
--

CREATE TABLE `platnosc` (
  `id_rachunku` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `nazwa_banku` text COLLATE utf8_polish_ci NOT NULL,
  `sposob_platnosci` text COLLATE utf8_polish_ci NOT NULL,
  `paragon_faktura` enum('0','1') COLLATE utf8_polish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `id_pracownika` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `login` text COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL,
  `id_szefa` int(11) NOT NULL,
  `id_magazynu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`id_pracownika`, `id_klienta`, `imie`, `nazwisko`, `login`, `haslo`, `id_szefa`, `id_magazynu`) VALUES
(1, 0, 'Piotr', 'Wiśniewski', 'wisnia', '12345', 0, 0),
(2, 0, 'Michał', 'Dąbrowski', 'debowy', 'qwerty', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `id_produktu` int(11) NOT NULL,
  `id_kategorii` int(11) NOT NULL,
  `nazwa_produktu` text COLLATE utf8_polish_ci NOT NULL,
  `cena_jednostkowa` decimal(9,2) NOT NULL,
  `opis_produktu` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczegoly_zamowienia_pozycja`
--

CREATE TABLE `szczegoly_zamowienia_pozycja` (
  `id_wiersza_zamowienia` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wiadomosc`
--

CREATE TABLE `wiadomosc` (
  `id_wiadomosci` int(11) NOT NULL,
  `tresc_wiadomosci` text COLLATE utf8_polish_ci NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `id_pracownika` int(11) NOT NULL,
  `tytul_wiadomosci` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id_zamowienia` int(11) NOT NULL,
  `id_dostawcy` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `data_zamowienia` datetime NOT NULL,
  `status_zamowienia` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `adres_klienta`
--
ALTER TABLE `adres_klienta`
  ADD PRIMARY KEY (`id_adresu_klienta`);

--
-- Indexes for table `cena`
--
ALTER TABLE `cena`
  ADD PRIMARY KEY (`cena_obowiazujaca`);

--
-- Indexes for table `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id_kategorii`);

--
-- Indexes for table `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indexes for table `kurier`
--
ALTER TABLE `kurier`
  ADD PRIMARY KEY (`id_dostawcy`);

--
-- Indexes for table `magazyn`
--
ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`id_magazynu`);

--
-- Indexes for table `opinia`
--
ALTER TABLE `opinia`
  ADD PRIMARY KEY (`id_opinii`);

--
-- Indexes for table `platnosc`
--
ALTER TABLE `platnosc`
  ADD PRIMARY KEY (`id_rachunku`);

--
-- Indexes for table `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`id_pracownika`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id_produktu`);

--
-- Indexes for table `szczegoly_zamowienia_pozycja`
--
ALTER TABLE `szczegoly_zamowienia_pozycja`
  ADD PRIMARY KEY (`id_wiersza_zamowienia`);

--
-- Indexes for table `wiadomosc`
--
ALTER TABLE `wiadomosc`
  ADD PRIMARY KEY (`id_wiadomosci`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id_zamowienia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `adres_klienta`
--
ALTER TABLE `adres_klienta`
  MODIFY `id_adresu_klienta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT dla tabeli `kurier`
--
ALTER TABLE `kurier`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  MODIFY `id_magazynu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `opinia`
--
ALTER TABLE `opinia`
  MODIFY `id_opinii` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `platnosc`
--
ALTER TABLE `platnosc`
  MODIFY `id_rachunku` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `id_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `szczegoly_zamowienia_pozycja`
--
ALTER TABLE `szczegoly_zamowienia_pozycja`
  MODIFY `id_wiersza_zamowienia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `wiadomosc`
--
ALTER TABLE `wiadomosc`
  MODIFY `id_wiadomosci` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
