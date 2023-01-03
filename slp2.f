\ https://rosettacode.org/wiki/Sorting_algorithms/Sleep_sort#FreeBASIC
: sandman ( list n -- )
\ This function sorts the list of numbers in ascending order
\ using the Sleep sort algorithm.
\
\
dup 0< if
drop exit
then
1- dup
rot
/ 2 swap
sandman-thread
;

: sandman-thread ( list n -- )
\ This function creates a separate thread for each element in the list.
\ Each thread sleeps for a number of seconds equal to the value of the element
\ it is responsible for, and then outputs the element.
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
sandman-thread
;

: main
\ This is the main program.
create arr 10 cells allot
variable lb
variable ub
variable i
arr lb ub bounds
lb !
ub !
0.5 random
0.5 +
for i lb ub 1 - do
i arr + !
next
cr
"unsorted " type
for i lb ub 1 + do
i arr + @ .
next
cr
" sorted " type
arr lb ub sandman
cr
"hit any key to end program"
key
;
 
