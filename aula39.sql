DECLARE
 VVALOR NUMBER(8, 2);
 VNOME VARCHAR2(30);
BEGIN

    SELECT VALOR, NOME
    INTO VVALOR, VNOME
    FROM TCURSO
    WHERE COD_CURSO = &COD_CURSO;
     Dbms_Output.Put_Line('VALOR: ' || To_Char(VVALOR, 'fm9999.99'));

     Dbms_Output.Put_Line('CURSO: ' || InitCap(VNOME));
END;

SELECT * FROM TCURSO;

SELECT * FROM tcontrato;

SELECT Max(cod_contrato) FROM tcontrato
CREATE SEQUENCE seq_contrato START WITH 8;


DECLARE
  vCod tcontrato.cod_contrato%TYPE;
BEGIN
  SELECT seq_contrato.nextval
  INTO vcod FROM dual;

  INSERT INTO tcontrato(cod_contrato, data, cod_aluno, desconto)
  VALUES (vcod, SYSDATE, 2, null);

  Dbms_Output.Put_Line('Criado contrato: ' || vcod);
END;

-- pegar o valor corrente
SELECT seq_contrato.currval FROM dual;


DECLARE
 vValor TCurso.Valor%TYPE := &Valor;
BEGIN
  UPDATE TCurso SET
  valor = valor + vValor
  WHERE carga_horaria >= 30;
END;


DECLARE
   vContrato NUMBER := &cod_contrato;
   vTexto VARCHAR2(50);
BEGIN

    UPDATE tcontrato SET
    desconto = desconto + 2
    WHERE cod_contrato >= vContrato;

    vTexto := SQL%ROWCOUNT;
  -- Retorna a quantidade de registros afetados pelo comando SQL

  Dbms_Output.Put_Line(vTexto || ' linhas atualizadas');
END;

COMMIT;



