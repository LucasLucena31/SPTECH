use ccoa;

SHOW TABLES;

SELECT * FROM aluno;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar (60) not null,
responsavel varchar(100),
area varchar(50),
constraint chkArea check (area in ('Marketing', 'TI'))
);

INSERT INTO empresa (nome, area) VALUES
	('C6 Bank', 'TI');
    
DESCRIBE empresa;
SELECT * FROM empresa;

-- DEFAULT
INSERT INTO empresa VALUES
(default, 'SAFRA', null, 'Marketing');

ALTER TABLE empresa MODIFY COLUMN responsavel varchar(100) not null default 'sem responsa';

UPDATE empresa SET responsavel = 'Joaca'
WHERE idEmpresa = 1;

UPDATE empresa SET responsavel = 'Mário'
WHERE idEmpresa = 2;

INSERT INTO empresa (nome, responsavel) VALUES
('STEFANINI', default);

SELECT * FROM empresa;

SELECT nome, responsavel FROM empresa;

-- ALIAS - APELIDO
SELECT nome AS 'Nome da Empresa',
	responsavel AS 'Responsável'
		FROM empresa;

SELECT concat(nome, responsavel) FROM empresa;
SELECT concat(nome, ' ' responsavel) FROM empresa;
SELECT concat('O nome da empresa é ', nome, ' e o responsa é ', responsavel) AS Frase FROM empresa;

ALTER TABLE empresa ADD COLUMN dtAdmissao date;

DESCRIBE empresa;

UPDATE empresa SET dtAdmissao = '2024-02-23'
WHERE idEmpresa = 2;

SELECT * FROM empresa;

SELECT responsavel, dtAdmissao FROM empresa;

SELECT responsavel,
	date_format(dtAdmissao, '%d/%m/%y')
    FROM empresa;
    
SELECT responsavel AS Responsa,
	date_format(dtAdmissao, '%D %M %Y') AS 'Data de admissão: '
    FROM empresa ;