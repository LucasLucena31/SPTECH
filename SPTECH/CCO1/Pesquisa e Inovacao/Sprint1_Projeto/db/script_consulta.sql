use FrozenMeat;

/*Script de seleção*/

/*Alterando as datas de registro dos usuarios e frigorificos para datas aleatorias */
/*Usuarios fisicos*/
update usuario_fisico set registrado_em = '2021-05-30 22:34:21'
	where id = 1;

update usuario_fisico set registrado_em = '2019-11-23 14:45:19'
	where id = 2;

update usuario_fisico set registrado_em = '2023-07-03 20:30:40'
	where id = 3;
    
update usuario_fisico set registrado_em = '2005-04-19 19:59:21'
	where id = 4;
    
update usuario_fisico set registrado_em = '2018-02-23 12:42:11'
	where id = 5;

/*Usuarios juridicos*/
update usuario_juridico set registrado_em = '2010-03-23 20:34:20'
	where id = 1;

update usuario_juridico set registrado_em = '2016-10-13 10:12:43'
	where id = 2;

update usuario_juridico set registrado_em = '2020-09-09 23:30:47'
	where id = 3;
    
update usuario_juridico set registrado_em = '2009-07-11 09:49:21'
	where id = 4;
    
update usuario_juridico set registrado_em = '2014-05-30 15:34:51'
	where id = 5;

/*Usuarios juridicos*/
update frigorifico set registrado_em = '2011-04-13 10:54:30'
	where id = 1;

update frigorifico set registrado_em = '2013-11-14 15:15:23'
	where id = 2;

update frigorifico set registrado_em = '2017-01-01 22:50:47'
	where id = 3;
    
update frigorifico set registrado_em = '2017-12-31 04:40:21'
	where id = 4;
    
update frigorifico set registrado_em = '2012-04-10 14:34:51'
	where id = 5;


select 
id as 'ID',
registrado_em as 'Data de registro', 
nome as 'Nome', 
email as 'Email', 
cpf as 'CPF', 
telefone as 'Número de telefone'
from usuario_fisico order by registrado_em desc;

select
registrado_em as 'Data de registro', 
nome as 'Nome', 
email as 'Email', 
telefone as 'Número de telefone'
from usuario_fisico
	where telefone like '11%';
    
select id as 'ID',
registrado_em as 'Data de Registro',
nome as 'Nome',
email as 'Email',
cnpj as 'CNPJ',
telefone as 'Número de telefone'
from usuario_juridico order by nome;

select 
registrado_em as 'Data de Registro',
nome as 'Nome',
email as 'Email',
cnpj as 'CNPJ',
telefone as 'Número de telefone'
from usuario_juridico
	where email like '%gmail%' order by email;
    
select 
id as 'ID',
registrado_em as 'Data de registro',
endereco as 'Endereço',
cep as 'CEP',
temperatura_ideal_minima as 'Temperatura ideal mínima',
temperatura_ideal_maxima as 'Temperatura ideal máxima'
from frigorifico order by cep desc;


select * from historico_frigorifico
order by temperatura;
    
    
