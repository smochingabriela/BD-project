--1
select nume,prenume,id_student,nota
from studenti_asm1 left join note_asm
using(id_student)
where nota < 9;

--2
select nume,prenume
from profesori_asm
where lower(trim(grad_didactic)) = 'prof';

--3
select nume,id_student
from studenti_asm1
where to_char(data_nastere,'dd') = '26';

--4
select nume,p.id_prof
from profesori_asm p join didactic_asm d                    
on p.id_prof = d.id_prof 
join cursuri_asm cu
on cu.id_curs=d.id_curs
where d.id_curs = '24';

--5
select nume, prenume, bursa, an 
from studenti_asm1 s1 
where bursa >= 
         (select avg(bursa) 
          from studenti_asm1 s2 
          group by an having s1.an = s2.an
         );
         
--6      
select id_eveniment,nume_eveniment
from evenimente_asm 
where locatie = '120' and nr_participanti < 120;

--7
select nume, avg(nvl(nota,0)) 
from studenti_asm1 s, note_asm n 
where s.id_student=n.id_student
group by nume, n.id_student
having avg(nota)>8 
order by avg(nvl(nota,0)) desc;

--8
select * 
from(select s.nume, avg(n.nota) 
from studenti_asm1 s, note_asm n
where s.id_student=n.id_student
group by s.id_student,s.nume 
order by avg(nota) desc) 
where rownum<4;

--9                 
select s1.nume|| ' ' ||  s1.prenume, s2.nume|| ' ' ||s2.prenume, floor(months_between(s1.data_nastere,s2.data_nastere)/12) as "Ani Diferenta"
from studenti_asm1 s1,studenti_asm1 s2 
where s1.id_student<>s2.id_student  and s2.data_nastere<=s1.data_nastere 
order by s1.data_nastere-s2.data_nastere;

--10
select nume, prenume, nota, trim(to_char(data_notare,'month'))||' '|| to_char(data_notare,'yyyy') as "sesiune" 
from studenti_asm1 s, note_asm n 
where s.id_student=n.id_student and nota>=5 
order by "sesiune";

--11
select s.nume ||'-'|| p.nume 
from studenti_asm1 s cross join profesori_asm p 
where length(trim(s.nume))=length(trim(p.nume));

--12
select distinct an, grupa, nume, prenume, nota
from studenti_asm1 s, note_asm n
where s.id_student=n.id_student and (grupa,an,nota) in
          (select grupa, an, max(nota)
           from studenti_asm1 s, note_asm n
           where s.id_student=n.id_student
           group by grupa, an)
order by an, grupa;
 
--13
select nume,data_nastere,cast(floor(add_months(data_nastere, ceil((sysdate-data_nastere)/365)*12)-sysdate) as varchar(23)) as "zile pana la aniversare" 
from studenti_asm1;

--14
select p.nume,p.prenume,c.titlu_curs 
from profesori_asm p, cursuri_asm c, didactic_asm d 
where d.id_curs(+)=c.id_curs and d.id_prof=p.id_prof(+) 
union
select p.prenume,p.prenume,c.titlu_curs 
from profesori_asm p, cursuri_asm c, didactic_asm d 
where d.id_curs=c.id_curs(+) and d.id_prof(+)=p.id_prof;

--15
select concat(lower(substr(nume,1,1)),upper(substr(nume,2))), length(trim(nume)) 
from profesori_asm
where nume like 'B%';


