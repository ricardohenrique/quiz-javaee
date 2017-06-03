-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.14 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para quiz
CREATE DATABASE IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `quiz`;

-- Copiando estrutura para tabela quiz.alternative
CREATE TABLE IF NOT EXISTS `alternative` (
  `alternativeId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`alternativeId`),
  KEY `questionId` (`questionId`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela quiz.alternative: 50 rows
/*!40000 ALTER TABLE `alternative` DISABLE KEYS */;
INSERT INTO `alternative` (`alternativeId`, `description`, `correct`, `questionId`) VALUES
	(1, '&lt;hr/&gt;', 1, 1),
	(2, '&lt;br/&gt;', 0, 1),
	(3, '&lt;hr&gt;&lt;/hr&gt;', 0, 1),
	(4, '&lt;br&gt;&lt;/br&gt;', 0, 1),
	(5, '&lt;line&gt;&lt;line/&gt;', 0, 1),
	(6, 'Contendo variáveis de sessão disponíveis para o atual script', 0, 2),
	(7, 'De variáveis passadas para o script atual via método HTTP REQUEST', 0, 2),
	(8, 'Que, por padrão, contém informações de $_GET, $_POST e $_COOKIE', 1, 2),
	(9, 'Contendo informações como cabeçalhos, paths, e localizações do script', 0, 2),
	(10, 'Contendo referências para todas as variáveis que estão atualmente definidas no escopo global do script', 0, 2),
	(11, 'Na hierarquia de classes, se superclasse é uma generalização de subclasses, pode-se inferir que a subclasse é uma especialização de superclasse', 1, 3),
	(12, 'Numa árvore genealógica de classes, a classe mais baixa herda os atributos e métodos somente da superclasse no nível imediatamente acima', 0, 3),
	(13, 'As variáveis de uma classe só podem ser alteradas por métodos definidos nos seus objetos', 0, 3),
	(14, 'O polimorfismo se caracteriza quando, para mensagens distintas, objetos diferentes responderem ou agirem de forma idêntica', 0, 3),
	(15, 'Os objetos de uma classe são idênticos no que se refere à sua interface e ao seu estado', 0, 3),
	(16, 'Interação', 0, 4),
	(17, 'Estado', 0, 4),
	(18, 'Colaboração', 0, 4),
	(19, 'Classe', 1, 4),
	(20, 'Sequência', 0, 4),
	(21, 'Se e Então', 1, 5),
	(22, 'Informação e Então', 0, 5),
	(23, 'Se e 10', 0, 5),
	(24, 'Informação e 10', 0, 5),
	(25, 'Nenhuma das alternativas', 0, 5),
	(26, 'Possuir código aberto', 0, 6),
	(27, 'Ser compilada', 0, 6),
	(28, 'Ser executada no lado do servidor', 1, 6),
	(29, 'Ser multiplataforma', 0, 6),
	(30, 'Possibilitar acesso a banco de dados por ODBC', 0, 6),
	(31, 'Flash', 0, 7),
	(32, 'Silverlight', 0, 7),
	(33, 'HTML', 0, 7),
	(34, 'CSS', 0, 7),
	(35, 'PHP', 1, 7),
	(36, 'Public', 0, 8),
	(37, 'Private', 1, 8),
	(38, 'Comum', 0, 8),
	(39, 'Void', 0, 8),
	(40, 'Protected', 0, 8),
	(41, 'Herança', 0, 9),
	(42, 'Polimorfismo', 0, 9),
	(43, 'Paralelismo', 0, 9),
	(44, 'Sobrecarga', 1, 9),
	(45, 'Nenhuma das alternativas', 0, 9),
	(46, 'GATO é um objeto. Tem como métodos andar, correr e pular, comer ração', 1, 10),
	(47, 'Ter 2 anos, andar e correr são instâncias do objeto GATO', 0, 10),
	(48, 'GATO é uma classe pois há outros GATO que tem idade diferente', 0, 10),
	(49, 'Andar, correr e pular, são objetos que podem ter como variável O GATO', 0, 10),
	(50, 'Nenhuma das alternativas', 0, 10);
/*!40000 ALTER TABLE `alternative` ENABLE KEYS */;

-- Copiando estrutura para tabela quiz.game
CREATE TABLE IF NOT EXISTS `game` (
  `gameId` int(11) NOT NULL AUTO_INCREMENT,
  `playerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`gameId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela quiz.game: 0 rows
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` (`gameId`, `playerId`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;

-- Copiando estrutura para tabela quiz.history
CREATE TABLE IF NOT EXISTS `history` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `result` int(11) DEFAULT NULL,
  `game` int(11) DEFAULT NULL,
  `playerId` int(11) NOT NULL,
  PRIMARY KEY (`historyId`),
  KEY `playerId` (`playerId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela quiz.history: 0 rows
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`historyId`, `result`, `game`, `playerId`) VALUES
	(1, 6, 1, 1),
	(2, 7, 2, 2),
	(3, 8, 3, 3),
	(4, 9, 4, 4),
	(5, 10, 5, 5);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- Copiando estrutura para tabela quiz.player
CREATE TABLE IF NOT EXISTS `player` (
  `playerId` int(11) NOT NULL AUTO_INCREMENT,
  `playerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateGame` datetime DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  UNIQUE KEY `playerName` (`playerName`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela quiz.player: 0 rows
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`playerId`, `playerName`, `dateGame`) VALUES
	(1, 'Ricardo Mota', '2017-06-03 18:43:10'),
	(2, 'Guilherme Barndão', '2017-06-03 18:44:10'),
	(3, 'Jhonny Messias', '2017-06-03 18:45:10'),
	(4, 'Tatiana Guilher', '2017-06-03 18:48:10'),
	(5, 'Sati Anjo', '2017-06-03 18:49:10');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;

-- Copiando estrutura para tabela quiz.question
CREATE TABLE IF NOT EXISTS `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela quiz.question: 10 rows
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`questionId`, `description`) VALUES
	(1, 'Se um profissional está criando um site em HTML e ele quiser colocar uma barra horizontal em sua página, qual tag ele deve usar?'),
	(2, 'Na linguagem PHP, $_REQUEST se refere a um array associativo'),
	(3, 'Sobre orientação a objetos é correto afirmar:'),
	(4, 'Na Orientação a Objetos, um diagrama que retrata uma série de elementos estáticos, suas associações, estruturas de superclasse e outros inter-relacionamentos estáticos é denominado diagrama de:'),
	(5, '"IF" e "THEN" significam:'),
	(6, 'Não são características da linguagem PHP as abaixo relacionadas, EXCETO:'),
	(7, 'Assinale a alternativa que indica a linguagem de programação que é considerada uma linguagem Server Side (processadas diretamente pelo servidor Web). '),
	(8, 'Para que um atributo seja visível apenas dentro da classe, ele precisa ser do tipo:'),
	(9, 'Qual é o nome do recurso em orientação a objetos que permite ao programador criar vários métodos com o mesmo nome, desde que tenham parâmetros diferentes?'),
	(10, 'Dentro do paradigma da orientação a objeto, para o enunciado abaixo, assinale a alternativa correta.  ');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
