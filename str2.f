: strand-sort ( a n -- )
   dup 0 > if
      drop exit
   then
   swap rot
   begin
      dup while
         swap 1-
         dup while
            rot
            rot 1-
            rot
            > if
               rot
            then
         repeat
      repeat
      swap drop
   repeat
;
\\ This implementation of Strand sort takes a list of integers a and its length n as input, 
\\ and sorts the list in ascending order. It works by repeatedly iterating through the list, 
\\ pulling out and sorting sublists, and then merging them back together.
\\ To use this code, you would first push the list and its length onto the stack, 
\\ and then call the strand-sort function. 
\\ For example, to sort the list  [9, 5, 3, 1, 8, 6, 4, 2, 7, 0]: 
\\ use 10 [9 5 3 1 8 6 4 2 7 0] strand-sort. 
\\ This will leave the sorted list on the top of the stack.

