: COUNTING-SORT-RADIX ( a n d -- )
   create count ,
   n @ 0 ?DO
      i @ a + @ d @ mod count + @ 1+ count + !
   LOOP
   count
   0 ?DO
      i @ count + @
      0 ?DO
         i @ a + !
         1 +
      LOOP
      1 +
   LOOP
;

: RADIX-SORT ( a n -- )
   0
   begin
      dup COUNTING-SORT-RADIX
      1+
      10 <
   while
   drop
;
\\ This implementation of radix sort uses the counting sort algorithm to sort the elements of 
\\ the input array by successive digits. It first sorts the elements by the least significant digit, 
\\ then by the next least significant digit, and so on.
\\ To use the RADIX-SORT function, you would call it with an array and the number of elements in the array, like this:
\\ [ 10 7 8 5 6 ] 6 radix-sort


