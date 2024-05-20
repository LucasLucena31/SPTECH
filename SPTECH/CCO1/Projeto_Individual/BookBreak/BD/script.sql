use bookbreak;

SELECT * FROM usuario;

CREATE TABLE Livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (80),
    genero VARCHAR(45),
    qtd_cap INT 
);

INSERT INTO Livro (nome, genero, qtd_cap) VALUES
('O Pequeno Princípe', 'fantasia', 27);

CREATE TABLE Capitulo (
	id INT,
    fk_livro INT,
CONSTRAINT pkComposta PRIMARY KEY (id, fk_livro),
CONSTRAINT fkLivroCapitulo FOREIGN KEY (fk_livro)
	REFERENCES Livro(id));
    
INSERT INTO Capitulo VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1);

CREATE TABLE post (
	id INT,
	titulo VARCHAR(100),
	descricao VARCHAR(250),
	fk_usuario INT,
    fk_capitulo INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_capitulo) REFERENCES Capitulo(id),
    PRIMARY KEY (id, fk_capitulo)
);

INSERT INTO post VALUES
(1, 'Uau, um teste', 'Hello Word', 1, 1);

SELECT * FROM post;
DESCRIBE usuario;

SELECT 
            a.id AS idPost,
            a.titulo,
            a.descricao,
            a.fk_usuario,
            a.fk_capitulo,
            u.id AS idUsuario,
            u.nome,
            u.email,
            u.senha, 
            u.cpf
        FROM post a
            INNER JOIN usuario u
                ON a.fk_usuario = u.id
                WHERE a.fk_capitulo = 1;
