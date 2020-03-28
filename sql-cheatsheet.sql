-- 'o operador respeita o datatype'

-- CRIA BANCO (SCHEMA)
CREATE DATABASE banco;

-- SELECIONA DB QUE ESTA USANDO
USE banco;

-- SINAL DE DIFERENTE É <> OU !=
SELECT * FROM tb_funcionarios WHERE sexo != 'F';

--  ATUALIZA DADOS NAS COLUNAS SELECIONADAS
UPDATE tb_funcionarios SET salario = '5500.99', admissao = '2015-05-01' WHERE id = 1;

-- ALTERA NOME DA TABELA (nome_antigo nome_novo - COLOCAR STMT NO FINAL)
ALTER TABLE tb_funcionarios
CHANGE adminissao admissao DATE;

-- CONSULTA A TABELA
SELECT * FROM tb_funcionarios;

SELECT * FROM tb_funcionarios WHERE	cadastro > '2018-01-01';

UPDATE tb_funcionarios SET admissao = CURRENT_DATE() WHERE id = 1;

-- CRIA TABELA E COLUNAS
CREATE TABLE tb_funcionarios (
	id int,
    nome varchar(60),
    salario decimal(10,2),
    adminissao date,
    sexo ENUM('F', 'M'),
    cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- INSERIR VALORES NA TABELA
INSERT INTO tb_funcionarios VALUES (2, 'Louise Lima', '3999.99', '2018-04-21', 'F', NULL);

-- VISUALIZA DETALHES DA TABELA
desc tb_funcionarios;

-- CONSULTA TABELA COM ORDEM ASC OU DESC
SELECT * FROM tb_funcionarios ORDER BY salario ASC;

-- INSERE VALORES
INSERT INTO tb_pessoas VALUES 
(1, 'Maria', 'F'); 

-- INSERE MAIS VALORES AO MESMO TEMPO
INSERT INTO tb_pessoas (nome, sexo) VALUES
('Louise', 'F'),
('José', 'M'); 

-- DELETA A TABELA DO BANCO SELECIONADO
DELETE FROM tb_pessoas WHERE banco; 

-- DELETA BANCO E VALORES NELE
DROP DATABASE testebanco;

-- DELETA VALORES INSERIDOS NA TABELA
DELETE FROM tb_funcionarios;