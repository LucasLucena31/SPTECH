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

-- Exiba os dados das pessoas e dos seus gastos correspondentes
select * from pessoa 
	JOIN gasto 
    ON fkPessoa = idPessoa;
    
-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from pessoa 
	JOIN gasto 
    ON idPessoa = fkPessoa
    WHERE idPessoa = 3;
    
-- Atualize valores já inseridos na tabela.
UPDATE gasto SET valor = 60 where idGasto = 1;
UPDATE gasto SET valor = 40 where idGasto = 2;
UPDATE gasto SET valor = 100 where idGasto = 3;
UPDATE gasto SET valor = 90 where idGasto = 4;
UPDATE gasto SET valor = 80 where idGasto = 5;

-- Exclua um ou mais registros de alguma tabela.
DELETE FROM gasto where idGasto = 3;

-- EXERCICIO 3
-- Criar um banco de dados chamado PraticaFuncionario.
CREATE DATABASE PraticaFuncionario;
USE PraticaFuncionario;


CREATE TABLE setor (
idSetor int primary key auto_increment,
nome varchar (45),
andar int 
);

CREATE TABLE funcionario (
idFuncionario int primary key auto_increment,
nome varchar (45),
telefone varchar (45),
salario decimal (7,2),
fkSetor int,
constraint fkSetorFunc foreign key (fkSetor)
	references setor (idSetor)
);

CREATE TABLE acompanhante (
 idAcompanhante int,
 fkFuncionario int,
 nome varchar(45), 
 relacao_funcionario varchar (45),
 dtNasc date,
 constraint pk_composta primary key (idAcompanhante, fkFuncionario),
 constraint fkFuncAcomp foreign key (fkFuncionario)
	references funcionario (idFuncionario)
);

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
INSERT INTO setor VALUES
	(default, 'Marketing', 3),
	(default, 'TI', 4),
	(default, 'SAC', 5);

INSERT INTO funcionario VALUES
	(default, 'Lucas', '11 985674258', '10000.00', 1),
	(default, 'Juliana', '11 985674754', '8000.00', 2),
	(default, 'Ilys', '11 985677458', '100.00', 2),
	(default, 'Ivan', '11 985202258', '7000.00', 3),
	(default, 'Giorgio', '11 978374258', '20.00', 3);

INSERT INTO acompanhante VALUES 
	(1, 1, 'Pietro', 'irmão', '2013-02-17'),
	(2, 1, 'Theodor', 'cachorro', '2019-01-06'),
	(1, 2, 'Laura', 'mãe', '1980-07-12'),
	(1, 3, 'Andrezza', 'irmã', '2005-06-28');

-- Exibir todos os dados de cada tabela criada, separadamente
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação

-- - Exibir os dados dos setores e dos seus respectivos funcionários
SELECT * FROM setor
	JOIN funcionario 
    ON fkSetor = idSetor;
    
-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
SELECT * FROM setor
	JOIN funcionario 
    ON fkSetor = idSetor
    Where idSetor = 2;
    
-- Exibir os dados dos funcionários e de seus acompanhantes.
SELECT * FROM acompanhante
	JOIN funcionario
    ON idFuncionario = fkFuncionario;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
SELECT funcionario.nome as NomeFuncionario,
		acompanhante.nome as NomeAcompanhante
        FROM funcionario
		JOIN acompanhante 
		ON fkFuncionario = idFuncionario
        WHERE funcionario.idFuncionario = 2; 

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes
    SELECT * FROM funcionario
		JOIN acompanhante 
        ON funcionario.idFuncionario = acompanhante.fkFuncionario
        JOIN setor
        ON fkSetor = idSetor;
        
-- EXERCICIO 4 
-- Criar um banco de dados chamado Treinador
CREATE DATABASE Treinador;

-- Selecionar esse banco de dados
USE Treinador;

--  Criar as tabelas correspondentes à sua modelagem.
create table treinador (
idTreinador int primary key auto_increment,
nome varchar (45),
telefone varchar(45),
email varchar (45),
fkOrientador int,
constraint fkOrientador foreign key (fkOrientador)
	references treinador (idTreinador)
    ) auto_increment = 10;
    
create table nadador (
idNadador int primary key auto_increment,
nome varchar(45),
estado_origem varchar (45),
dtNasc date,
fkTreinador int,
constraint fkTreinador foreign key (fkTreinador)
	references treinador (IdTreinador)
) auto_increment = 100;

-- Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.
INSERT INTO treinador VALUES 
(default, 'bob', '1845675201', 'bob@gmail.com', null); 

INSERT INTO treinador VALUES 
(default, 'patrick', '1844745201', 'patrick@gmail.com', 10),
(default, 'luiz', '1845696801', 'luiz@gmail.com', 10);

INSERT INTO nadador VALUES 
(default, 'leonardo', 'São Paulo', '2005-02-01', 10),
(default, 'leticia', 'Amazonas', '2008-07-10', 11),
(default, 'raine', 'Rio de Janeiro', '2003-10-11', 12),
(default, 'ana', 'São Paulo', '2002-09-29', 10);

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM treinador;
SELECT * FROM nadador;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores
SELECT * FROM treinador 
	JOIN nadador
    ON fkTreinador = idTreinador;
    
-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
SELECT treinador.nome as NomeTreinador,
		nadador.nome as NomeNadador,
        nadador.estado_origem
        FROM treinador JOIN nadador
        ON fkTreinador = idTreinador
        WHERE idTreinador = 10;
        
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
SELECT treinador.nome as NomeTreinador,
		orientador.nome as NomeOrientador
        FROM treinador JOIN treinador as orientador
        ON treinador.fkOrientador = orientador.idTreinador;
        
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta)
SELECT treinador.nome as NomeTreinador,
		orientador.nome as NomeOrientador
        FROM treinador JOIN treinador as orientador
        ON treinador.fkOrientador = orientador.idTreinador
        where treinador.fkOrientador = 10;

-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
SELECT * FROM treinador JOIN treinador as orientador
        ON treinador.fkOrientador = orientador.idTreinador
        JOIN nadador ON nadador.fkTreinador = treinador.idTreinador;
        
-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador
SELECT * FROM treinador JOIN treinador as orientador
        ON treinador.fkOrientador = orientador.idTreinador
        JOIN nadador ON nadador.fkTreinador = treinador.idTreinador
        WHERE treinador.idTreinador = 11;