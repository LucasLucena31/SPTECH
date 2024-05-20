create DATABASE sprints;
USE sprints;

CREATE TABLE grupo (
	idGrupo int primary key auto_increment,
    nome varchar (45),
    descricao_projeto varchar(80)
    );
    
CREATE TABLE aluno (
	RA int primary key,
    fkGrupo int,
    nome varchar (45),
    email varchar (45),
constraint fkGrupoAluno foreign key (fkGrupo)
	references grupo (idGrupo)
    );
    
CREATE TABLE professor (
	idProfessor int primary key auto_increment,
    nome varchar (45),
    disciplina varchar (45)
    ) auto_increment = 10000;
    
CREATE TABLE avalia (
	fkGrupo int,
    fkProfessor1 int,
    fkProfessor2 int,
    dtAvaliacao datetime,
    nota int,
constraint fkProfessor1Avalia foreign key (fkProfessor1)
	references professor (idProfessor),
constraint fkProfessor2Avalia foreign key (fkProfessor2)
	references professor (idProfessor),
constraint fkComposta primary key (fkGrupo, fkProfessor1, fkProfessor2)
    );
    

INSERT INTO grupo (nome, descricao_projeto) VALUES 
('FlowTech', 'Projeto de mensuração de fluxo no metro'),
('GrapeSci', 'Projeto de mensuração de temperatura em talhões de uva');

INSERT INTO aluno (RA, fkGrupo, nome, email) VALUES 
(12345, 1, 'Lucas Sampaio', 'lucas@sampaio.com'),
(23456, 1, 'Giorgio', 'giorgio@lordi.com'),
(34567, 2, 'Juliana', 'juliana@freires.com'),
(45678, 2, 'Guilherme', 'guilherme@presili.com');

INSERT INTO professor (nome, disciplina) VALUES 
('Brandão', 'Pesquisa e Inovação'),
('Julia', 'Pesquisa e Inovação');

INSERT INTO avalia (fkGrupo, fkProfessor1, fkProfessor2, dtAvaliacao, nota) VALUES 
(1, 10000, 10001, '2024-04-17 14:30:00', 10),
(2, 10000, 10001, '2024-04-10 12:00:00', 8);

SELECT * FROM grupo;
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM avalia;

SELECT * FROM grupo JOIN aluno 
			ON idGrupo = fkgrupo
            WHERE idGrupo = 2;
            
SELECT avg(nota) FROM avalia;

SELECT min(nota) FROM avalia;
SELECT max(nota) FROM avalia;

SELECT SUM(nota) FROM avalia;

SELECT * FROM avalia as a JOIN professor as p1
			ON p1.idProfessor = a.fkProfessor1
            JOIN professor as p2 
            ON p2.idProfessor = a.fkProfessor2
            JOIN grupo 
            ON idGrupo = a.fkGrupo;
            
SELECT * FROM avalia as a JOIN professor as p1
			ON p1.idProfessor = a.fkProfessor1
            JOIN professor as p2 
            ON p2.idProfessor = a.fkProfessor2
            JOIN grupo 
            ON idGrupo = a.fkGrupo
            WHERE idGrupo = 2;
            
SELECT nome FROM grupo JOIN avalia
			ON idGrupo = fkGrupo
            WHERE fkProfessor1 = 10000 OR fkProfessor2 = 10000;


SELECT * FROM avalia as a JOIN professor as p1
			ON p1.idProfessor = a.fkProfessor1
            JOIN professor as p2 
            ON p2.idProfessor = a.fkProfessor2
            JOIN grupo 
            ON idGrupo = a.fkGrupo
            JOIN aluno
            ON idGrupo = aluno.fkGrupo;
            
SELECT DISTINCT nota FROM avalia;

SELECT fkProfessor1, fkProfessor2, avg(nota), sum(nota) FROM avalia
				JOIN professor as p1
                ON fkProfessor1 = p1.idProfessor
                JOIN professor as p2
                ON fkProfessor2 = p2.idProfessor
                GROUP BY fkProfessor1, fkProfessor2;
                
SELECT fkGrupo, avg(nota), sum(nota) FROM avalia
				JOIN grupo 
                ON fkGrupo = idGrupo
                GROUP BY fkGrupo;
                
SELECT fkProfessor1, fkProfessor2, min(nota), max(nota) FROM avalia
				JOIN professor as p1
                ON fkProfessor1 = p1.idProfessor
                JOIN professor as p2
                ON fkProfessor2 = p2.idProfessor
                GROUP BY fkProfessor1, fkProfessor2;
                
SELECT fkGrupo, min(nota), max(nota) FROM avalia
				JOIN grupo 
                ON fkGrupo = idGrupo
                GROUP BY fkGrupo;
                
