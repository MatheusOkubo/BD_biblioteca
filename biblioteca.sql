create database biblioteca;
use biblioteca;

create table emprestimo(
id_emprestimo int not null auto_increment primary key,
id_usuario int,
id_titulo  int,
data_emprestimo date,
descrição varchar(255)
)engine = InnoDB;

create table usuario(
id_usuario int not null auto_increment primary key,
nome_user varchar(255),
telefone varchar(255),
endereço varchar(255)
)engine = InnoDB;

create table autores(
id_autor int not null auto_increment primary key,
nome varchar(255),
telefone varchar(255),
endereço varchar(255)
)engine = InnoDB;

create table editora(
id_editora int not null auto_increment primary key,
nome varchar(255),
telefone varchar(255),
endereço varchar(255)
)engine = InnoDB;

create table titulo(
id_titulo int not null auto_increment primary key,
id_autores int,
id_editora int,
id_exemplares int,
id_area_de_conhecimento int,
id_palavra_chave int,
nome varchar(255),
genero varchar(1)
)engine = InnoDB;

create table exemplares(
id_exemplares int not null auto_increment primary key,
descrição varchar(255)
)engine = InnoDB;

create table palavra_chave(
id_palavra_chave int not null auto_increment primary key,
descrição varchar(255)
)engine = InnoDB;

create table area_de_conhecimento(
id_conhecimento int not null auto_increment primary key,
descrição varchar(255)
)engine= InnoDB;

alter table titulo add constraint fk_id_autores foreign key (id_autores) references autores(id_autor);
alter table titulo add constraint fk_id_editora foreign key (id_editora) references editora(id_editora);
alter table titulo add constraint fk_id_exemplares foreign key (id_exemplares) references exemplares(id_exemplares);
alter table titulo add constraint fk_id_palavra_chave foreign key (id_palavra_chave) references palavra_chave(id_palavra_chave);
alter table titulo add constraint fk_id_conhecimento foreign key (id_area_de_conhecimento) references area_de_conhecimento(id_conhecimento);
alter table emprestimo add constraint fk_id_usuario foreign key (id_usuario) references usuario(id_usuario);
alter table emprestimo add constraint fk_id_titulo foreign key (id_titulo) references titulo(id_titulo);