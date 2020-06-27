CREATE TABLE TDESCONTO (
CLASSE VARCHAR(2),
INFERIOR INTEGER,
SUPERIOR INTEGER
);


SELECT * FROM TDESCONTO;


INSERT INTO TDESCONTO(CLASSE, INFERIOR, SUPERIOR)
VALUES('&cla', &inf, &sup);

SELECT * FROM TDESCONTO
WHERE CLASSE = '&cla'

UPDATE tdesconto SET
inferior = '&inf',
superior = '&sup'
WHERE classe = '&cla';

----------------------------------------------------------------------

CREATE TABLE tdesconto2
 AS SELECT * FROM tdesconto;

 SELECT * FROM tdesconto2;

 COMMIT;


 -- transação (commit/rollback)

 DELETE FROM tdesconto2;

 TRUNCATE TABLE tdesconto2;

 ROLLBACK;

