CREATE OR REPLACE FUNCTION consulta_preco
(pCod_Curso NUMBER) RETURN NUMBER
AS
 vValor NUMBER;
BEGIN
   SELECT valor INTO vValor FROM tcurso
   WHERE cod_curso = pCod_Curso;

   RETURN vValor;
END;

-- teste | Usando a function
DECLARE
 vCod NUMBER := &Codigo;
 vValor NUMBER;
BEGIN

   vValor := consulta_preco(vCod);
   Dbms_Output.Put_Line('Preco do curso: '||vValor);
END;


CREATE OR REPLACE FUNCTION existe_aluno
(pCod_Aluno IN tAluno.cod_aluno%TYPE)
RETURN BOOLEAN
IS
 vAluno NUMBER(10);
BEGIN
  SELECT cod_aluno
  INTO vAluno
  FROM taluno
  WHERE cod_aluno = pCod_Aluno;
  RETURN (TRUE);
  EXCEPTION
   WHEN OTHERS THEN
    RETURN (FALSE);
END;

-- teste
DECLARE
 vCodigo INTEGER := 1;
BEGIN
  IF existe_aluno(vCodigo) THEN
     Dbms_Output.Put_Line('Codigo encontrado');
  ELSE
     Dbms_Output.Put_Line('Codigo não encontrado');
  END IF;
END;

COMMIT;