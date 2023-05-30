--Excluir Banco de dados se ja existir

DROP DATABASE IF EXISTS uvv;


--Excluir usuario se ja existir

DROP USER IF EXISTS arthurromani;

-- Criando o usuario 

CREATE user arthurromani WITH
SUPERUSER
CREATEDB
CREATEROLE
ENCRYPTED PASSWORD 'arthur';


--Criando o banco de dados

CREATE DATABASE uvv WITH 
	OWNER = arthurromani
	TEMPLATE = template0
	ENCODING = 'UTF8'
	LC_COLLATE = 'pt_BR.UTF-8'
	LC_CTYPE = 'pt_BR.UTF-8'
	ALLOW_CONNECTIONS = true;
	
COMMENT ON DATABASE uvv IS 'Banco de dados uvv';

ALTER USER postgres
SET SEARCH_PATH TO lojas,"$user",public;

--Entrando no usuario

SET ROLE arthurromani;

\c "host=localhost dbname=uvv user=arthurromani password=arthur";

--Excluir SCHEMA se ja existir

DROP SCHEMA IF EXISTS lojas;

--Criando o SCHEMA lojas

CREATE SCHEMA lojas AUTHORIZATION arthurromani;
SHOW SEARCH_PATH;
SELECT CURRENT_SCHEMA();

ALTER USER arthurromani
SET SEARCH_PATH TO lojas, "$user", public;

--Criando tabela produtos e seus comentarios

CREATE TABLE lojas.produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
COMMENT ON TABLE lojas.produtos IS 'tabela sobre os produtos';
COMMENT ON COLUMN lojas.produtos.produto_id IS 'coluna para armazenar dados sobre o produto_id';
COMMENT ON COLUMN lojas.produtos.nome IS 'coluna para armazenar dados sobre o nome';
COMMENT ON COLUMN lojas.produtos.preco_unitario IS 'coluna para armazenar dados sobre o preco_unitario';
COMMENT ON COLUMN lojas.produtos.detalhes IS 'coluna para armazenar dados sobre os detalhes';
COMMENT ON COLUMN lojas.produtos.imagem IS 'coluna para armazenar dados sobre as imagens';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type IS 'coluna para armazenar dados sobre a imagem_mime_type';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo IS 'coluna para armazenar dados sobre a imagem_arquivo';
COMMENT ON COLUMN lojas.produtos.imagem_charset IS 'coluna para armazenar dados sobre a imagem_charset';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'coluna para armazenar dados sobre a imagem_ultima_atualizacao';

--Criando tabela lojas e seus comentarios

CREATE TABLE lojas.lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA NOT NULL,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT loja_id PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas.lojas IS 'Tabela sobre as lojas';
COMMENT ON COLUMN lojas.lojas.loja_id IS 'coluna para armazenar dados sobre o loja_id';
COMMENT ON COLUMN lojas.lojas.nome IS 'coluna para armazenar dados sobre os nomes';
COMMENT ON COLUMN lojas.lojas.endereco_web IS 'coluna para armazenar dados sobre os endereco_web';
COMMENT ON COLUMN lojas.lojas.endereco_fisico IS 'coluna para armazenar dados sobre os endereco_fisico';
COMMENT ON COLUMN lojas.lojas.latitude IS 'coluna para armazenar dados sobre a latitude';
COMMENT ON COLUMN lojas.lojas.longitude IS 'coluna para armazenar dados sobre a longitude';
COMMENT ON COLUMN lojas.lojas.logo IS 'coluna para armazenar dados sobre a logo';
COMMENT ON COLUMN lojas.lojas.logo_mime_type IS 'coluna para aramazenar dados sobre logo_mime_type';
COMMENT ON COLUMN lojas.lojas.logo_arquivo IS 'coluna para armazenar dados sobre logo_arquivo ';
COMMENT ON COLUMN lojas.lojas.logo_charset IS 'coluna para armazenar dados sobre logo_charset';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao IS 'coluna para armazenar dados sobre a logo_ultima_atualizacao ';

--Criando tabela estoques e seus comentarios

CREATE TABLE lojas.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE lojas.estoques IS 'tabela sobre os estoques';
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'coluna para armazenar dados sobre o estoque_id';
COMMENT ON COLUMN lojas.estoques.loja_id IS 'coluna para armazenar dados sobre o loja_id';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'coluna para armazenar dados sobre o produto_id';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'coluna para armazenar dados sobre a quantidade';

--Criando tabela clientes e seus comentarios

CREATE TABLE lojas.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE lojas.clientes IS 'Tabela sobre os clientes';
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'coluna sobre o cliente_id';
COMMENT ON COLUMN lojas.clientes.email IS 'coluna para armazenar os emails';
COMMENT ON COLUMN lojas.clientes.nome IS 'coluna para armazenar os nomes';
COMMENT ON COLUMN lojas.clientes.telefone1 IS 'coluna para armazenar os telefones1';
COMMENT ON COLUMN lojas.clientes.telefone2 IS 'coluna para armazenar os telefones2';
COMMENT ON COLUMN lojas.clientes.telefone3 IS 'coluna para armazenar os telefones3';

--Criando tabela envios e seus comentarios

CREATE TABLE lojas.envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);
COMMENT ON TABLE lojas.envios IS 'tabela sobre os envios';
COMMENT ON COLUMN lojas.envios.envio_id IS 'coluna para armazenar dados sobre o envio_id';
COMMENT ON COLUMN lojas.envios.loja_id IS 'coluna para armazenar dados sobre loja_id';
COMMENT ON COLUMN lojas.envios.cliente_id IS 'coluna para armazenar dados sobre o cliente_id';
COMMENT ON COLUMN lojas.envios.endereco_entrega IS 'coluna para armazenar os endereco_entrega';
COMMENT ON COLUMN lojas.envios.status IS 'coluna para armazenar dados sobre os status';

--Criando tabela pedidos e seus comentarios

CREATE TABLE lojas.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE lojas.pedidos IS 'Tabela sobre os pedidos';
COMMENT ON COLUMN lojas.pedidos.pedido_id IS 'coluna para armazenar o pedido_id';
COMMENT ON COLUMN lojas.pedidos.data_hora IS 'coluna sobre a data-hora';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'coluna sobre o cliente_id';
COMMENT ON COLUMN lojas.pedidos.status IS 'coluna para armazenar dados sobre o status';
COMMENT ON COLUMN lojas.pedidos.loja_id IS 'coluna sobre o loja_id';

--Criando tabela pedidos_itens e seus comentarios

CREATE TABLE lojas.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE lojas.pedidos_itens IS 'Tabela sobre os pedidos_itens';
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id IS 'coluna para armazenar dados sobre o pedido_id';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id IS 'coluna para armazenar dados sobre o produto_id';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'coluna para armazenar dados sobre o numero_da_linha';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario IS 'coluna para armazenar dados sobre o preco_unitario';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade IS 'coluna para armazenar dados sobre a quantidade';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id IS 'coluna para armazenar dados sobre o envio_id';

--Ligamento das tabelas

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_peedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_peedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_peedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Crinado as restricoes

ALTER TABLE lojas.pedidos
ADD CONSTRAINT check_de_pedidos
CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

ALTER TABLE lojas.envios
ADD CONSTRAINT check_status_envios
CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

ALTER TABLE lojas.lojas
ADD CONSTRAINT check_do_endereco
CHECK (endereco_web IS NOT NULL OR endereco_fisico IS NOT NULL);

ALTER TABLE lojas.produtos
ADD CONSTRAINT check_do_preco
CHECK (preco_unitario >= 0);

ALTER TABLE lojas.estoques
ADD CONSTRAINT check_de_quantidade
CHECK (quantidade >= 0);

ALTER TABLE lojas.pedidos_itens 
ADD CONSTRAINT check_preco_positivo
CHECK (quantidade >=0);

ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT preco_positivo_check
CHECK (preco_unitario >=0);


