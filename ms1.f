: MERGE ( a b -- c )
   over length @ over length @ +
   create c-array ,
   0 0
   dup 0 > swap dup 1 > or
   while
      dup 0 >
      if
         a + @ c-array + !
         1 +
      else
         b + @ c-array + !
         1 +
      then
      dup 1 >
      if
         a + @ c-array + !
         2 +
      else
         b + @ c-array + !
         2 +
      then
   repeat
   c-array
;

: MERGE-SORT ( a -- a' )
   dup length @ 1 <
   if
      drop a
   else
      dup length @ 2 /
      swap 0 a ,
      swap length @ 2 /
      swap dup length @ a + ,
      dup merge swap ,
   then
;
```
\\ This implementation of merge sort first defines a function MERGE that takes two sorted arrays 
\\ and returns a new array that is the result of merging them. The MERGE-SORT function then uses 
\\ this function to recursively sort the input array.
\\ To use the MERGE-SORT function, you would call it with an array on the stack, 
\\ like this: ```[ 10 7 8 5 6 ] merge-sort .s``` This would print the sorted array on the stack.

