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
\\ This implementation of bucket sort uses the insertion sort algorithm to sort the elements of each bucket. 
\\ It first distributes the elements of the input array into a number of "buckets" based 
\\ on their values, then sorts the elements in each bucket using insertion sort.
\\ To use the BUCKET-SORT function, you would call it with an array and the number of elements in the array, like this:
\\ [ 10 7 8 5 6 ] 6 bucket-sort

