-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 11  Data declarations and algebraic data types 
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Discussios on Homework 02

b. Your progress:

i.     Hutton, chapter 4, 5, 6 and 8(and the slides associated to it). Practice 
       writing Haskell codes in a development environment (eg. Class VMs). 
       Exercises from Hutton are highly recommended. Also, Bird's text also have
       relevant worked examples with recursion and list comprehension as main 
       techniques to define function.
       
ii.    ACST: Chapter 2. Chapter 3.1 

c. Help session (via Zoom) by TAs (next Monday, starting at 10 am). Details 
   will be re-scheduled in blackboard.  Note: I strongly recommend you to attend
   (or at least review the recordings). It will be a good preparations for the 
   Midterm.

** MIDTERM IS COMING **

i.     Midterm are scheduled on Oct 20. 
ii.    It is an one hour written test (in class). 
iii.   It will cover BOTH Programming and Formal Methods. 


** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. Discussions on HW 02 
2. Data declarations
3. Introduction to recursive data types
4. In class practice
5. Summary

-------------------------------------------------------------------------------
II.1. Discussions on HW 02
-------------------------------------------------------------------------------

a. Luhn's algorithm explained.

Example:  1784  

Write example as [1,7,8,4]
Second last number: 8
Moving left, double each other number from second last
[2, 7, 16, 4]
Subtract 9 from each number that’s greater than 9
[2, 7, 7, 4]
Add all the resulting numbers together
sum [2,7,7,4] = 2+7+7+4 = 20 = 0 (mod 10)
Conclude that it is a valid card number
 
Example: 4783

Write example as [4,7,8,3]
Second last number: 8
Moving left, double each other number from second last
[8,7,16,3] 
Subtract 9 from each number that’s greater than 9
[8,7,7,3]
Add the resulting number together 
sum [8,7,7,3] = 25 = 5 (mod 10)
Conclude that it is NOT a valid card number

The algorithm is designed for REAL Credit Card for (security) error checking.
Use your own card to see if this still works !
	
b. The definition of (o), the composition of relations, explained. 

Eg:

{(0,1),{1,2),(1,3)}
{(1,4),{2,4),(3,2)}


--------------------------------------------------------------------------------
	
b. Practice Program Testing  


-- Use the example egHUnit.lhs for practice



-------------------------------------------------------------------------------
II.2. Data Declarations
-------------------------------------------------------------------------------


Ref. Hutton, Chapter 8 (in particula, review the slides)

a.  Examples


> data Shape = Circle Float | Rect Float Float

> mine :: Shape
> mine = Circle 1.0

> area            :: Shape -> Float
> area (Circle n) = pi*n*n
> area (Rect a b) = a*b

> allarea    :: [Shape] -> Float
> allarea []            = 0
> allarea ((Circle a):xs) = area (Circle a) + allarea xs
> allarea ((Rect b c):xs) = area (Rect b c) + allarea xs


-------------------------------------------------------------------------------
II.3. Introduction to recursive data types
-------------------------------------------------------------------------------

a. Beginning examples

> data Nat = Zero | Succ Nat 

> newsum           :: Nat -> Nat -> Int
> newsum Zero Zero     = 0
> newsum Zero (Succ y)     = 1 + newsum Zero y
> newsum (Succ x) (Succ y) = 1 + newsum x (Succ y) 

*Main> newsum (Succ Zero) (Succ (Succ Zero))
3


b. Review tautology.hs


-------------------------------------------------------------------------------
II.4. In-class exercise
-------------------------------------------------------------------------------


a. Write a function count which will, given a list of shapes (type Shape) as
   input, return (c,r) where

   c = the number of shapes in the list that are circles 
   r = the number of shapes in the list that are rectangles


b. Define a recursive data type:

   Define a new data type: Simple expression SimE where the it is either
   
   i.   a character 
   ii.  Concatenations of two Simple expressions 

   Write a function that compute the number of characters of an 
   Simple expressions


c. Consider the following data types:

> data Lst a = Nil | Cons a (Lst a)
>              deriving (Show)

> yours :: Lst Int
> yours = (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))) 

What is the above type trying to represnt ?


-------------------------------------------------------------------------------
II.5. Summary
-------------------------------------------------------------------------------


