: PARTITION ( a lo hi -- lo' hi' )
   hi lo -
   over lo +
   / 2
   a + @
   pivot !
   lo hi
   lo +
   hi -
   1 ?DO
      i @ a + @ pivot @ >
      if
         i @ a + @ hi @ a + @ swap
         hi @ 1-
      else
         i @ a + @ lo @ a + @ swap
         lo @ 1+
      then
   LOOP
   pivot @ lo @ a + @ hi @ a + @ swap
   hi lo
;

: QUICK-SORT ( a lo hi -- )
   dup 2 >
   if
      dup PARTITION
      over QUICK-SORT
      drop QUICK-SORT
   then
;

\\ This implementation of quick sort first defines a function PARTITION that selects a pivot 
\\ element and rearranges the elements of the array so that all elements less than the pivot 
\\ are placed before it, and all elements greater than the pivot are placed after it. 
\\ The QUICK-SORT function then uses this function to recursively sort the array.
\\ To use the QUICK-SORT function, you would call it with an array and the indices of the first and last elements
\\ of the subarray to be sorted, like this:
\\ [ 10 7 8 5 6 ] 0 5 quick-sort

