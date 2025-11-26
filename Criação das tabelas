CREATE DATABASE laboratorio_protese;
USE laboratorio_protese;

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20)
);

CREATE TABLE DENTISTA (
    id_dentista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cro VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE PROTETICO (
    id_protetico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(30) NOT NULL,
    id_cliente INT NOT NULL,
    id_dentista INT NOT NULL,
    
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_dentista) REFERENCES DENTISTA(id_dentista)
);

CREATE TABLE PROTESE (
    id_protese INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    material VARCHAR(50),
    cor VARCHAR(30),
    id_pedido INT NOT NULL,

    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

CREATE TABLE ETAPA_PRODUCAO (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY,
    nome_etapa VARCHAR(100) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    status_etapa VARCHAR(30),
    id_pedido INT NOT NULL,

    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

CREATE TABLE PEDIDO_PROTETICO (
    id_pedido INT,
    id_protetico INT,
    funcao VARCHAR(50),

    PRIMARY KEY (id_pedido, id_protetico),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_protetico) REFERENCES PROTETICO(id_protetico)
);
