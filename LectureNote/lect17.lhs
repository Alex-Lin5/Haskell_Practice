
-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 17     Implementations of ACL formulas and evaluation functions
               Higher order functions
               Discretionary access control

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (until,iterate, map, filter, sqrt, foldr, foldl)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 04 has been released 
  
b. Your progress:

i.     Hutton, chapter 7, 8 (and the slides associated to it). Please spend 
       time to use text examples (Hutton, also recommended Bird) for practice.

ii.    ACST, Chapter 3, 4.

c. Midterm paper will be returned after class.

** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. Higher order functions (with practice)
2. Homework 4 Walk thru.  
3. Access control mechanisms and policies
4. Discretionary access control
5. Summary

-------------------------------------------------------------------------------
II.1. Higher order functions 
-------------------------------------------------------------------------------

Reference: Hutton, chapter 7 and slides

Note:   Many higher order functions are developed to capture the pattern of
        Computations: takeWhile, dropWhile, until, iterate 

a.  foldr function

> foldr        :: (a -> b -> b) -> b -> [a] -> b
> foldr f e []     =  e
> foldr f e (x:xs) =  f x (foldr f e xs)

Algebraically:

foldr (@) e [1,2,3,4] 
= 
(1 @ (2 @ (3 @ (4 @ e))))


Practice exercise:

Represent the sum function via foldr

Ideas:

                             V
sum [1,2,3] = (1 + (2 + (3 + 0)))
                 ^    ^    ^ 

> sum1 :: [Int] -> Int
> sum1 = foldr (+) 0


Example:  function map 

map f [1,2,3] = [f 1, f 2, f 3]

Write: 
              
map (@) [1,2,3] = (1 @ (2 @  (3 @ []))

What is (@) ?










Idea: 

3 @ [] = [f 3]
       = (f 3) : [] 

2 @ [f 3] = [f 2, f 3]
          = (f 2):[f 3]

Guess:

@ = (:) . f



Example: Define the function foldl ("fold from the left")

"fold from the left" means:

foldl (@) e [1,2,3,4] = ((((e @ 1) @ 2) @ 3) @ 4)










Note:


foldl (@) e [1,2,3,4] = ((((e @ 1) @ 2) @ 3) @ 4)

foldl (@) e [2,3,4] = (((e @ 2) @ 3) @ 4)
                         ^

replace e    by    e @ 1 

foldl (@) e [1,2,3,4] = (foldl (@) (e @ 1) [2,3,4])

foldl (@) e (1:[2,3,4]) = (foldl (@) (e @ 1) [2,3,4])

foldl (@) e (x:[2,3,4]) = (foldl (@) (e @ x) [2,3,4])

foldl (@) e (x:xs) = (foldl (@) (e @ x) xs)

foldl f e (x:xs) = foldl f (f e x) xs


So:


> foldl        :: (b -> a -> b) -> b -> [a] -> b
> foldl f e []     =  e
> foldl f e (x:xs) =  foldl f (f e x) xs


-------------------------------------------------------------------------------
II.2. Homework 4 Walk thru.
-------------------------------------------------------------------------------

Refer to hw04.lhs


-------------------------------------------------------------------------------
II.3. Access control mechanisms and policies
-------------------------------------------------------------------------------

Refer to Chapter 4, ACST. (see also the slides)


-------------------------------------------------------------------------------
II.3. Understanding Access control policies
-------------------------------------------------------------------------------

Reference: ACST, chapter 4 and 5.

Definition

Discretionary access control policies are dynamic (i.e., they can be changed), 
and they are typically under user control. In particular, discretionary 
access control (DAC) policies are policies where users control access to 
protected objects over which they have jurisdiction.


Relevant objects 

-- Access control matrix
-- Access control lists and capability lists

The trojan horse example (see class handouts)

-------------------------------------------------------------------------------
