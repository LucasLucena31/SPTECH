create database pratica;
use pratica;

create table dono (
	idDono int primary key auto_increment,
    nome varchar(45)
    );
    
create table pet (
	idPet int primary key auto_increment,
    nome varchar (45),
    fkMae int,
    fkDono int,
    constraint fkMaePet foreign key (fkMae)
		references pet (idPet),
	constraint fkPetDono foreign key (fkDono)
		references dono (idDono)
        );
        
INSERT INTO dono (nome) VALUES 
('Lucas'), 
('Pietro'), 
('Esdras'), 
('Franciene');

INSERT INTO pet (nome, fkDono) VALUES
('Zack', 1),
('Luck', 2),
('Lolla', 4),
('Gigi', 1);

UPDATE pet SET fkMae = 3 WHERE idPet = 1;
UPDATE pet SET fkMae = 4 WHERE idPet = 2;

SELECT p.nome as "Nome Pet",
		mae.nome as "Mãe do Pet",
        d.nome as "Dono do Pet"
        FROM pet as p
        JOIN pet as mae
        ON p.fkMae = mae.idPet
        JOIN dono as d 
        ON p.fkDono = d.idDono;
        
CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
	nome varchar (45)
    );
    
CREATE TABLE funcionario (
	idFuncionario int primary key auto_increment,
    nome varchar (45),
    fkEmpresa int,
    fkSupervisor int,
    constraint fkFuncionarioEmpresa foreign key (fkEmpresa)
		references empresa (idEmpresa),
	constraint fkFuncionarioSupervisor foreign key (fkSupervisor)
		references funcionario (idFuncionario)
        );
        
INSERT INTO empresa (nome) VALUES
('Amazon'),
('Google'),
('IFood'),
('LATAM');

INSERT INTO funcionario (nome, fkEmpresa) VALUES 
('Junior', 1),
('Flavio', 2),
('Pablo', 3),
('Talita', 3),
('Alice', 4);
    
UPDATE funcionario SET fkSupervisor = 5 where idFuncionario = 1;
UPDATE funcionario SET fkSupervisor = 5 where idFuncionario = 2;
UPDATE funcionario SET fkSupervisor = 4 where idFuncionario = 3;

SELECT * FROM funcionario;

SELECT f.nome as "Nome Funcionario",
		sup.nome as "Nome Supervisor",
        e.nome as "Nome Empresa"
        FROM funcionario as f 
        JOIN funcionario as sup
        ON f.fkSupervisor = sup.idFuncionario
        JOIN empresa as e
        ON f.fkEmpresa = e.idEmpresa;
        

CREATE TABLE endereco (
	idEndereco int primary key auto_increment,
    logradouro varchar (80),
    CEP char (8)
    );
    
CREATE TABLE pessoa (
	idPessoa int primary key auto_increment,
    nome varchar (45),
    fkSombra int,
    fkEndereco int,
    constraint fkPessoaSombra foreign key (fkSombra)
		references pessoa (idPessoa),
	constraint fkPessoaEndereco foreign key (fkEndereco)
		references endereco (idEndereco)
        );

INSERT INTO endereco (logradouro, CEP) VALUES
	('Rua Generica, 123', '89023489'),
	('Rua Rei Davi, 39', '89023489'),
	('Rua Salmos, 23', '89023489'),
	('Rua Alameda Campos, 178', '89023489');
    
INSERT INTO pessoa (nome, fkEndereco) VALUES
	('Lucas', 3),
	('Pietro', 4),
	('Franciene', 1),
	('Esdras', 2);
    
UPDATE pessoa SET fkSombra = 1 WHERE idPessoa = 1;
UPDATE pessoa SET fkSombra = 2 WHERE idPessoa = 2;
UPDATE pessoa SET fkSombra = 3 WHERE idPessoa = 3;
UPDATE pessoa SET fkSombra = 4 WHERE idPessoa = 4;

SELECT * FROM pessoa;

SELECT p.nome as "Nome da Pessoa",
		s.nome as "Sua sombra pertence a:",
        e.logradouro as "Logradouro",
        e.CEP as "CEP"
        FROM pessoa as p
        JOIN pessoa as s
        ON p.fkSombra = s.idPessoa
        JOIN endereco as e
        ON p.fkEndereco = e.idEndereco;
	