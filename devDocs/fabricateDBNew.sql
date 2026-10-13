-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Okt 12. 22:03
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fabricatedb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `template`
--

CREATE TABLE `template` (
  `ID` int(11) NOT NULL,
  `page_width` int(11) DEFAULT NULL,
  `page_height` int(11) DEFAULT NULL,
  `editor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `template`
--

INSERT INTO `template` (`ID`, `page_width`, `page_height`, `editor_id`) VALUES
(1, 1080, 1920, 1),
(2, 1920, 1080, 2),
(3, 1225, 2035, 3),
(4, 130, 245, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `template_image_field`
--

CREATE TABLE `template_image_field` (
  `ID` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `page_num` int(11) DEFAULT NULL,
  `num_X` decimal(8,2) DEFAULT NULL,
  `num_Y` decimal(8,2) DEFAULT NULL,
  `field_width` int(11) DEFAULT NULL,
  `field_height` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `alignment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `template_image_field`
--

INSERT INTO `template_image_field` (`ID`, `template_id`, `page_num`, `num_X`, `num_Y`, `field_width`, `field_height`, `url`, `alignment`) VALUES
(1, 1, 1, 110.00, 130.30, 30, 980, 'balabla/bla.png', 'center'),
(2, 3, 1, 96.68, 1829.90, 60, 880, 'blkasfdlksd.png', 'left'),
(3, 2, 2, 83.36, 3529.50, 90, 780, 'shdi.png', 'right'),
(4, 1, 4, 70.04, 5229.10, 120, 680, 'találjonkiadatotakinekhatanyjavan.jpg', 'bottom');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `template_text_field`
--

CREATE TABLE `template_text_field` (
  `ID` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `page_num` int(11) DEFAULT NULL,
  `num_X` decimal(8,2) DEFAULT NULL,
  `num_Y` decimal(8,2) DEFAULT NULL,
  `field_width` int(11) DEFAULT NULL,
  `field_height` int(11) DEFAULT NULL,
  `field_type` varchar(50) DEFAULT NULL,
  `font_name` varchar(50) DEFAULT NULL,
  `font_size` int(11) DEFAULT NULL,
  `alignment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `template_text_field`
--

INSERT INTO `template_text_field` (`ID`, `template_id`, `page_num`, `num_X`, `num_Y`, `field_width`, `field_height`, `field_type`, `font_name`, `font_size`, `alignment`) VALUES
(1, 3, 1, 123.32, 1110.40, 120, 1030, 'textbox', 'Arial', 21, 'center'),
(2, 2, 3, 110.00, 130.30, 30, 980, 'textbox', 'TimesNewRoman', 20, 'right'),
(3, 2, 4, 96.68, 849.80, 60, 930, 'textbox', 'Román', 30, 'top'),
(4, 1, 1, 83.36, 1829.90, 150, 880, 'textbox', 'Cigány', 56, 'left');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `license_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`userID`, `user_email`, `user_name`, `user_password`, `license_key`) VALUES
(1, 'teszt@teszt.com', 'teszt', 'IUAFGSu89asdiuofasodz9ö', 'SDFT632BUHNKF832UHF'),
(2, 'teszt@gmail.com', 'gmail', '', 'Q3RFZF5 VC89Ö9ER2'),
(3, 'apple@apple.com', 'Apple', 'hsdfggUO9DHGö8dt9P8A7DU', 'FAEUTF7T3IUF01'),
(4, 'apple@vidman.just', 'Vidman', 'jsokjdg89DTIös9phdiOPS', 'ASKDZ79329ITJN9Ö2');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_userID` (`editor_id`);

--
-- A tábla indexei `template_image_field`
--
ALTER TABLE `template_image_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_image_template` (`template_id`);

--
-- A tábla indexei `template_text_field`
--
ALTER TABLE `template_text_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_text_template` (`template_id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `license_key` (`license_key`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `template`
--
ALTER TABLE `template`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `template_image_field`
--
ALTER TABLE `template_image_field`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `template_text_field`
--
ALTER TABLE `template_text_field`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `template`
--
ALTER TABLE `template`
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`editor_id`) REFERENCES `user` (`userID`);

--
-- Megkötések a táblához `template_image_field`
--
ALTER TABLE `template_image_field`
  ADD CONSTRAINT `fk_image_template` FOREIGN KEY (`template_id`) REFERENCES `template` (`ID`);

--
-- Megkötések a táblához `template_text_field`
--
ALTER TABLE `template_text_field`
  ADD CONSTRAINT `fk_text_template` FOREIGN KEY (`template_id`) REFERENCES `template` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
