-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2018 at 11:52 AM
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
('FIFAWC20180614RUSKSA', 'FIFAWC2018', '2018-06-14 15:00:00', 'RUS', 'KSA', 5, 0, 'GRPMT'),
('FIFAWC20180615EGYURU', 'FIFAWC2018', '2018-06-15 12:00:00', 'EGY', 'URU', 0, 1, 'GRPMT'),
('FIFAWC20180615MARIRN', 'FIFAWC2018', '2018-06-15 17:00:00', 'MAR', 'IRN', 0, 1, 'GRPMT'),
('FIFAWC20180616ARGISL', 'FIFAWC2018', '2018-06-16 13:00:00', 'ARG', 'ISL', 1, 1, 'GRPMT'),
('FIFAWC20180616CRONGA', 'FIFAWC2018', '2018-06-16 19:00:00', 'CRO', 'NGA', 2, 0, 'GRPMT'),
('FIFAWC20180616FRAAUS', 'FIFAWC2018', '2018-06-16 10:00:00', 'FRA', 'AUS', 2, 1, 'GRPMT'),
('FIFAWC20180616PERDEN', 'FIFAWC2018', '2018-06-16 16:00:00', 'PER', 'DEN', 0, 1, 'GRPMT'),
('FIFAWC20180616PORESP', 'FIFAWC2018', '2018-06-15 18:00:00', 'POR', 'ESP', 3, 3, 'GRPMT'),
('FIFAWC20180617BRASUI', 'FIFAWC2018', '2018-06-17 18:00:00', 'BRA', 'SUI', 1, 1, 'GRPMT'),
('FIFAWC20180617CRCSRB', 'FIFAWC2018', '2018-06-17 12:00:00', 'CRC', 'SRB', 0, 1, 'GRPMT'),
('FIFAWC20180617GERMEX', 'FIFAWC2018', '2018-06-17 15:00:00', 'GER', 'MEX', 0, 1, 'GRPMT'),
('FIFAWC20180618BELPAN', 'FIFAWC2018', '2018-06-18 15:00:00', 'BEL', 'PAN', 3, 0, 'GRPMT'),
('FIFAWC20180618SWEKOR', 'FIFAWC2018', '2018-06-18 12:00:00', 'SWE', 'KOR', 1, 0, 'GRPMT'),
('FIFAWC20180618TUNENG', 'FIFAWC2018', '2018-06-18 18:00:00', 'TUN', 'ENG', 1, 2, 'GRPMT'),
('FIFAWC20180619COLJPN', 'FIFAWC2018', '2018-06-19 12:00:00', 'COL', 'JPN', 1, 2, 'GRPMT'),
('FIFAWC20180619POLSEN', 'FIFAWC2018', '2018-06-19 15:00:00', 'POL', 'SEN', 1, 2, 'GRPMT'),
('FIFAWC20180619RUSEGY', 'FIFAWC2018', '2018-06-19 18:00:00', 'RUS', 'EGY', 3, 1, 'GRPMT');

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
('A6714', 'FIFAWC20180618TUNENG', 0, 0, 1),
('A6714', 'FIFAWC20180619POLSEN', 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tmatch_bet_cost`
--

CREATE TABLE `tmatch_bet_cost` (
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `match_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tmatch_bet_cost`
--

INSERT INTO `tmatch_bet_cost` (`tournament_id`, `match_type_id`, `cost`) VALUES
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
-- Table structure for table `tteam_bet`
--

CREATE TABLE `tteam_bet` (
  `team_bet_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `team_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `team_bet_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tteam_bet`
--

INSERT INTO `tteam_bet` (`team_bet_id`, `user_id`, `team_id`, `tournament_id`, `team_bet_type_id`, `paid`) VALUES
('08668495-6c4f-4c19-98e6-9e283e280ef6', 'A3270', 'SUI', 'FIFAWC2018', 'CHMPNTBT', 1),
('29219eaf-b10c-4578-966b-fb60ac09516a', 'A6714', 'URU', 'FIFAWC2018', 'CHMPNTBT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tteam_bet_cost`
--

CREATE TABLE `tteam_bet_cost` (
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `team_bet_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tteam_bet_cost`
--

INSERT INTO `tteam_bet_cost` (`tournament_id`, `team_bet_type_id`, `cost`) VALUES
('FIFAWC2018', 'CHMPNTBT', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tteam_bet_type`
--

CREATE TABLE `tteam_bet_type` (
  `team_bet_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tteam_bet_type`
--

INSERT INTO `tteam_bet_type` (`team_bet_type_id`, `name`) VALUES
('CHMPNTBT', 'Champion');

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
-- Indexes for table `tteam`
--
ALTER TABLE `tteam`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `tteam_bet`
--
ALTER TABLE `tteam_bet`
  ADD PRIMARY KEY (`team_bet_id`),
  ADD KEY `team_bet_user_fk_constraint` (`user_id`),
  ADD KEY `team_bet_team_bet_type_fk_constraint` (`team_bet_type_id`),
  ADD KEY `team_bet_team_fk_constraint` (`team_id`),
  ADD KEY `team_bet_tournament_fk_constraint` (`tournament_id`);

--
-- Indexes for table `tteam_bet_cost`
--
ALTER TABLE `tteam_bet_cost`
  ADD PRIMARY KEY (`tournament_id`,`team_bet_type_id`);

--
-- Indexes for table `tteam_bet_type`
--
ALTER TABLE `tteam_bet_type`
  ADD PRIMARY KEY (`team_bet_type_id`);

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
-- Constraints for table `tteam_bet`
--
ALTER TABLE `tteam_bet`
  ADD CONSTRAINT `team_bet_team_bet_type_fk_constraint` FOREIGN KEY (`team_bet_type_id`) REFERENCES `tteam_bet_type` (`team_bet_type_id`),
  ADD CONSTRAINT `team_bet_team_fk_constraint` FOREIGN KEY (`team_id`) REFERENCES `tteam` (`team_id`),
  ADD CONSTRAINT `team_bet_tournament_fk_constraint` FOREIGN KEY (`tournament_id`) REFERENCES `ttournament` (`tournament_id`),
  ADD CONSTRAINT `team_bet_user_fk_constraint` FOREIGN KEY (`user_id`) REFERENCES `tuser` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
