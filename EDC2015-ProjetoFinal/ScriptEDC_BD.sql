create database EDC_BD;

--drop table favoritenews;

create table favoritenews(
	title varchar(500),
	descricao varchar(max),
	link varchar(max),
	category varchar(50),
	pubDate varchar(30),
	imagem varchar(max),

	primary key(title)
	
);

create table favoritecategories(
	category varchar(50),
	
	primary key(category)
	
);


INSERT INTO favoritecategories
VALUES ('Desporto');

-- ...

------------------------------------------------------------------------------

INSERT INTO favoritenews
VALUES ('Quase 500 pequenos accionistas do BES apresentam duas acções populares na Justiça',
'test','http://feedproxy.google.com/~r/PublicoRSS/~3/Fo9ki8sy6hE/quase-500-pequenos-accionistas-do-bes-apresentam-duas-accoes-populares-na-justica-1676176t',
'Desporto','Thu, 13 Nov 2014 18:11:09 GMT','http://static.publico.pt/files/header/img/publico.png');


