create database	Projeto_5;
use Projeto_5;
create table Departamento (
	sk_departamento int auto_increment primary key,
	id_departamento int not null,
	nome varchar(45),
	campus varchar(45),
	id_professor_coordenador int
);

create table Disciplina (
	sk_disciplina int auto_increment primary key,
	id_disciplina int not null unique
);

create table Curso (
	sk_curso int auto_increment primary key,
	id_curso int not null unique
);

create table Periodo (
	sk_data int auto_increment primary key,
	ano smallint not null,
	semestre tinyint not null,
	ano_semestre char (6) not null,
	data_inicio date not null, 
	data_fim date not null, 
	unique (ano, semestre)
);

create table Professor (
	id_professor int not null,
	sk_departamento int not null,
	sk_disciplina int not null,
	sk_curso int not null,
	sk_periodo_oferta_disciplina int not null,
	sk_periodo_oferta_curso int not null,
	
	primary key (id_professor, sk_disciplina, sk_curso, sk_periodo_oferta_disciplina),

	constraint fk_professor_departamento
		foreign key (sk_departamento) references Departamento (sk_departamento),
	constraint fk_professor_disciplina
		foreign key (sk_disciplina) references Disciplina (sk_disciplina),
	constraint fk_professor_curso
		foreign key (sk_curso) references Curso (sk_curso),
	constraint fk_professor_periodo_disciplina
		foreign key (sk_periodo_oferta_disciplina) references Periodo (sk_data),
	constraint fk_professor_periodo_curso
		foreign key (sk_periodo_oferta_curso) references Periodo (sk_data)
);

alter table Curso add column id_departamento int;
