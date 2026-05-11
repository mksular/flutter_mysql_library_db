-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 May 2026, 08:22:48
-- Sunucu sürümü: 8.3.0
-- PHP Sürümü: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `library_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `author`
--

INSERT INTO `author` (`aid`, `name`) VALUES
(1, 'Oğuz Atay'),
(2, 'Jean-Christophe Grangé'),
(3, 'José Rodrigues dos Santos'),
(4, 'Gabriel García Márquez'),
(5, 'Fyodor Dostoyevski'),
(6, 'Charles Dickens'),
(7, 'Johann Wolfgang von Goethe'),
(8, 'Franz Kafka:'),
(9, 'Thomas Mann');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `catid` int NOT NULL,
  `aid` int NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `book`
--

INSERT INTO `book` (`bid`, `title`, `catid`, `aid`) VALUES
(1, 'Tutunamayanlar', 1, 1),
(2, 'Leyleklerin Uçuşu', 1, 2),
(3, 'İsa\'nın Son Sırrı', 1, 3),
(4, 'Yüzyıllık Yalnızlık', 1, 4),
(5, 'Suç ve Ceza', 1, 5),
(6, 'İki Şehrin Hikâyesi', 1, 6),
(7, 'Faust', 1, 7),
(8, 'Dönüşüm', 1, 8),
(9, 'Venedik\'te Ölüm', 1, 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `catid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`catid`, `name`) VALUES
(1, 'Roman');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
