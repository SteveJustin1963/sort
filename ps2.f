: pancake-sort ( a n -- )
   dup 0 > if
      drop exit
   then
   swap rot
   begin
      dup while
         1-
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
\\ This implementation of Pancake sort takes a list of integers a and its length n as input, 
\\ and sorts the list in ascending order. It works by repeatedly flipping 
\\ sublists of the list until the entire list is sorted.
\\ To use this code, you would first push the list and its length onto the stack, 
\\ and then call the pancake-sort function. 
\\ For example, to sort the list [9, 5, 3, 1, 8, 6, 4, 2, 7, 0]:
\\ run 10 [9 5 3 1 8 6 4 2 7 0] pancake-sort
\\ This will leave the sorted list on the top of the stack.

