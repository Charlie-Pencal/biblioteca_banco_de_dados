CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS `livros` (
  `id` int PRIMARY KEY,
  `nome` varchar(50),
  `genero` enum (
  'Fantasia',
  'Ficção',
  'Ficção Cientifica',
  'Policial',
  'Ação',
  'Aventura',
  'Horror',
  'Thriller',
  'Suspense',
  'Romance',
  'Infantil',
  'Infanto-Juvenil',
  'Biografia',
  'Gastronomia',
  'Autoajuda',
  'Historia'),
  `qtd_paginas` int,
  `id_autores_fk` int,
  `id_editoras_fk` int,
  `id_status_fk` int
);

CREATE TABLE IF NOT EXISTS `autores` (
  `id` int PRIMARY KEY,
  `qtd_livros` int,
  `id_pessoas_fk` int,
  `id_livros_fk` int
);

CREATE TABLE IF NOT EXISTS `editoras` (
  `id` int PRIMARY KEY,
  `nome` varchar(50),
  `nome_fantasia` varchar(50),
  `cnpj` varchar(14),
  `id_endereco_fk` int
);

CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int PRIMARY KEY,
  `nome` varchar(50),
  `cpf` varchar(11),
  `data_de_nascimento` date,
  `nacionalidade` varchar(30),
  `email` varchar(50),
  `id_endereco_fk` int
);

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int PRIMARY KEY,
  `senha` int,
  `id_pessoas_fk` int
);

CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int PRIMARY KEY,
  `cep` varchar(9),
  `rua` varchar(50),
  `numero` int,
  `complemento` varchar(20),
  `bairro` varchar(30),
  `cidade` varchar(60),
  `estado` varchar(50),
  `pais` varchar(50)
);

CREATE TABLE IF NOT EXISTS `status` (
  `id` int PRIMARY KEY,
  `disponivel` boolean DEFAULT true
);



ALTER TABLE `livros` ADD FOREIGN KEY (`id_editoras_fk`) REFERENCES `editoras` (`id`);

ALTER TABLE `livros` ADD FOREIGN KEY (`id_status_fk`) REFERENCES `status` (`id`);

ALTER TABLE `autores` ADD FOREIGN KEY (`id_pessoas_fk`) REFERENCES `pessoas` (`id`);

ALTER TABLE `editoras` ADD FOREIGN KEY (`id_endereco_fk`) REFERENCES `endereco` (`id`);

ALTER TABLE `pessoas` ADD FOREIGN KEY (`id_endereco_fk`) REFERENCES `endereco` (`id`);

ALTER TABLE `usuario` ADD FOREIGN KEY (`id_pessoas_fk`) REFERENCES `pessoas` (`id`);
