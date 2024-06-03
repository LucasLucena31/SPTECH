CREATE DATABASE Exercicio11;
USE Exercicio11;

CREATE TABLE Departamento (
	idDepto int primary key,
    nomeDepto varchar(80), 
    fkGerente int,
    dataInicioGer date
    );
    
CREATE TABLE Funcionario (
	idFunc int primary key,
    nomeFunc varchar (80),
    salario decimal (6,2),
    sexo varchar (45),
    fkSupervisor int, 
    dataNasc date,
    fkDepto int
    );
    

CREATE TABLE Projeto (
	idProj int primary key,
    nomeProj varchar (80),
    localProj varchar (80),
    fkDepto int
    );
    
    
CREATE TABLE FuncProj (
	fkFunc int, 
    fkProj int,
    horas decimal (3,1),
    primary key (fkFunc, FkProj)
    );
    
INSERT INTO Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer) VALUES 
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES 
(1, 'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

INSERT INTO Projeto (idProj, nomeProj, localProj, fkDepto) VALUES 
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);


INSERT INTO FuncProj (fkFunc, fkProj, horas) VALUES 
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 15.0),
(8, 20, NULL);


 ALTER TABLE Departamento ADD CONSTRAINT fkGerenteFunc 
 FOREIGN KEY (fkGerente) REFERENCES Funcionario(idFunc);
 
 ALTER TABLE Funcionario ADD CONSTRAINT fkSupervisorFunc 
 FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFunc);
 
 ALTER TABLE Funcionario ADD CONSTRAINT fkDeptoFunc 
 FOREIGN KEY (fkDepto) REFERENCES Departamento(idDepto);

 ALTER TABLE Projeto ADD CONSTRAINT fkDeptProj 
 FOREIGN KEY (fkDepto) REFERENCES Departamento(idDepto);

 ALTER TABLE FuncProj ADD CONSTRAINT fkFuncProj 
 FOREIGN KEY (fkFunc) REFERENCES Funcionario(idFunc);
 
 ALTER TABLE FuncProj ADD CONSTRAINT fkProjFunc
 FOREIGN KEY (fkProj) REFERENCES Projeto(idProj);


-- Exibir os dados de cada tabela separadamente
SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;

-- Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES 
(NULL, 'Cecília Ribeiro', 2800, 'f', NULL, '1980-04-05', 104);
-- Conseguiu inserir? Por que? 
-- Não, pois a coluna idFunc não pode ser nula uma vez que ela é uma pk


-- Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES 
(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- Conseguiu inserir? Por que? 
-- Não, pois já existe um Funcionario com o idFunc = 3 e a coluna idFunc não pode se repetir uma vez que ela é uma pk


-- Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES 
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- Conseguiu inserir? Por que? 
-- Não, pois não exite um departamento com id 107


-- Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES 
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
-- Conseguiu inserir? Por que? 
-- Sim, pois os campos estão todos coerentes


-- Excluir a tupla (registro) da tabela FuncProj, em que fkFunc=3 e fkProj = 10. 
delete from FuncProj where fkFunc = 3 and fkProj = 10;
-- Conseguiu inserir? Por que? 
-- Sim, pois o dado existe na tabela e não há nenhuma restrição que impessa a exclusão dele


--  Excluir a tupla da tabela Funcionario, em que idFunc=4. 
delete from Funcionario where idFunc = 4;
-- Conseguiu excluir? Por que? 
-- Não, pois o Funcionario com esse id está alocado em algum registro de outra tabela como uma fk


-- Excluir a tupla da tabela Funcionário, em que idFunc=2
delete from Funcionario where idFunc = 2;
-- Conseguiu excluir? Por que?
-- Não, pois o Funcionario com esse id está alocado em algum registro de outra tabela como uma fk


-- Alterar o salário do Funcionário com idFunc=3 para 2800
UPDATE Funcionario SET salario = 2800 WHERE idFunc = 3;
-- Conseguiu excluir? Por que?
-- Sim, não é um campo com alguma restrição que impessa essa alteração 


-- Alterar o fkDepto do Funcionário com idFunc=3 para 101. 
UPDATE Funcionario SET fkDepto = 101 WHERE idFunc = 3;
-- Conseguiu excluir? Por que?
-- Sim, não é um campo com alguma restrição que impessa essa alteração 


-- Alterar o fkDepto do Funcionário com idFunc=3 para 107. 
UPDATE Funcionario SET fkDepto = 107 WHERE idFunc = 3;
-- Conseguiu alterar? Por que?
-- Não, pois não exite um departamento com id 107


-- Exibir a data de nascimento e o salário do funcionário João Silva.
SELECT dataNasc, salario FROM Funcionario WHERE nomeFunc = 'Joao Silva';

-- Exibir uma lista apenas dos salários de todos os funcionários.
SELECT salario FROM Funcionario;

-- Exibir uma lista apenas dos salários distintos de todos os funcio
SELECT DISTINCT salario FROM  Funcionario;

-- Exibir os dados dos funcionários ordenados pelo nome.
SELECT * FROM Funcionario order by nomeFunc;

-- Exibir os dados dos funcionários ordenados pelo salário, de forma decrescente.
SELECT * FROM Funcionario order by salario desc;

-- Exibir os dados dos funcionários que tenham salário entre 2000 e 4000.
SELECT * FROM Funcionario WHERE salario > 2000 and salario < 4000;
SELECT * FROM Funcionario WHERE salario BETWEEN 2000 AND 4000;

-- Exibir os nomes e os salários dos funcionários cujos nomes começam com a letra ‘J’.
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc like 'J%';

-- Exibir os nomes e os salários dos funcionários cujos nomes terminam com a letra ‘a’.
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc like '%a';

-- Exibir os nomes dos funcionários que tem a letra ‘n’ como terceira letra do nome.
SELECT nomeFunc FROM Funcionario WHERE nomeFunc like '__n%';

-- Exibir os nomes e as datas de nascimento dos funcionários cujos nomes tenham a letra ‘S’ como 5ª letra de trás para frente.
SELECT nomeFunc, dataNasc FROM Funcionario WHERE nomeFunc like '%s____';

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa
SELECT * FROM Funcionario WHERE fkDepto = 105;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham salário acima de 3500.
SELECT * FROM Funcionario WHERE fkDepto = 105 and salario > 3500;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham o nome com inicial ‘J’.
SELECT * FROM Funcionario WHERE fkDepto = 105 and nomeFunc like 'J%';

-- Exibir o idFunc e o nome de cada funcionário, juntamente com o idFunc e o nome do seu supervisor. Faça com que o título da coluna seja “idFuncionario” para funcionário e “idSupervisor” para o id do supervisor.
SELECT f.idFunc as 'idFuncionario',
		f.nomeFunc,
        s.idFunc as 'idSupervisor',
        s.nomeFunc
        FROM Funcionario as f JOIN Funcionario as s 
        ON f.fkSupervisor = s.idFunc;
        
-- Exibir para cada projeto localizado em São Paulo, o idProj do projeto, o número do departamento que o controla, o nome e a data de nascimento do gerente do departamento.
SELECT p.idProj,
    p.fkDepto,
    d.nomeDepto,
    f.nomeFunc,
    f.dataNasc
	FROM Projeto as p
	JOIN Departamento d ON p.fkDepto = d.idDepto
	JOIN Funcionario f ON d.fkGerente = f.idFunc
	WHERE p.localProj = 'São Paulo';
    
-- Exibir o idFunc e o nome do funcionário, o projeto e o nome do projeto em que trabalha, e a quantidade de horas que trabalha nesse projeto.
SELECT f.idFunc,
    f.nomeFunc,
    p.idProj,
    p.nomeProj,
    fp.horas
    FROM Funcionario as f
	JOIN FuncProj as fp ON f.idFunc = fp.fkFunc
	JOIN Projeto as p ON fp.fkProj = p.idProj
	GROUP BY f.idFunc, f.nomeFunc, p.idProj, p.nomeProj;

-- Exibir os nomes dos funcionários que nasceram antes de 1980.
SELECT nomeFunc FROM Funcionario WHERE dataNasc < '1980-01-01';

-- Exibir a quantidade de salários diferentes que existem na empresa.
SELECT COUNT(DISTINCT salario) FROM Funcionario;

-- Exibir a quantidade de locais diferentes de projeto.
SELECT distinct localProj FROM projeto;

-- Exibir o salário médio da empresa e a soma dos salários.
SELECT AVG(salario) from Funcionario;
SELECT SUM(salario) from Funcionario;

-- Exibir o menor e o maior salário da empresa.
SELECT MAX(salario) from Funcionario;
SELECT MIN(salario) from Funcionario;

-- Exibir o idDepto, o salário médio e a soma do salário de cada departamento (agrupado por departamento)
SELECT d.idDepto,
    AVG(f.salario),
    SUM(f.salario)
	FROM Funcionario as f
	JOIN Departamento as d 
    ON f.fkDepto = d.idDepto
	GROUP BY d.idDepto;
    
-- Exibir o idDepto, o menor e o maior salário de cada departamento (agrupado por departamento).
SELECT d.idDepto,
    MIN(f.salario),
    MAX(f.salario)
	FROM Funcionario as f
	JOIN Departamento as d 
    ON f.fkDepto = d.idDepto
	GROUP BY d.idDepto;
    
-- Inserir mais os seguintes funcionários na tabela Funcionário:
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto)
VALUES 
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', NULL),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', NULL);

-- Inserir mais o seguinte departamento na tabela Departamento:
INSERT INTO Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer)
VALUES (110, 'RH', 3, '2018-11-10');
