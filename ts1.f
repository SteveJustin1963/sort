: INSERT ( value node -- )
   dup value @ <
   if
      node @ left @
      dup value @ >
      if
         node @ left @ insert
      else
         node @ left !
      then
   else
      node @ right @
      dup value @ <
      if
         node @ right @ insert
      else
         node @ right !
      then
   then
;

: IN-ORDER ( node -- )
   node @
   if
      node @ left @ in-order
      node @ value @ .
      node @ right @ in-order
   then
;

: TREE-SORT ( a n -- )
   create root ,
   0 ?DO
      i @ a + @ root insert
   LOOP
   root in-order
;
\\ This implementation of tree sort builds a binary search tree from the elements of the input array 
\\ and then performs an in-order traversal of the tree to print the elements in sorted order.
\\ To use the TREE-SORT function, you would call it with an array and the number 
\\ of elements in the array, like this:
\\ [ 10 7 8 5 6 ] 6 tree-sort

