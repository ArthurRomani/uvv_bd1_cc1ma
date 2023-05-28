
--Criando o banco de dados

CREATE DATABASE uvv

CHARACTER SET = 'UTF8'

--Criando usuario

CREATE USER 'arthur_romani'@'localhost';

GRANT ALL PRIVILEGES ON uvv.* TO 'arthur_romani'@'localhost';

--Criando a tabela produtos e seus comentarios 

CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes LONGBLOB,
                imagem LONGBLOB,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                PRIMARY KEY (produto_id)
);

ALTER TABLE produtos COMMENT 'tabela sobre os produtos';

ALTER TABLE produtos MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o produto_id';

ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(255) COMMENT 'coluna para armazenar dados sobre o nome';

ALTER TABLE produtos MODIFY COLUMN preco_unitario NUMERIC(10, 2) COMMENT 'coluna para armazenar dados sobre o preco_unitario';

ALTER TABLE produtos MODIFY COLUMN detalhes BLOB COMMENT 'coluna para armazenar dados sobre os detalhes';

ALTER TABLE produtos MODIFY COLUMN imagem BLOB COMMENT 'coluna para armazenar dados sobre as imagens';

ALTER TABLE produtos MODIFY COLUMN imagem_mime_type VARCHAR(512) COMMENT 'coluna para armazenar dados sobre a imagem_mime_type';

ALTER TABLE produtos MODIFY COLUMN imagem_arquivo VARCHAR(512) COMMENT 'coluna para armazenar dados sobre a imagem_arquivo';

ALTER TABLE produtos MODIFY COLUMN imagem_charset VARCHAR(512) COMMENT 'coluna para armazenar dados sobre a imagem_charset';

ALTER TABLE produtos MODIFY COLUMN imagem_ultima_atualizacao DATE COMMENT 'coluna para os dados sobre a imagem_ultima_atualizacao';

--Criando a tabela lojas e seus comentarios

CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo LONGBLOB NOT NULL,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                PRIMARY KEY (loja_id)
);

ALTER TABLE lojas COMMENT 'Tabela sobre as lojas';

ALTER TABLE lojas MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o loja_id';

ALTER TABLE lojas MODIFY COLUMN nome VARCHAR(255) COMMENT 'coluna para armazenar dados sobre os nomes';

ALTER TABLE lojas MODIFY COLUMN endereco_web VARCHAR(100) COMMENT 'coluna para armazenar dados sobre os endereco_web';

ALTER TABLE lojas MODIFY COLUMN endereco_fisico VARCHAR(512) COMMENT 'coluna para armazenar dados sobre os endereco_fisico';

ALTER TABLE lojas MODIFY COLUMN latitude NUMERIC COMMENT 'coluna para armazenar dados sobre a latitude';

ALTER TABLE lojas MODIFY COLUMN longitude NUMERIC COMMENT 'coluna para armazenar dados sobre a longitude';

ALTER TABLE lojas MODIFY COLUMN logo BLOB COMMENT 'coluna para armazenar dados sobre a logo';

ALTER TABLE lojas MODIFY COLUMN logo_mime_type VARCHAR(512) COMMENT 'coluna para aramazenar dados sobre logo_mime_type';

ALTER TABLE lojas MODIFY COLUMN logo_arquivo VARCHAR(512) COMMENT 'coluna para armazenar dados sobre logo_arquivo';

ALTER TABLE lojas MODIFY COLUMN logo_charset VARCHAR(512) COMMENT 'coluna para armazenar dados sobre logo_charset';

ALTER TABLE lojas MODIFY COLUMN logo_ultima_atualizacao DATE COMMENT 'coluna para armazenar dados sobre a logo_ultima_atualizacao';

--Criando a tabela estoques e seus comentarios

CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                PRIMARY KEY (estoque_id)
);

ALTER TABLE estoques COMMENT 'tabela sobre os estoques';

ALTER TABLE estoques MODIFY COLUMN estoque_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o estoque_id';

ALTER TABLE estoques MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o loja_id';

ALTER TABLE estoques MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o produto_id';

ALTER TABLE estoques MODIFY COLUMN quantidade NUMERIC(38) COMMENT 'coluna para armazenar dados sobre a quantidade';

--Criando a tabela clientes e seus comentarios

CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                PRIMARY KEY (cliente_id)
);

ALTER TABLE clientes COMMENT 'Tabela sobre os clientes';

ALTER TABLE clientes MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'coluna sobre o cliente_id';

ALTER TABLE clientes MODIFY COLUMN email VARCHAR(255) COMMENT 'coluna para armazenar os emails';

ALTER TABLE clientes MODIFY COLUMN nome VARCHAR(255) COMMENT 'coluna para armazenar os nomes';

ALTER TABLE clientes MODIFY COLUMN telefone1 VARCHAR(20) COMMENT 'coluna para armazenar os telefones1';

ALTER TABLE clientes MODIFY COLUMN telefone2 VARCHAR(20) COMMENT 'coluna para armazenar os telefones2';

ALTER TABLE clientes MODIFY COLUMN telefone3 VARCHAR(20) COMMENT 'coluna para armazenar os telefones3';

--Criando a tabela envios e seus comentarios

CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                PRIMARY KEY (envio_id)
);

ALTER TABLE envios COMMENT 'tabela sobre os envios';

ALTER TABLE envios MODIFY COLUMN envio_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o envio_id';

ALTER TABLE envios MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre loja_id';

ALTER TABLE envios MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o cliente_id';

ALTER TABLE envios MODIFY COLUMN endereco_entrega VARCHAR(512) COMMENT 'coluna para armazenar os endereco_entrega';

ALTER TABLE envios MODIFY COLUMN status VARCHAR(15) COMMENT 'coluna para armazenar dados sobre os status';

--Criando a tabela pedidos e seus comentarios 

CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora DATETIME NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                PRIMARY KEY (pedido_id)
);

ALTER TABLE pedidos COMMENT 'Tabela sobre os pedidos';

ALTER TABLE pedidos MODIFY COLUMN pedido_id NUMERIC(38) COMMENT 'coluna para armazenar o pedido_id';

ALTER TABLE pedidos MODIFY COLUMN data_hora TIMESTAMP COMMENT 'coluna sobre a data-hora';

ALTER TABLE pedidos MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'coluna sobre o cliente_id';

ALTER TABLE pedidos MODIFY COLUMN status VARCHAR(15) COMMENT 'coluna para armazenar dados sobre o status';

ALTER TABLE pedidos MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'coluna sobre o loja_id';

--Criando a tabela pedidos_itens e seus comentarios

CREATE TABLE pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38) NOT NULL,
                PRIMARY KEY (pedido_id, produto_id)
);

ALTER TABLE pedidos_itens COMMENT 'Tabela sobre os pedidos_itens';

ALTER TABLE pedidos_itens MODIFY COLUMN pedido_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o pedido_id';

ALTER TABLE pedidos_itens MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o produto_id';

ALTER TABLE pedidos_itens MODIFY COLUMN numero_da_linha NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o numero_da_linha';

ALTER TABLE pedidos_itens MODIFY COLUMN preco_unitario NUMERIC(10, 2) COMMENT 'coluna para armazenar dados sobre o preco_unitario';

ALTER TABLE pedidos_itens MODIFY COLUMN quantidade NUMERIC(38) COMMENT 'coluna para armazenar dados sobre a quantidade';

ALTER TABLE pedidos_itens MODIFY COLUMN envio_id NUMERIC(38) COMMENT 'coluna para armazenar dados sobre o envio_id';

--Adicionando restricoes

ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_peedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pedidos_itens ADD CONSTRAINT envios_peedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_peedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
