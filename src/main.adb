With Ada.Integer_Text_IO, Ada.Text_IO;
Use Ada.Integer_Text_IO, Ada.Text_IO;

procedure Main is
   flagThreadA: Integer := 1;
   flagThreadB: Integer := 0;
   flagThreadC: Integer := 0;
   flagThreadD: Integer := 0;
   indexVector: Integer := 1;
   vector: array(1..30) of Character;

   task type threadA;
   task type threadB;
   task type threadC;

   task body threadA is
   begin
      Put_Line("Created thread a.");
      while indexVector<29  loop
         while flagThreadA = 0 loop
            null;
         end loop;
         vector(indexVector) := 'a';
         indexVector := indexVector+1;
         flagThreadA := 0;
         flagThreadB := 1;
      end loop;
   end threadA;

   task body threadB is
   begin
      Put_Line("Created thread b.");
      while indexVector<30  loop
         while flagThreadB = 0 loop
            null;
         end loop;
         vector(indexVector) := 'b';
         indexVector := indexVector+1;
         flagThreadB := 0;
         flagThreadC := 1;
      end loop;
   end threadB;

   task body threadC is
   begin
      Put_Line("Created thread c.");
      while indexVector<31  loop
         while flagThreadC = 0 loop
            null;
         end loop;
         vector(indexVector) := 'c';
         indexVector := indexVector+1;
         flagThreadC := 0;
         flagThreadA := 1;
      end loop;
      for i in 1..30 loop
         Put_Line("vector[" & Integer'Image(i) & " ] = " & vector(i));
      end loop;
   end threadC;

   A : threadA;
   B : threadB;
   C : threadC;

begin
   while True loop
      null;
   end loop;
end Main;
