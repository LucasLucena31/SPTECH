CREATE DATABASE Pet;
USE Pet;

CREATE TABLE cliente (
idCliente int primary key auto_increment,
nome VARCHAR (45),
telFixo VARCHAR (45),
telCelular VARCHAR (45),
cep varchar (45),
numEnd varchar(45),
bairro varchar(45)
);

CREATE TABLE pet (
idPet int auto_increment,
fkCliente int,
constraint pkComposta primary key (idPet, fkCliente),
especie varchar (45),
nome varchar (45),
raca varchar (45),
dtNasc DATE,
constraint fkPetCliente foreign key (fkCliente)
		references cliente (idCliente)
)auto_increment = 100; 

INSERT INTO cliente VALUES
	(default, 'Bob Esponja', '11 123456789', '11 987654321', '45879-456', '1', 'Abacaxi'),
	(default, 'Giorgiro Esponja', '11 789456123', '11 321654987', '78954-021', '2', 'Maca'),
	(default, 'Leo Miranda', '11 741852963', '11 963852741', '78987-635', '3', 'Mooca'),
	(default, 'Juuh Murakami', '11 326159487', '11 748159263', '21978-412', '4', 'Mondstand'),
	(default, 'Ana Lessa', '11 563214789', '11 987412365', '35789-458', '5', 'Mooca');
    
INSERT INTO pet VALUES
	(default, '1', 'caracol', 'gary', 'Helix Aspersa', '2005-01-01'),
	(default, '2', 'estrela do mar', 'patrick', 'Paxillosida ', '2002-01-01'),
	(default, '3', 'passaro', 'flash', 'Canario ', '2001-01-01'),
	(default, '3', 'lobo', 'lobinho', 'lobo-cinzento ', '2008-01-01'),
	(default, '4', 'gato', 'gato de botas', 'gato-asporthi', '2001-01-01'),
	(default, '5', 'cachorro', 'coockie', 'Shih-tzu ', '2005-01-01');
    
SELECT * FROM cliente;

SELECT * FROM pet;

ALTER TABLE cliente MODIFY COLUMN nome varchar(50);

describe cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro)
SELECT * FROM pet WHERE especie = 'caracol';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
SELECT nome, dtNasc FROM pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome
SELECT * FROM pet ORDER BY nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro
SELECT * FROM cliente ORDER BY bairro DESC;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra
SELECT * FROM pet WHERE nome like '%G%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome
SELECT * FROM cliente WHERE nome like '% Esponja';

-- Alterar o telefone de um determinado cliente
UPDATE cliente SET telCelular = '11 738942165' WHERE idCliente = 4; 

-- Exibir os dados dos clientes para verificar se alterou
SELECT * FROM cliente where idCliente = 4;

-- Exibir os dados dos pets e dos seus respectivos donos
SELECT * FROM pet
	JOIN cliente 
    ON pet.fkCliente = cliente.idCliente;
    
-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente
    SELECT * FROM pet
		JOIN cliente
        ON pet.fkCliente = cliente.idCliente
        WHERE cliente.idCliente = 3;
        
-- Excluir algum pet.
	DELETE FROM pet WHERE idPet = 102;

-- Exibir os dados dos pets para verificar se excluiu
SELECT * FROM pet;
    
-- Excluir as tabelas.
DROP TABLE pet;
DROP TABLE cliente;
DROP DATABASE pet;

-- EXERCICIO 2
CREATE DATABASE financa;
USE financa;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar (45),
dtNasc DATE,
profissao varchar(45));

CREATE TABLE gasto (
idGasto int auto_increment,
fkPessoa int,
constraint pkComposta primary key (idGasto, fkPessoa),
`data` date,
valor decimal(5,2),
descricao varchar (45),
constraint fkGastoPessoa foreign key (fkPessoa)
	references pessoa (idPessoa));
        
-- Insira dados nas tabelas.
INSERT INTO pessoa VALUES
	(default, 'Lucas', '2005-08-31', 'estudante'),
	(default, 'Pietro', '2013-02-17', 'estudante'),
	(default, 'Esdras', '1980-08-23', 'autonomo'),
	(default, 'Franciene', '1983-10-03', 'cabeleleira');

INSERT INTO gasto VALUES
	(default, 1, '2024-01-14', 59.99, 'Camiseta Nike'),
	(default, 2, '2024-04-11', 39.99, 'Bola de Futebol'),
	(default, 3, '2024-04-14', 99.99, 'Gasolina da Moto'),
	(default, 4, '2024-01-27', 89.99, 'Shampoo e condicionador'),
	(default, 3, '2024-02-14', 79.99, 'Chinelo');
    
-- Exiba os dados de cada tabela individualmente.
SELECT * FROM pessoa;
SELECT * FROM gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
SELECT * FROM pessoa WHERE profissao = 'estudante';
SELECT * FROM gasto WHERE valor > 60;
