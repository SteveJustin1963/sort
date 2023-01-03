: pancake-sort ( list n -- )
\ This function sorts the list of numbers in ascending order
\ using the Pancake sort algorithm.
dup 0< if
drop exit
then
1- dup
rot
/ 2 swap
pancake-flip
;

: pancake-flip ( list n -- )
\ This function flips the list over so that the largest element
\ is at the top of the list.
dup 0< if
drop exit
then
dup 1-
rot
/ 2 swap
pancake-flip-step
;

: pancake-flip-step ( list n -- )
\ This function flips the list over so that the largest element
\ is at the top of the list.
dup 0< if
drop exit
then
1-
rot
over > if
swap
then
1-
rot
/ 2 swap
pancake-flip
;

\\ To use this function, you would call pancake-sort and pass it the list of numbers you want to sort
\\ and the length of the list. For example, to sort the list [5, 3, 1, 4, 2]
\\ you would call:5 3 1 4 2 5 pancake-sort
\\ This would leave the sorted list on the stack.

