: SHELL-SORT ( a n -- )
   n @ 2 /
   gap !
   gap @
   while
      gap @
      0 ?DO
         i @ gap @ +
         dup i @ a + @
         i @ gap @ -
         dup a + @ >
         while
            i @ gap @ -
            i @ a + @
            i @ gap @ - a + @ swap
         repeat
      LOOP
      gap @ 2 /
   repeat
;
\\ This implementation of shell sort repeatedly sorts subarrays of the input array using the gap sequence 
\\ defined by the Knuth gap sequence. The gap is initialized to half the length of the array, and is 
\\ repeatedly halved until it is 1. 
\\ To use the SHELL-SORT function, you would call it with an array and the number of elements 
\\ in the array, like this:
\\ [ 10 7 8 5 6 ] 6 shell-sort

