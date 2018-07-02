# Binary Search Trees and Palindrome Compressor

This [prolog](http://www.swi-prolog.org/) project contains the following modules:

1. `BSTree`. An implementation of Binary search trees with a few predicates that unify some useful information like inner nodes, leaves and tree-traversals in in-order, pre-order and post-order.
2. `Compress`. It implements a simple compression algorithm:
    1. Traverse the list from left to right,
    2. if a palindrome of length N, where N is greater or equal to 2, is found:
        1. the last `floor(N / 2)` elements are deleted,
        2. the algorithm restarts and compresses the remaining elements of the list until we are done.
    3. If no palindromes are found, return the list itself.
