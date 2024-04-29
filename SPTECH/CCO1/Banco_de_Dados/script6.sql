create DATABASE AlunoProjeto;
USE AlunoProjeto;

CREATE TABLE projeto (
	idProjeto INT primary key,
    nome varchar(45),
    descricao varchar(80)
    );
    
CREATE TABLE aluno (
	ra int primary key,
    nome varchar(45),
    telefone char(11),
    fkRepresentante int,
constraint fkAlunoRepresentante foreign key (fkRepresentante)
	references aluno (ra),
    fkProjeto int,
constraint fkAlunoProjeto foreign key (fkProjeto)
	references projeto(idProjeto)
    );
    
CREATE TABLE acompanhante (
	idAcompanhante int primary key,
    fkAluno int,
    nome varchar (45),
    relacao varchar (45),
    constraint fkAcompanhanteAluno foreign key (fkAluno)
		references aluno(ra)
    );

INSERT INTO projeto VALUES 
	(1, 'FlowTech', 'Projeto para medir fluxo de pessoas nas estacoes em prol de vendas publicitarias'),
    (2, 'GrapeSci', 'Projeto para medir a umidade e a temperatura em estufas de uva');
    
INSERT INTO aluno VALUES
	(34567, 'Lucas Sampaio', '11947394509', null, 1);
    
SELECT ra, nome, telefone, ifnull(fkRepresentante, 'É o representante') as representante
	FROM aluno;
	
INSERT INTO aluno VALUES
	(12345, 'Juliana', '11462849301', 34567, 2),
	(12537, 'Giorgio', '11462847691', 34567, 1);
    
INSERT INTO acompanhante VALUES
	(1, 12345, 'Marlene', 'Mãe'),
	(2, 12345, 'Julia', 'Irmã'),
	(3, 12537, 'Giorgia', 'Irmã');

SELECT * FROM projeto;
SELECT * FROM aluno;
SELECT * FROM acompanhante;

SELECT aluno.ra AS ra_aluno, aluno.nome AS nome_aluno, 
	aluno.telefone, projeto.nome AS nome_projeto, 
	projeto.descricao AS descricao_projeto
	FROM aluno
	JOIN projeto ON aluno.fkProjeto = projeto.idProjeto;

SELECT a.ra AS ra_aluno, a.nome AS nome_aluno, 
	a.telefone AS telefone_aluno, ac.nome AS nome_acompanhante, 
	ac.relacao AS relacao_acompanhante
	FROM aluno AS a
	JOIN acompanhante AS ac ON a.ra = ac.fkAluno;

SELECT a.ra AS ra_aluno, a.nome AS nome_aluno, a.telefone AS telefone_aluno, 
	r.nome AS nome_representante, r.telefone AS telefone_representante
	FROM aluno AS a
	LEFT JOIN aluno AS r ON a.fkRepresentante = r.ra;
    
SELECT aluno.ra, aluno.nome AS nome_aluno, aluno.telefone, projeto.nome AS nome_projeto, projeto.descricao AS descricao_projeto
	FROM aluno
	JOIN projeto ON aluno.fkProjeto = projeto.idProjeto
	WHERE projeto.nome = 'FlowTech';
    
SELECT a.ra AS ra_aluno, a.nome AS nome_aluno, a.telefone AS telefone_aluno,
	p.nome AS nome_projeto, p.descricao AS descricao_projeto,
	ac.nome AS nome_acompanhante, ac.relacao AS relacao_acompanhante
	FROM aluno AS a
	LEFT JOIN projeto AS p ON a.fkProjeto = p.idProjeto
	LEFT JOIN acompanhante ac ON a.ra = ac.fkAluno;
    
DROP DATABASE AlunoProjeto;
-- Exercicio 2
CREATE DATABASE campanha;
USE campanha;

CREATE TABLE organizador (
	idOrganizador int primary key auto_increment,
    nome varchar (45),
    rua varchar (45),
    bairro varchar (45),
    email varchar (45),
    fkOrientador int,
	constraint fkOrganizadorOrientador foreign key (fkOrientador)
		references organizador (idOrganizador)
    ) auto_increment = 30;

CREATE TABLE campanha (
	idCampanha int primary key auto_increment,
    categoria varchar (45),
    instituicao1 varchar (45),
    instituicao2 varchar (45),
    dtFinal date,
    fkOrganizador int,
    constraint fkOrganizadorCampanha foreign key (fkOrganizador)
		references organizador (idOrganizador)
        );
        
INSERT INTO organizador (nome, rua, bairro, email, fkOrientador) VALUES
    ('João', 'Rua A', 'Centro', 'joao@email.com', NULL), 
    ('Maria', 'Rua B', 'Bairro X', 'maria@email.com', 30), 
    ('Pedro', 'Rua C', 'Bairro Y', 'pedro@email.com', 31);
    
INSERT INTO campanha (categoria, instituicao1, instituicao2, dtFinal, fkOrganizador) VALUES
    ('Alimento', 'Instituição A', 'Instituição B', '2024-05-31', 30), 
    ('Produto de Higiene', 'Instituição C', NULL, '2024-06-15', 30),   
    ('Máscaras de Proteção', 'Instituição D', NULL, '2024-07-31', 31);

SELECT * FROM organizador;
SELECT * FROM campanha;

SELECT o.idOrganizador as ID_Organizador,
    o.nome as Nome_Organizador,
    o.rua as Rua,
    o.bairro as Bairro,
    o.email as Email,
    o.fkOrientador as ID_Organizador_Orientador,
    c.idCampanha as ID_Campanha,
    c.categoria as Categoria_Campanha,
    c.instituicao1 as Instituicao1,
    c.instituicao2 as Instituicao2,
    c.dtFinal as Data_Final_Campanha
	FROM organizador as o
	JOIN campanha as c 
    ON o.idOrganizador = c.fkOrganizador;
    
SELECT o.idOrganizador as ID_Organizador,
    o.nome as Nome_Organizador,
    o.rua as Rua,
    o.bairro as Bairro,
    o.email as Email,
    o.fkOrientador as ID_Organizador_Orientador,
    c.idCampanha as ID_Campanha,
    c.categoria as Categoria_Campanha,
    c.instituicao1 as Instituicao1,
    c.instituicao2 as Instituicao2,
    c.dtFinal as Data_Final_Campanha
	FROM organizador as o
	JOIN campanha as c 
    ON o.idOrganizador = c.fkOrganizador
    WHERE o.nome = 'João';
    
SELECT novato.idOrganizador as ID_Organizador_Novato,
    novato.nome as Nome_Organizador_Novato,
    novato.rua as Rua_Novato,
    novato.bairro as Bairro_Novato,
    novato.email as Email_Novato,
    novato.fkOrientador as ID_Organizador_Orientador,
    orientador.nome as Nome_Organizador_Orientador,
    orientador.rua as Rua_Orientador,
    orientador.bairro as Bairro_Orientador,
    orientador.email as Email_Orientador
	FROM organizador as novato
	JOIN organizador as orientador 
    ON novato.fkOrientador = orientador.idOrganizador;

SELECT novato.idOrganizador as ID_Organizador_Novato,
    novato.nome as Nome_Organizador_Novato,
    novato.rua as Rua_Novato,
    novato.bairro as Bairro_Novato,
    novato.email as Email_Novato,
    novato.fkOrientador as ID_Organizador_Orientador,
    orientador.nome as Nome_Organizador_Orientador,
    orientador.rua as Rua_Orientador,
    orientador.bairro as Bairro_Orientador,
    orientador.email as Email_Orientador
	FROM organizador as novato
	JOIN organizador as orientador 
    ON novato.fkOrientador = orientador.idOrganizador
	WHERE orientador.nome = 'Maria';
    
SELECT novato.idOrganizador as ID_Organizador_Novato,
    novato.nome as Nome_Organizador_Novato,
    novato.rua as Rua_Novato,
    novato.bairro as Bairro_Novato,
    novato.email as Email_Novato,
    novato.fkOrientador as ID_Organizador_Orientador,
    orientador.nome as Nome_Organizador_Orientador,
    orientador.rua as Rua_Orientador,
    orientador.bairro as Bairro_Orientador,
    orientador.email as Email_Orientador,
    campanha.idCampanha as ID_Campanha,
    campanha.categoria as Categoria_Campanha,
    campanha.instituicao1 as Instituicao1,
    campanha.instituicao2 as Instituicao2,
    campanha.dtFinal as Data_Final_Campanha
	FROM organizador as novato
	JOIN organizador as orientador 
    ON novato.fkOrientador = orientador.idOrganizador
	JOIN campanha ON novato.idOrganizador = campanha.fkOrganizador;
    
SELECT novato.idOrganizador as ID_Organizador_Novato,
    novato.nome as Nome_Organizador_Novato,
    novato.rua as Rua_Novato,
    novato.bairro as Bairro_Novato,
    novato.email as Email_Novato,
    novato.fkOrientador as ID_Organizador_Orientador,
    orientador.nome as Nome_Organizador_Orientador,
    orientador.rua as Rua_Orientador,
    orientador.bairro as Bairro_Orientador,
    orientador.email as Email_Orientador,
    campanha.idCampanha as ID_Campanha,
    campanha.categoria as Categoria_Campanha,
    campanha.instituicao1 as Instituicao1,
    campanha.instituicao2 as Instituicao2,
    campanha.dtFinal as Data_Final_Campanha
	FROM organizador as novato
	JOIN organizador as orientador
    ON novato.fkOrientador = orientador.idOrganizador
	JOIN campanha ON novato.idOrganizador = campanha.fkOrganizador
	WHERE novato.nome = 'Maria';

