--------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 2  Haskell basics
--------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

1. See Prof. Lee after class (if you did not attend first lecture)
2. Status of Class VM
3. Pre-class exercises
4. Haskell central

i.      the site:               https://www.haskell.org/
ii.     the search engine:      https://hoogle.haskell.org/

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. Running Haskell
2. Starting GHC/GHCi (REPL environment)
3. Haskell scripts, evaluation of Haskell expressions and types 
4. Prelude
5. Layout rules
6. Summary

------------------------------
II.1  Running Haskell
------------------------------

1. Remarks on using class VM 

a. Windows user: Run VM 

via 

virtualbox: check the following link

https://www.virtualbox.org/

or 

vmware: check the following link

https://e5.onthehub.com/WebStore/ProductsByMajorVersionList.aspx?ws=819d6b5e-4c24-de11-a497-0030485a8df0&vsro=8

b. Mac user

See the instructions posted under blackboard.

------------------------------------------------------------
II.2 Starting GHC/GHCi (REPL environment) 
------------------------------------------------------------

1. Class Demo (Ubuntu environment)


----------------------------------------------------------------------
II.3  Haskell scripts, evaluation of Haskell expressions and types 
----------------------------------------------------------------------

a. Recall examples of the haskell function

> double   :: Int -> Int     -- type
> double x = x + x           -- double.1

> sum1    :: [Int] -> Int    -- type
> sum1 []     = 0            -- sum1.1   base case
> sum1 (n:ns) = n + sum ns   -- sum1.2   recursion step


Function q implements the quicksort for list of integers.

> q    :: [Int] -> [Int]
> q []     = []
> q (x:xs) = q smaller ++ [x] ++ q larger
>     where 
>       smaller = [a | a <- xs, a <= x]
>       larger  = [b | b <- xs, b > x]

b. Class exercise

A tour on running Haskell based on the following files:

i.  Numbers2Words.lhs
ii. cipher.hs

----------------------------------------------------------------------
II.4  Prelude
----------------------------------------------------------------------

a. Visit functions in Prelude (Hutton Appendix)

b. Examples


> divide      :: Int -> [a] -> ([a],[a])
> divide k xs = (take k xs, drop k xs)

> getmiddle    :: [a] -> a
> getmiddle xs = xs !!(length xs `div` 2)

- a is a type variable.
- These two functions are polymorphic (see Hutton 3.7).
- Will revisit these concepts later.


----------------------------------------------------------------------
II.5  Layout rules  
----------------------------------------------------------------------

a. Illustrations (via the lhs and hs files given earlier)





