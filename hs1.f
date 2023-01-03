: HEAPIFY ( a i n -- )
   dup i @ n @ >
   if
      drop
   else
      i @ 1 +
      dup a + @ i @ a + @ >
      if
         i @ 1 +
      then
      i @ a + @ swap
      heapify
   then
;

: HEAP-SORT ( a n -- )
   n @ 1 -
   0 ?DO
      i @ n @ 1 -
      i @ swap
      i @ a + @ n @ a + @ swap
      i @ heapify
   LOOP
;
\\ This implementation of heap sort first defines a function HEAPIFY that restores the heap property 
\\ of a binary heap by repeatedly swapping the element at the root with the largest of its children 
\\ until the heap is valid. The HEAP-SORT function then uses this function to sort the array.
\\ To use the HEAP-SORT function, you would call it with an array and the number of elements in the array, like this:
\\ [ 10 7 8 5 6 ] 6 heap-sort
