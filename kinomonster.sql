-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 11 2019 г., 14:18
-- Версия сервера: 10.3.15-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinomonster`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Фильмы'),
(2, 'Сериалы');

-- --------------------------------------------------------

--
-- Структура таблицы `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `movie_id` int(255) NOT NULL,
  `comments_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `movie_id`, `comments_text`) VALUES
(1, 7, 605, 'Очень хороший фильм'),
(2, 7, 605, 'Мне понравилось'),
(3, 8, 605, 'Мне понравилось, очень хорошо'),
(10, 8, 605, 'новый комментарий'),
(11, 8, 606, 'А теперь посмотрим как работает здесь'),
(14, 7, 655, 'УУУ АЛИКС ПЕРИШШ ТАКАЯ КРУТАЯЯЯ ПАСМАТРИТЕ ВСЕ ТУПЫЕ АДНА ОНА УМНАЯ');

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE `movie` (
  `id` int(5) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descriptions` text NOT NULL,
  `year` int(4) NOT NULL,
  `rating` float NOT NULL,
  `poster` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `player_code` varchar(255) NOT NULL,
  `add_date` datetime NOT NULL,
  `category_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `movie`
--

INSERT INTO `movie` (`id`, `slug`, `name`, `descriptions`, `year`, `rating`, `poster`, `director`, `player_code`, `add_date`, `category_id`) VALUES
(605, 'joy', 'Джой', 'Joy', 2015, 0, 'http://c.cinemate.cc/media/m/4/5/154054/0.big.jpg', '', 'https://www.youtube.com/embed/uR-2TiQVY-k?showinfo=0', '2015-12-05 17:50:27', 1),
(606, 'by-the-sea', 'Лазурный берег', 'By the Sea', 2015, 0, 'http://c.cinemate.cc/media/m/3/1/159513/0.big.jpg', '', 'https://www.youtube.com/embed/vUFZOO9zO0Q?showinfo=0', '2015-12-05 17:50:27', 1),
(607, 'concussion', 'Сотрясение', 'Concussion', 2015, 0, 'http://c.cinemate.cc/media/m/9/4/157449/0.big.jpg', '', 'https://www.youtube.com/embed/Io6hPdC41RM?showinfo=0', '2015-12-05 17:50:27', 1),
(608, 'the-boy', 'Кукла', 'The Boy', 2015, 5.7, 'http://c.cinemate.cc/media/m/7/6/159067/0.big.jpg', '', 'https://www.youtube.com/embed/yPxybc_aJWU?showinfo=0', '2015-12-05 17:50:27', 1),
(609, 'the-finest-hours', 'И грянул шторм', 'The Finest Hours', 2015, 0, 'http://c.cinemate.cc/media/m/8/9/159198/0_1.big.jpg', '', 'https://www.youtube.com/embed/-1QOTS-OkIg?showinfo=0', '2015-12-05 17:50:27', 1),
(610, 'daughter-of-god', 'Дочь Бога', 'Daughter of God', 2015, 0, 'http://c.cinemate.cc/media/m/2/7/159272/0.big.jpg', '', 'https://www.youtube.com/embed/sutfsWmgWgs?showinfo=0', '2015-12-05 17:50:27', 1),
(611, 'the-danish-girl', 'Девушка из Дании', 'The Danish Girl', 2015, 5.4, 'http://c.cinemate.cc/media/m/8/8/159788/0.big.jpg', '', 'https://www.youtube.com/embed/9VF3-6Odwu4?showinfo=0', '2015-12-05 17:50:27', 1),
(612, 'the-revenant', 'Выживший', 'The Revenant', 2015, 0, 'http://c.cinemate.cc/media/m/0/9/155290/0.big.jpg', '', 'https://www.youtube.com/embed/QRfj1VCg16Y?showinfo=0', '2015-12-03 17:50:27', 1),
(613, 'sisters', 'Сестры', 'Sisters', 2015, 0, 'http://c.cinemate.cc/media/m/0/1/153610/0_1.big.jpg', '', 'https://www.youtube.com/embed/vRnhEjP3R-c?showinfo=0', '2015-12-05 17:50:27', 1),
(614, 'creed', 'Крид', 'Creed', 2015, 0, 'http://c.cinemate.cc/media/m/5/7/157775/0_qHqshz3.big.jpg', '', 'https://www.youtube.com/embed/Uv554B7YHk4?showinfo=0', '2015-12-05 17:50:27', 1),
(615, 'alvin-and-the-chipmunks-the-road-chip', 'Элвин и бурундуки 4', 'Alvin and the Chipmunks: The Road Chip', 2015, 0, 'http://c.cinemate.cc/media/m/5/7/137475/0.big.jpg', '', 'https://www.youtube.com/embed/xA6cOSEZhzM?showinfo=0', '2015-12-05 17:50:27', 1),
(616, 'steve-jobs', 'Стив Джобс', 'Steve Jobs', 2015, 6.4, 'http://c.cinemate.cc/media/m/1/7/157771/0_RfDTyDZ.big.jpg', '', 'https://www.youtube.com/embed/aEr6K1bwIVs?showinfo=0', '2015-12-05 17:50:27', 1),
(617, 'krampus', 'Крампус', 'Krampus', 2015, 0, 'http://c.cinemate.cc/media/m/3/7/157773/0.big.jpg', '', 'https://www.youtube.com/embed/h6cVyoMH4QE?showinfo=0', '2015-12-05 17:50:27', 1),
(618, 'point-break', 'На гребне волны', 'Point Break', 2015, 0, 'http://c.cinemate.cc/media/m/6/0/155006/0.big.jpg', '', 'https://www.youtube.com/embed/ncvFAm4kYCo?showinfo=0', '2015-12-05 17:50:27', 1),
(619, 'dekiru-the-three-stones', 'Декиру: Магические камни', 'Dekiru: The Three Stones', 2015, 0, 'http://c.cinemate.cc/media/m/5/8/159885/0.big.jpg', '', 'https://www.youtube.com/embed/G5whoJ2GLUA?showinfo=0', '2015-12-05 17:50:27', 1),
(620, 'masterminds', 'Зачинщики', 'Masterminds', 2015, 0, 'http://c.cinemate.cc/media/m/5/3/153535/0.big.jpg', '', 'https://www.youtube.com/embed/onOblb6W_yw?showinfo=0', '2015-12-05 17:50:27', 1),
(621, 'love-the-coopers', 'Любите Куперов', 'Love the Coopers', 2015, 0, 'http://c.cinemate.cc/media/m/2/6/159062/0.big.jpg', '', 'https://www.youtube.com/embed/-TSX_0rwPNc?showinfo=0', '2015-12-05 17:50:27', 1),
(622, 'star-wars', 'Звёздные войны: Пробуждение силы', 'Star Wars: Episode VII - The Force Awakens', 2015, 0, 'http://c.cinemate.cc/media/m/6/8/120786/0.big.jpg', '', 'https://www.youtube.com/embed/gAUxw4umkdY?showinfo=0', '2015-12-05 17:50:27', 1),
(623, 'x-mas', 'Рождество', 'X-Mas', 2015, 0, 'http://c.cinemate.cc/media/m/7/3/156737/0.big.jpg', '', 'https://www.youtube.com/embed/ocjpSBMNyoU?showinfo=0', '2015-12-05 17:50:27', 1),
(624, 'solace', 'Утешение', 'Solace', 2015, 6.4, 'http://c.cinemate.cc/media/m/2/6/157762/0.big.jpg', '', 'https://www.youtube.com/embed/yiH5V5psa7M?showinfo=0', '2015-12-05 17:50:27', 1),
(625, 'in-the-heart-of-the-sea', 'В сердце моря', 'In the Heart of the Sea', 2015, 0, 'http://c.cinemate.cc/media/m/6/9/154996/0.big.jpg', '', 'https://www.youtube.com/embed/4Atz6dfryss?showinfo=0', '2015-12-05 17:50:27', 1),
(626, 'bridge-of-spies', 'Шпионский мост', 'Bridge of Spies', 2015, 8.3, 'http://c.cinemate.cc/media/m/0/1/155010/0.big.jpg', '', 'https://www.youtube.com/embed/jxUk1RsajcI?showinfo=0', '2015-12-05 17:50:27', 1),
(627, 'goosebumps', 'Ужастики', 'Goosebumps', 2015, 7.3, 'http://c.cinemate.cc/media/m/4/8/155284/0_VvqPtmT.big.jpg', '', 'https://www.youtube.com/embed/7Cn716jv61s?showinfo=0', '2015-12-05 17:50:27', 1),
(628, 'the-good-dinosaur', 'Хороший динозавр', 'The Good Dinosaur', 2015, 0, 'http://c.cinemate.cc/media/m/4/7/137474/0.big.jpg', '', 'https://www.youtube.com/embed/O-RgquKVTPE?showinfo=0', '2015-12-05 17:50:27', 1),
(629, 'sicario', 'Наёмница', 'Sicario', 2015, 8.1, 'http://c.cinemate.cc/media/m/1/2/158621/0.big.jpg', '', 'https://www.youtube.com/embed/kuCddASCWyo?showinfo=0', '2015-12-05 17:50:27', 1),
(655, 'quantico', 'База Куантико', 'Quantico', 2015, 7.6, 'http://c.cinemate.cc/media/m/9/6/159969/0.big.jpg', 'John Doe', 'https://www.youtube.com/embed/wJp-BZpVBPA?showinfo=0', '2015-12-05 17:50:41', 2),
(656, 'secrets-and-lies', 'Тайны и ложь', 'Secrets and Lies', 2015, 7.7, 'http://c.cinemate.cc/media/m/3/6/157863/0.big.jpg', '', 'https://www.youtube.com/embed/84LUUehDMB4?showinfo=0', '2015-12-05 17:50:41', 2),
(657, 'miles-from-tomorrowland', 'Майлз с другой планеты', 'Miles from Tomorrowland', 2015, 7.9, 'http://c.cinemate.cc/media/m/5/7/158275/0.big.jpg', '', 'https://www.youtube.com/embed/r59DjoDB-5Q?showinfo=0', '2015-12-05 17:50:41', 2),
(658, 'fear-the-walking-dead', 'Бойтесь ходячих мертвецов', 'Fear the Walking Dead', 2015, 7.7, 'http://c.cinemate.cc/media/m/2/5/159652/0.big.jpg', '', 'https://www.youtube.com/embed/yzXglr5bc3w?showinfo=0', '2015-12-05 17:50:41', 2),
(659, 'show-me-a-hero', 'Покажите мне героя', 'Show Me a Hero', 2015, 8.3, 'http://c.cinemate.cc/media/m/9/9/159599/0.big.jpg', '', 'https://www.youtube.com/embed/0FPIflcWIOk?showinfo=0', '2015-12-05 17:50:41', 2),
(660, 'k-c-undercover', 'Кей Си. Под прикрытием', 'K.C. Undercover', 2015, 6.1, 'http://c.cinemate.cc/media/m/0/4/159640/0.big.jpg', '', 'https://www.youtube.com/embed/_4tynKL-zyM?showinfo=0', '2015-12-05 17:50:41', 2),
(661, 'big-giant-swords', 'Гигантские мечи', 'Big Giant Swords', 2015, 8.1, 'http://c.cinemate.cc/media/m/7/9/159297/0.big.jpg', '', 'https://www.youtube.com/embed/iwM7GaXXtcA?showinfo=0', '2015-12-05 17:50:41', 2),
(662, 'ballers', 'Футболисты', 'Ballers', 2015, 7.5, 'http://c.cinemate.cc/media/m/7/1/159017/0.big.jpg', '', 'https://www.youtube.com/embed/go_V0xBH2TY?showinfo=0', '2015-12-05 17:50:41', 2),
(663, 'the-brink', 'На грани', 'The Brink', 2015, 7.9, 'http://c.cinemate.cc/media/m/8/1/159018/0.big.jpg', '', 'https://www.youtube.com/embed/z9SJxSXySSo?showinfo=0', '2015-12-05 17:50:41', 2),
(664, 'the-whispers', 'Шёпот', 'The Whispers', 2015, 7.4, 'http://c.cinemate.cc/media/m/4/1/158814/0.big.jpg', '', 'https://www.youtube.com/embed/DMG9TMnJfOs?showinfo=0', '2015-12-05 17:50:41', 2),
(665, 'harvey-beaks', 'Харви Бикс', 'Harvey Beaks', 2015, 6.9, 'http://c.cinemate.cc/media/m/9/3/158939/0_1.big.jpg', '', 'https://www.youtube.com/embed/XgBUo2eFUXY?showinfo=0', '2015-12-05 17:50:41', 2),
(666, 'aquarius', 'Водолей', 'Aquarius', 2015, 7, 'http://c.cinemate.cc/media/m/1/5/158751/0.big.jpg', '', 'https://www.youtube.com/embed/sFP-hW7JpUQ?showinfo=0', '2015-12-05 17:50:41', 2),
(667, 'wayward-pines', 'Сосны', 'Wayward Pines', 2015, 7.8, 'http://c.cinemate.cc/media/m/0/0/157700/0_1.big.jpg', '', 'https://www.youtube.com/embed/RsQ9Fl0VCkk?showinfo=0', '2015-12-05 17:50:41', 2),
(668, 'happyish', 'Типа счастье', 'Happyish', 2015, 7.2, 'http://c.cinemate.cc/media/m/4/2/158424/0.big.jpg', '', 'https://www.youtube.com/embed/oZzsRNBq42Q?showinfo=0', '2015-12-05 17:50:41', 2),
(669, 'bella-and-the-bulldogs', 'Белла и Бульдоги', 'Bella and the Bulldogs', 2015, 5, 'http://c.cinemate.cc/media/m/7/0/160007/0.big.jpg', '', 'https://www.youtube.com/embed/CVdxMzRQk5A?showinfo=0', '2015-12-05 17:50:41', 2),
(670, 'battle-creek', 'Батл Крик', 'Battle Creek', 2015, 7.4, 'http://c.cinemate.cc/media/m/0/3/157830/0.big.jpg', '', 'https://www.youtube.com/embed/6whby3eS8vw?showinfo=0', '2015-12-05 17:50:41', 2),
(671, 'better-call-saul', 'Лучше звоните Солу', 'Better Call Saul', 2015, 8.9, 'http://c.cinemate.cc/media/m/0/2/157520/0.big.jpg', '', 'https://www.youtube.com/embed/lK_70f7PamE?showinfo=0', '2015-12-05 17:50:41', 2),
(672, 'togetherness', 'Вместе', 'Togetherness', 2015, 7.5, 'http://c.cinemate.cc/media/m/1/6/156961/0.big.jpg', '', 'https://www.youtube.com/embed/IBt3XoWxvOo?showinfo=0', '2015-12-05 17:50:41', 2),
(673, 'empire', 'Империя', 'Empire', 2015, 8, 'http://c.cinemate.cc/media/m/5/8/156885/0.big.jpg', '', 'https://www.youtube.com/embed/dBzu_jKLJek?showinfo=0', '2015-12-05 17:50:41', 2),
(674, 'the-astronaut-wives-club', 'Клуб жён астронавтов', 'The Astronaut Wives Club', 2015, 7.1, 'http://c.cinemate.cc/media/m/1/8/158981/0.big.jpg', '', 'https://www.youtube.com/embed/dKMDli5b3W8?showinfo=0', '2015-12-05 17:50:41', 2),
(675, 'unreal', 'Нереально', 'UnREAL', 2015, 7.8, 'http://c.cinemate.cc/media/m/2/8/158982/0.big.jpg', '', 'https://www.youtube.com/embed/BU7AjoWGHwc?showinfo=0', '2015-12-05 17:50:41', 2),
(676, 'the-odd-couple', 'Странная парочка', 'The Odd Couple', 2015, 6.4, 'http://c.cinemate.cc/media/m/5/1/157715/0.big.jpg', '', 'https://www.youtube.com/embed/H8lY2kLmnbQ?showinfo=0', '2015-12-05 17:50:41', 2),
(677, 'you-me-and-the-apocalypse', 'Ты, я и конец света', 'You, Me and the Apocalypse', 2015, 7.9, 'http://c.cinemate.cc/media/m/0/2/160020/0.big.jpg', '', 'https://www.youtube.com/embed/nnFTbj7QyBE?showinfo=0', '2015-12-05 17:50:41', 2),
(678, 'catching-monsters', 'Крупный улов', 'Catching Monsters', 2015, 0, 'http://c.cinemate.cc/media/m/4/2/160024/0.big.jpg', '', 'https://www.youtube.com/embed/8cadxeA__v4?showinfo=0', '2015-12-05 17:50:41', 2),
(679, 'american-odyssey', 'Американская одиссея', 'American Odyssey', 2015, 7.2, 'http://c.cinemate.cc/media/m/3/3/158233/0.big.jpg', '', 'https://www.youtube.com/embed/7PYepYHaitg?showinfo=0', '2015-12-05 17:50:41', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` tinyint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `slug`) VALUES
(1, 'Новость 1', 'Это текст новости 1', 'news-1'),
(11, 'Новость 2', 'Текст новости 2', 'news-2'),
(14, 'Новость 3', 'Текст новости 3', 'news-3');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `data` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `slug`) VALUES
(1, 'Как снимали Интерстеллар\r\n', '45 лет исполнилось Кристоферу Нолану — одному из самых успешных режиссеров нашего времени, чьи работы одинаково любимы как взыскательными критиками, так и простыми зрителями. Фильмом изначально занималась студия Paramount. Когда Кристофер Нолан занял место режиссера, студия Warner Bros., которая выпускала его последние фильмы, добилась участия в проекте.', 'posts-1'),
(2, 'Актер Том Хенкс поделился впечатлением о фестивале\r\n', '16 февраля в Лондоне состоялась 67-я церемония вручения наград Британской киноакадемии. Леонардо ДиКаприо, Брэд Питт, Анджелина Джоли, Кейт Бланшетт, Хелен Миррен, Эми Адамс, Кристиан Бэйл, Альфонсо Куарон и другие гости и победители премии — в нашем репортаже.\r\n\r\n', 'posts-2');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'User'),
(2, 0, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `username` varchar(25) COLLATE utf8_bin NOT NULL,
  `password` varchar(75) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `newpass` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `newpass_key` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `newpass_time` datetime DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `email`, `banned`, `ban_reason`, `newpass`, `newpass_key`, `newpass_time`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(5, 2, 'admin', '$2y$10$Mc0JAYfEVfvkb07qe3EmhOULlR.A9TLpzi5BK4j1/q6VrMiZrJ1he', 'admin@test.com', 0, NULL, NULL, NULL, NULL, '127.0.0.1', '2019-07-03 11:17:56', '2016-01-08 14:37:09', '2019-07-03 09:17:56'),
(7, 1, 'user', '$2y$10$.0/HYgD.XMnjGOs2lEH79.5LHqFb.Vun2A7V7Y5Cm1UpWU1Z/.NT.', 'user@test.com', 0, NULL, NULL, NULL, NULL, '127.0.0.1', '2019-07-11 14:16:38', '2016-01-08 14:46:36', '2019-07-11 12:16:38'),
(8, 1, 'test', '$2y$10$J16SjAbAVbIM8LfrIfrcueuiaggqArPjEwVzUP6fMSXDvX0cpCXkm', 'test@example.com', 0, NULL, NULL, NULL, NULL, '127.0.0.1', '2019-07-11 12:10:10', '2019-07-04 16:27:40', '2019-07-11 10:10:10');

-- --------------------------------------------------------

--
-- Структура таблицы `user_autologin`
--

CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT 0,
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `country`, `website`) VALUES
(4, 5, NULL, NULL),
(6, 7, NULL, NULL),
(7, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_temp`
--

CREATE TABLE `user_temp` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(75) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activation_key` varchar(75) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_autologin`
--
ALTER TABLE `user_autologin`
  ADD PRIMARY KEY (`key_id`,`user_id`);

--
-- Индексы таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_temp`
--
ALTER TABLE `user_temp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=710;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` tinyint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user_temp`
--
ALTER TABLE `user_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
