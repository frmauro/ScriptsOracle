--Especificação ou declaração
CREATE OR REPLACE PACKAGE PKG_ALUNO
IS
  vCidade varchar2(30); --Variaveis publicas
  vMedia  number(8, 2); --Variaveis publicas
  vNome VARCHAR2(30);  -- Variaveis publicas
  PROCEDURE DELETA_ALUNO(pCOD_ALUNO NUMBER);
  PROCEDURE MEDIA_CONTRATOS;
  PROCEDURE CON_ALUNO(pCOD_ALUNO NUMBER);
END;


--Corpo
CREATE OR REPLACE PACKAGE BODY PKG_ALUNO
IS

  --variaveis locais
  vTeste VARCHAR(20);

  PROCEDURE MEDIA_CONTRATOS
  IS
  BEGIN
    vTeste := 'teste';
    SELECT Avg(total) INTO vMedia FROM tcontrato;
  END;

  PROCEDURE CON_ALUNO(pCOD_ALUNO NUMBER)
  IS
  BEGIN
    vNome := '';
    SELECT  nome INTO vNome FROM taluno
    WHERE  COD_ALUNO = pCOD_ALUNO;
    EXCEPTION
     WHEN No_Data_Found THEN
      Dbms_Output.Put_Line('Aluno não existe');
  END;



  PROCEDURE DELETA_ALUNO(pCOD_ALUNO NUMBER)
  IS
  BEGIN
    CON_ALUNO(pCOD_ALUNO);
      IF Length(vNome) > 0 THEN
        DELETE FROM taluno WHERE cod_aluno = pCOD_ALUNO;
        Dbms_Output.Put_Line(vNome||'->Excluido');
      END IF;
  END;

END;
-- fim do package

COMMIT;

EXEC PKG_ALUNO.DELETA_ALUNO(60);

SELECT * FROM taluno;


DECLARE
 m NUMBER;
BEGIN
   PKG_ALUNO.MEDIA_CONTRATOS; --Executa a procedure
   m := PKG_ALUNO.vMedia;
   Dbms_Output.Put_Line('Media: '||m);
END;


DECLARE
 nome VARCHAR(30);
BEGIN
   PKG_ALUNO.CON_ALUNO(60); --Executa a procedure
   nome := PKG_ALUNO.vNome;
   Dbms_Output.Put_Line('Nome: '||nome);
END;

--ROLLBACK;