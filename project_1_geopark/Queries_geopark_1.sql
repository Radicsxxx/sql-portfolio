--· 1. Kolik úèastníkù se pøihlásilo na jednotlivé zájezdy? 

SELECT COUNT(PRIJMENI), KOD,LOKALITA FROM UCASTNICI
INNER JOIN ZAJEZDY ON UCASTNICI.ZAJEZD= ZAJEZDY.KOD
GROUP BY KOD,LOKALITA

--2 Kolik je vybráno celkem na zálohách? 

SELECT SUM(ZALOHA), ZAJEZD FROM UCASTNICI
GROUP BY ZAJEZD

--3. Kolik ještì doplatí úèastníci v jednotlivých zájezdech? 

--DOPLATEK JEDNOTLIVYCH UCASTNIKU
SELECT LOKALITA,KOD,(CENA-ZALOHA)AS ZBYVA_DOPLATIT, prijmeni FROM ZAJEZDY
INNER JOIN UCASTNICI ON zajezdy.kod=UCASTNICI.ZAJEZD

--DOPLATEK CELKEM
SELECT SUM(CENA-ZALOHA)AS DOPLATEK FROM ZAJEZDY
INNER JOIN UCASTNICI ON zajezdy.kod=UCASTNICI.ZAJEZD

--DOPLATEK NA JEDNOTLIVYCH ZAJEZDECH
SELECT SUM(CENA-ZALOHA)AS DOPLATEK,KOD,ZAJEZD,COUNT(PRIJMENI) FROM ZAJEZDY
INNER JOIN UCASTNICI ON zajezdy.kod=UCASTNICI.ZAJEZD
GROUP BY KOD,ZAJEZD

--4. Kolik rokù je nejstaršímu pøihlášenému muži? 
select  max(vek) from(
    SELECT round(((sysdate-Datum_narozeni)/365),2) as vek, prijmeni from ucastnici
)

select prijmeni, round(((sysdate-datum_narozeni)/365),2) from ucastnici where datum_narozeni=(
SELECT min(datum_narozeni) from ucastnici);

--5. Který zájezd je ztrátový? 

SELECT ZAJEZD, ((SUM(CENA)/10)-REZIE) FROM UCASTNICI
INNER JOIN ZAJEZDY ON ucastnici.zajezd=zajezdy.kod
GROUP BY ZAJEZD,REZIE
--