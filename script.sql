-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para plantacare
CREATE DATABASE IF NOT EXISTS `plantacare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `plantacare`;

-- Copiando estrutura para tabela plantacare.leituras
CREATE TABLE IF NOT EXISTS `leituras` (
  `id_leitura` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `umidade` decimal(5,2) DEFAULT NULL,
  `temperatura` decimal(5,2) DEFAULT NULL,
  `origem` enum('manual','simulada') NOT NULL,
  `data_leitura` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_leitura`),
  KEY `id_planta` (`id_planta`),
  CONSTRAINT `leituras_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela plantacare.leituras: ~11 rows (aproximadamente)
INSERT INTO `leituras` (`id_leitura`, `id_planta`, `umidade`, `temperatura`, `origem`, `data_leitura`) VALUES
	(1, 1, 55.00, 24.00, 'simulada', '2026-10-20 13:23:51'),
	(2, 1, 55.00, 24.00, 'simulada', '2026-10-20 14:21:46'),
	(3, 1, 55.00, 24.00, 'simulada', '2026-10-22 16:58:42'),
	(4, 1, 55.00, 24.00, 'simulada', '2026-10-22 17:16:05'),
	(5, 1, 20.00, 24.00, 'simulada', '2026-10-22 18:14:49'),
	(6, 1, 90.00, 24.00, 'simulada', '2026-10-22 18:16:51'),
	(7, 1, 90.00, 24.00, 'simulada', '2026-10-22 18:17:05'),
	(8, 1, 20.00, 24.00, 'simulada', '2026-10-22 18:45:58'),
	(9, 1, 20.00, 24.00, 'simulada', '2026-10-22 18:46:05'),
	(10, 1, 20.00, 24.00, 'simulada', '2026-10-22 18:47:04'),
	(11, 1, 20.00, 24.00, 'simulada', '2026-10-22 18:47:22'),
	(12, 1, 55.00, 24.00, 'simulada', '2026-10-29 13:52:10');

-- Copiando estrutura para tabela plantacare.notificacoes
CREATE TABLE IF NOT EXISTS `notificacoes` (
  `id_notificacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `mensagem` varchar(500) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `lida` tinyint(1) DEFAULT 0,
  `data_notificacao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_notificacao`),
  KEY `id_planta` (`id_planta`),
  CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela plantacare.notificacoes: ~5 rows (aproximadamente)
INSERT INTO `notificacoes` (`id_notificacao`, `id_planta`, `titulo`, `mensagem`, `tipo`, `lida`, `data_notificacao`) VALUES
	(1, 1, 'Teste do sistema', 'Esta e uma notificacao ficticia.', 'teste', 1, '2026-10-20 13:23:51'),
	(2, 1, 'Umidade baixa', 'Verifique a umidade do solo desta planta.', 'umidade', 1, '2026-10-20 18:19:48'),
	(3, 1, 'Umidade baixa', 'A planta Samambaia está com umidade abaixo do mínimo recomendado.', 'umidade', 1, '2026-10-22 18:14:49'),
	(4, 1, 'Umidade alta', 'A planta Samambaia está com umidade acima do máximo recomendado.', 'umidade', 1, '2026-10-22 18:16:51'),
	(5, 1, 'Umidade alta', 'A planta Samambaia está com umidade acima do máximo recomendado.', 'umidade', 1, '2026-10-22 18:17:05');

-- Copiando estrutura para tabela plantacare.plantas
CREATE TABLE IF NOT EXISTS `plantas` (
  `id_planta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especie` varchar(100) NOT NULL,
  `localizacao` varchar(100) DEFAULT NULL,
  `foto_url` varchar(500) DEFAULT NULL,
  `umidade_minima` decimal(5,2) DEFAULT NULL,
  `umidade_maxima` decimal(5,2) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_planta`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `plantas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela plantacare.plantas: ~12 rows (aproximadamente)
INSERT INTO `plantas` (`id_planta`, `id_usuario`, `nome`, `especie`, `localizacao`, `foto_url`, `umidade_minima`, `umidade_maxima`, `data_cadastro`) VALUES
	(1, 1, 'Samambaia', 'Samambaia', 'Sala', NULL, 40.00, 70.00, '2026-10-20 13:23:51'),
	(2, 1, 'Jiboia', 'Epipremnum aureum', 'Sala', NULL, 40.00, 70.00, '2026-10-20 13:49:26'),
	(3, 1, 'Lirio-da-paz', 'Spathiphyllum', 'Quarto', NULL, 40.00, 70.00, '2026-10-20 13:57:27'),
	(4, 1, 'Planta Teste', 'Samambaia', NULL, NULL, 40.00, 70.00, '2026-10-20 19:22:28'),
	(5, 1, 'Planta Teste', 'Samambaia', NULL, NULL, 40.00, 70.00, '2026-10-20 19:24:50'),
	(6, 1, 'Teste Validacao', 'Samambaia', NULL, NULL, 40.00, 70.00, '2026-10-20 19:27:13'),
	(7, 1, 'Teste Validacao', 'Samambaia', NULL, NULL, 40.00, 70.00, '2026-10-20 19:34:27'),
	(8, 1, 'Teste Validacao', 'Samambaia', NULL, NULL, 40.00, 70.00, '2026-10-20 19:34:34'),
	(9, 1, 'PlantaTesteValidacao', 'Teste', NULL, NULL, 40.00, 70.00, '2026-10-20 19:44:07'),
	(10, 1, 'TesteValidacao', 'Teste', NULL, NULL, 40.00, 70.00, '2026-10-20 19:52:59'),
	(11, 1, 'PlantaTesteCadastro', 'Teste', 'Laboratorio', NULL, 40.00, 70.00, '2026-10-22 16:18:08'),
	(12, 1, 'LavandaTesteAPI', 'Lavandula angustifolia', 'Sala', NULL, 40.00, 70.00, '2026-10-22 16:52:36');

-- Copiando estrutura para tabela plantacare.regas
CREATE TABLE IF NOT EXISTS `regas` (
  `id_rega` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `quantidade_agua_ml` int(11) DEFAULT NULL,
  `data_rega` timestamp NOT NULL DEFAULT current_timestamp(),
  `observacao` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_rega`),
  KEY `id_planta` (`id_planta`),
  CONSTRAINT `regas_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela plantacare.regas: ~6 rows (aproximadamente)
INSERT INTO `regas` (`id_rega`, `id_planta`, `quantidade_agua_ml`, `data_rega`, `observacao`) VALUES
	(1, 1, 200, '2026-10-20 13:23:51', 'Registro ficticio de teste'),
	(2, 1, 200, '2026-10-20 14:05:20', 'Rega de teste'),
	(3, 1, 200, '2026-10-22 17:21:55', 'Rega de teste pela API'),
	(4, 1, 250, '2026-10-22 19:39:39', 'Rega de teste'),
	(5, 1, 250, '2026-10-22 19:40:06', 'Rega de teste'),
	(6, 1, 250, '2026-10-22 19:50:17', '123'),
	(7, 1, 250, '2026-10-22 19:55:14', 'Rega de teste'),
	(8, 1, 200, '2026-10-29 13:52:27', 'Rega de teste da API');

-- Copiando estrutura para tabela plantacare.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela plantacare.usuarios: ~0 rows (aproximadamente)
INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha_hash`, `data_cadastro`) VALUES
	(1, 'Usuario Teste', 'teste@exemplo.com', 'HASH_FICTICIO_SOMENTE_PARA_TESTE', '2026-10-20 13:23:51');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
