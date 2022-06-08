CREATE DATABASE DesafioGrupo4;
USE DesafioGrupo4;

CREATE TABLE tbReinos(
	idReinos INT PRIMARY KEY AUTO_INCREMENT,
    nomeReino VARCHAR(45),
    populacaoReino BIGINT,
    racaReino VARCHAR(45)
);

CREATE TABLE tbRei(
	idRei INT PRIMARY KEY AUTO_INCREMENT,
    fkReino INT,
	FOREIGN KEY (fkReino) REFERENCES tbReinos(idReinos),
    nomeRei VARCHAR(45),
    idadeRei INT,
    inicioReinado DATE
);

CREATE TABLE tbExercito(
	idExercito INT PRIMARY KEY AUTO_INCREMENT,
	fkReinos INT,
	FOREIGN KEY (fkReinos) REFERENCES tbReinos(idReinos),
    nomeExercito VARCHAR(45),
    corUniforme VARCHAR(45)
);

CREATE TABLE tbGuerreiros(
	idGuerreiros INT PRIMARY KEY AUTO_INCREMENT,
	fkExercito INT,
	FOREIGN KEY (fkExercito) REFERENCES tbExercito(idExercito),
	fkMestre INT,
	FOREIGN KEY (fkMestre) REFERENCES tbGuerreiros(idGuerreiros),
    nomeGuerreiro VARCHAR(45),
    classeGuerreiro VARCHAR(45),
    vidaGuerreiro BIGINT,
    ataqueGuerreiro FLOAT,
    magiaGuerreiro FLOAT,
    defesaGuerreiro FLOAT
);

CREATE TABLE tbPoderes(
	idPoderes INT PRIMARY KEY AUTO_INCREMENT,
    nomePoder VARCHAR(45),
    elementoPoder VARCHAR(45),
    criticidadePoder FLOAT
);

CREATE TABLE tbArmas(
	idArmas INT PRIMARY KEY AUTO_INCREMENT,
    nomeArma VARCHAR(45),
    tipoArma VARCHAR(45),
    alcanceArma CHAR(45),
    CHECK (alcanceArma = 'Curto' OR alcanceArma = 'Médio' OR alcanceArma = 'Longo'),
    criticidadeArma FLOAT,
    precoArma DECIMAL(5,2)
);

CREATE TABLE tbGuerreirosArmas(
	fkGuerreiros INT,
    FOREIGN KEY (fkGuerreiros) REFERENCES tbGuerreiros(idGuerreiros),
	fkArmas INT,
	FOREIGN KEY (fkArmas) REFERENCES tbArmas(idArmas)
);

CREATE TABLE tbGuerreirosPoderes(
	fkGuerreiros INT,
	FOREIGN KEY (fkGuerreiros) REFERENCES tbGuerreiros(idGuerreiros),
	fkPoderes INT,
	FOREIGN KEY (fkPoderes) REFERENCES tbPoderes(idPoderes)
);

SELECT * FROM tbReinos;
SELECT * FROM tbRei;
SELECT * FROM tbExercito;
SELECT * FROM tbGuerreiros;
SELECT * FROM tbPoderes;
SELECT * FROM tbArmas;
SELECT * FROM tbGuerreirosArmas;
SELECT * FROM tbGuerreirosPoderes;

INSERT INTO tbReinos
VALUES (NULL,'NormenGarden','3000000','Humanos'),
		(NULL,'Vale dos Elfos','2000','Elfo'),
        (NULL,'Reino do Submundo','35000','Orc');
        
INSERT INTO tbRei
VALUES (NULL,'3','Alex Barrera','25','1990-05-21'),
		(NULL,'2','Marcelo Rosim','36','1987-09-17'),
        (NULL,'1','Fernanda Caramico','100','1776-12-25');
        
INSERT INTO tbExercito
VALUES (NULL,'1','Casa Stark','Preto'),
		(NULL,'2','Sparta','Cinza'),
		(NULL,'2','Elfos Ousados','Vermelho'),
        (NULL,'1','Mindinos','Verde'),
        (NULL,'1','Sleet','Marrom'),
        (NULL,'3','Hell','Branco');
        
INSERT INTO tbGuerreiros
VALUES (NULL,'1',NULL,'Marcinho Carioca','Cavaleiro','500','88.50','20.32','998'),
		(NULL,'3',NULL,'Leleto','Curandeiro','450','8.50','40.54','234'),
        (NULL,'2',NULL,'Mariazinha','Lanceira','300','20','16.76','3543'),
        (NULL,'6',NULL,'Ariel','Mago','350','15.45','70.89','134'),
        (NULL,'2','3','Paulete','Arqueiro','400','40.79','18.34','42'),
        (NULL,'4',NULL,'Xamate','Curandeiro','250','9.3','84.76','1353'),
        (NULL,'5',NULL,'Sir Kauan','Cavaleiro','200','90.43','13.54','335'),
        (NULL,'1','1','Bits','Mago','100','20.21','87.54','4532'),
        (NULL,'3','2','Jhonny Depp','Arqueiro','150','50.23','23.3','2345'),
        (NULL,'6','4','Ronald Plates','Lanceiro','230','21.45','21.4','4122'),
        (NULL,'3','2','Lucas Penalva','Mago','170','17.89','90.56','113'),
        (NULL,'2','3','Fio Puts','Cavaleiro','460','95.32','34.4','45652');
        
INSERT INTO tbPoderes
VALUES (NULL,'Bola de Fogo','Fogo','70'),
		(NULL,'Invisibilidade','Sombra','30'),
        (NULL,'Cura Feridas','Luz','0'),
        (NULL,'Teletransporte','Ar','20');
        
INSERT INTO tbArmas
VALUES (NULL,'Adaga Venenosa','Faca','Curto','60','250.50'),
		(NULL,'Katana','Espada','Curto','80','300.45'),
        (NULL,'Aegis','Escudo','Curto','0','320.99'),
        (NULL,'Furador','Lança','Médio','50','400.35'),
        (NULL,'Puxador','Arco e Flecha','Longo','45','210.89');
        
INSERT INTO tbGuerreirosArmas
VALUES ('1','2'),
		('1','3'),
		('2','1'),
        ('3','4'),
        ('5','5'),
        ('6','1'),
        ('7','2'),
        ('7','3'),
        ('9','5'),
        ('10','4'),
        ('12','2'),
        ('12','3');
        
INSERT INTO tbGuerreirosPoderes
VALUES ('2','3'),
        ('2','4'),
        ('4','1'),
        ('4','2'),
        ('4','3'),
        ('6','3'),
		('8','1'),
        ('8','2'),
        ('11','1'),
        ('11','3');
