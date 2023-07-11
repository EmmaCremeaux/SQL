-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 11 juil. 2023 à 12:27
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.2.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locationVehicules`
--
CREATE DATABASE IF NOT EXISTS `locationVehicules` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `locationVehicules`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) NOT NULL,
  `prenom` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `permis` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_client_permis` (`permis`) USING BTREE,
  UNIQUE KEY `idx_unique_client_email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formulaire`
--

DROP TABLE IF EXISTS `formulaire`;
CREATE TABLE IF NOT EXISTS `formulaire` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicule_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `verification_debut` text NOT NULL,
  `verification_fin` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idex_vehicule_id` (`vehicule_id`),
  KEY `idx_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_statut_nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_utilisateur_email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(191) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `marque` varchar(191) NOT NULL,
  `modele` varchar(191) NOT NULL,
  `couleur` varchar(191) NOT NULL,
  `statut_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_statut_id` (`statut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `fk_vehicule_statut_statut_id` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
