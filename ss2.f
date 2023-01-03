: selection-sort ( a n -- )
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
```
This implementation of Selection sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly finding the minimum element in the list and placing it at the front.

To use this code, you would first push the list and its length onto the stack, and then call the selection-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]:```
run with ```10 [9 5 3 1 8 6 4 2 7 0] selection-sort``` This will leave the sorted list on the top of the stack.
