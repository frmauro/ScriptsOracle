DECLARE
    HORA VARCHAR2(2);
    H NUMBER;
  BEGIN
    H := To_Number(To_Char(SYSDATE, 'HH24'));
    Dbms_Output.Put_Line(H||'   '||To_Char(SYSDATE+2, 'DAY'));
  END;

  BEGIN
    IF (To_Char(SYSDATE, 'DAY') IN ('SáBADO', 'DOMINGO') OR
        To_Number(To_Char(SYSDATE, 'HH24'))  NOT BETWEEN 8 AND 18) THEN
        Raise_Application_Error(-20001,'Fora do horario comercial');
    END IF;
  END;

END;




CREATE OR REPLACE TRIGGER VALIDA_HORARIO_CURSO
BEFORE INSERT OR DELETE ON TCONTRATO
 BEGIN
   IF (To_Char(SYSDATE, 'D') IN (1, 7) OR
     To_Number(To_Char(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 10) THEN
     Raise_Application_Error(-20001,'Fora horario comercial');
   END IF;
 END;


INSERT INTO tcontrato VALUES (7666, SYSDATE, 10, 1500, null);

SELECT * FROM tcontrato;


CREATE TABLE LOG
(
  usuario VARCHAR2(30),
  horario DATE,
  valor_antigo VARCHAR2(10),
  valor_novo VARCHAR2(10)
);


CREATE OR REPLACE TRIGGER gera_log_alt
AFTER UPDATE OF TOTAL ON tcontrato
DECLARE
-- variaveis se houver
BEGIN
  INSERT INTO Log(usuario, horario) VALUES (USER, SYSDATE);
END;


SELECT * FROM tcontrato;
UPDATE tcontrato SET TOTAL = 5000 WHERE cod_contrato = 1;

SELECT * FROM Log;


CREATE OR REPLACE TRIGGER valida_horario_curso2
BEFORE INSERT OR UPDATE OR DELETE ON tcontrato
BEGIN

   IF (To_Char(SYSDATE, 'D') IN (1, 7) OR
     To_Number(To_Char(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 10) THEN
      IF ( INSERTING ) THEN
        Raise_Application_Error(-20001,'Não pode inserir');
      ELSIF ( DELETING ) THEN
        Raise_Application_Error(-20002,'Não pode deletar');
      ELSIF ( UPDATING('TOTAL') ) THEN
        Raise_Application_Error(-20003,'Não pode alterar total');
      ELSE
        Raise_Application_Error(-20004,'Não pode alterar');
      END IF;
   END IF;
END;

ALTER TRIGGER VALIDA_HORARIO_CURSO DISABLE;

update tcontrato SET TOTAL = 5000 WHERE cod_contrato = 1;

ALTER TABLE Log ADD OBS VARCHAR(80);

ALTER TABLE taluno ADD SALARIO NUMERIC(12,2);

CREATE OR REPLACE TRIGGER audita_aluno
AFTER INSERT OR DELETE OR UPDATE ON taluno
FOR EACH ROW --Executa para cada linha afetada
              -- sem o for each executa somente uma vez
BEGIN
    IF ( DELETING ) THEN
      INSERT INTO Log (usuario, horario, obs )
      VALUES (USER, SYSDATE, 'linhas deletadas...' );
    ELSIF ( INSERTING ) THEN
      INSERT INTO Log (usuario, horario, obs )
      VALUES (USER, SYSDATE, 'linhas inseridas...' );
    ELSIF ( UPDATING('SALARIO') ) THEN
      INSERT INTO Log VALUES (:OLD.NOME, SYSDATE, :OLD.salario  , :NEW.salario, 'alterado salario');
    ELSE
      INSERT INTO Log (usuario, horario, obs )
      VALUES (USER, SYSDATE, 'Atualização do aluno' );
    END IF;
END;

UPDATE taluno SET salario = 3000;
SELECT * FROM Log;

ALTER TABLE tcontrato ADD valor_comissao NUMERIC(8, 2);

COMMIT;