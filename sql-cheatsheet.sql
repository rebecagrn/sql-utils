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

-- CRIA TABLES COM RELACIONAMENTOS (FK)
CREATE TABLE tb_pessoas(
	idpessoa INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT pk_pessoas PRIMARY KEY (idpessoa)
) ENGINE = InnoDB;

CREATE TABLE tb_funcionarios(
	idfuncionario INT AUTO_INCREMENT NOT NULL,
    idpessoa INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    CONSTRAINT pk_funcionarios PRIMARY KEY  (idfuncionario),
    CONSTRAINT fk_funcionarios_pessoas FOREIGN KEY (idpessoa)
		REFERENCES tb_pessoas (idpessoa)
);

CREATE TABLE tb_pedidos(
	idpedido INT AUTO_INCREMENT NOT NULL,
    idpessoa INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    valor_pedido DEC(10, 2),
    CONSTRAINT pk_pedidos PRIMARY KEY(idpedido),
    CONSTRAINT fk_pedidos_pessoas FOREIGN KEY (idpessoa) REFERENCES tb_pessoas (idpessoa)
);

-- PROCEDURE QUE CRIA E INSERE DADOS NA TABELA
DELIMITER $$
    CREATE DEFINER=`root`@`localhost` PROCEDURE sp_criar_pessoa(
        pnome varchar(100)
    ) 
    BEGIN
        INSERT INTO tb_pessoas VALUES(NULL, pnome, NULL);
    END $$

DELIMITER ;

-- CHAMA A PROCEDURE E EXECUTA O SCRIPT
CALL sp_criar_pessoa('Lady Gaga da Silva');


-- COMANDO QUE DECLARA DETERMINISTIC NA FUNÇÃO
SET GLOBAL log_bin_trust_function_creators = 1;


-- FUNÇÃO QUE CALCULA IMPOSTO DE RENDA
DELIMITER $$

CREATE FUNCTION fn_calcula_ir(

    p_salario DEC(10,2)

)
RETURNS DEC(10,2)

    BEGIN
        DECLARE valiquota DEC(10,2);
            SET valiquota = CASE
            WHEN p_salario <=1903.98 THEN 0.00
            WHEN p_salario >=1903.99 AND p_salario<= 2826.65 then ((p_salario * .075)-142.80)
            WHEN p_salario >=2826.66 AND p_salario<= 3751.05 then ((p_salario * .15)-354.80)
            WHEN p_salario >=3751.06 AND p_salario<= 4664.68 then ((p_salario * .225)-636.13)
            WHEN p_salario >=4664.68 THEN ((p_salario * .275)-869.36)
        END;
        RETURN valiquota;
    END $$

DELIMITER ;

-- DELETA A TABELA DO BANCO SELECIONADO
DELETE FROM tb_pessoas WHERE banco; 

-- DELETA BANCO E VALORES NELE
DROP DATABASE testebanco;

-- DELETA VALORES INSERIDOS NA TABELA
DELETE FROM tb_funcionarios;