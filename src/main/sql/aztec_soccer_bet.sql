-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2018 at 04:49 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aztec_soccer_bet`
--

-- --------------------------------------------------------

--
-- Table structure for table `tmatch`
--

CREATE TABLE `tmatch` (
  `match_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `host_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `guest_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `host_goals` int(11) DEFAULT NULL,
  `guest_goals` int(11) DEFAULT NULL,
  `match_type_id` varchar(36) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tmatch`
--

INSERT INTO `tmatch` (`match_id`, `tournament_id`, `time`, `host_id`, `guest_id`, `host_goals`, `guest_goals`, `match_type_id`) VALUES
('9496af21-47b7-4ee6-be45-391637a8bf3c', 'FIFAWC2018', '2018-06-19 12:00:00', 'COL', 'JPN', NULL, NULL, 'GRPMT');

-- --------------------------------------------------------

--
-- Table structure for table `tmatch_bet`
--

CREATE TABLE `tmatch_bet` (
  `user_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `match_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `host_goals` int(11) NOT NULL,
  `guest_goals` int(11) NOT NULL,
  `payed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tmatch_bet`
--

INSERT INTO `tmatch_bet` (`user_id`, `match_id`, `host_goals`, `guest_goals`, `payed`) VALUES
('A6714', '9496af21-47b7-4ee6-be45-391637a8bf3c', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tmatch_bet_cost`
--

CREATE TABLE `tmatch_bet_cost` (
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `match_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tmatch_bet_cost`
--

INSERT INTO `tmatch_bet_cost` (`tournament_id`, `match_type_id`, `price`) VALUES
('FIFAWC2018', 'FINMT', 5),
('FIFAWC2018', 'GRPMT', 2),
('FIFAWC2018', 'QRFMT', 3),
('FIFAWC2018', 'R16MT', 2),
('FIFAWC2018', 'SMFMT', 4),
('FIFAWC2018', 'TPPMT', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tmatch_type`
--

CREATE TABLE `tmatch_type` (
  `match_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tmatch_type`
--

INSERT INTO `tmatch_type` (`match_type_id`, `name`) VALUES
('FINMT', 'Final'),
('GRPMT', 'Group'),
('QRFMT', 'Quarter-final'),
('R16MT', 'Round of 16'),
('SMFMT', 'Semi-final'),
('TPPMT', 'Third place play-off');

-- --------------------------------------------------------

--
-- Table structure for table `tspecial_bet`
--

CREATE TABLE `tspecial_bet` (
  `user_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `team_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `special_bet_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tspecial_bet`
--

INSERT INTO `tspecial_bet` (`user_id`, `team_id`, `special_bet_type_id`, `paid`) VALUES
('A6714', 'URU', 'FIFAWC2018CHMPN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tspecial_bet_type`
--

CREATE TABLE `tspecial_bet_type` (
  `special_bet_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tspecial_bet_type`
--

INSERT INTO `tspecial_bet_type` (`special_bet_type_id`, `tournament_id`, `name`, `cost`) VALUES
('FIFAWC2018CHMPN', 'FIFAWC2018', 'FIFA World Cup 2018 Champion', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tteam`
--

CREATE TABLE `tteam` (
  `team_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `code` char(3) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `img_url` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tteam`
--

INSERT INTO `tteam` (`team_id`, `code`, `name`, `img_url`) VALUES
('ARG', 'ARG', 'Argentina', 'bla'),
('AUS', 'AUS', 'Australia', 'bla'),
('BEL', 'BEL', 'Belgium', 'bla'),
('BRA', 'BRA', 'Brazil', 'bla'),
('COL', 'COL', 'Colombia', 'bla'),
('CRC', 'CRC', 'Costa Rica', 'bla'),
('CRO', 'CRO', 'Croatia', 'bla'),
('DEN', 'DEN', 'Denmark', 'bla'),
('EGY', 'EGY', 'Egypt', 'bla'),
('ENG', 'ENG', 'England', 'bla'),
('ESP', 'ESP', 'Spain', 'bla'),
('FRA', 'FRA', 'France', 'bla'),
('GER', 'GER', 'Germany', 'bla'),
('IRN', 'IRN', 'Iran', 'bla'),
('ISL', 'ISL', 'Iceland', 'bla'),
('JPN', 'JPN', 'Japan', 'bla'),
('KOR', 'KOR', 'Korea Republic', 'bla'),
('KSA', 'KSA', 'Saudi Arabia', 'bla'),
('MAR', 'MAR', 'Morocco', 'bla'),
('MEX', 'MEX', 'Mexico', 'bla'),
('NGA', 'NGA', 'Nigeria', 'bla'),
('PAN', 'PAN', 'Panama', 'bla'),
('PER', 'PER', 'Peru', 'bla'),
('POL', 'POL', 'Poland', 'bla'),
('POR', 'POR', 'Portugal', 'bla'),
('RUS', 'RUS', 'Russia', 'bla'),
('SEN', 'SEN', 'Senegal', 'bla'),
('SRB', 'SRB', 'Serbia', 'bla'),
('SUI', 'SUI', 'Switzerland', 'bla'),
('SWE', 'SWE', 'Sweden', 'bla'),
('TUN', 'TUN', 'Tunisia', 'bla'),
('URU', 'URU', 'Uruguay', 'bla');

-- --------------------------------------------------------

--
-- Table structure for table `ttournament`
--

CREATE TABLE `ttournament` (
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ttournament`
--

INSERT INTO `ttournament` (`tournament_id`, `name`) VALUES
('FIFAWC2018', 'FIFA World Cup 2018');

-- --------------------------------------------------------

--
-- Table structure for table `tuser`
--

CREATE TABLE `tuser` (
  `user_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tuser`
--

INSERT INTO `tuser` (`user_id`, `name`) VALUES
('A3270', 'Christopher Kozlicek'),
('A6714', 'Viktor Csomor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tmatch`
--
ALTER TABLE `tmatch`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `match_tournament_fk_constraints` (`tournament_id`),
  ADD KEY `match_teams_guest_fk_constraints` (`guest_id`),
  ADD KEY `match_teams_host_fk_constraints` (`host_id`),
  ADD KEY `match_match_type_fk_contraint` (`match_type_id`);

--
-- Indexes for table `tmatch_bet`
--
ALTER TABLE `tmatch_bet`
  ADD PRIMARY KEY (`user_id`,`match_id`),
  ADD KEY `bet_match_fk_constraints` (`match_id`);

--
-- Indexes for table `tmatch_bet_cost`
--
ALTER TABLE `tmatch_bet_cost`
  ADD PRIMARY KEY (`tournament_id`,`match_type_id`),
  ADD KEY `match_bet_price_match_type_fk_constraint` (`match_type_id`);

--
-- Indexes for table `tmatch_type`
--
ALTER TABLE `tmatch_type`
  ADD PRIMARY KEY (`match_type_id`);

--
-- Indexes for table `tspecial_bet`
--
ALTER TABLE `tspecial_bet`
  ADD PRIMARY KEY (`team_id`,`user_id`),
  ADD KEY `special_bet_user_fk_constraint` (`user_id`),
  ADD KEY `special_bet_special_bet_type_fk_constraint` (`special_bet_type_id`);

--
-- Indexes for table `tspecial_bet_type`
--
ALTER TABLE `tspecial_bet_type`
  ADD PRIMARY KEY (`special_bet_type_id`),
  ADD KEY `special_bet_type_tournament_fk_constraint` (`tournament_id`);

--
-- Indexes for table `tteam`
--
ALTER TABLE `tteam`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `ttournament`
--
ALTER TABLE `ttournament`
  ADD PRIMARY KEY (`tournament_id`);

--
-- Indexes for table `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tmatch`
--
ALTER TABLE `tmatch`
  ADD CONSTRAINT `match_match_type_fk_contraint` FOREIGN KEY (`match_type_id`) REFERENCES `tmatch_type` (`match_type_id`),
  ADD CONSTRAINT `match_teams_guest_fk_constraints` FOREIGN KEY (`guest_id`) REFERENCES `tteam` (`team_id`),
  ADD CONSTRAINT `match_teams_host_fk_constraints` FOREIGN KEY (`host_id`) REFERENCES `tteam` (`team_id`),
  ADD CONSTRAINT `match_tournament_fk_constraints` FOREIGN KEY (`tournament_id`) REFERENCES `ttournament` (`tournament_id`);

--
-- Constraints for table `tmatch_bet`
--
ALTER TABLE `tmatch_bet`
  ADD CONSTRAINT `bet_match_fk_constraints` FOREIGN KEY (`match_id`) REFERENCES `tmatch` (`match_id`),
  ADD CONSTRAINT `bet_user_fk_constraints` FOREIGN KEY (`user_id`) REFERENCES `tuser` (`user_id`);

--
-- Constraints for table `tmatch_bet_cost`
--
ALTER TABLE `tmatch_bet_cost`
  ADD CONSTRAINT `match_bet_price_match_type_fk_constraint` FOREIGN KEY (`match_type_id`) REFERENCES `tmatch_type` (`match_type_id`),
  ADD CONSTRAINT `match_bet_price_tournament_fk_constraint` FOREIGN KEY (`tournament_id`) REFERENCES `ttournament` (`tournament_id`);

--
-- Constraints for table `tspecial_bet`
--
ALTER TABLE `tspecial_bet`
  ADD CONSTRAINT `special_bet_special_bet_type_fk_constraint` FOREIGN KEY (`special_bet_type_id`) REFERENCES `tspecial_bet_type` (`special_bet_type_id`),
  ADD CONSTRAINT `special_bet_team_fk_constraint` FOREIGN KEY (`team_id`) REFERENCES `tteam` (`team_id`),
  ADD CONSTRAINT `special_bet_user_fk_constraint` FOREIGN KEY (`user_id`) REFERENCES `tuser` (`user_id`);

--
-- Constraints for table `tspecial_bet_type`
--
ALTER TABLE `tspecial_bet_type`
  ADD CONSTRAINT `special_bet_type_tournament_fk_constraint` FOREIGN KEY (`tournament_id`) REFERENCES `ttournament` (`tournament_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
