-- LEMBRETE 'o operador respeita o datatype'

CREATE DATABASE banco; -- CRIAR BANCO

USE banco; -- SELECIONAR DB QUE ESTA USANDO

SELECT * FROM tb_funcionarios WHERE sexo <> 'F'; -- SINAL DE DIFERENTE É <> OU !=

UPDATE tb_funcionarios SET sexo = 'F' WHERE id = 1; -- UPDATE DE DADOS

ALTER TABLE tb_funcionarios
CHANGE adminissao admissao DATE; -- ALTERA NOME DA TABELA (COLOCAR STMT NO FINAL)

SELECT * FROM tb_funcionarios; -- SELECT NA TABELA

SELECT * FROM tb_funcionarios WHERE	cadastro > '2018-01-01';

UPDATE tb_funcionarios SET adminissao = CURRENT_DATE() WHERE id = 1;

CREATE TABLE tb_funcionarios (
	id int,
    nome varchar(60),
    salario decimal(10,2),
    adminissao date,
    sexo ENUM('F', 'M'),
    cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
); -- CRIAR TABELA E COLUNAS

INSERT INTO tb_funcionarios VALUES (2, 'Louise Lima', '3999.99', '2018-04-21', 'F', NULL); -- INSERIR VALORES NA TABELA

desc tb_funcionarios; -- VISUALIZAR TABELA

SELECT * FROM tb_funcionarios ORDER BY salario ASC; -- CONSULTAR TABELA COM ORDER BY

INSERT INTO tb_pessoas VALUES 
(1, 'Maria', 'F'); -- INSERIR VALORES

INSERT INTO tb_pessoas (nome, sexo) VALUES
('Louise', 'F'),
('José', 'M'); -- INSERIR MAIS VALORES AO MESMO TEMPO

-- DELETE FROM tb_pessoas where banco; 

DROP DATABASE testebanco; -- DELETAR BANCO E VALORES

DELETE FROM tb_funcionarios; -- DELETAR VALORES INSERIDOS NA TABELA
