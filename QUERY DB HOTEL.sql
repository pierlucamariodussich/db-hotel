-- Seleziona tutti gli ospiti che sono stati identificati con la carta di identità

SELECT* FROM ospiti WHERE document_type = "CI";

-- Seleziona tutti gli ospiti che sono nati dopo il 1988

SELECT* FROM ospiti WHERE date_of_birth > '1988-12-31';

-- Seleziona tutti gli ospiti che hanno più di 20 anni (al momento dell’esecuzione della query

SELECT* FROM ospiti WHERE TIMESTAMPDIFF(YEAR,date_of_birth,CURRENT_DATE) > 20 ;

-- Seleziona tutti gli ospiti il cui nome inizia con la D

SELECT * FROM ospiti WHERE name LIKE "D%" ;

-- Calcola il totale degli ordini accepted

SELECT COUNT(*) FROM pagamenti WHERE status = "accepted" ;

-- Qual è il prezzo massimo pagato?

SELECT  MAX(price) FROM pagamenti;

-- Seleziona gli ospiti riconosciuti con patente e nati nel 1975

SELECT * FROM ospiti WHERE document_type = "Driver License" AND YEAR(date_of_birth) = "1975" ;

-- Quanti paganti sono anche ospiti?

SELECT COUNT(*)  FROM paganti WHERE ospite_id IS NOT NULL ;

-- Quanti posti letto ha l’hotel in totale?

SELECT SUM(beds) FROM stanze;


-- GROUP BY

-- Conta gli ospiti raggruppandoli per anno di nascita

SELECT YEAR(date_of_birth),COUNT(id) FROM ospiti GROUP BY YEAR(date_of_birth);

-- Somma i prezzi dei pagamenti raggruppandoli per status

SELECT status, SUM(price) FROM pagamenti GROUP BY status;

-- Conta quante volte è stata prenotata ogni stanza

SELECT stanza_id, COUNT(stanza_id) FROM prenotazioni GROUP BY stanza_id;

-- Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti ****

SELECT  COUNT(stanza_id) as total_room_hh, stanza_id ; HOUR(created_at) as hh FROM prenotazioni GrOUP BY hh ORDER BY total_room_hh DESC ;

-- Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni?

SELECT ospite_id,COUNT(ospite_id) FROM prenotazioni_has_ospiti GROUP BY ospite_id ORDER BY COUNT(ospite_id) DESC ;

--JOIN

-- Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? 

SELECT ospiti.name, ospiti.lastname, prenotazioni_has_ospiti.ospite_id, COUNT(ospite_id) FROM prenotazioni_has_ospiti JOIN ospiti ON prenotazioni_has_ospiti.ospite_id = ospiti.id GROUP BY ospite_id HAVING COUNT(ospite_id) > 2 ;

-- Stampare tutti gli ospiti per ogni prenotazione

SELECT* FROM prenotazioni_has_ospiti JOIN ospiti ON prenotazioni_has_ospiti.ospite_id = ospiti.id ;

--Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018

SELECT paganti.name, paganti.lastname, pagamenti.price, pagamenti.pagante_id , pagamenti.created_at FROM pagamenti JOIN paganti ON pagamenti.pagante_id = pagante_id WHERE pagamenti.created_at LIKE "2018-05%";

--Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano

SELECT stanze.floor, SUM(price) from pagamenti JOIN prenotazioni ON pagamenti.prenotazione_id = prenotazioni.id JOIN stanze ON prenotazioni.stanza_id=stanze.id GROUP BY stanze.floor HAVING stanze.floor=1 ;

-- Prendi i dati di fatturazione per la prenotazione con id=7

SELECT paganti.name, paganti.lastname, paganti.address, pagamenti.price, pagamenti.prenotazione_id FROM pagamenti JOIN paganti ON pagamenti.pagante_id = paganti.id WHERE prenotazione_id =7 

-- Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate

SELECT prenotazioni.id, prenotazioni.stanza_id, stanze.id FROM prenotazioni RIGHT JOIN stanze ON prenotazioni.stanza_id = stanze.id HAVING prenotazioni.id IS NULL 








