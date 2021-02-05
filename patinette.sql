-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 fév. 2021 à 11:26
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `patinette`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `trajet_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1323A575D12A823` (`trajet_id`),
  KEY `IDX_1323A575ED766068` (`username_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id`, `username_id`, `score`, `description`, `created_at`, `trajet_id`) VALUES
(1, 3, 5, 'C\'est un bon trajet', '2021-02-02 17:03:56', 7),
(9, 1, 0, 'C\'est pas ouf', '2021-02-02 17:31:02', 1);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` int(11) NOT NULL,
  `usecode` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `category` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id`, `code`, `sale`, `usecode`, `created_at`, `category`) VALUES
(1, 'ABC123', 10, 1, '2021-02-02 17:33:28', '');

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

DROP TABLE IF EXISTS `trajet`;
CREATE TABLE IF NOT EXISTS `trajet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username_id` int(11) NOT NULL,
  `depart` datetime NOT NULL,
  `arrivee` datetime NOT NULL,
  `time` int(11) NOT NULL,
  `cout` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2B5BA98CED766068` (`username_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`id`, `username_id`, `depart`, `arrivee`, `time`, `cout`) VALUES
(1, 3, '2021-02-02 16:54:30', '2021-02-02 17:09:30', 15, 3),
(2, 2, '2021-02-02 17:30:12', '2021-02-02 17:45:12', 15, 3),
(4, 2, '2021-02-04 07:57:13', '2021-02-04 08:17:13', 10, 1),
(5, 2, '2021-02-04 07:57:13', '2021-02-04 08:17:13', 10, 1),
(6, 2, '2021-02-04 07:57:13', '2021-02-04 08:12:13', 10, 3),
(7, 1, '2021-02-04 09:25:52', '2021-02-04 09:40:52', 15, 3);

-- --------------------------------------------------------

--
-- Structure de la table `trotinette`
--

DROP TABLE IF EXISTS `trotinette`;
CREATE TABLE IF NOT EXISTS `trotinette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trottinette`
--

DROP TABLE IF EXISTS `trottinette`;
CREATE TABLE IF NOT EXISTS `trottinette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trottinette`
--

INSERT INTO `trottinette` (`id`, `matricule`, `prix`, `created_at`, `updated_at`) VALUES
(1, 'ABC123', 1, '2021-02-02 16:49:25', '2021-02-02 16:49:25'),
(2, 'DEF456', 1, '2021-02-02 17:18:31', '2021-02-02 17:18:31');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `firstname`, `phone`, `birthday`, `created_at`) VALUES
(1, 'nicolas@mazaud.com', '[\"ROLE_ADMIN\"]', '#Latortuequicourt94', 'MAZAUD', 'Nicolas', '0608970977', '2021-02-02 00:00:00', '2021-02-02 16:38:46'),
(2, 'toto@toto.com', '[\"\"]', 'ejrzglhkjzerhglkezerg', 'toto', 'toto', '0000000000', '2021-02-02 00:00:00', '2021-02-02 17:27:15'),
(3, 'tutu@tutu.com', '[\"ROLE_ADMIN\"]', 'azerstdyuij', 'Tutu', 'Tutu', '000000000', '2021-02-02 00:00:00', '2021-02-02 17:34:16');

-- --------------------------------------------------------

--
-- Structure de la table `user_promotion`
--

DROP TABLE IF EXISTS `user_promotion`;
CREATE TABLE IF NOT EXISTS `user_promotion` (
  `user_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`promotion_id`),
  KEY `IDX_C1FDF035A76ED395` (`user_id`),
  KEY `IDX_C1FDF035139DF194` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_promotion`
--

INSERT INTO `user_promotion` (`user_id`, `promotion_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_trotinette`
--

DROP TABLE IF EXISTS `user_trotinette`;
CREATE TABLE IF NOT EXISTS `user_trotinette` (
  `user_id` int(11) NOT NULL,
  `trotinette_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`trotinette_id`),
  KEY `IDX_54845F22A76ED395` (`user_id`),
  KEY `IDX_54845F2264F0FC18` (`trotinette_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_trottinette`
--

DROP TABLE IF EXISTS `user_trottinette`;
CREATE TABLE IF NOT EXISTS `user_trottinette` (
  `user_id` int(11) NOT NULL,
  `trottinette_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`trottinette_id`),
  KEY `IDX_ED4E50ACA76ED395` (`user_id`),
  KEY `IDX_ED4E50ACF6798F43` (`trottinette_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_trottinette`
--

INSERT INTO `user_trottinette` (`user_id`, `trottinette_id`) VALUES
(1, 2),
(2, 2),
(3, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK_1323A575D12A823` FOREIGN KEY (`trajet_id`) REFERENCES `trajet` (`id`),
  ADD CONSTRAINT `FK_1323A575ED766068` FOREIGN KEY (`username_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `FK_2B5BA98CED766068` FOREIGN KEY (`username_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_promotion`
--
ALTER TABLE `user_promotion`
  ADD CONSTRAINT `FK_C1FDF035139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C1FDF035A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_trotinette`
--
ALTER TABLE `user_trotinette`
  ADD CONSTRAINT `FK_54845F2264F0FC18` FOREIGN KEY (`trotinette_id`) REFERENCES `trotinette` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_54845F22A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_trottinette`
--
ALTER TABLE `user_trottinette`
  ADD CONSTRAINT `FK_ED4E50ACA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ED4E50ACF6798F43` FOREIGN KEY (`trottinette_id`) REFERENCES `trottinette` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
