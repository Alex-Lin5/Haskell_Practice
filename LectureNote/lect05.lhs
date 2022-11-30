-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 5  Defining functions
-------------------------------------------------------------------------------

> import Prelude hiding (drop, product, length)

-------------------------------------------------------------------------------

I. Announcement

a. Homework 00 (Hints)

Discuss:

> transfer         :: ([a],[a]) -> ([a],[a])
> transfer ([],ys)     = ([],ys)
> transfer ((x:xs),ys) = transfer (xs,(x:ys))

How it works.

How to use it to compose the reverse function.


b. Current progress: you should be reading 

i.     Hutton, chapter 3, 4 (and the slides associated to it)
ii,    ACST: Chapter 1, Chapter 2, section 2.
 
c. Class activity today



** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. (Class exercise) The language of propositional logic

2. Writing functions

3. Summary


-------------------------------------------------------------------------------
II.1. The language of propositional logic and access control logic (with class 
activities)
-------------------------------------------------------------------------------

Ref. ACST chapter 2.

Discussions refers to text's slide.

a. The syntax of a logical language

b. Syntax via BNF

c. The structure of a formula 

d. Practice


-------------------------------------------------------------------------------
II.2.  Writing functions (Hutton ch.3 and 4)
-------------------------------------------------------------------------------

a.  The basics 

    Conditional expressions and Guarded Equations

b.  Sectioning
    
    i. Define a binary operator: 

    Suppose we want to define a binary operator # for Int. That is, we can 
    write

    x # y 

    in a Haskell expression.  We will first define the operator as a function 
    and use (#) to denote the function:

> (#) :: Int -> Int -> Int
> (#) x y = x + y + 1

> e :: Int
> e = (2 # 3) + 1 

    We can also write:  (# 10) and  (10 #) as functions (what's their types ?)

    In fact, suppose x, y are of type Int. The two expressions are being 
    evaluated as:

    (# x) y = y # x 
    (x #) y = x # y 

    In general, if # is an operator then functions of the form 

    (#), (x #) , (# y) 

    are called sections.

    Examples:

> k :: Int -> Int
> k = (12 #)

> l :: Int -> Int
> l = (# 3)


c.  Pattern matching (*important*)

    -  Wildcards `_`

    -  list patterns: the cons operator (:)

    -  lambda expessions



i.  The fibonacci numbers

> fib   :: Int -> Int
> fib  k 
>  | k < 0                = 0
>  | (k == 0) || (k == 1) = 1
>  | otherwise            = fib (k-1) + fib (k-2) 

Note: the definition above is a translation of it mathematical definition

ii.  Recursion on lists (Hutton, Ch.6)

     -  Patterns used

     -  Examples 
     
        1: The product of integers           

> product    :: [Integer] -> Integer
> product []     = 1
> product (x:xs) = x * (product xs)


        2: length

> length :: [a] -> Int
> length []     = 0
> length (x:xs) = 1 + length xs

     -  3: drop

> drop      :: Int -> [a] -> [a]
> drop 0 xs = xs
> drop _ []     = []
> drop n (x:xs) = drop (n-1) xs

-----

