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
\\ This implementation sorts an array of values located at addresses addr1 and addr2. 
\\ The addresses should be passed in with addr1 being the lower address and addr2 
\\ being the higher address. The sorted array will be in ascending order.
