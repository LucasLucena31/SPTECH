-- EXERCICIO 1
CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

CREATE TABLE projeto(
	idProjeto int primary key auto_increment,
    nome varchar (45),
    descricao varchar (45));
    

CREATE TABLE aluno (
	RA int primary key auto_increment,
    nome varchar (45),
    telefone char(11),
    fkProjeto int,
    fkRepresentante int,
    constraint fkAlunoProjeto foreign key (fkProjeto)
		references projeto(idProjeto),
	constraint fkAlunoRepresentante foreign key (fkRepresentante)
		references aluno(RA));
        
INSERT INTO projeto (nome, descricao) VALUES 
	('FlowTech', 'Monitoramento de fluxo na linha amarela'),
    ('FrozenMeat', 'Monitoramento de temperatura em frigorificos'),
    ('GrapeSci', 'Monitoramento de temperatura de uva');
    
INSERT INTO aluno (nome, telefone) VALUES
	('Lucas', '11947395409'),
	('Juliana', '11947395408'),
	('Nicolas', '11947395407'),
	('Nagasse', '11947395406'),
	('Bruno', '11947395405');

SELECT * FROM projeto;
SELECT * FROM aluno;

UPDATE aluno SET fkProjeto = 1, fkRepresentante = 1 where RA = 1;
UPDATE aluno SET fkProjeto = 1, fkRepresentante = 1 where RA = 2;
UPDATE aluno SET fkProjeto = 2, fkRepresentante = 2 where RA = 3;
UPDATE aluno SET fkProjeto = 2, fkRepresentante = 2 where RA = 4;
UPDATE aluno SET fkProjeto = 3, fkRepresentante = 2 where RA = 5;

SELECT a.RA as 'RA do Aluno',
		a.nome as NomeAluno,
        a.telefone as TelefoneAluno,
        p.idProjeto as 'ID do projeto',
        p.nome as 'Nome do Projeto',
        p.descricao as 'Descricao do Projeto'
        FROM aluno as a 
			JOIN projeto as p
            ON a.fkProjeto = p.idProjeto;

SELECT a.RA as 'RA do Aluno',
		a.nome as NomeAluno,
        a.telefone as TelefoneAluno,
        r.RA as 'RA do Representante',
        r.nome as NomeRepresentante,
        r.telefone as 'Telefone do Aluno'
		FROM aluno as a 
			JOIN aluno as r
            ON a.fkRepresentante = r.RA;

-- PESQUISA DO PROJETO GRAPESCI 
SELECT a.RA as 'RA do Aluno',
		a.nome as NomeAluno,
        a.telefone as TelefoneAluno,
        p.idProjeto as 'ID do projeto',
        p.nome as 'Nome do Projeto',
        p.descricao as 'Descricao do Projeto'
        FROM aluno as a 
			JOIN projeto as p
            ON a.fkProjeto = p.idProjeto 
            WHERE p.idProjeto = 3;


-- EXERCICIO 2
CREATE DATABASE Campanha;
USE Campanha;

create table organizador (
	idOrganizador int primary key auto_increment,
    nome varchar(45),
    endereco varchar(80),
    email varchar(45),
    fkOrganizador int,
    constraint fkOrganizadorOrganizador foreign key (fkOrganizador)
		references organizador(idOrganizador)) auto_increment = 30;

create table campanha (
	idCampanha int primary key auto_increment,
    categoria varchar(45),
    instituicao1 varchar(45),
    instituicao2 varchar(45),
    dtFinal date,
    fkOrganizador int,
    constraint fkOrganizadorCampanha foreign key (fkOrganizador)
		references organizador(idOrganizador)) auto_increment = 500;
        
INSERT INTO organizador (nome, endereco, email) VALUES
	('Lucas', 'Rua Antonio Soares Pais, Guaianases', 'lucas@gmail.com'),
	('Pietro', 'Rua Antonio Soares Avós, Goianases', 'Pietro@gmail.com'),
	('Theodor', 'Rua Antonio Soares Filhos, Guaiarena', 'theodor@gmail.com');
    
INSERT INTO campanha (categoria, instituicao1, instituicao2, dtFinal) VALUES
	('alimento', 'Crianca Esperanca', 'Reserva Azul', '2024-04-08'),
	('produto de higiene', 'Casa Cheia', 'H&P', '2024-04-15'),
	('roupa', 'Grande Casaco', 'Abrigados', '2024-04-10'),
	('eletronicos', 'NewTech', '404', '2024-04-21');
    
UPDATE organizador SET fkOrganizador = 30 WHERE idOrganizador = 31;
UPDATE organizador SET fkOrganizador = 30 WHERE idOrganizador = 32;

UPDATE campanha SET fkOrganizador = 30 WHERE idCampanha = 500;
UPDATE campanha SET fkOrganizador = 31 WHERE idCampanha = 501;
UPDATE campanha SET fkOrganizador = 30 WHERE idCampanha = 502;
UPDATE campanha SET fkOrganizador = 32 WHERE idCampanha = 503;

select * from organizador;
select * from campanha;

SELECT  o.idOrganizador as 'Id do organizador',
		o.nome as 'Nome do organizador', 
        o.endereco as 'Endereço do organizador',
        o.email as 'Email do organizador',
        c.idCampanha as 'Id da campanha',
        c.instituicao1 as 'Instituição beneficiaria 1',
        c.instituicao2 as 'Instituição beneficiaria 2',
        c.dtFinal as 'Data Final da campanha'
        FROM organizador as o 
        JOIN campanha as c
        ON c.fkOrganizador = o.idOrganizador;
        
SELECT  o.idOrganizador as 'Id do organizador',
		o.nome as 'Nome do organizador', 
        o.endereco as 'Endereço do organizador',
        o.email as 'Email do organizador',
        c.idCampanha as 'Id da campanha',
        c.instituicao1 as 'Instituição beneficiaria 1',
        c.instituicao2 as 'Instituição beneficiaria 2',
        c.dtFinal as 'Data Final da campanha'
        FROM organizador as o 
        JOIN campanha as c
        ON c.fkOrganizador = o.idOrganizador
        WHERE idOrganizador = 30;
        
SELECT  novato.idOrganizador as 'Id do organizador novato',
		novato.nome as 'Nome do organizador novato', 
        novato.endereco as 'Endereço do organizador novato',
        novato.email as 'Email do organizador novato',
        orientador.idOrganizador as 'Id do organizador orientador',
		orientador.nome as 'Nome do organizador orientador', 
        orientador.endereco as 'Endereço do organizador orientador',
        orientador.email as 'Email do organizador orientador'
        FROM organizador as novato 
        JOIN organizador as orientador
        ON novato.fkOrganizador = orientador.idOrganizador;
        
SELECT  novato.idOrganizador as 'Id do organizador novato',
		novato.nome as 'Nome do organizador novato', 
        novato.endereco as 'Endereço do organizador novato',
        novato.email as 'Email do organizador novato',
        orientador.idOrganizador as 'Id do organizador orientador',
		orientador.nome as 'Nome do organizador orientador', 
        orientador.endereco as 'Endereço do organizador orientador',
        orientador.email as 'Email do organizador orientador'
        FROM organizador as novato 
        JOIN organizador as orientador
        ON novato.fkOrganizador = orientador.idOrganizador
        WHERE orientador.idOrganizador = 30;
        
SELECT  novato.idOrganizador as 'Id do organizador novato',
		novato.nome as 'Nome do organizador novato', 
        novato.endereco as 'Endereço do organizador novato',
        novato.email as 'Email do organizador novato',
        orientador.idOrganizador as 'Id do organizador orientador',
		orientador.nome as 'Nome do organizador orientador', 
        orientador.endereco as 'Endereço do organizador orientador',
        orientador.email as 'Email do organizador orientador',
        c.idCampanha as 'Id da campanha',
        c.instituicao1 as 'Instituição beneficiaria 1',
        c.instituicao2 as 'Instituição beneficiaria 2',
        c.dtFinal as 'Data Final da campanha'
        FROM organizador as novato 
        JOIN organizador as orientador
        ON novato.fkOrganizador = orientador.idOrganizador
        JOIN campanha as c
        ON c.fkOrganizador = novato.idOrganizador
        WHERE orientador.idOrganizador = 30;
        

	