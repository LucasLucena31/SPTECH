CREATE DATABASE aula10;
USE aula10;

CREATE TABLE dono (
idDono int primary key auto_increment,
nome varchar (45),
dtNasc date);

INSERT INTO dono VALUES 
	(default, 'Joaquina', '1978-01-01');
    
SELECT * FROM dono;

CREATE TABLE pet (
idPet int primary key auto_increment,
nome varchar(45),
fkDono int, -- idDono
fkMae int, -- idPet
constraint fkDonoPet foreign key (fkDono)
	references dono (idDono),
constraint fkFilhoMae foreign key (fkMae)
	references pet (idPet) 
) auto_increment = 100;

INSERT INTO pet VALUES 
	(default, 'Jhey', 1, null);
    
SELECT * FROM pet;

INSERT INTO pet VALUES
 (default, 'Jony', 1, 100);
 
 SELECT * FROM pet JOIN dono
	ON idDono = fkDono;
    
SELECT * FROM pet JOIN pet as mae
	on pet.fkmae = mae.idPet;
    
SELECT pet.nome as NomePet,
	mae.nome as NomeMae
    FROM pet JOIN pet as mae
    ON pet.fkMae = mae.idPet;
    
SELECT pet.nome as NomePet,
	mae.nome as NomeMae,
    dono.nome as NomeDono
    FROM pet JOIN pet as mae
    ON pet.fkMae = mae.idPet
    JOIN dono 
    ON pet.fkDono = idDono;
    
    -- EXERCICIO SOMBRA X PESSOA X ENDEREÇO
    
CREATE TABLE endereco (
idEnd int primary key auto_increment,
cep char (9),
numEnd varchar (45),
complemento varchar (45));

INSERT INTO endereco VALUES
	(default, '01414-905', '595', '11º andar'),
	(default, '01414-905', '595', '12º andar');
    
SELECT * FROM endereco;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar (45),
fkSombra int unique,
fkEnd int unique,
constraint fkSombraPessoa foreign key (fkSombra)
    references pessoa (idPessoa),
constraint fkEndPessoa foreign key (fkEnd)
	references endereco(idEnd));
    
INSERT INTO pessoa VALUES
	(default, 'Picapau', 1, 2),
    (default, 'Bob Esponja', 2, 1);
    
SELECT * FROM pessoa;

SELECT * FROM pessoa JOIN endereco
	ON idEnd = fkEnd;
    
SELECT * FROM pessoa JOIN pessoa as sombra
	ON pessoa.fkSombra = sombra.idPessoa;
    
SELECT pessoa.nome as NomePessoa,
	sombra.nome as NomeSombra,
    complemento
    FROM pessoa JOIN pessoa as sombra
		ON pessoa.fkSombra = sombra.idPessoa
        JOIN endereco
        ON idEnd = pessoa.fkEnd;
        
/* TIPOS DE ATRIBUTOS
-- ATRIBUTO IDENTIFICADOR: PK
-- ATRIBUTO DERIVADO: IDADE - DTNASC
-- ATRIBUTO SIMPLES: BAIRRO, GENERO
-- ATRIBUTO COMPOSTO: ENDERECO
-- -- CEP/NUMERO/COMPLEMENTO API DOS CORREIOS
-- -- DEVE SER DIVIDIDO EM SUBPARTES DIFERENTES
-- -- TELEFONE: DDI DDD PREFIXO SUFIXO
-- -- EMAIL: USERNAME DOMINIO
-- ATRIBUTO MONOVALORADO (Só um valor)
-- ATRIBUTO MULTIVALORADO
-- -- TELEFONE: TELEFONE CELULAR E O TELEFONE FIXO
*/

-- Exercício Funcionário x Dependentes
CREATE TABLE funcionario (
idFunc int primary key auto_increment, -- atributo identificador
nome varchar(45), -- atributo simples
cep char(9), -- cep + numEnd + complemento = atributo composto
numEnd varchar(45),
complemento varchar(45),
telCelular varchar(45), -- telCelular + telFixo = atributo multivalorado
telFixo varchar(45)
) auto_increment = 100;

INSERT INTO funcionario VALUES
	(default, 'Papai Smurf', '01414-905', '595', '1º andar', '11 987654321', '11 34567890'),
	(default, 'João', '01414-905', '595', '2º andar', '11 987654321', '11 34567890'),
	(default, 'Edward', '01414-905', '595', '2º andar', '11 987654321', '11 34567890');

SELECT * FROM funcionario;

-- entidade fraca = pk composta (id e fk)
CREATE TABLE dependente (
idDep int,
fkFunc int,
constraint pkComposta primary key (idDep, fkFunc),
nome varchar (45),
parentesco varchar (45),
dtNasc date,
constraint fkFuncDep foreign key (fkFunc)
	references funcionario(idFunc));
    
INSERT INTO dependente VALUES
	(1, 100, 'Mamãe Smurf', 'esposa', '1976-01-01'),
	(2, 100, 'Primo Smurf', 'primo', '1989-01-01'),
	(1, 101, 'Maria', 'irmã', '1999-01-01');
	-- (3, 100, 'Filho Smurf', 'filho', '2004-01-01');
    
SELECT * FROM dependente;

SELECT * FROM dependente JOIN funcionario
	ON idFunc = fkFunc;
    
SELECT funcionario.nome as NomeFunc,
		dependente.nome as NomeDep,
        parentesco
        FROM dependente JOIN funcionario
		ON idFunc = fkFunc;
        
-- EXIBIR TODOS OS FUNCIONARIOS E SEUS DEPENDENTES, INCLUSIVE OS FUNCIONARIOS SEM DEPENDENTES
SELECT funcionario.nome as NomeFunc,
		dependente.nome as NomeDep,
        parentesco
        FROM dependente RIGHT JOIN funcionario
		ON idFunc = fkFunc;
        
SELECT funcionario.nome as NomeFunc,
		dependente.nome as NomeDep,
        parentesco
        FROM funcionario LEFT JOIN dependente
		ON idFunc = fkFunc;

SELECT funcionario.nome as NomeFunc,
		dependente.nome as NomeDep,
        parentesco
        FROM funcionario LEFT JOIN dependente
		ON idFunc = fkFunc
        WHERE fkFunc is null;
    