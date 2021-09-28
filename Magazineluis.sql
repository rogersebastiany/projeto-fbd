CREATE TABLE Usuarios (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(50),
    Endereco VARCHAR(100),
    CPF VARCHAR(11),
    Apelido VARCHAR(9),
    Senha VARCHAR(9),
    ID_meio_pagamento VARCHAR(10)
);

CREATE TABLE Produtos (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao VARCHAR(255),
    Preco FLOAT,
    ID_marca VARCHAR(10),
    ID_categoria VARCHAR(10),
    ID_avaliacao VARCHAR(10),
    Media_avaliacoes FLOAT
);

CREATE TABLE Marcas (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(25),
    Descricao VARCHAR(255),
    fk_Produtos_ID VARCHAR(10)
);

CREATE TABLE Categorias (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(50),
    Descricao VARCHAR(255)
);

CREATE TABLE Servicos (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(25),
    Descricao VARCHAR(255),
    Preco FLOAT
);

CREATE TABLE Meios_de_pagamento (
    ID VARCHAR(10) PRIMARY KEY,
    Tipo VARCHAR(4),
    Numero_cartao VARCHAR(12),
    Nome_titular VARCHAR(20),
    Vencimento_mes VARCHAR(2),
    Vencimento_ano VARCHAR(2),
    Cod_verificacao VARCHAR(3),
    fk_Pedidos_Trocas_ID VARCHAR(10)
);

CREATE TABLE Pedidos_Trocas (
    ID VARCHAR(10) PRIMARY KEY,
    ID_produto VARCHAR(10),
    Quantidade FLOAT,
    ID_meio_pagamento VARCHAR(10),
    ID_usuario VARCHAR(10),
    Tipo VARCHAR(10),
    ID_pedido VARCHAR(10)
);

CREATE TABLE Avaliacoes (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(50),
    Estrelas FLOAT,
    ID_produto VARCHAR(10)
);

CREATE TABLE Newsletter (
    ID VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(30)
);

CREATE TABLE Gerar (
    fk_Usuarios_ID VARCHAR(10),
    fk_Pedidos_Trocas_ID VARCHAR(10)
);

CREATE TABLE Possui (
    fk_Meios_de_pagamento_ID VARCHAR(10),
    fk_Usuarios_ID VARCHAR(10)
);

CREATE TABLE Tem_Pedidos_Servicos_Produtos (
    fk_Pedidos_Trocas_ID VARCHAR(10),
    fk_Servicos_ID VARCHAR(10),
    fk_Produtos_ID VARCHAR(10)
);

CREATE TABLE Assinar (
    fk_Newsletter_ID VARCHAR(10),
    fk_Usuarios_ID VARCHAR(10)
);

CREATE TABLE Organizados (
    fk_Categorias_ID VARCHAR(10),
    fk_Produtos_ID VARCHAR(10)
);

CREATE TABLE Possui2 (
    fk_Produtos_ID VARCHAR(10),
    fk_Avaliacoes_ID VARCHAR(10)
);
 
ALTER TABLE Marcas ADD CONSTRAINT FK_Marcas_2
    FOREIGN KEY (fk_Produtos_ID)
    REFERENCES Produtos (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Meios_de_pagamento ADD CONSTRAINT FK_Meios_de_pagamento_2
    FOREIGN KEY (fk_Pedidos_Trocas_ID)
    REFERENCES Pedidos_Trocas (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Gerar ADD CONSTRAINT FK_Gerar_1
    FOREIGN KEY (fk_Usuarios_ID)
    REFERENCES Usuarios (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Gerar ADD CONSTRAINT FK_Gerar_2
    FOREIGN KEY (fk_Pedidos_Trocas_ID)
    REFERENCES Pedidos_Trocas (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui2 ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (fk_Meios_de_pagamento_ID)
    REFERENCES Meios_de_pagamento (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_2
    FOREIGN KEY (fk_Usuarios_ID)
    REFERENCES Usuarios (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Tem_Pedidos_Servicos_Produtos ADD CONSTRAINT FK_Tem_Pedidos_Servicos_Produtos_1
    FOREIGN KEY (fk_Pedidos_Trocas_ID)
    REFERENCES Pedidos_Trocas (ID)
    ON DELETE NO ACTION;
 
ALTER TABLE Tem_Pedidos_Servicos_Produtos ADD CONSTRAINT FK_Tem_Pedidos_Servicos_Produtos_2
    FOREIGN KEY (fk_Servicos_ID)
    REFERENCES Servicos (ID)
    ON DELETE NO ACTION;
 
ALTER TABLE Tem_Pedidos_Servicos_Produtos ADD CONSTRAINT FK_Tem_Pedidos_Servicos_Produtos_3
    FOREIGN KEY (fk_Produtos_ID)
    REFERENCES Produtos (ID)
    ON DELETE NO ACTION;
 
ALTER TABLE Assinar ADD CONSTRAINT FK_Assinar_1
    FOREIGN KEY (fk_Newsletter_ID)
    REFERENCES Newsletter (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Assinar ADD CONSTRAINT FK_Assinar_2
    FOREIGN KEY (fk_Usuarios_ID)
    REFERENCES Usuarios (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Organizados ADD CONSTRAINT FK_Organizados_1
    FOREIGN KEY (fk_Categorias_ID)
    REFERENCES Categorias (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Organizados ADD CONSTRAINT FK_Organizados_2
    FOREIGN KEY (fk_Produtos_ID)
    REFERENCES Produtos (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (fk_Produtos_ID)
    REFERENCES Produtos (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_2
    FOREIGN KEY (fk_Avaliacoes_ID)
    REFERENCES Avaliacoes (ID)
    ON DELETE SET NULL;
