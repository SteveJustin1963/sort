```
: COUNTING-SORT ( a n -- )
   n @ 1 -
   0 ?DO
      i @ a + @ count +!
   LOOP
   0
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
\\ This implementation of counting sort uses an auxiliary array count to store the frequency 
\\ of each element in the input array. It then iterates through the count array and writes 
\\ each element of the input array to the output array the appropriate number of times.
\\ To use the COUNTING-SORT function, you would call it with an array and the number 
\\ of elements in the array, like this:
\\ [ 10 7 8 5 6 ] 6 counting-sort

