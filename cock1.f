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
\\ This implementation sorts an array of values located at addresses addr1 and addr2. 
\\ The addresses should be passed in with addr1 being the lower address and addr2 being the higher address. 
\\ The sorted array will be in ascending order.
