CREATE DATABASE projeto_financeiro;
USE projeto_financeiro;
SHOW databases;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    tipo ENUM('receita', 'despesa') NOT NULL
);
CREATE TABLE transacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    categoria_id INT NULL,  -- Permite valores NULL
    descricao VARCHAR(255),
    valor DECIMAL(10,2) NOT NULL,
    data_transacao DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL
);
CREATE TABLE parcelamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transacao_id INT NOT NULL,
    numero_parcela INT NOT NULL,
    total_parcelas INT NOT NULL,
    valor_parcela DECIMAL(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    FOREIGN KEY (transacao_id) REFERENCES transacoes(id) ON DELETE CASCADE
);



