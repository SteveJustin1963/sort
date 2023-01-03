: INSERTION-SORT ( a -- )
   dup length @
   1 ?DO
      i @
      i @ a + @
      i @ 1-
      0 ?DO
         j @ a + @ j @ 1- a + @ >
         if
            j @ a + @ j @ 1- a + @ swap
         then
      LOOP
   LOOP
;
```
This is an implementation of the insertion sort algorithm, which repeatedly inserts the next unsorted element into the correct position in the sorted part of the array.
