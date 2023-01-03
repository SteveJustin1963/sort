: SELECTION-SORT ( a -- )
   dup length @
   0 ?DO
      i @
      dup length @
      i +
      1 ?DO
         j @ a + @ i @ a + @ >
         if
            i @ a + @ j @ a + @ swap
         then
      LOOP
   LOOP
;
