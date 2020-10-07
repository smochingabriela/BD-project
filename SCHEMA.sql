DROP TABLE studenti_asm1 cascade constraints;
DROP TABLE cursuri_asm cascade constraints;
DROP TABLE profesori_asm cascade constraints;
DROP TABLE evenimente_asm cascade constraints;
DROP TABLE sali_asm cascade constraints;
DROP TABLE note_asm cascade constraints;
DROP TABLE didactic_asm cascade constraints;

CREATE TABLE studenti_asm1(
  id_student VARCHAR2(10) primary key,
  nume VARCHAR2(10),
  prenume VARCHAR2(10),
  an NUMBER(1),
  grupa CHAR(2),
  bursa NUMBER(6,2),
  data_nastere DATE
  );

CREATE TABLE cursuri_asm(
  id_curs VARCHAR2(10) primary key,
  titlu_curs VARCHAR2(15),
  an NUMBER(1),
  semestru NUMBER(1),
  credite NUMBER(2)
  );
  
CREATE TABLE note_asm(
  id_student VARCHAR2(10) references studenti_asm1(id_student),
  id_curs VARCHAR2(10) references cursuri_asm(id_curs),
  nota NUMBER(2),
  data_notare DATE,
  primary key(id_student,id_curs,data_notare)
  );

CREATE TABLE profesori_asm(
  id_prof VARCHAR2(10) primary key,
  nume VARCHAR2(20),
  prenume VARCHAR(20),
  grad_didactic VARCHAR2(5)
  );

CREATE TABLE didactic_asm(
  id_prof VARCHAR2(10) references profesori_asm(id_prof),
  id_curs VARCHAR2(10) references cursuri_asm(id_curs),
  primary key(id_prof,id_curs)
  );
  
CREATE TABLE sali_asm(
  nume_sala VARCHAR2(10) primary key,
  etaj VARCHAR2(20)
);


CREATE TABLE evenimente_asm(
    id_eveniment VARCHAR2(10) primary key,
    nume_eveniment VARCHAR2(50),
    locatie VARCHAR2(15),
    data_eveniment DATE,
    nr_participanti number(5)
);

INSERT INTO studenti_asm1 VALUES ('111', 'Popescu', 'Bogdan',3, 'A3',670, TO_DATE('17/02/1991', 'dd/mm/yyyy'));
INSERT INTO studenti_asm1 VALUES ('112', 'Prelipcean', 'Radu',2, 'A2',NULL, TO_DATE('26/05/1995', 'dd/mm/yyyy'));
INSERT INTO studenti_asm1 VALUES ('113', 'Antonie', 'Ioana',2, 'B2',450, TO_DATE('3/01/1997', 'dd/mm/yyyy'));
INSERT INTO studenti_asm1 VALUES ('114', 'Arhire', 'Raluca',1, 'A1',NULL, TO_DATE('26/12/1999', 'dd/mm/yyyy'));
INSERT INTO studenti_asm1 VALUES ('115', 'Panaite', 'Alexandru',3, 'B3',NULL, TO_DATE('13/04/1992', 'dd/mm/yyyy'));

INSERT INTO cursuri_asm VALUES ('21', 'Logica', 1, 1, 3);
INSERT INTO cursuri_asm VALUES ('22', 'Analiza', 3, 1, 4);
INSERT INTO cursuri_asm VALUES ('23', 'POO', 2, 2, 5);
INSERT INTO cursuri_asm VALUES ('24', 'BD', 2, 1, 5);
INSERT INTO cursuri_asm VALUES ('25', 'LFA', 2, 2, 5);
INSERT INTO cursuri_asm VALUES ('26', 'Algebra', 2, 2, 5);
INSERT INTO cursuri_asm VALUES ('27', 'Geometrie', 3, 1, 5);
INSERT INTO cursuri_asm VALUES ('28', 'SDA', 3, 1, 6);


INSERT INTO profesori_asm VALUES ('p1', 'Masalagiu', 'Cristian', 'Prof');
INSERT INTO profesori_asm VALUES ('p2', 'Buraga', 'Sabin', 'Conf');
INSERT INTO profesori_asm VALUES ('p3', 'Lucanu', 'Dorel', 'Prof');
INSERT INTO profesori_asm VALUES ('p4', 'Tiplea', 'Laurentiu', 'Prof');
INSERT INTO profesori_asm VALUES ('p5', 'Iacob', 'Florin', 'Lect');
INSERT INTO profesori_asm VALUES ('p6', 'Breaban', 'Mihaela', 'Conf');
INSERT INTO profesori_asm VALUES ('p7', 'Varlan', 'Cosmin', 'Lect');
INSERT INTO profesori_asm VALUES ('p8', 'Frasinaru', 'Cristian', 'Prof');
INSERT INTO profesori_asm VALUES ('p9', 'Ciobaca', 'Stefan', 'Conf');


INSERT INTO didactic_asm VALUES ('p1','21');
INSERT INTO didactic_asm VALUES ('p9','21');
INSERT INTO didactic_asm VALUES ('p5','22');
INSERT INTO didactic_asm VALUES ('p3','23');
INSERT INTO didactic_asm VALUES ('p6','24');
INSERT INTO didactic_asm VALUES ('p7','24');
INSERT INTO didactic_asm VALUES ('p8','25');
INSERT INTO didactic_asm VALUES ('p2','26');
INSERT INTO didactic_asm VALUES ('p4','27');
INSERT INTO didactic_asm VALUES ('p7','28');

INSERT INTO note_asm VALUES ('111', '22',  8, TO_DATE('17/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('111', '27',  9, TO_DATE('19/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('112', '23',  7, TO_DATE('25/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('113', '25',  9, TO_DATE('17/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('113', '26',  9, TO_DATE('19/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('114', '21',  9, TO_DATE('19/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('115', '28', 10, TO_DATE('17/02/2020', 'dd/mm/yyyy'));
INSERT INTO note_asm VALUES ('115', '22',  7, TO_DATE('19/02/2020', 'dd/mm/yyyy'));

INSERT INTO sali_asm VALUES ('9','parter');
INSERT INTO sali_asm VALUES ('120','unu');
INSERT INTO sali_asm VALUES ('215','doi');
INSERT INTO sali_asm VALUES ('108','unu');
INSERT INTO sali_asm VALUES ('317','trei');

INSERT INTO evenimente_asm VALUES ('1','KMD','120', TO_DATE('13/03/2020','dd/mm/yyyy'),56);
INSERT INTO evenimente_asm VALUES ('2','CodeCamp','9', TO_DATE('24/03/2020','dd/mm/yyyy'),120);
INSERT INTO evenimente_asm VALUES ('3','Catalyst','317', TO_DATE('05/03/2020','dd/mm/yyyy'),98);
INSERT INTO evenimente_asm VALUES ('4','Stagii pe bune','120', TO_DATE('18/03/2020','dd/mm/yyyy'),320);
INSERT INTO evenimente_asm VALUES ('5','Meeting Google','108', TO_DATE('02/03/2020','dd/mm/yyyy'),100);
commit;
