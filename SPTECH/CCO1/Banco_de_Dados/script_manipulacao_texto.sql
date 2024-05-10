CREATE DATABASE aula13;
USE aula13;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar (45));

INSERT INTO usuario VALUES
	(default, 'Nemo'),
	(null, 'Dory');
    
CREATE TABLE termo (
idTermo int auto_increment,
fkUsuario int unique, -- 1:1
primary key (idTermo, fkUsuario),
dtTermo date,
foreign key (fkUsuario) references usuario(idUsuario));

INSERT INTO termo VALUES
	(default, 1, '2024-05-03'),
	(default, 2, '2024-05-03');
    
SELECT * FROM termo;

SELECT * FROM usuario JOIN termo
		ON idUsuario = fkUsuario;
        
-- Medico x Paciente;
CREATE TABLE paciente (
idPaciente int primary key auto_increment,
nome varchar(45)) auto_increment = 1000;

INSERT INTO paciente (nome) VALUES
	('Julia'),
	('Sarah'),
	('Giorgio');
    
CREATE TABLE medico (
idMedico int primary key auto_increment,
nome varchar (45)) auto_increment = 10;

INSERT INTO medico (nome) values 
	('Dra. Marise'),
	('Dra. Thiago'),
	('Dra. Brandão');
    
-- CRIAR A TABELA ASSOCIATIVA 
CREATE TABLE consulta (
idConsulta int,
fkPaciente int,
fkMedico int,
primary key (idConsulta, fkMedico, fkPaciente),
dtConsulta datetime,
valor decimal(5,2),
foreign key (fkPaciente) references paciente(idPaciente),
foreign key (fkMedico) references medico(idMedico));

SELECT * FROM medico;
SELECT * FROM paciente;

INSERT INTO consulta VALUES
	(1, 1000, 10, '2024-05-02 08:00', 1.99),
	(1, 1001, 10, '2024-05-02 09:00', 1.99),
	(1, 1000, 11, '2024-05-02 09:00', 2.99),
	(1, 1001, 11, '2024-05-02 10:00', 2.99),
	(2, 1001, 11, '2024-05-10 10:00', 0);
    
SELECT * FROM consulta;

SELECT * FROM paciente JOIN consulta
			ON idPaciente = fkPaciente
            JOIN medico
            ON idMedico = fkMedico;
    
SELECT * FROM paciente LEFT JOIN consulta
			ON idPaciente = fkPaciente
            LEFT JOIN medico
            ON idMedico = fkMedico
UNION
SELECT * FROM paciente RIGHT JOIN consulta
			ON idPaciente = fkPaciente
            RIGHT JOIN medico
            ON idMedico = fkMedico;
            
SELECT * FROM paciente LEFT JOIN consulta
			ON idPaciente = fkPaciente
            LEFT JOIN medico
            ON idMedico = fkMedico
            WHERE fkPaciente is null
UNION
SELECT * FROM paciente RIGHT JOIN consulta
			ON idPaciente = fkPaciente
            RIGHT JOIN medico
            ON idMedico = fkMedico
            WHERE fkPaciente is null;
            
            
            
            
SELECT paciente.nome FROM paciente LEFT JOIN consulta
			ON idPaciente = fkPaciente
            LEFT JOIN medico
            ON idMedico = fkMedico
            WHERE fkPaciente is null
UNION
SELECT ifnull(paciente.nome, 'Livre') Paciente,
		ifnull(medico.nome, 'Disponível') Medico
			FROM paciente RIGHT JOIN consulta
			ON idPaciente = fkPaciente
            RIGHT JOIN medico
            ON idMedico = fkMedico
            WHERE fkPaciente is null;
            

-- FUNCOES MATEMATICAS
SELECT COUNT(*) FROM consulta;
SELECT COUNT(idConsulta) FROM consulta;

-- valores diferentes
SELECT distinct valor FROM CONSULTA;

-- A consulta mais cara
SELECT max(valor) FROM consulta;

-- A consulta mais barata
SELECT min(valor) FROM consulta;

-- SOMAR
select sum(valor) FROM consulta;

-- Média 
SELECT avg(valor) FROM consulta;

SELECT round(avg(valor), 2) FROM consulta;
SELECT truncate(avg(valor), 2) from consulta;

UPDATE consulta SET valor = 1.17
	WHERE idCOnsulta = 2 and fkPaciente = 1001
    and fkMedico = 11;

SELECT idConsulta from consulta
	where valor >= (select avg(valor) FROM consulta);
    
SELECT dtConsulta, count(fkMedico) FROM consulta
	GROUP BY dtConsulta;
    
SELECT timestampdiff(day, dtConsulta, now()) FROM consulta;

-- SELECT timestampdiff(year, dytNasc, now()) FROM usuario;