CREATE TABLE Clientes (
    id_cliente INT IDENTITY PRIMARY KEY,
    id_endereco INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    data_cadastro SMALLDATETIME NOT NULL,

CONSTRAINT fk_clientes_endereco FOREIGN KEY (id_endereco)
        REFERENCES enderecos (id_endereco)
;

CREATE TABLE Enderecos (
    id_endereco INT IDENTITY PRIMARY KEY,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NULL,
    complemento VARCHAR(40) NULL,
    bairro VARCHAR(40) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
;

CREATE TABLE Aparelhos (
    id_aparelho INT IDENTITY PRIMARY KEY,
    id_cliente INT NOT NULL,
    marca VARCHAR(30) NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    imei VARCHAR(15) NOT NULL UNIQUE,
    valor_mercado DECIMAL(10,2) NOT NULL,
    ano_fabricacao INT NULL,

    CONSTRAINT fk_aparelho_cliente FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id_cliente)
;

CREATE TABLE planos_seguro (
    id_plano TINYINT IDENTITY PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    cobertura_roubo BIT NOT NULL,
    cobertura_danos BIT NOT NULL,
    cobertura_perda BIT NOT NULL
);


CREATE TABLE Apolices (
    id_apolice INT IDENTITY PRIMARY KEY,
    id_aparelho INT NOT NULL,
    id_plano TINYINT NOT NULL,
    data_inicio_vigencia SMALLDATETIME NOT NULL,
    data_fim_vigencia SMALLDATETIME NOT NULL,
    valor_cobertura DECIMAL(10,2) NOT NULL,
    valor_franquia DECIMAL(10,2) NOT NULL,
    status_apolice VARCHAR(15) NOT NULL,
   
    CONSTRAINT fk_apolice_aparelho FOREIGN KEY (id_aparelho)
        REFERENCES Aparelhos (id_aparelho),
    CONSTRAINT fk_apolice_plano FOREIGN KEY (id_plano)
        REFERENCES Planos_Seguro (id_plano)
);

CREATE TABLE Sinistros (
    id_sinistro INT IDENTITY PRIMARY KEY,
    id_apolice INT NOT NULL,
    data_ocorrencia DATE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    tipo_ocorrencia VARCHAR(30) NOT NULL,
    status_sinistro VARCHAR(20) NOT NULL,

    CONSTRAINT fk_sinistro_apolice FOREIGN KEY (id_apolice)
        REFERENCES Apolices (id_apolice)
);

CREATE TABLE Reparos (
    id_reparo INT IDENTITY PRIMARY KEY,
    id_sinistro INT NOT NULL,
    data_envio SMALLDATETIME NOT NULL,
    data_conclusao SMALLDATETIME NOT NULL,
    custo_reparo DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_reparo_sinistro FOREIGN KEY (id_sinistro)
        REFERENCES Sinistros (id_sinistro)
);

CREATE TABLE Pagamentos (
    id_pagamento INT IDENTITY PRIMARY KEY,
    id_apolice INT NOT NULL,
    data_pagamento SMALLDATETIME NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(20) NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,

    CONSTRAINT fk_pagamento_apolice FOREIGN KEY (id_apolice)
        REFERENCES Apolices (id_apolice)
);
