# sorting algorithms


##   examples of sorting algorithms in FORTH: (MINT later)

## Bubble sort:
``
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


