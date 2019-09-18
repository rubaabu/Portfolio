-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Aug 2019 um 09:56
-- Server-Version: 10.1.40-MariaDB
-- PHP-Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `gamer_community`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `banned_user`
--

CREATE TABLE `banned_user` (
  `banned_user_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `banned_user_date_unbanning` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `banned_user`
--

INSERT INTO `banned_user` (`banned_user_id`, `fk_user_id`, `banned_user_date_unbanning`) VALUES
(1, 5, '2999-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `community`
--

CREATE TABLE `community` (
  `community_id` int(11) NOT NULL,
  `community_name` varchar(50) NOT NULL,
  `community_img` varchar(300) NOT NULL,
  `community_description` mediumtext NOT NULL,
  `community_status` enum('open','closed','private') NOT NULL,
  `community_owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `community`
--

INSERT INTO `community` (`community_id`, `community_name`, `community_img`, `community_description`, `community_status`, `community_owner`) VALUES
(1, 'The Adventurers', 'group/geqHteykIDM.png', 'We are adventurers! Come with us!', 'private', 2),
(2, 'Warriors', 'group/unknown.png', 'WE ARE NUMBER ONE!!!!\r\nWE ARE WARRIORS!!!\r\nSTUUUUUUUUUUFFFFFFFF', 'private', 2),
(11, 'Runners', 'group/i6dXIAYQzIM.png', 'We are speedrunning games', 'private', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `community_member`
--

CREATE TABLE `community_member` (
  `community_member_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_community_id` int(11) NOT NULL,
  `community_member_join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `community_member_status` enum('pending','active') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `community_member`
--

INSERT INTO `community_member` (`community_member_id`, `fk_user_id`, `fk_community_id`, `community_member_join_date`, `community_member_status`) VALUES
(1, 3, 1, '2019-08-13 17:36:32', 'active'),
(3, 2, 1, '2019-08-13 08:36:51', 'active'),
(4, 2, 2, '2019-08-12 09:40:03', 'active'),
(39, 6, 1, '2019-08-13 13:24:30', 'active'),
(40, 8, 1, '2019-08-13 15:59:04', 'active'),
(46, 2, 11, '2019-08-14 04:22:04', 'active');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `friendship`
--

CREATE TABLE `friendship` (
  `friendship_id` int(11) NOT NULL,
  `fk_user_id_1` int(11) NOT NULL,
  `fk_user_id_2` int(11) NOT NULL,
  `friendship_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `friendship_status` enum('pending','active') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `friendship`
--

INSERT INTO `friendship` (`friendship_id`, `fk_user_id_1`, `fk_user_id_2`, `friendship_date`, `friendship_status`) VALUES
(1, 3, 1, '2019-08-07 12:26:02', 'active'),
(2, 2, 3, '2019-08-07 12:27:49', 'active'),
(10, 2, 6, '2019-08-13 07:17:19', 'active'),
(11, 8, 2, '2019-08-13 15:59:50', 'active');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `games`
--

CREATE TABLE `games` (
  `game_id` int(11) NOT NULL,
  `game_name` varchar(50) NOT NULL,
  `fk_game_tag_id` int(11) NOT NULL,
  `game_img` varchar(300) NOT NULL,
  `game_price` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `games`
--

INSERT INTO `games` (`game_id`, `game_name`, `fk_game_tag_id`, `game_img`, `game_price`) VALUES
(1, 'Rainbow 6', 5, 'game/r6logo.jpg', ''),
(2, 'Mario', 6, 'game/mario.png', ''),
(3, 'Minecraft', 1, 'game/uredi3jC1Pd.jpg', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game_connect`
--

CREATE TABLE `game_connect` (
  `game_connect_id` int(11) NOT NULL,
  `fk_game_id` int(11) NOT NULL,
  `fk_community_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `game_connect`
--

INSERT INTO `game_connect` (`game_connect_id`, `fk_game_id`, `fk_community_id`) VALUES
(10, 1, 2),
(11, 2, 11),
(12, 1, 11),
(14, 1, 1),
(15, 2, 1),
(16, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game_tag`
--

CREATE TABLE `game_tag` (
  `game_tag_id` int(11) NOT NULL,
  `game_tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `game_tag`
--

INSERT INTO `game_tag` (`game_tag_id`, `game_tag_name`) VALUES
(1, 'Multiplayer'),
(2, 'Violence'),
(5, 'Shooting'),
(6, 'Adventure');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_from` int(11) NOT NULL,
  `notification_to` int(11) NOT NULL,
  `notification_message` mediumtext NOT NULL,
  `notification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_from`, `notification_to`, `notification_message`, `notification_date`) VALUES
(1, 3, 1, 'Hi There, would you like to Bust Kopas a... later on? I will be online... see ya', '2019-08-07 12:32:07'),
(5, 6, 2, 'Io dude, wanna shoot some people? I am online now...', '2019-08-12 11:24:13'),
(7, 1, 2, 'Hi PayPaul, have u seen where I am on the league? Check that out and die on jealousy lol...', '2019-08-07 12:36:02'),
(8, 2, 3, 'hi', '2019-08-13 15:16:08'),
(16, 8, 8, 'Hello im lonely', '2019-08-13 15:58:43'),
(17, 8, 2, 'Whats up?', '2019-08-13 15:59:24'),
(19, 8, 2, 'Hello Paul', '2019-08-14 07:05:21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_community_id` int(11) NOT NULL,
  `post_subject` varchar(30) NOT NULL,
  `post_comment` mediumtext NOT NULL,
  `post_img` varchar(300) DEFAULT NULL,
  `post_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `post`
--

INSERT INTO `post` (`post_id`, `fk_user_id`, `fk_community_id`, `post_subject`, `post_comment`, `post_img`, `post_date_time`) VALUES
(1, 6, 2, 'playing group at the weekend', 'Io guys, who is up for a little competition this weekend? Let know...', 'post/aaaaaaaaaa.jpg', '2019-08-12 15:44:42'),
(3, 2, 1, 'Mario hidden world...', 'Have u guys seen the hidden world of Mario?? Contact me if u want and I can send u details...', NULL, '2019-08-12 15:51:29'),
(5, 2, 1, 'Hello', 'World', 'post/qdIxrVuyHWr.jpg', '2019-08-13 09:16:05'),
(28, 6, 2, 'Hello ', 'Hello GUYYS I am new here ♥', NULL, '2019-08-13 12:03:07'),
(32, 6, 1, 'Hello', 'HELLO WORLD', NULL, '2019-08-13 13:58:28'),
(33, 8, 1, 'Hey', 'You are COOL', NULL, '2019-08-13 15:59:12'),
(34, 2, 1, 'Hello', 'Hi', NULL, '2019-08-13 16:33:58'),
(37, 2, 11, 'test', 'We are awesome', 'post/MHOdMH3vk8K.jpg', '2019-08-14 04:31:54');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_message`
--

CREATE TABLE `support_message` (
  `support_message_id` int(11) NOT NULL,
  `support_message_from` int(11) NOT NULL,
  `support_message_type` enum('report user','support','suggestion') NOT NULL,
  `support_message_message` mediumtext NOT NULL,
  `support_message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `support_message`
--

INSERT INTO `support_message` (`support_message_id`, `support_message_from`, `support_message_type`, `support_message_message`, `support_message_date`) VALUES
(1, 1, 'support', 'Hi there, I am having trouble on choosing a new game on the group, could you please check?', '2019-08-07 12:41:15'),
(2, 3, 'report user', 'Could you please check why this user John whatever is so rude to everyone? He should be banned... thanks', '2019-08-07 12:41:15'),
(8, 2, 'report user', ' dawd', '2019-08-14 07:13:50'),
(9, 2, 'support', ' dawd', '2019-08-14 07:13:53');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_nickname` varchar(30) NOT NULL,
  `user_roll` enum('user','adm') NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_img` varchar(300) DEFAULT NULL,
  `user_badge` enum('begginer','intermediate','advanced') DEFAULT NULL,
  `user_gender` enum('f','m') NOT NULL,
  `user_date_birth` datetime NOT NULL,
  `user_description` mediumtext,
  `user_register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_password` varchar(256) NOT NULL,
  `user_last_login` datetime DEFAULT NULL,
  `user_status` enum('online','offline') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `user_nickname`, `user_roll`, `user_first_name`, `user_last_name`, `user_email`, `user_img`, `user_badge`, `user_gender`, `user_date_birth`, `user_description`, `user_register_date`, `user_password`, `user_last_login`, `user_status`) VALUES
(1, 'Ruba', 'adm', 'Ruba', 'Abu Isa', 'ruba@gmail.com', 'avatar/unknown.png', '', 'f', '1997-10-17 00:00:00', '', '2019-08-12 09:31:59', '123123', '0000-00-00 00:00:00', ''),
(2, 'PayPaul', 'adm', 'Paul', 'Panosch', 'paul@gmail.com', 'avatar/6BleLGTYdVW.png', 'advanced', 'm', '2002-01-23 00:00:00', 'My name is Paul and i am awesome', '2019-08-14 07:15:43', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2019-08-14 09:15:43', ''),
(3, 'Neto', 'user', 'Acilio', 'Carraro', 'acilio@gmail.com', 'avatar/unknown.png', 'begginer', 'm', '1980-03-08 00:00:00', NULL, '2019-08-13 16:22:31', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', NULL, NULL),
(5, 'John', 'user', 'John', 'Doe', 'john@gmail.com', 'avatar/unknown.png', NULL, 'm', '2000-01-01 00:00:00', NULL, '2019-08-12 12:59:47', '123123', NULL, NULL),
(6, 'xXMax123Xx', 'user', 'Max', 'Mustermann', 'max@gmail.com', 'avatar/RXWHL3G3ATV.png', 'intermediate', 'm', '2000-01-01 00:00:00', NULL, '2019-08-14 07:15:06', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-08-14 09:15:06', 'offline'),
(8, 'Pnoschi', 'user', 'Lara', 'Panosch', 'lara@gmail.com', 'avatar/oh4Mf55lRqk.jpg', NULL, 'f', '2004-10-08 00:00:00', NULL, '2019-08-14 07:05:12', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-08-14 09:05:12', 'offline');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `banned_user`
--
ALTER TABLE `banned_user`
  ADD PRIMARY KEY (`banned_user_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `community`
--
ALTER TABLE `community`
  ADD PRIMARY KEY (`community_id`),
  ADD KEY `community_owner` (`community_owner`);

--
-- Indizes für die Tabelle `community_member`
--
ALTER TABLE `community_member`
  ADD PRIMARY KEY (`community_member_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_community_id` (`fk_community_id`);

--
-- Indizes für die Tabelle `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`friendship_id`),
  ADD KEY `fk_user_id_1` (`fk_user_id_1`),
  ADD KEY `fk_user_id_2` (`fk_user_id_2`);

--
-- Indizes für die Tabelle `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`),
  ADD KEY `fk_game_tag_id` (`fk_game_tag_id`);

--
-- Indizes für die Tabelle `game_connect`
--
ALTER TABLE `game_connect`
  ADD PRIMARY KEY (`game_connect_id`),
  ADD KEY `fk_game_id` (`fk_game_id`),
  ADD KEY `fk_community_id` (`fk_community_id`);

--
-- Indizes für die Tabelle `game_tag`
--
ALTER TABLE `game_tag`
  ADD PRIMARY KEY (`game_tag_id`);

--
-- Indizes für die Tabelle `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_from` (`notification_from`),
  ADD KEY `notification_to` (`notification_to`);

--
-- Indizes für die Tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_community_id` (`fk_community_id`);

--
-- Indizes für die Tabelle `support_message`
--
ALTER TABLE `support_message`
  ADD PRIMARY KEY (`support_message_id`),
  ADD KEY `support_message_from` (`support_message_from`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `banned_user`
--
ALTER TABLE `banned_user`
  MODIFY `banned_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `community`
--
ALTER TABLE `community`
  MODIFY `community_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `community_member`
--
ALTER TABLE `community_member`
  MODIFY `community_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT für Tabelle `friendship`
--
ALTER TABLE `friendship`
  MODIFY `friendship_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `game_connect`
--
ALTER TABLE `game_connect`
  MODIFY `game_connect_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `game_tag`
--
ALTER TABLE `game_tag`
  MODIFY `game_tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT für Tabelle `support_message`
--
ALTER TABLE `support_message`
  MODIFY `support_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `banned_user`
--
ALTER TABLE `banned_user`
  ADD CONSTRAINT `banned_user_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `community`
--
ALTER TABLE `community`
  ADD CONSTRAINT `community_ibfk_1` FOREIGN KEY (`community_owner`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `community_member`
--
ALTER TABLE `community_member`
  ADD CONSTRAINT `community_member_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `community_member_ibfk_2` FOREIGN KEY (`fk_community_id`) REFERENCES `community` (`community_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`fk_user_id_1`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`fk_user_id_2`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`fk_game_tag_id`) REFERENCES `game_tag` (`game_tag_id`);

--
-- Constraints der Tabelle `game_connect`
--
ALTER TABLE `game_connect`
  ADD CONSTRAINT `game_connect_ibfk_1` FOREIGN KEY (`fk_game_id`) REFERENCES `games` (`game_id`),
  ADD CONSTRAINT `game_connect_ibfk_2` FOREIGN KEY (`fk_community_id`) REFERENCES `community` (`community_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`notification_from`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`notification_to`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`fk_community_id`) REFERENCES `community` (`community_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `support_message`
--
ALTER TABLE `support_message`
  ADD CONSTRAINT `support_message_ibfk_1` FOREIGN KEY (`support_message_from`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
