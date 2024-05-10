CREATE DATABASE venda;
USE venda;

CREATE TABLE cliente (
	idCliente int primary key auto_increment,
    nome varchar (45),
    email varchar (45),
    endereco varchar (80),
    fkIndicacao int,
    constraint FkIndicadorCliente foreign key (fkIndicacao) 
		references cliente(idCliente)
	);
    
CREATE TABLE venda (
	idVenda int,
    fkCliente int,
    total decimal(5,2),
    dtVenda date,
    constraint PkComposta primary key (idVenda, fkCliente),
    constraint FkClienteVenda foreign key (fkCliente) 
		references cliente(idCliente));
        
CREATE TABLE produto (
	idProduto int primary key auto_increment,
    nome varchar (45),
    descricao varchar (45),
    quantidade int,
    preco decimal (5,2));
    
CREATE TABLE possui (
	idPossui int,
	fkVenda int,
    fkProduto int,
	constraint FkVendaPossui foreign key (fkVenda) 
		references venda(idVenda),
	constraint FkProdutoPossui foreign key (fkProduto) 
		references produto(idProduto),
	constraint PkComposta primary key (idPossui, fkVenda, fkProduto));
    
    
INSERT INTO cliente (nome, email, endereco, fkIndicacao) VALUES
('João Silva', 'joao@example.com', 'Rua A, 123', NULL),
('Maria Santos', 'maria@example.com', 'Rua B, 456', 1),
('Carlos Oliveira', 'carlos@example.com', 'Rua C, 789', 2),
('Ana Souza', 'ana@example.com', 'Rua D, 1011', 3),
('Pedro Lima', 'pedro@example.com', 'Rua E, 1213', 1);


INSERT INTO venda (idVenda, fkCliente, total, dtVenda) VALUES
(1, 1, 50.00, '2024-05-01'),
(2, 2, 100.00, '2024-05-02'),
(3, 3, 75.00, '2024-05-03'),
(4, 1, 30.00, '2024-05-04'),
(5, 4, 60.00, '2024-05-05'),
(6, 5, 90.00, '2024-05-06'),
(7, 3, 25.00, '2024-05-07');


INSERT INTO produto (nome, descricao, preco, quantidade) VALUES
('Gelatina', 'Produto em pó para fab ricacao de gelatina', 20.00, 2),
('Suco Tang', 'Suco em pó', 30.00, 1),
('Sucrilhos', 'Caixa de cereal', 25.00, 5),
('Pão de forma', 'Pão de forma', 40.00, 1),
('Detergente', 'Produto de limpeza para louça', 35.00, 2);


INSERT INTO possui (idPossui, fkVenda, fkProduto) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4),
(5, 4, 1),
(6, 5, 2),
(7, 6, 3),
(8, 6, 4),
(9, 7, 5);

SELECT * FROM cliente;
SELECT * FROM venda;
SELECT * FROM produto;
SELECT * FROM possui;

SELECT cliente.nome, venda.idVenda,
		venda.total AS TotalVenda,
		venda.dtVenda AS DataVenda 
		FROM cliente JOIN venda 
        ON idCliente = fkCliente;
        
SELECT cliente.nome, venda.idVenda,
		venda.total AS TotalVenda,
		venda.dtVenda AS DataVenda 
		FROM cliente JOIN venda 
        ON idCliente = fkCliente
        WHERE cliente.nome = 'Ana Souza';
        
SELECT c.nome as 'Nome Indicador', i.nome as 'Nome Cliente'
		FROM cliente as c JOIN cliente as i 
        ON c.idCliente = i.fkIndicacao;
    
SELECT c.nome as 'Nome Indicador', i.nome as 'Nome Cliente'
		FROM cliente as c JOIN cliente as i 
        ON c.idCliente = i.fkIndicacao
        WHERE c.nome = 'João Silva';
        
SELECT c.idCliente AS ClienteID,
    c.nome AS ClienteNome,
    c.email AS ClienteEmail,
    c.endereco AS ClienteEndereco,
    i.idCliente AS IndicadorID,
    i.nome AS IndicadorNome,
    i.email AS IndicadorEmail,
    i.endereco AS IndicadorEndereco,
    v.idVenda,
    p.nome AS ProdutoNome,
    p.descricao AS ProdutoDescricao,
    p.preco AS ProdutoPreco,
    v.total AS TotalVenda,
    v.dtVenda AS DataVenda
	FROM cliente c LEFT JOIN cliente i 
    ON c.fkIndicacao = i.idCliente
	LEFT JOIN venda v 
    ON c.idCliente = v.fkCliente
	LEFT JOIN possui po 
    ON v.idVenda = po.fkVenda
	LEFT JOIN produto p 
    ON po.fkProduto = p.idProduto;   
    
SELECT v.dtVenda, p.nome, p.quantidade
		FROM venda v JOIN produto p
        ON v.idVenda = possui.fkVenda;
        
SELECT v.dtVenda AS DataVenda,
    p.nome AS NomeProduto,
    p.quantidade AS Quantidade
	FROM venda v 
    JOIN possui po 
    ON v.idVenda = po.fkVenda
	JOIN produto p 
    ON po.fkProduto = p.idProduto
	WHERE v.idVenda = 1;
    
SELECT p.nome AS NomeProduto,
		p.preco AS ValorProduto,
		SUM(p.quantidade) AS QuantidadeTotal
		FROM produto p JOIN possui po 
        ON p.idProduto = po.fkProduto
		GROUP BY p.nome, p.preco;
        
INSERT INTO cliente (nome, email, endereco, fkIndicacao) 
VALUES ('Mariana Oliveira', 'mariana@example.com', 'Rua Farias, 1415', 2);

SELECT c.idCliente,
    c.nome AS NomeCliente,
    c.email AS EmailCliente,
    c.endereco AS EnderecoCliente,
    v.idVenda,
    v.total AS TotalVenda,
    v.dtVenda AS DataVenda
	FROM cliente c LEFT JOIN venda v 
    ON c.idCliente = v.fkCliente;

SELECT MIN(preco) AS ValorMinimo,
		MAX(preco) AS ValorMaximo
		FROM produto;
        
SELECT SUM(preco) AS SomaPrecos,
		AVG(preco) AS MediaPrecos
		FROM produto;
        
SELECT COUNT(*) AS 'Quantidade de Precos Acima da Media'
	FROM produto
	WHERE preco > (SELECT AVG(preco) FROM produto);
        
SELECT SUM(DISTINCT preco) AS 'Soma de Precos Distintos'
FROM produto;

SELECT v.idVenda, SUM(p.preco) AS SomaPrecos
FROM venda v JOIN possui po 
ON v.idVenda = po.fkVenda
JOIN produto p 
ON po.fkProduto = p.idProduto 
WHERE v.idVenda = 6;
