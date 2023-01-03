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
\\ This implementation sorts an array of values located at addresses addr1 and addr2. 
\\ The addresses should be passed in with addr1 being the lower address and addr2 
\\ being the higher address. The sorted array will be in ascending order.

