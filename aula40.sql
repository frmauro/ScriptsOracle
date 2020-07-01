DECLARE
 vNome VARCHAR(30) := 'Carioca';
 vCidade VARCHAR(30);
 vEstado VARCHAR(2);
 BEGIN

 IF(vNome = 'Gaucho') THEN
    vCidade := 'Porto Alegre';
    vEstado := 'RS';
   ELSIF (vNome = 'Carioca') THEN
    vCidade := 'Rio de janeiro';
    vEstado := 'RJ';
   ELSE
      IF (vEstado = 'SP') THEN
        vCidade := 'Paulista';
      ELSE
        vCidade := 'Outros';
        vEstado := 'XX';
      END IF;
   END IF;

    Dbms_Output.Put_Line(vCidade||' - '||vEstado);

 END;




 DECLARE
   vEstado VARCHAR(2) := 'RR';
   vNome VARCHAR(30);
BEGIN

    CASE
      WHEN vEstado = 'RS' THEN vNome := 'Gaucho';
      WHEN vEstado = 'RJ' OR vEstado = 'ES' THEN vNome := 'Carioca';
    ELSE
        vNome := 'Outros';
    END CASE;

       Dbms_Output.Put_Line('Apelido: '|| vNome);
END;


DECLARE
 vContador INTEGER := 0;
BEGIN
     LOOP
        vContador := vContador + 1;
        Dbms_Output.Put_Line(vContador);
        EXIT WHEN vContador = 10;
      END LOOP;
        Dbms_Output.Put_Line('Fim do looping');
END;


DECLARE
   vContador INTEGER;
BEGIN
    FOR vContador IN 1..10
    LOOP
      Dbms_Output.Put_Line('For Loop: '||vContador);
    END LOOP;
      Dbms_Output.Put_Line('Fim do looping');
END;






