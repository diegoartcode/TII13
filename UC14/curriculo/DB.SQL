CREATE DATABASE IF NOT EXISTS curriculos_db;
use curriculos_db;
CREATE TABLE IF NOT EXISTS curriculos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone VARCHAR(25),
    cidade VARCHAR(120),
    profissao VARCHAR(120),
    objetivo TEXT,
    resumo TEXT
);

CREATE TABLE IF NOT EXISTS experiencias(
	id INT AUTO_INCREMENT PRIMARY KEY,
    curriculo_id INT NOT NULL,
    empresa VARCHAR(150) NOT NULL,
    cargo VARCHAR(120) NOT NULL,
    periodo VARCHAR(80) NOT NULL,
    atividade TEXT,
    CONSTRAINT fk_experiencias_curriculo FOREIGN KEY (curriculo_id)
    REFERENCES curriculos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS formacoes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    curriculo_id INT NOT NULL,
    escolaridade VARCHAR(80),
    curso VARCHAR(160) NOT NULL,
    instituicao VARCHAR(160),
    conclusao VARCHAR(30),
    CONSTRAINT fk_formacoes_curriculo FOREIGN KEY (curriculo_id)
    REFERENCES curriculos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS habilidades(
	id INT AUTO_INCREMENT PRIMARY KEY,
    curriculo_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT fk_habilidades_curriculo FOREIGN KEY (curriculo_id) 
    REFERENCES curriculos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS idiomas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    curriculo_id INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    nivel VARCHAR(50),
    CONSTRAINT fk_idiomas_curriculo FOREIGN KEY (curriculo_id)
    REFERENCES curriculos(id) ON DELETE CASCADE
);


SELECT * from curriculos; 

INSERT INTO curriculos (nome, email, telefone, cidade, profissao, objetivo,resumo)
VALUES ('Diego Rodrigues', 'diego@email.com','11999999999',
'São Paulo','Desenvolvedor Mobile', 
'Atuar no desenvolvimento de aplicativos mobile',
'Desenvolvedor com experiência em Flutter e Dart')

INSERT INTO experiencias (curriculo_id, empresa,cargo, periodo, atividades)
VALUES (1,'Tech Solutions','Desenvolvedor Mobile','2023 - Atual', 
'Denvolvimento de aplicativos ultilizando Flutter e Dart.')

INSERT INTO formacoes (curriculo_id, escolaridade, curso, instituicao, conclusao)
VALUES (1, 'Ensino Superior', 'Análise e Desenvolvimento de Sistemas',
'Faculdade de Tecnoogia', '2024')

