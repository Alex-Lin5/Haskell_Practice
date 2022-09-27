-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 7  Access control logic: Kripke's structures; List comprehension
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

I. Announcement

a. Homework 01 to be distributed soon (Covers both Prorgamming and ACST).

b. ACST 2.2 and Tues' class exercise.

c. Your progress:

i.     Hutton, chapter 3, 4 and 6 (and the slides associated to it). Practice 
       writing Haskell code in a development environment (eg. Class VMs)

ii.    ACST: Chapter 1, Chapter 2, section 1-2.

iii.   Today's office hour specifically for those who did not take Discrete
       Mathematics (CIS 607 background) in their undergraduate studies.

iv.    Students who's using Apple laptop (M1 chip), please stay 
       (for ~ 5 minutes) after class.


** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. The language of access control logic: kripke's structures
   and Class activity
3. Quicksort revisited
4. Introduction to list comprehension  
5. Summary

-------------------------------------------------------------------------------
II.1. The language of access control logic: kripke's structures
-------------------------------------------------------------------------------

Background: ACST, Chapter 2 Slides: 22 to 24.


a. Definition (kripke's structure)

b. Examples (See Slides 23, 24)

c. Class activity: 

Introducing Kripke's structures and their graph representation

-------------------------------------------------------------------------------
II.2.  Quicksort revisited (Hutton ch. 6)
-------------------------------------------------------------------------------

Background:  Hutton Slides: ch. 5 and 6. 

> qsort    :: Ord a => [a] -> [a]
> qsort []     = []
> qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
>     where 
>       smaller = [a | a <- xs, a<= x]
>       larger  = [b | b <-xs, b > x]


In the above code, the smaller and larger are LISTs that are defined using
list comprehension (resembles of using set builder notation to define sets).


--------------------------------------------------------------------------------
II.3. Introduction to list comprehension  
--------------------------------------------------------------------------------

Slides (Hutton, chapter 5)

Discussion topics:

1. Background: Set Comprehension

2. List comprehension: 

a  Generators: single, multiple and dependent 

b. Guards 

Example: Turning a mathematical definition into code

> factor :: Int -> [Int]
> factor n = [ x | x <- [1..n], n `mod` x == 0]

> isPrime   :: Int -> Bool
> isPrime n = factor n == [1,n]





