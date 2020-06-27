SELECT * FROM user_tables;
SELECT * FROM all_tables;
SELECT * FROM user_objects;

CREATE TABLE teste
(
  codigo INTEGER NOT NULL PRIMARY KEY,
  data DATE DEFAULT sysdate
);

INSERT INTO teste (codigo) VALUES (1);
INSERT INTO teste (codigo, data) VALUES (2, sysdate);

SELECT * FROM teste;


CREATE TABLE tcontrato_vip
AS
SELECT * FROM tcontrato WHERE total > 500;

ALTER TABLE tcontrato_vip ADD valor NUMBER(5,2);

ALTER TABLE tcontrato_vip MODIFY valor NUMBER(8,2);

ALTER TABLE tcontrato_vip RENAME COLUMN valor TO valor2;

COMMIT;
