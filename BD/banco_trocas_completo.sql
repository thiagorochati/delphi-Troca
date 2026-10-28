-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2026 às 03:12
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `troca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ind_excluido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`, `ind_excluido`) VALUES
(1, 'Eletrônicos', 0),
(2, 'Informática', 0),
(3, 'Games', 0),
(4, 'Livros', 0),
(5, 'Roupas', 0),
(6, 'Esportes', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat_troca`
--

CREATE TABLE `chat_troca` (
  `id_chat_troca` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_troca` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `ind_lido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `chat_troca`
--

INSERT INTO `chat_troca` (`id_chat_troca`, `id_usuario`, `id_troca`, `mensagem`, `data`, `ind_lido`) VALUES
(1, 2, 1, 'Olá! Você aceita trocar o PS4 por um notebook?', '2026-08-26 10:00:00', 1),
(2, 1, 1, 'Olá Maria! Depende do modelo do notebook.', '2026-08-26 10:05:00', 1),
(3, 2, 1, 'É um Lenovo com 8GB de RAM e SSD de 256GB.', '2026-08-26 10:08:00', 1),
(4, 1, 1, 'Pode ser interessante. Podemos conversar melhor.', '2026-08-26 10:12:00', 0),
(5, 3, 2, 'Olá Maria, tenho interesse no notebook.', '2026-08-27 09:30:00', 0),
(6, 4, 4, 'A bicicleta ainda está disponível?', '2026-08-27 15:20:00', 1),
(7, 4, 4, 'Sim, ainda está disponível.', '2026-08-27 15:25:00', 1),
(8, 5, 5, 'Aceita trocar o teclado por algum jogo?', '2026-08-28 19:00:00', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `condicao`
--

CREATE TABLE `condicao` (
  `id_condicao` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ind_excluido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `condicao`
--

INSERT INTO `condicao` (`id_condicao`, `nome`, `ind_excluido`) VALUES
(1, 'Novo', 0),
(2, 'Usado - Excelente', 0),
(3, 'Usado - Bom', 0),
(4, 'Usado - Regular', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `troca`
--

CREATE TABLE `troca` (
  `id_troca` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_condicao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `ind_situacao` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `troca`
--

INSERT INTO `troca` (`id_troca`, `titulo`, `descricao`, `id_categoria`, `id_condicao`, `id_usuario`, `data`, `ind_situacao`) VALUES
(1, 'PlayStation 4 Slim', 'PS4 Slim funcionando perfeitamente, acompanha controle e cabos.', 3, 2, 1, '2026-08-20 10:30:00', 1),
(2, 'Notebook Lenovo', 'Notebook Lenovo com 8GB de RAM e SSD de 256GB.', 2, 3, 2, '2026-08-21 14:20:00', 1),
(3, 'Livro Clean Code', 'Livro sobre boas práticas de programação. Pouco usado.', 4, 2, 3, '2026-08-22 09:15:00', 1),
(4, 'Bicicleta Mountain Bike', 'Bicicleta aro 29, usada poucas vezes.', 6, 2, 4, '2026-08-23 16:45:00', 1),
(5, 'Teclado Mecânico', 'Teclado mecânico RGB, switches azuis.', 2, 2, 5, '2026-08-24 11:00:00', 1),
(6, 'Camiseta de futebol', 'Camiseta oficial de futebol, tamanho M.', 5, 3, 1, '2026-08-25 18:30:00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `troca_foto`
--

CREATE TABLE `troca_foto` (
  `id_troca_foto` int(11) NOT NULL,
  `id_troca` int(11) NOT NULL,
  `arquivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `troca_foto`
--

INSERT INTO `troca_foto` (`id_troca_foto`, `id_troca`, `arquivo`) VALUES
(1, 1, 'ps4_frente.jpg'),
(2, 1, 'ps4_controle.jpg'),
(3, 1, 'ps4_lateral.jpg'),
(4, 2, 'notebook_aberto.jpg'),
(5, 2, 'notebook_teclado.jpg'),
(6, 3, 'clean_code_capa.jpg'),
(7, 4, 'bicicleta_lateral.jpg'),
(8, 4, 'bicicleta_frente.jpg'),
(9, 5, 'teclado_rgb.jpg'),
(10, 6, 'camiseta_frente.jpg'),
(11, 6, 'camiseta_costas.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `ind_excluido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `cidade`, `estado`, `ind_excluido`) VALUES
(1, 'João Silva', 'joao@email.com', '123456', 'São Paulo', 'SP', 0),
(2, 'Maria Oliveira', 'maria@email.com', '123456', 'Campinas', 'SP', 0),
(3, 'Carlos Souza', 'carlos@email.com', '123456', 'Curitiba', 'PR', 0),
(4, 'Ana Santos', 'ana@email.com', '123456', 'Belo Horizonte', 'MG', 0),
(5, 'Pedro Costa', 'pedro@email.com', '123456', 'Rio de Janeiro', 'RJ', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `chat_troca`
--
ALTER TABLE `chat_troca`
  ADD PRIMARY KEY (`id_chat_troca`),
  ADD KEY `fk_chat_troca_usuario` (`id_usuario`),
  ADD KEY `fk_chat_troca_troca` (`id_troca`);

--
-- Índices para tabela `condicao`
--
ALTER TABLE `condicao`
  ADD PRIMARY KEY (`id_condicao`);

--
-- Índices para tabela `troca`
--
ALTER TABLE `troca`
  ADD PRIMARY KEY (`id_troca`),
  ADD KEY `fk_troca_categoria` (`id_categoria`),
  ADD KEY `fk_troca_condicao` (`id_condicao`),
  ADD KEY `fk_troca_usuario` (`id_usuario`);

--
-- Índices para tabela `troca_foto`
--
ALTER TABLE `troca_foto`
  ADD PRIMARY KEY (`id_troca_foto`),
  ADD KEY `fk_troca_foto_troca` (`id_troca`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `chat_troca`
--
ALTER TABLE `chat_troca`
  MODIFY `id_chat_troca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `condicao`
--
ALTER TABLE `condicao`
  MODIFY `id_condicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `troca`
--
ALTER TABLE `troca`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `troca_foto`
--
ALTER TABLE `troca_foto`
  MODIFY `id_troca_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `chat_troca`
--
ALTER TABLE `chat_troca`
  ADD CONSTRAINT `fk_chat_troca_troca` FOREIGN KEY (`id_troca`) REFERENCES `troca` (`id_troca`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_chat_troca_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `troca`
--
ALTER TABLE `troca`
  ADD CONSTRAINT `fk_troca_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_troca_condicao` FOREIGN KEY (`id_condicao`) REFERENCES `condicao` (`id_condicao`),
  ADD CONSTRAINT `fk_troca_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `troca_foto`
--
ALTER TABLE `troca_foto`
  ADD CONSTRAINT `fk_troca_foto_troca` FOREIGN KEY (`id_troca`) REFERENCES `troca` (`id_troca`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
