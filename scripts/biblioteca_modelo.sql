#criação do banco de dados e acionando seu uso.
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

#criação da tabela livros, utilizando int para numeros inteiros, varchar para valores de texto e enum para valores que se limitam a opções. Com uso de foreign keys para referira as tabelas autores e editoras. Também foi usado um valor booleano para informar se um livro está disponivel ou não.
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
  `disponivel` boolean DEFAULT true,
  `id_autores_fk` int,
  `id_editoras_fk` int
);
#criado a tabela autores, utilizando apenas valores inteiros. Usando uma foreign key para se referenciar a pessoas. Mantive as maiores informações de autores dentro de pessoas.
CREATE TABLE IF NOT EXISTS `autores` (
  `id` int PRIMARY KEY,
  `qtd_livros` int,
  `id_pessoas_fk` int
);
#criada a tabela editoras com algumas informações basicas. Usando o If not exists pra não criar uma segunda tabela de mesmo nome. Usei uma FK (Foreign Key) para referenciar a endereços.
CREATE TABLE IF NOT EXISTS `editoras` (
  `id` int PRIMARY KEY,
  `nome` varchar(50),
  `nome_fantasia` varchar(50),
  `cnpj` varchar(14),
  `id_endereco_fk` int
);
#criada a tabela pessoas com atributos usando varchar, int e date usado para adicionar datas.
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int PRIMARY KEY,
  `nome` varchar(50),
  `cpf` varchar(11),
  `data_de_nascimento` date,
  `nacionalidade` varchar(30),
  `email` varchar(50),
  `id_endereco_fk` int
);
#criada a tabela usuario referenciando pessoas por uma FK.
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int PRIMARY KEY,
  `senha` int,
  `id_pessoas_fk` int
);
#criado a tabela endereço onde vai abrigar o endereço dos usuarios, autores, e editoras.
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


#referenciando os relacionamentos das chaves estrangeiras.
ALTER TABLE `livros` ADD FOREIGN KEY (`id_editoras_fk`) REFERENCES `editoras` (`id`);

ALTER TABLE `livros` ADD FOREIGN KEY (`id_autores_fk`) REFERENCES `autores` (`id`);

ALTER TABLE `autores` ADD FOREIGN KEY (`id_pessoas_fk`) REFERENCES `pessoas` (`id`);

ALTER TABLE `editoras` ADD FOREIGN KEY (`id_endereco_fk`) REFERENCES `endereco` (`id`);

ALTER TABLE `pessoas` ADD FOREIGN KEY (`id_endereco_fk`) REFERENCES `endereco` (`id`);

ALTER TABLE `usuario` ADD FOREIGN KEY (`id_pessoas_fk`) REFERENCES `pessoas` (`id`);
