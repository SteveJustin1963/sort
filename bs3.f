: bubble-sort ( a n -- )  # define a new function called "bubble-sort"
   dup 0 > if  # if the length of the list is zero or greater
      drop exit  # drop the list and exit the function
   then  # otherwise
   swap rot  # swap the list and its length and rotate them to the top of the stack
   dup while  # repeat the following block while the length of the list is greater than zero
      1-  # decrease the length by one
      dup while  # repeat the following block while the length of the list is greater than zero
         rot  # rotate the list, length, and element to the top of the stack
         rot 1-  # rotate the list and element to the top of the stack and decrease the length by one
         rot  # rotate the element, list, and length to the top of the stack
         > if  # if the element is greater than the one following it
            rot  # rotate the two elements to the top of the stack
         then  # otherwise, do nothing
      repeat  # repeat the inner loop until the end of the list is reached
   repeat  # repeat the outer loop until the list is fully sorted
   swap drop  # swap the sorted list and its length and drop the length from the stack
;  # end the function definition
