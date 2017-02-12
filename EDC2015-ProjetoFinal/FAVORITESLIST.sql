create table favoritesList
(
	title varchar(300) not null,
	link varchar(300) not null,
	descricao varchar(max),
	categoria varchar(20),
	pubdate varchar(60),
	id_userfav nvarchar(128)

	primary key(title),
	foreign key(id_userfav) references AspNetUsers(Id)
);

drop table favoritesList