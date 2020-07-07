CREATE OR REPLACE PROCEDURE aumenta_precocurso (pCod_Curso NUMBER)
IS
-- variaveis
BEGIN
   UPDATE tcurso SET
   valor = valor * 1.1
   WHERE cod_curso = pCod_Curso;
END;


SELECT * FROM tcurso;

exec aumenta_precocurso(5);


-- declara um bloco anonimo
DECLARE
 vcod INTEGER := &codigo;
BEGIN
  aumenta_precocurso(vcod);
END;

CREATE OR REPLACE PROCEDURE Consulta_Aluno
(pCodigo   IN taluno.Cod_Aluno%TYPE,
pNome      OUT taluno.Nome%TYPE,
pCep       OUT taluno.Cep%TYPE,
pCidade    OUT taluno.Cidade%TYPE)
IS
BEGIN
   SELECT nome, cep, cidade
   INTO pNome, pCep, pCidade
   FROM taluno
   WHERE cod_aluno = pCodigo;
END;

--teste
DECLARE
  vNome VARCHAR(30);
  vCidade VARCHAR(30);
  vCep VARCHAR(10);
  vCod NUMBER := &Codigo;
BEGIN
  -- executa a procedure uma forma de executar uma procedure
   --Consulta_Aluno(vCod, vNome, vCep, vCidade);

   -- executa a procedure outra forma de executar uma procedure
  Consulta_Aluno(pNome => vNome,
                 pCodigo => vCod,
                 pCidade => vCidade,
                 pCep    => vCep);

  Dbms_Output.Put_Line(vNome);
  Dbms_Output.Put_Line(vCidade);
  Dbms_Output.Put_Line(vCep);

END;

SELECT * FROM taluno;


CREATE OR REPLACE PROCEDURE Consulta_Aluno2
(pRegistro IN OUT taluno%ROWTYPE)
IS
  CURSOR csql IS
    SELECT * FROM taluno WHERE cod_aluno = pRegistro.cod_aluno;
BEGIN

   OPEN csql;
   FETCH csql INTO pRegistro;
   CLOSE csql;

END;

-- teste
DECLARE
 registro taluno%ROWTYPE;
BEGIN

   registro.cod_aluno := 1;
   Consulta_Aluno2(registro);
   Dbms_Output.Put_Line(registro.nome);
   Dbms_Output.Put_Line(registro.cidade|| 'Cep: '||registro.cep);

END;



