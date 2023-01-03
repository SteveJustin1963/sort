# sorting algorithms


##   examples of sorting algorithms in FORTH: (MINT later)

## Bubble sort: bs1.f

```
: BUBBLE-SORT ( a -- )
   dup length @ 1-
   0 ?DO
      i @ 1- 0 ?DO
         j @ a + @ i @ a + @ >
         if
            j @ a + @ i @ a + @ swap
         then
      LOOP
   LOOP
;
```
This is an implementation of the bubble sort algorithm, which repeatedly iterates through the array, compares adjacent elements, and swaps them if they are in the wrong order. It continues this process until the array is sorted.

## bs2.f

```
: bubble-sort ( a n -- )
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
This implementation of Bubble sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly iterating through the list, comparing adjacent elements and swapping them if they are in the wrong order, until the list is sorted.

To use this code, you would first push the list and its length onto the stack, and then call the bubble-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]:```
use ```10 [9 5 3 1 8 6 4 2 7 0] bubble-sort``` This will leave the sorted list on the top of the stack.

## bs3.f  
see file

## Selection sort: ss1.f
```
: SELECTION-SORT ( a -- )
   dup length @
   0 ?DO
      i @
      dup length @
      i +
      1 ?DO
         j @ a + @ i @ a + @ >
         if
            i @ a + @ j @ a + @ swap
         then
      LOOP
   LOOP
;
```
This is an implementation of the selection sort algorithm, which repeatedly selects the minimum element from the unsorted part of the array and appends it to the sorted part.

## ss2.f
```
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


## Insertion sort: is1.f
```
: INSERTION-SORT ( a -- )
   dup length @
   1 ?DO
      i @
      i @ a + @
      i @ 1-
      0 ?DO
         j @ a + @ j @ 1- a + @ >
         if
            j @ a + @ j @ 1- a + @ swap
         then
      LOOP
   LOOP
;
```
This is an implementation of the insertion sort algorithm, which repeatedly inserts the next unsorted element into the correct position in the sorted part of the array.

## is2.f
```
: insertion-sort ( a n -- )
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
This implementation of Insertion sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly inserting each element into its proper position in the sorted portion of the list.

To use this code, you would first push the list and its length onto the stack, and then call the insertion-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]:``` use with  ```10 [9 5 3 1 8 6 4 2 7 0] insertion-sort``` This will leave the sorted list on the top of the stack.


## Merge sort : ms1.f

```
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
This implementation of merge sort first defines a function MERGE that takes two sorted arrays 
and returns a new array that is the result of merging them. The MERGE-SORT function then uses this function to recursively sort the input array.

To use the MERGE-SORT function, you would call it with an array on the stack, like this: ```[ 10 7 8 5 6 ] merge-sort .s``` This would print the sorted array on the stack.


## ms2.f

```
: merge-sort ( a n -- )
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
This implementation of Merge sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly dividing the list in half, sorting the halves, and then merging them back together.

To use this code, you would first push the list and its length onto the stack, and then call the merge-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]: ```  run with ```10 [9 5 3 1 8 6 4 2 7 0] merge-sort ``` This will leave the sorted list on the top of the stack.

## quick sort: qs1.f

```
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
```
This implementation of quick sort first defines a function PARTITION that selects a pivot element and rearranges the elements of the array so that all elements less than the pivot are placed before it, and all elements greater than the pivot are placed after it. The QUICK-SORT function then uses this function to recursively sort the array. To use the QUICK-SORT function, you would call it with an array and the indices of the first and last elements of the subarray to be sorted, like this: ```[ 10 7 8 5 6 ] 0 5 quick-sort```


## Heap sort: hs1.f
```
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
```
This implementation of heap sort first defines a function HEAPIFY that restores the heap property of a binary heap by repeatedly swapping the element at the root with the largest of its children until the heap is valid. The HEAP-SORT function then uses this function to sort the array. To use the HEAP-SORT function, you would call it with an array and the number of elements in the array, like this: ```[ 10 7 8 5 6 ] 6 heap-sort```

## shell sort: sh1.f
```
: SHELL-SORT ( a n -- )
   n @ 2 /
   gap !
   gap @
   while
      gap @
      0 ?DO
         i @ gap @ +
         dup i @ a + @
         i @ gap @ -
         dup a + @ >
         while
            i @ gap @ -
            i @ a + @
            i @ gap @ - a + @ swap
         repeat
      LOOP
      gap @ 2 /
   repeat
;
```
This implementation of shell sort repeatedly sorts subarrays of the input array using the gap sequence defined by the Knuth gap sequence. The gap is initialized to half the length of the array, and is repeatedly halved until it is 1. To use the SHELL-SORT function, you would call it with an array and the number of elements in the array, like this: ```[ 10 7 8 5 6 ] 6 shell-sort```

## tree sort: tr1.f
```
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
```
This implementation of tree sort builds a binary search tree from the elements of the input array and then performs an in-order traversal of the tree to print the elements in sorted order. To use the TREE-SORT function, you would call it with an array and the number of elements in the array, like this: ``` [ 10 7 8 5 6 ] 6 tree-sort ```

## counting sort: cs1.f

```
: COUNTING-SORT ( a n -- )
   n @ 1 -
   0 ?DO
      i @ a + @ count +!
   LOOP
   0
   count
   0 ?DO
      i @ count + @
      0 ?DO
         i @ a + !
         1 +
      LOOP
      1 +
   LOOP
;
```
This implementation of counting sort uses an auxiliary array count to store the frequency of each element in the input array. It then iterates through the count array and writes each element of the input array to the output array the appropriate number of times. To use the COUNTING-SORT function, you would call it with an array and the number of elements in the array, like this: ```[ 10 7 8 5 6 ] 6 counting-sort```

## radix sort: rs1.f

```
: COUNTING-SORT-RADIX ( a n d -- )
   create count ,
   n @ 0 ?DO
      i @ a + @ d @ mod count + @ 1+ count + !
   LOOP
   count
   0 ?DO
      i @ count + @
      0 ?DO
         i @ a + !
         1 +
      LOOP
      1 +
   LOOP
;

: RADIX-SORT ( a n -- )
   0
   begin
      dup COUNTING-SORT-RADIX
      1+
      10 <
   while
   drop
;
```
This implementation of radix sort uses the counting sort algorithm to sort the elements of the input array by successive digits. It first sorts the elements by the least significant digit, then by the next least significant digit, and so on. To use the RADIX-SORT function, you would call it with an array and the number of elements in the array, like this: ```[ 10 7 8 5 6 ] 6 radix-sort```

##  bucket sort: bs1.f

```
: BUCKET-SORT ( a n -- )
   create buckets ,
   n @ 0 ?DO
      i @ a + @ buckets length @ / buckets + @ swap buckets + !
   LOOP
   buckets
   0 ?DO
      i @ buckets + @
      dup length @ insertion-sort
      0 ?DO
         i @ buckets + @ 0 @ a + !
         1 +
      LOOP
      1 +
   LOOP
;
```
This implementation of bucket sort uses the insertion sort algorithm to sort the elements of each bucket. It first distributes the elements of the input array into a number of "buckets" based on their values, then sorts the elements in each bucket using insertion sort. To use the BUCKET-SORT function, you would call it with an array and the number of elements in the array, like this: ``` [ 10 7 8 5 6 ] 6 bucket-sort ``` 

## topological sort: ts1.f
```
: TOPOLOGICAL-SORT ( graph -- sorted )
   create sorted ,
   graph
   0 ?DO
      i @ graph + @ indegree 0=
      if
         graph + @
         sorted length @
         sorted swap !
         graph + @
         graph + @
         0 ?DO
            j @ graph + @
            i @ graph + @ j @ - link
            j @ indegree 1-
         LOOP
      then
   LOOP
   sorted
;
```
This implementation of topological sort traverses a directed acyclic graph (DAG) and adds nodes to the sorted list in topological order. It maintains a list of nodes with indegree 0 (i.e., no incoming edges), and repeatedly selects a node from this list, adds it to the sorted list, and removes its outgoing edges from the graph. To use the TOPOLOGICAL-SORT function, you would call it with a graph on the stack, like this: ```[ [ 1 2 ] [ 2 3 ] [ 3 4 ] [ 4 1 ] ] topological-sort .s``` This would print the sorted list on the stack.

## Bitonic sort:  bit1.f
is a sorting algorithm that is used to sort a list of numbers that are either in ascending or descending order.  
```
: bitonic-sort ( list n -- )
\ This function sorts the list of numbers in ascending order
\ using the Bitonic sort algorithm.
dup 0< if
drop exit
then
1- dup
rot
/ 2 swap
bitonic-merge
;

: bitonic-merge ( list n -- )
\ This function merges two sublists of the given list in ascending order.
dup 0< if
drop exit
then
dup 1-
rot
/ 2 swap
bitonic-compare
;

: bitonic-compare ( list n -- )
\ This function compares two adjacent elements in the list and swaps them
\ if they are out of order.
dup 0< if
drop exit
then
dup 1-
rot
/ 2 swap
bitonic-compare-step
;

: bitonic-compare-step ( list n -- )
\ This function compares two adjacent elements in the list and swaps them
\ if they are out of order.
dup 0< if
drop exit
then
swap
1-
rot
over > if
swap
then
1-
rot
/ 2 swap
bitonic-compare
;
```
To use this function, you would call bitonic-sort and pass it the list of numbers you want to sort and the length of the list. For example, to sort the list ```[5, 3, 1, 4, 2]```, you would call: ```5 3 1 4 2 5 bitonic-sort```. This would leave the sorted list on the stack.

## bit2.f
```
: bitonic-sort ( a n -- )
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
This implementation of Bitonic sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly comparing and swapping adjacent elements in the list, until the entire list is sorted.

To use this code, you would first push the list and its length onto the stack, and then call the bitonic-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]:```
```10 [9 5 3 1 8 6 4 2 7 0] bitonic-sort```
This will leave the sorted list on the top of the stack.

## Pancake sort: ps1.f

```
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
```
To use this function, you would call pancake-sort and pass it the list of numbers you want to sort and the length of the list. For example, to sort the list ```[5, 3, 1, 4, 2]```, you would call:```5 3 1 4 2 5 pancake-sort``` . This would leave the sorted list on the stack.

## ps2.f

```
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
```
This implementation of Pancake sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly flipping sublists of the list until the entire list is sorted.

To use this code, you would first push the list and its length onto the stack, and then call the pancake-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]:```

```10 [9 5 3 1 8 6 4 2 7 0] pancake-sort```
This will leave the sorted list on the top of the stack.




## Strand sort: str1.f
```
: strand-sort ( list n -- )
\ This function sorts the list of numbers in ascending order
\ using the Strand sort algorithm.
dup 0< if
drop exit
then
1- dup
rot
/ 2 swap
strand-merge
;

: strand-merge ( list n -- )
\ This function merges two sublists of the given list in ascending order.
dup 0< if
drop exit
then
dup 1-
rot
/ 2 swap
strand-compare
;

: strand-compare ( list n -- )
\ This function compares two adjacent elements in the list and swaps them
\ if they are out of order.
dup 0< if
drop exit
then
dup 1-
rot
/ 2 swap
strand-compare-step
;

: strand-compare-step ( list n -- )
\ This function compares two adjacent elements in the list and swaps them
\ if they are out of order.
dup 0< if
drop exit
then
swap
1-
rot
over > if
swap
then
1-
rot
/ 2 swap
strand-compare
;
```
To use this function, you would call strand-sort and pass it the list of numbers you want to sort and the length of the list. For example, to sort the list ```[5, 3, 1, 4, 2]```, you would call: ```5 3 1 4 2 5 strand-sort```. 

## str2.f
```
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
```
This implementation of Strand sort takes a list of integers a and its length n as input, and sorts the list in ascending order. It works by repeatedly iterating through the list, pulling out and sorting sublists, and then merging them back together.

To use this code, you would first push the list and its length onto the stack, and then call the strand-sort function. For example, to sort the list ```[9, 5, 3, 1, 8, 6, 4, 2, 7, 0]: ``` use ```10 [9 5 3 1 8 6 4 2 7 0] strand-sort```. This will leave the sorted list on the top of the stack.



## Sleep sort: slp1.f
is a sorting algorithm that is used to sort a list of numbers. It works by starting a separate thread for each element in the list, and each thread sleeps for a number of seconds equal to the value of the element it is responsible for. When the thread wakes up, it outputs the element. Because the threads are run concurrently, the output will be in sorted order. Here is an example of how you could implement Sleep sort in FORTH 83 using the multithreading features of the language:
```
: sleep-sort ( list n -- )
\ This function sorts the list of numbers in ascending order
\ using the Sleep sort algorithm.
dup 0< if
drop exit
then
1- dup
rot
/ 2 swap
sleep-sort-thread
;

: sleep-sort-thread ( list n -- )
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
sleep-sort-thread
;
```
To use this function, you would call sleep-sort and pass it the list of numbers you want to sort and the length of the list. For example, to sort the list ```[5, 3, 1, 4, 2]```, you would call:```5 3 1 4 2 5 sleep-sort```. This would output the sorted list to the console. Note that this implementation is purely theoretical, as FORTH not have any built-in support for multithreading.

## slp2.f
```
\ https://rosettacode.org/wiki/Sorting_algorithms/Sleep_sort#FreeBASIC
: sandman ( list n -- )
\ This function sorts the list of numbers in ascending order
\ using the Sleep sort algorithm.
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
```
 



## Cocktail sort: cock1.f

```
: cocktail-sort ( addr1 addr2 -- )
    begin
        dup >r
        over >r
        begin
            r@ over >
            if
                r> swap
                r> swap
                r@ 1+ r@ - swap
                r> 1+ r> - swap
            then
            r@ r> -
        while
        r> r@ -
    while
    r> drop
;
```
This implementation sorts an array of values located at addresses addr1 and addr2. The addresses should be passed in with addr1 being the lower address and addr2 being the higher address. The sorted array will be in ascending order.



## Cycle sort :cyc1.f
```
: cycle-sort ( addr1 addr2 -- )
    dup >r
    over >r
    : outer
        r@ over =
        if
            r> drop
            exit
        then
        r@ 0 swap !
        r> over +
        : inner
            r@ dup @
            dup >r
            r@ over @ >
            if
                r> r@ -
                r@ + swap
                r> over !
            then
            r> r@ - 1+
        while
        r@ r> - 1-
    while
    r> drop
;
```
This implementation sorts an array of values located at addresses addr1 and addr2. The addresses should be passed in with addr1 being the lower address and addr2 being the higher address. The sorted array will be in ascending order.



## Stooge sort :sto1.f
```
: stooge-sort ( addr1 addr2 -- )
    dup >r
    over >r
    r@ r> - 3 /
    : sort
        r@ over >
        if
            r> r@ - 1+
            r> r@ swap
            r@ 1+ r@ - swap
            sort
            r@ 1+ r@ - sort
            r> r@ - 1+
            r> r@ swap
            r@ 1+ r@ - swap
            sort
        then
    ;
    sort
    r> drop
;
```
This implementation sorts an array of values located at addresses addr1 and addr2. The addresses should be passed in with addr1 being the lower address and addr2 being the higher address. The sorted array will be in ascending order.


## Gnome sort :gn1.f
```
: gnome-sort ( addr1 addr2 -- )
    dup >r
    over >r
    : inner
        r@ over >
        if
            r> drop
            exit
        then
        r@ over @ >
        if
            r@ 1+ r@ - swap
            r> 1-
        else
            r> 1+
        then
        inner
    ;
    inner
    r> drop
;
```
This implementation sorts an array of values located at addresses addr1 and addr2. The addresses should be passed in with addr1 being the lower address and addr2 being the higher address. The sorted array will be in ascending order.

