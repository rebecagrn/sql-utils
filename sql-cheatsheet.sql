-- 'o operador respeita o datatype'

-- CRIA BANCO (SCHEMA)
CREATE DATABASE banco;

-- SELECIONA DB QUE ESTA USANDO
USE banco;

-- SINAL DE DIFERENTE É <> OU !=
SELECT * FROM tb_funcionarios WHERE sexo <> 'F';

--  ATUALIZA DADOS NAS COLUNAS SELECIONADAS
UPDATE tb_funcionarios SET sexo = 'F' WHERE id = 1;

-- ALTERA NOME DA TABELA (nome_antigo nome_novo - COLOCAR STMT NO FINAL)
ALTER TABLE tb_funcionarios
CHANGE adminissao admissao DATE;

-- CONSULTA A TABELA
SELECT * FROM tb_funcionarios;

SELECT * FROM tb_funcionarios WHERE	cadastro > '2018-01-01';

UPDATE tb_funcionarios SET adminissao = CURRENT_DATE() WHERE id = 1;

-- CRIA TABELA E COLUNAS
CREATE TABLE tb_funcionarios (
	id int,
    nome varchar(60),
    salario decimal(10,2),
    adminissao date,
    sexo ENUM('F', 'M'),
    cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO tb_funcionarios VALUES (2, 'Louise Lima', '3999.99', '2018-04-21', 'F', NULL); -- INSERIR VALORES NA TABELA

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

DELETE FROM tb_pessoas where banco; 

-- DELETA BANCO E VALORES NELE
DROP DATABASE testebanco;

-- DELETA VALORES INSERIDOS NA TABELA
DELETE FROM tb_funcionarios;