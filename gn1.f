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
\\ This implementation sorts an array of values located at addresses addr1 and addr2. 
\\ The addresses should be passed in with addr1 being the lower address and addr2 being 
\\ the higher address. The sorted array will be in ascending order.

