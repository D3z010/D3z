-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Jun-2021 às 00:20
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `campeonatodistritalbasquetebol`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'admin can add a clube, jogo and jogador', NULL, NULL, NULL, NULL),
('create-clube', 1, 'allow a user to add a clube', NULL, NULL, NULL, NULL),
('create-jogador', 1, 'user can add a jogador', NULL, NULL, NULL, NULL),
('create-jogo', 1, 'allow a user to add a jogo', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-clube'),
('admin', 'create-jogador'),
('admin', 'create-jogo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clube`
--

CREATE TABLE `clube` (
  `id_selecao` int(11) NOT NULL,
  `nome_selecao` varchar(20) NOT NULL,
  `genero` varchar(15) DEFAULT NULL,
  `Escalão_id_escalao` int(11) NOT NULL,
  `Treinador_id_treinador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clube`
--

INSERT INTO `clube` (`id_selecao`, `nome_selecao`, `genero`, `Escalão_id_escalao`, `Treinador_id_treinador`) VALUES
(1, 'FC Porto', 'Masculino', 1, 1),
(2, 'Ovarense', 'Masculino', 1, 2),
(3, 'Barreirense', 'Feminino', 1, 1),
(4, 'Madeira', 'Feminino', 1, 2),
(5, 'Esgueira', 'Masculino', 2, 3),
(6, 'Galitos', 'Masculino', 2, 4),
(7, 'Illiabum', 'Feminino', 2, 3),
(8, 'Maia BC', 'Feminino', 2, 4),
(9, 'SC Lusitânia', 'Masculino', 3, 5),
(10, 'SL Benfica', 'Masculino', 3, 6),
(11, 'Sporting CP', 'Feminino', 3, 5),
(12, 'Terceira BC', 'Feminino', 3, 6),
(13, 'UD Oliveirense', 'Masculino', 4, 7),
(14, 'Vitória de Guimarães', 'Masculino', 4, 8),
(15, 'Mirandela', 'Feminino', 4, 7),
(16, 'Moimenta da Beira', 'Feminino', 4, 8),
(17, 'Canelas FC', 'Masculino', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clube_jogador`
--

CREATE TABLE `clube_jogador` (
  `Seleção_id_selecao` int(11) NOT NULL,
  `Jogador_id_jogador` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clube_jogador`
--

INSERT INTO `clube_jogador` (`Seleção_id_selecao`, `Jogador_id_jogador`, `data`) VALUES
(1, 3, '2017-01-12 18:29:44'),
(1, 12, '2017-01-12 18:29:44'),
(2, 2, '2017-01-12 18:29:44'),
(2, 10, '2017-01-12 18:29:44'),
(3, 5, '2017-01-12 18:29:44'),
(3, 9, '2017-01-12 18:29:44'),
(4, 1, '2017-01-12 18:29:44'),
(4, 11, '2017-01-12 18:29:44'),
(13, 7, '2017-01-12 18:29:44'),
(13, 14, '2017-01-12 18:29:44'),
(14, 6, '2017-01-12 18:29:44'),
(14, 16, '2017-01-12 18:29:44'),
(15, 8, '2017-01-12 18:29:44'),
(15, 15, '2017-01-12 18:29:44'),
(16, 4, '2017-01-12 18:29:44'),
(16, 13, '2017-01-12 18:29:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `divisao`
--

CREATE TABLE `divisao` (
  `id_divisao` int(11) NOT NULL,
  `nome_divisao` varchar(20) NOT NULL,
  `descricao_divisao` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `divisao`
--

INSERT INTO `divisao` (`id_divisao`, `nome_divisao`, `descricao_divisao`) VALUES
(1, 'Divisão A', 'Divisão A, divisão dos clubes teoricamente mais fortes'),
(2, 'Divisão B', 'Divisão B, divisão dos clubes teoricamente mais fracos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `escalao`
--

CREATE TABLE `escalao` (
  `id_escalao` int(11) NOT NULL,
  `nome_escalao` varchar(20) NOT NULL,
  `descricao_escalao` varchar(150) DEFAULT NULL,
  `Divisão_id_divisao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `escalao`
--

INSERT INTO `escalao` (`id_escalao`, `nome_escalao`, `descricao_escalao`, `Divisão_id_divisao`) VALUES
(1, 'Juniores', 'Juniores, jogadores com 17, 18 anos', 1),
(2, 'Juvenis', 'Juvenis, jogadores com 15, 16 anos', 1),
(3, 'Juniores', 'Juniores, jogadores com 17, 18 anos', 2),
(4, 'Juvenis', 'Juvenis, jogadores com 15, 16 anos', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `faltas`
--

CREATE TABLE `faltas` (
  `id_falta` int(11) NOT NULL,
  `minuto` int(11) NOT NULL,
  `tipo_falta` varchar(10) NOT NULL,
  `Jogo_id_jogo` int(11) NOT NULL,
  `Jogador_id_jogador` int(11) DEFAULT NULL,
  `Treinador_id_treinador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `faltas`
--

INSERT INTO `faltas` (`id_falta`, `minuto`, `tipo_falta`, `Jogo_id_jogo`, `Jogador_id_jogador`, `Treinador_id_treinador`) VALUES
(1, 12, 'Pessoal', 1, 3, NULL),
(2, 29, 'Técnica', 1, 10, NULL),
(3, 73, 'Técnica', 1, NULL, 2),
(4, 85, 'Pessoal', 1, 12, NULL),
(5, 36, 'Técnica', 4, 8, NULL),
(6, 71, 'Pessoal', 4, 13, NULL),
(7, 83, 'Técnica', 4, NULL, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `id_jogador` int(11) NOT NULL,
  `nome_jogador` varchar(45) NOT NULL,
  `num_camisola` int(11) DEFAULT NULL,
  `clube` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `genero` varchar(15) DEFAULT NULL,
  `idade` int(11) NOT NULL,
  `total_pontos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`id_jogador`, `nome_jogador`, `num_camisola`, `clube`, `data_nascimento`, `email`, `genero`, `idade`, `total_pontos`) VALUES
(1, 'Vitoria Melo Gonçalves', 3, 'Esgueira', '1999-04-05', 'VitoriaMeloGoncalves@armyspy.com', 'Feminino', 17, 30),
(2, 'André Santos Castro', 2, 'CAB Madeira', '1998-06-14', 'AndreSantosCastro@dayrep.com', 'Masculino', 18, NULL),
(3, 'Martim Sousa Cunha', 3, 'AD Ovarense', '1999-08-15', 'MartimSousaCunha@armyspy.com', 'Masculino', 17, NULL),
(4, 'Aline Araujo Rodrigues', 4, 'FC Porto', '2000-03-01', 'AlineAraujoRodrigues@hotmail.com', 'Feminino', 16, NULL),
(5, 'Carolina Rocha Silva', 5, 'Galitos', '1998-09-28', 'CarolinaRochaSilva@rhyta.com', 'Feminino', 18, NULL),
(6, 'Paulo Costa Santos', 6, 'Maia BC', '2001-05-16', 'PauloCostaSantos@teleworm.com', 'Masculino', 15, NULL),
(7, 'Vitor Ribeiro Almeida', 7, 'SL Benfica', '2000-11-10', 'VitorRibeiroAlmeida@teleworm.com', 'Masculino', 16, NULL),
(8, 'Luana Almeida Ribeiro', 8, 'Sporting CP', '2001-12-03', 'LuanaAlmeidaRibeiro@jourrapide.com', 'Feminino', 15, 5),
(9, 'Clara Castro Lima', 9, 'Pinhal SC', '1998-08-09', 'ClaraCastroLima@rhyta.com', 'Feminino', 18, NULL),
(10, 'Rafael Dias Gonçalves', 10, 'SL Benfica', '1998-03-19', 'RafaelDiasGoncalves@dayrep.com', 'Masculino', 18, 5),
(11, 'Julia Araujo Santos', 11, 'FC Porto', '1999-01-15', 'JuliaAraujoSantos@hotmail.com', 'Feminino', 17, NULL),
(12, 'Leonardo Costa Sousa', 12, 'UD Oliveirense', '1999-06-12', 'LeonardoCostaSousa@sapo.pt', 'Masculino', 17, NULL),
(13, 'Maria Cunha Cardoso', 13, 'Varzim BC', '2000-09-29', 'MariaCunhaCardoso@hotmail.com', 'Feminino', 16, 7),
(14, 'Alex Martins Almeida', 14, 'SC Vianense', '2000-11-24', 'AlexMartinsAlmeida@gmail.com', 'Masculino', 16, NULL),
(15, 'Ana Ferreira Silva', 15, 'Vitória de Guimarães', '2001-04-12', 'AnaFerreiraSilva@sapo.pt', 'Feminino', 15, 10),
(16, 'André Pereira Rocha', 16, 'Moimenta da Beira', '2001-08-08', 'AndréPereiraRocha@hotmail.com', 'Masculino', 15, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogo`
--

CREATE TABLE `jogo` (
  `id_jogo` int(11) NOT NULL,
  `local` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `hora` time(3) NOT NULL,
  `resultado` varchar(45) DEFAULT NULL,
  `Seleção_id_selecao1` int(11) NOT NULL,
  `Seleção_id_selecao2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogo`
--

INSERT INTO `jogo` (`id_jogo`, `local`, `data`, `hora`, `resultado`, `Seleção_id_selecao1`, `Seleção_id_selecao2`) VALUES
(1, 'Centro Desportivo Viana', '2016-12-02', '15:00:00.000', '45-38', 1, 2),
(2, 'Pavilhão Desportivo do Porto', '2016-12-09', '14:00:00.000', '27-33', 4, 3),
(3, 'Centro Desportivo Viseu', '2016-12-16', '16:00:00.000', '48-43', 13, 14),
(4, 'Pavilhão Desportivo da Guarda', '2016-12-23', '17:00:00.000', '50-51', 16, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontos`
--

CREATE TABLE `pontos` (
  `id_ponto` int(11) NOT NULL,
  `minuto` int(11) NOT NULL,
  `tipo_ponto` int(11) DEFAULT NULL,
  `Jogo_id_jogo` int(11) NOT NULL,
  `Jogador_id_jogador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pontos`
--

INSERT INTO `pontos` (`id_ponto`, `minuto`, `tipo_ponto`, `Jogo_id_jogo`, `Jogador_id_jogador`) VALUES
(1, 12, 3, 1, 3),
(2, 19, 2, 1, 10),
(3, 30, 2, 1, 2),
(4, 59, 3, 1, 12),
(5, 14, 3, 4, 4),
(6, 43, 2, 4, 8),
(7, 71, 3, 4, 15),
(8, 87, 2, 4, 13),
(9, 88, 3, 4, 8),
(10, 89, 3, 4, 13),
(11, 90, 3, 1, 10),
(12, 90, 2, 4, 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `substituicoes`
--

CREATE TABLE `substituicoes` (
  `id_substituicao` int(11) NOT NULL,
  `minuto` int(11) NOT NULL,
  `Jogo_id_jogo` int(11) NOT NULL,
  `Jogador_id_jogador_sai` int(11) NOT NULL,
  `Jogador_id_jogador_entra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `substituicoes`
--

INSERT INTO `substituicoes` (`id_substituicao`, `minuto`, `Jogo_id_jogo`, `Jogador_id_jogador_sai`, `Jogador_id_jogador_entra`) VALUES
(1, 37, 1, 3, 12),
(2, 53, 1, 2, 10),
(3, 78, 1, 12, 3),
(4, 83, 1, 10, 2),
(5, 30, 4, 8, 15),
(6, 50, 4, 13, 4),
(7, 72, 4, 15, 8),
(8, 84, 4, 4, 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `treinador`
--

CREATE TABLE `treinador` (
  `id_treinador` int(11) NOT NULL,
  `nome_treinador` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `treinador`
--

INSERT INTO `treinador` (`id_treinador`, `nome_treinador`) VALUES
(1, 'Miguel Morais'),
(2, 'José Pedro'),
(3, 'Fabrice Francisco'),
(4, 'Paulo Castro'),
(5, 'João Sousa'),
(6, 'João Pacheco'),
(7, 'André Neves'),
(8, 'Luis Carvalho');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'chico', 'chico'),
(6, 'rita', 'rita');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Índices para tabela `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Índices para tabela `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Índices para tabela `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Índices para tabela `clube`
--
ALTER TABLE `clube`
  ADD PRIMARY KEY (`id_selecao`),
  ADD KEY `fk_Seleção_Escalão1_idx` (`Escalão_id_escalao`),
  ADD KEY `fk_Seleção_Treinador1_idx` (`Treinador_id_treinador`);

--
-- Índices para tabela `clube_jogador`
--
ALTER TABLE `clube_jogador`
  ADD PRIMARY KEY (`Seleção_id_selecao`,`Jogador_id_jogador`),
  ADD KEY `fk_Seleção_has_Jogador_Jogador1_idx` (`Jogador_id_jogador`),
  ADD KEY `fk_Seleção_has_Jogador_Seleção1_idx` (`Seleção_id_selecao`);

--
-- Índices para tabela `divisao`
--
ALTER TABLE `divisao`
  ADD PRIMARY KEY (`id_divisao`);

--
-- Índices para tabela `escalao`
--
ALTER TABLE `escalao`
  ADD PRIMARY KEY (`id_escalao`),
  ADD KEY `fk_Escalão_Divisão_idx` (`Divisão_id_divisao`);

--
-- Índices para tabela `faltas`
--
ALTER TABLE `faltas`
  ADD PRIMARY KEY (`id_falta`),
  ADD KEY `fk_Faltas_Jogo1_idx` (`Jogo_id_jogo`),
  ADD KEY `fk_Faltas_Jogador1_idx` (`Jogador_id_jogador`),
  ADD KEY `fk_Faltas_Treinador1_idx` (`Treinador_id_treinador`);

--
-- Índices para tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`id_jogador`);

--
-- Índices para tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`id_jogo`),
  ADD KEY `fk_Jogo_Seleção1_idx` (`Seleção_id_selecao1`),
  ADD KEY `fk_Jogo_Seleção2_idx` (`Seleção_id_selecao2`);

--
-- Índices para tabela `pontos`
--
ALTER TABLE `pontos`
  ADD PRIMARY KEY (`id_ponto`),
  ADD KEY `fk_Pontos_Jogo1_idx` (`Jogo_id_jogo`),
  ADD KEY `fk_Pontos_Jogador1_idx` (`Jogador_id_jogador`);

--
-- Índices para tabela `substituicoes`
--
ALTER TABLE `substituicoes`
  ADD PRIMARY KEY (`id_substituicao`),
  ADD KEY `fk_Substituições_Jogo1_idx` (`Jogo_id_jogo`),
  ADD KEY `fk_Substituições_Jogador1_idx` (`Jogador_id_jogador_sai`),
  ADD KEY `fk_Substituições_Jogador2_idx` (`Jogador_id_jogador_entra`);

--
-- Índices para tabela `treinador`
--
ALTER TABLE `treinador`
  ADD PRIMARY KEY (`id_treinador`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clube`
--
ALTER TABLE `clube`
  MODIFY `id_selecao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `divisao`
--
ALTER TABLE `divisao`
  MODIFY `id_divisao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `escalao`
--
ALTER TABLE `escalao`
  MODIFY `id_escalao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `faltas`
--
ALTER TABLE `faltas`
  MODIFY `id_falta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `id_jogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pontos`
--
ALTER TABLE `pontos`
  MODIFY `id_ponto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `substituicoes`
--
ALTER TABLE `substituicoes`
  MODIFY `id_substituicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `clube`
--
ALTER TABLE `clube`
  ADD CONSTRAINT `fk_Seleção_Escalão1` FOREIGN KEY (`Escalão_id_escalao`) REFERENCES `escalao` (`id_escalao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Seleção_Treinador1` FOREIGN KEY (`Treinador_id_treinador`) REFERENCES `treinador` (`id_treinador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `clube_jogador`
--
ALTER TABLE `clube_jogador`
  ADD CONSTRAINT `fk_Seleção_has_Jogador_Jogador1` FOREIGN KEY (`Jogador_id_jogador`) REFERENCES `jogador` (`id_jogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Seleção_has_Jogador_Seleção1` FOREIGN KEY (`Seleção_id_selecao`) REFERENCES `clube` (`id_selecao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `escalao`
--
ALTER TABLE `escalao`
  ADD CONSTRAINT `fk_Escalão_Divisão` FOREIGN KEY (`Divisão_id_divisao`) REFERENCES `divisao` (`id_divisao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `faltas`
--
ALTER TABLE `faltas`
  ADD CONSTRAINT `fk_Faltas_Jogador1` FOREIGN KEY (`Jogador_id_jogador`) REFERENCES `jogador` (`id_jogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Faltas_Jogo1` FOREIGN KEY (`Jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Faltas_Treinador1` FOREIGN KEY (`Treinador_id_treinador`) REFERENCES `treinador` (`id_treinador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `jogo`
--
ALTER TABLE `jogo`
  ADD CONSTRAINT `fk_Jogo_Seleção1` FOREIGN KEY (`Seleção_id_selecao1`) REFERENCES `clube` (`id_selecao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Jogo_Seleção2` FOREIGN KEY (`Seleção_id_selecao2`) REFERENCES `clube` (`id_selecao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pontos`
--
ALTER TABLE `pontos`
  ADD CONSTRAINT `fk_Pontos_Jogador1` FOREIGN KEY (`Jogador_id_jogador`) REFERENCES `jogador` (`id_jogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pontos_Jogo1` FOREIGN KEY (`Jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `substituicoes`
--
ALTER TABLE `substituicoes`
  ADD CONSTRAINT `fk_Substituições_Jogador1` FOREIGN KEY (`Jogador_id_jogador_sai`) REFERENCES `jogador` (`id_jogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Substituições_Jogador2` FOREIGN KEY (`Jogador_id_jogador_entra`) REFERENCES `jogador` (`id_jogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Substituições_Jogo1` FOREIGN KEY (`Jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
