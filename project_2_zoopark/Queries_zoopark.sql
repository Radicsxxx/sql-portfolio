--1. Kter�ho roku se narodil nej�ast�ji nemocn� expon�t?

SELECT EXPONAT,JMENO,ROK_NAR
FROM
(
SELECT EXPONAT,JMENO,ROK_NAR,COUNT(EXPONAT)AS POCET
FROM NEMOCI2
INNER JOIN EXPONATY2
ON NEMOCI2.EXPONAT=EXPONATY2.INV_CIS
GROUP BY EXPONAT,JMENO,ROK_NAR
)  
WHERE POCET= (SELECT MAX(pocet)
FROM
(
SELECT EXPONAT,JMENO,ROK_NAR,COUNT(EXPONAT)AS POCET
FROM NEMOCI2
INNER JOIN EXPONATY2
ON NEMOCI2.EXPONAT=EXPONATY2.INV_CIS
GROUP BY EXPONAT,JMENO,ROK_NAR
))


--2. A kter�ho roku jeho o�et�ovatel?

SELECT JMENO|| ' ' ||PRIJMENI as celeJmeno,ROK_NAR
FROM
(
SELECT OSETROVATELE2.PRIJMENI,OSETROVATELE2.JMENO,OSETROVATELE2.ROK_NAR,COUNT(NEMOCI2.EXPONAT)AS POCET
FROM NEMOCI2
INNER JOIN EXPONATY2
ON NEMOCI2.EXPONAT=EXPONATY2.INV_CIS
INNER JOIN  OSETROVATELE2
ON EXPONATY2.OSETROVATEL=OSETROVATELE2.OS_CIS
GROUP BY EXPONATY2.ROK_NAR,OSETROVATELE2.PRIJMENI,OSETROVATELE2.JMENO,OSETROVATELE2.ROK_NAR
)  
WHERE pocet = (SELECT max(pocet)
FROM
(
SELECT OSETROVATELE2.PRIJMENI,OSETROVATELE2.JMENO,OSETROVATELE2.ROK_NAR,COUNT(NEMOCI2.EXPONAT)AS POCET
FROM NEMOCI2
INNER JOIN EXPONATY2
ON NEMOCI2.EXPONAT=EXPONATY2.INV_CIS
INNER JOIN  OSETROVATELE2
ON EXPONATY2.OSETROVATEL=OSETROVATELE2.OS_CIS
GROUP BY EXPONATY2.ROK_NAR,OSETROVATELE2.PRIJMENI,OSETROVATELE2.JMENO,OSETROVATELE2.ROK_NAR
)) 
    
    
--3. Kolik zaplatila Zoo jednotliv�m veterin���m za l��en� hroch�?

SELECT pocet*sazba_den,cele_jmeno
FROM
(
SELECT sum(dni)as pocet,jmeno ||' ' ||prijmeni as cele_jmeno,sazba_den
FROM
(
SELECT exponaty2.inv_cis,nemoci2.dni,nemoci2.veterinar,veterinari2.sazba_den,
veterinari2.jmeno,veterinari2.prijmeni
FROM EXPONATY2
INNER JOIN NEMOCI2
ON exponaty2.inv_cis=NEMOCI2.EXPONAT
left JOIN  veterinari2
ON nemoci2.veterinar=veterinari2.ident
WHERE DRUH='Hroch'
)
group by jmeno,prijmeni,sazba_den
)

--4. Na l��en� kter�ho expon�tu zaplatila Zoo nejv�ce?
SELECT utrata_za_zvire,JMENO
FROM
(
SELECT SUM(dni*sazba_den)AS utrata_za_zvire, jmeno
FROM
(
SELECT exponaty2.inv_cis,nemoci2.dni,nemoci2.veterinar,veterinari2.sazba_den,
exponaty2.jmeno
FROM EXPONATY2
INNER JOIN NEMOCI2
ON exponaty2.inv_cis=NEMOCI2.EXPONAT
left JOIN  veterinari2
ON nemoci2.veterinar=veterinari2.ident
)
GROUP BY  jmeno
)
WHERE utrata_za_zvire=(SELECT MAX(utrata_za_zvire)
FROM
(
SELECT SUM(dni*sazba_den)AS utrata_za_zvire, jmeno
FROM
(
SELECT exponaty2.inv_cis,nemoci2.dni,nemoci2.veterinar,veterinari2.sazba_den,
exponaty2.jmeno
FROM EXPONATY2
INNER JOIN NEMOCI2
ON exponaty2.inv_cis=NEMOCI2.EXPONAT
left JOIN  veterinari2
ON nemoci2.veterinar=veterinari2.ident
)
GROUP BY  jmeno
)
)
--5. Kter� expon�t nebyl v Zoo v�bec l��en?
SELECT *FROM  EXPONATY2
WHERE NOT EXISTS
(
SELECT *
FROM NEMOCI2
WHERE EXPONATY2.INV_CIS=NEMOCI2.EXPONAT
)

--6. Jak� vzd�l�n� maj� o�et�ovatel� expon�t�, kter� l��il nejdra��� veterin��?
SELECT jmeno ||' '||prijmeni as cele_jmeno,vzdelani FROM 
(
SELECT osetrovatele2.jmeno, osetrovatele2.prijmeni, osetrovatele2.vzdelani 
FROM VETERINARI2
INNER JOIN nemoci2 ON
nemoci2.veterinar=VETERINARI2.IDENT
inner join exponaty2 ON
nemoci2.exponat=exponaty2.inv_cis
left JOIN osetrovatele2 ON 
exponaty2.osetrovatel=osetrovatele2.os_cis
WHERE sazba_den=
(
SELECT MAX(sazba_den)
FROM 
(
SELECT * FROM VETERINARI2
INNER JOIN nemoci2 ON
nemoci2.veterinar=VETERINARI2.IDENT
inner join exponaty2 ON
nemoci2.exponat=exponaty2.inv_cis
left JOIN osetrovatele2 ON 
exponaty2.osetrovatel=osetrovatele2.os_cis
)
)
)
GROUP BY jmeno,prijmeni,vzdelani




















SELECT vzdelani FROM 
(
SELECT * FROM VETERINARI2
INNER JOIN nemoci2 ON
nemoci2.veterinar=VETERINARI2.IDENT
inner join exponaty2 ON
nemoci2.exponat=exponaty2.inv_cis
left JOIN osetrovatele2 ON 
exponaty2.osetrovatel=osetrovatele2.os_cis
WHERE sazba_den=
(
SELECT MAX(sazba_den)
FROM 
(
SELECT * FROM VETERINARI2
INNER JOIN nemoci2 ON
nemoci2.veterinar=VETERINARI2.IDENT
inner join exponaty2 ON
nemoci2.exponat=exponaty2.inv_cis
left JOIN osetrovatele2 ON 
exponaty2.osetrovatel=osetrovatele2.os_cis
)
)
)








