# sorting algorithms


##   examples of sorting algorithms in FORTH: (MINT later)

## Bubble sort:
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

## Selection sort:
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

## Insertion sort:
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

## Merge sort :

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

To use the MERGE-SORT function, you would call it with an array on the stack, like this:

```
[ 10 7 8 5 6 ] merge-sort .s

```
This would print the sorted array on the stack.


## quick sort:

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
This implementation of quick sort first defines a function PARTITION that selects a pivot element and rearranges the elements of the array so that all elements less than the pivot are placed before it, and all elements greater than the pivot are placed after it. The QUICK-SORT function then uses this function to recursively sort the array.

To use the QUICK-SORT function, you would call it with an array and the indices of the first and last elements of the subarray to be sorted, like this:

```
[ 10 7 8 5 6 ] 0 5 quick-sort
```


## Heap sort
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
This implementation of heap sort first defines a function HEAPIFY that restores the heap property of a binary heap by repeatedly swapping the element at the root with the largest of its children until the heap is valid. The HEAP-SORT function then uses this function to sort the array.

To use the HEAP-SORT function, you would call it with an array and the number of elements in the array, like this:

```
[ 10 7 8 5 6 ] 6 heap-sort
```

## shell sort:

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
This implementation of shell sort repeatedly sorts subarrays of the input array using the gap sequence defined by the Knuth gap sequence. The gap is initialized to half the length of the array, and is repeatedly halved until it is 1.

To use the SHELL-SORT function, you would call it with an array and the number of elements in the array, like this:

```
[ 10 7 8 5 6 ] 6 shell-sort
```

## tree sort:

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
This implementation of tree sort builds a binary search tree from the elements of the input array and then performs an in-order traversal of the tree to print the elements in sorted order.

To use the TREE-SORT function, you would call it with an array and the number of elements in the array, like this:

```
[ 10 7 8 5 6 ] 6 tree-sort
```

## counting sort:

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
This implementation of counting sort uses an auxiliary array count to store the frequency of each element in the input array. It then iterates through the count array and writes each element of the input array to the output array the appropriate number of times.

To use the COUNTING-SORT function, you would call it with an array and the number of elements in the array, like this:

```
[ 10 7 8 5 6 ] 6 counting-sort

```

## radix sort:

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
This implementation of radix sort uses the counting sort algorithm to sort the elements of the input array by successive digits. It first sorts the elements by the least significant digit, then by the next least significant digit, and so on.

To use the RADIX-SORT function, you would call it with an array and the number of elements in the array, like this:
```
[ 10 7 8 5 6 ] 6 radix-sort
```

##  bucket sort:

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
This implementation of bucket sort uses the insertion sort algorithm to sort the elements of each bucket. It first distributes the elements of the input array into a number of "buckets" based on their values, then sorts the elements in each bucket using insertion sort.

To use the BUCKET-SORT function, you would call it with an array and the number of elements in the array, like this:

``` [ 10 7 8 5 6 ] 6 bucket-sort ```

## topological sort:

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
This implementation of topological sort traverses a directed acyclic graph (DAG) and adds nodes to the sorted list in topological order. It maintains a list of nodes with indegree 0 (i.e., no incoming edges), and repeatedly selects a node from this list, adds it to the sorted list, and removes its outgoing edges from the graph.

To use the TOPOLOGICAL-SORT function, you would call it with a graph on the stack, like this:
```[ [ 1 2 ] [ 2 3 ] [ 3 4 ] [ 4 1 ] ] topological-sort .s```
This would print the sorted list on the stack.

## Bitonic sort
## Pancake sort
## Strand sort
## Sleep sort
## Cocktail sort
## Cycle sort
## Stooge sort
## Gnome sort

