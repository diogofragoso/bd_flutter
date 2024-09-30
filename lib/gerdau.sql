-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/09/2024 às 22:12
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gerdau`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acompanhamentos`
--

CREATE TABLE `acompanhamentos` (
  `id_acompanhamentos` int(11) NOT NULL,
  `nome_acompanhamentos` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acompanhamentos`
--

INSERT INTO `acompanhamentos` (`id_acompanhamentos`, `nome_acompanhamentos`) VALUES
(1, 'Arroz branco'),
(2, 'Feijão'),
(3, 'Macarrão'),
(4, 'Frango');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pratos`
--

CREATE TABLE `pratos` (
  `id_prato` int(11) NOT NULL,
  `nome_prato` varchar(30) NOT NULL,
  `descricao_prato` varchar(30) NOT NULL,
  `disponivel_prato` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pratos`
--

INSERT INTO `pratos` (`id_prato`, `nome_prato`, `descricao_prato`, `disponivel_prato`) VALUES
(1, 'Dia a dia', 'Uma delicia', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pratos_acompanhamentos`
--

CREATE TABLE `pratos_acompanhamentos` (
  `id_pratos_acompanhamentos` int(11) NOT NULL,
  `id_pratos_fk` int(11) NOT NULL,
  `id_acompanhamentos_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acompanhamentos`
--
ALTER TABLE `acompanhamentos`
  ADD PRIMARY KEY (`id_acompanhamentos`);

--
-- Índices de tabela `pratos`
--
ALTER TABLE `pratos`
  ADD PRIMARY KEY (`id_prato`);

--
-- Índices de tabela `pratos_acompanhamentos`
--
ALTER TABLE `pratos_acompanhamentos`
  ADD PRIMARY KEY (`id_pratos_acompanhamentos`),
  ADD KEY `fk_pratos` (`id_pratos_fk`),
  ADD KEY `fk_acompanhamentos` (`id_acompanhamentos_fk`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acompanhamentos`
--
ALTER TABLE `acompanhamentos`
  MODIFY `id_acompanhamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pratos`
--
ALTER TABLE `pratos`
  MODIFY `id_prato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pratos_acompanhamentos`
--
ALTER TABLE `pratos_acompanhamentos`
  MODIFY `id_pratos_acompanhamentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pratos_acompanhamentos`
--
ALTER TABLE `pratos_acompanhamentos`
  ADD CONSTRAINT `fk_acompanhamentos` FOREIGN KEY (`id_acompanhamentos_fk`) REFERENCES `acompanhamentos` (`id_acompanhamentos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
