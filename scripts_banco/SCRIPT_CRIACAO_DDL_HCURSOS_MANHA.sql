--CREATE DATABASE HCURSOS_MANHA

USE HCURSOS_MANHA

--CRIA UMA TABELA DE CATEGORIAS
CREATE TABLE CATEGORIAS (
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(250) NOT NULL UNIQUE
);

--CRIA UMA TABELA DE ALUNOS
CREATE TABLE ALUNOS (
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(250) NOT NULL 
);

--CRIA UMA TABELA DE PROFESSORES
CREATE TABLE PROFESSORES (
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(250) NOT NULL
);

/*
	CRIA A TABELA CURSOS
	REFERENCIA A CATEGORIA E O PROFESSOR
	PROFESSOR -> CURSOS = 1 PARA MUITOS
	CATEGORIA -> CURSOS = 1 PARA MUITOS
*/
CREATE TABLE CURSOS (
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(250) NOT NULL
	,TITULO VARCHAR(250) NOT NULL
	,ID_CATEGORIA INT FOREIGN KEY REFERENCES CATEGORIAS(ID)
	,ID_PROFESSOR INT FOREIGN KEY REFERENCES PROFESSORES(ID)
);

/*
	CRIA A TABELA CURSOS_ALUNOS
	REFERECIA O CURSO E O ALUNO 
	MUITOS PARA MUITOS
*/
CREATE TABLE CURSOS_ALUNOS (
	ID_CURSO INT FOREIGN KEY REFERENCES CURSOS(ID)
	,ID_ALUNO INT FOREIGN KEY REFERENCES ALUNOS(ID)
);

