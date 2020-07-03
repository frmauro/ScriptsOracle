DECLARE
     TYPE Rec_aluno IS RECORD
     ( cod_aluno NUMBER NOT NULL := 0,
       nome TAluno.Nome%TYPE,
       cidade TAluno.Cidade%type
     );

     Registro rec_aluno;
BEGIN
      registro.cod_aluno := 50;
      registro.nome := 'Master';
      registro.Cidade := 'Novo Hamburgo';
      Dbms_Output.Put_Line('Codigo: '||registro.cod_aluno);
      Dbms_Output.Put_Line('Nome: '||registro.nome);
      Dbms_Output.Put_Line('Cidade: '||registro.cidade);
END;

DECLARE
  reg TAluno%ROWTYPE; -- record
  vcep VARCHAR(10) := '98300000';
BEGIN

     SELECT cod_aluno, nome, cidade
     INTO reg.cod_aluno, reg.nome, reg.cidade
     FROM tAluno
     WHERE cod_aluno = 1;

     vcep := '93500000';
     reg.cep := vcep;

     Dbms_Output.Put_Line('Codigo: '||reg.cod_aluno);
     Dbms_Output.Put_Line('Nome: '||reg.nome);
     Dbms_Output.Put_Line('Cidade: '||reg.cidade);
     Dbms_Output.Put_Line('Cep: '||reg.cep);

END;

DECLARE
 TYPE t_aluno IS TABLE OF TAluno.nome%TYPE INDEX BY binary_INTEGER;
 registro t_aluno; --record
 BEGIN
     registro(1) := 'Marcio';
     registro(2) := 'Jose';
     registro(3) := 'Pedro';

     Dbms_Output.Put_Line('Nome1: '||registro(1));
     Dbms_Output.Put_Line('Nome2: '||registro(2));
     Dbms_Output.Put_Line('Nome3: '||registro(3));
 END;

 DECLARE
  TYPE nome_varray IS varray(5) OF TAluno.nome%TYPE;
  nome_vetor nome_varray := nome_varray();
BEGIN
  nome_vetor.extend;
  nome_vetor(1) := 'Marcio';
  Dbms_Output.Put_Line(nome_vetor(1));
END;


