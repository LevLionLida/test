-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Ноя 22 2022 г., 19:52
-- Версия сервера: 8.0.31
-- Версия PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

CREATE TABLE `companies` (
  `id` bigint NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `OwnerName` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`id`, `Name`, `OwnerName`) VALUES
(1, 'Promo', 'Mark'),
(2, 'Victory', 'Tom'),
(3, 'Test', 'Jon');

-- --------------------------------------------------------

--
-- Структура таблицы `integration`
--

CREATE TABLE `integration` (
  `id` bigint NOT NULL,
  `NumberID` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Platform` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `integration`
--

INSERT INTO `integration` (`id`, `NumberID`, `Platform`) VALUES
(1, '1', 'Viber'),
(2, '1', 'Telegram'),
(3, '2', 'Viber'),
(4, '3', 'Telegram');

-- --------------------------------------------------------

--
-- Структура таблицы `numbers`
--

CREATE TABLE `numbers` (
  `id` bigint NOT NULL,
  `CompanyID` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `numbers` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `numbers`
--

INSERT INTO `numbers` (`id`, `CompanyID`, `numbers`) VALUES
(1, '1', '380673869594'),
(2, '2', '380673869595'),
(3, '1', '380673869598');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` bigint NOT NULL,
  `integrationID` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Amount` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id`, `integrationID`, `Amount`) VALUES
(1, '1', 23),
(2, '2', 34),
(3, '2', 70),
(4, '3', 89);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `integration`
--
ALTER TABLE `integration`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `integration`
--
ALTER TABLE `integration`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `numbers`
--
ALTER TABLE `numbers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
