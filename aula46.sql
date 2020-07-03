DECLARE
  vCod taluno.cod_aluno%TYPE := 566;
  vCidade tAluno.cidade%TYPE;
  x NUMBER;
BEGIN

  SELECT cidade INTO vCidade
  FROM taluno
  WHERE cod_aluno = vCod;
  x := 0 / 0;
  Dbms_Output.Put_Line('Cidade: ' || vCidade);
EXCEPTION
  WHEN No_Data_Found THEN
   Raise_Application_Error(-20001, 'Aluno inexistente! '|| SQLCODE ||SQLERRM);
  WHEN too_many_rows THEN
   Raise_Application_Error(-20002, 'Registro duplicado! '|| SQLCODE ||SQLERRM);
  WHEN others THEN
   Raise_Application_Error(-20003, 'Exceção desconhecida! '|| SQLCODE ||SQLERRM);
END;



CREATE TABLE contas
(
  Codigo INTEGER NOT NULL PRIMARY KEY,
  Valor NUMBER(10, 2),
  Juros NUMBER(10, 2),
  Vencimento Date
);

INSERT INTO contas VALUES (100, 550, 50, SYSDATE - 10);

SELECT * FROM contas;

COMMIT;


DECLARE
 vDt_vencimento DATE;
 vConta NUMBER := 100;
 eConta_vencida EXCEPTION;
 BEGIN
     SELECT vencimento INTO vDt_vencimento
     FROM contas WHERE codigo = vConta;
     IF vDt_vencimento < Trunc(sysdate) THEN
       RAISE eConta_vencida;
     END IF;
EXCEPTION
  WHEN eConta_vencida THEN
  Dbms_Output.Put_Line('Conta vencida');
  UPDATE contas SET valor = valor + juros
  WHERE codigo = vConta;
END;

DECLARE
 eFK_inexistente EXCEPTION;
 PRAGMA EXCEPTION_INIT(eFK_inexistente, -2291);
BEGIN

    INSERT INTO tbairro VALUES (100, 100, 'erro');
EXCEPTION
 WHEN eFK_inexistente THEN
  Raise_Application_Error(-20200, 'Cidade não existe');
END;


SELECT * FROM tbairro;
SELECT * FROM tcidade;




