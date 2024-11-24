// cocktail-sort 1
// Initialize variables
0 n! 0 i! 0 j! 0 t! 0 s! 0 f! 0 l! 0 r!

// Helper function to swap elements
:W                      // W for sWap
    a i ? t!           // temp = a[i]
    a j ? a i ?!       // a[i] = a[j]
    t a j ?!           // a[j] = temp
;

// Main cocktail sort implementation
:C                      // C for Cocktail sort
    a /S n!            // get array size
    n 1 < (            // if size < 1
        `Array too small` /N
        /T             // exit
    )
    
    0 l!               // left = 0
    n 1 - r!           // right = n-1
    
    /U (               // unlimited loop
        /F f!          // reset swap flag
        
        // Forward pass (left to right)
        l (            // loop from left
            /i i!      // current index
            i 1 + j!   // next index
            j r <= (   // if within bounds
                a i ? a j ?  // get values
                > (         // if out of order
                    W       // swap them
                    /T f!   // set swap flag
                ) ' '     // clean stack
            ) ' 
        )
        
        f /F = (       // if no swaps
            /T        // exit loop
        )
        r 1 - r!      // decrease right bound
        
        /F f!         // reset swap flag
        
        // Backward pass (right to left)
        r l > (        // if right > left
            r 1 - (    // loop from right-1
                /i j!  // j = current
                /i 1 - i! // i = previous
                a i ? a j ? // get values
                > (        // if out of order
                    W      // swap them
                    /T f!  // set swap flag
                ) ' '    // clean stack
            )
        )
        
        l 1 + l!       // increase left bound
        
        f /F = r l <= | /W  // continue while swaps or bounds valid
    )
;

// Print array helper
:D                      // D for Display
    `Array:` /N
    a /S (             // loop array size times
        a /i ? .       // print number
        ` `           // space
    ) /N
;

// Test function with multiple cases
:T                      // T for Test
    // Test 1: Basic array
    [ 5 4 3 2 1 ] a!
    `Test 1 - Basic sort` /N
    `Before:` /N
    D
    C
    `After:` /N
    D /N

    // Test 2: Already sorted
    [ 1 2 3 4 5 ] a!
    `Test 2 - Already sorted` /N
    `Before:` /N
    D
    C
    `After:` /N
    D /N

    // Test 3: Reversed
    [ 9 8 7 6 5 4 3 2 1 ] a!
    `Test 3 - Reversed array` /N
    `Before:` /N
    D
    C
    `After:` /N
    D /N

    // Test 4: With duplicates
    [ 4 2 3 2 1 4 3 2 1 ] a!
    `Test 4 - With duplicates` /N
    `Before:` /N
    D
    C
    `After:` /N
    D /N

    // Test 5: Even length
    [ 6 5 4 3 2 1 ] a!
    `Test 5 - Even length` /N
    `Before:` /N
    D
    C
    `After:` /N
    D /N

    // Test 6: Odd length
    [ 7 6 5 4 3 2 1 ] a!
    `Test 6 - Odd length` /N
    `Before:` /N
    D
    C
    `After:` /N
    D /N
;

// Performance test with larger array
:R                      // R for Random test
    [ 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 ] a!
    `Performance Test - 15 elements` /N
    `Before:` /N
    D
    C
    `After:` /N
    D
;

// Simple test
:S                      // S for Simple test
    [ 3 1 4 1 5 ] a!
    `Simple Test` /N
    `Before:` /N
    D
    C
    `After:` /N
    D
;
