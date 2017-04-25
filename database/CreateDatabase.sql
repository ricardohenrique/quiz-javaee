CREATE TABLE alternativa (
  idalternativa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  pergunta_idpergunta INTEGER UNSIGNED NOT NULL,
  descricao VARCHAR(255) NULL,
  correta BOOL NULL,
  PRIMARY KEY(idalternativa),
  INDEX alternativa_FKIndex1(pergunta_idpergunta)
);

CREATE TABLE historico (
  idusuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_idusuario INTEGER UNSIGNED NOT NULL,
  resultado INTEGER UNSIGNED NULL,
  PRIMARY KEY(idusuario),
  INDEX historico_FKIndex1(usuario_idusuario)
);

CREATE TABLE historico_has_jogos (
  historico_idusuario INTEGER UNSIGNED NOT NULL,
  jogos_idjogos INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(historico_idusuario, jogos_idjogos),
  INDEX historico_has_jogos_FKIndex1(historico_idusuario),
  INDEX historico_has_jogos_FKIndex2(jogos_idjogos)
);

CREATE TABLE jogos (
  idjogos INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  jogadas INTEGER UNSIGNED NULL,
  PRIMARY KEY(idjogos)
);

CREATE TABLE pergunta (
  idpergunta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(255) NULL,
  PRIMARY KEY(idpergunta)
);

CREATE TABLE pergunta_has_jogos (
  pergunta_idpergunta INTEGER UNSIGNED NOT NULL,
  jogos_idjogos INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(pergunta_idpergunta, jogos_idjogos),
  INDEX pergunta_has_jogos_FKIndex1(pergunta_idpergunta),
  INDEX pergunta_has_jogos_FKIndex2(jogos_idjogos)
);

CREATE TABLE usuario (
  idusuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(20) NULL,
  data_cadastro INTEGER UNSIGNED NULL,
  PRIMARY KEY(idusuario)
);


