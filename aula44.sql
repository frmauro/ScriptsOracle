DECLARE

  vCod_aluno TAluno.Cod_aluno%TYPE;
  vNome TAluno.nome%TYPE;
  CURSOR c1 IS
  SELECT cod_aluno, nome
  FROM taluno;

BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO vCod_aluno, vNome;
    EXIT WHEN c1%ROWCOUNT >= 10 OR c1%NOTFOUND;
    Dbms_Output.Put_Line('Codigo: ' || LPad(vCod_aluno, 4, '0') || ' - ' || 'Nome: ' || vNome);
  END LOOP;
  CLOSE c1;
END;

DECLARE
  CURSOR c1 IS
     SELECT * FROM taluno;

     Reg c1%ROWTYPE; -- record
BEGIN

  OPEN c1;
  LOOP
           FETCH c1 INTO reg;
           EXIT WHEN c1%ROWCOUNT >= 10 OR c1%NOTFOUND;
           Dbms_Output.Put_Line('Codigo: ' || LPad(reg.cod_aluno, 4, '0') || ' - ' || 'Nome: ' || reg.nome);
  END LOOP;
  CLOSE c1;

END;



DECLARE
  CURSOR c1 IS
     SELECT * FROM taluno;
     Reg c1%ROWTYPE; -- record
BEGIN
   FOR reg IN c1
   LOOP
           Dbms_Output.Put_Line('Codigo: ' || LPad(reg.cod_aluno, 4, '0') || ' - ' || 'Nome: ' || reg.nome);
   END LOOP;
END;



DECLARE
     Reg TAluno%ROWTYPE; -- record
BEGIN
   FOR reg IN (SELECT * FROM taluno)
   LOOP
           Dbms_Output.Put_Line('Codigo: ' || LPad(reg.cod_aluno, 4, '0') || ' - ' || 'Nome: ' || reg.nome);
   END LOOP;
END;


DECLARE
   CURSOR c1 (pCod_Aluno number) IS
   SELECT * FROM TAluno
   WHERE Cod_aluno = pCod_aluno
   FOR UPDATE OF nome NOWAIT;
   -- bloqueia a coluna nome para alteração
   Reg c1%ROWTYPE;
BEGIN
      OPEN c1(&codigo);
      FETCH c1 INTO reg;
      Dbms_Output.Put_Line('Codigo: ' || LPad(reg.cod_aluno, 5, '0') || ' - ' || 'Nome: ' || reg.nome);
      CLOSE c1;  -- libero o registro para alteração
END;




DECLARE
  CURSOR c1 IS
  SELECT nome FROM taluno
  FOR UPDATE;
  Reg_aluno c1%ROWTYPE;
BEGIN

  FOR Reg_aluno IN c1
  LOOP
    UPDATE taluno
     SET nome = InitCap(reg_aluno.nome)
     WHERE CURRENT OF c1;
     Dbms_Output.Put_Line('Nome: ' || Reg_aluno.nome);
  END LOOP;
  COMMIT;

END;


