-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 8  More on list comprehensions. Introduction to program testing
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (reverse)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Remarks on Homework 01 (Covers both Prorgamming and ACST).

b. Using Haskell packages (HUnit and QuickCheck)

c. Your progress:

i.     Hutton, chapter 4, 5 and 6 (and the slides associated to it). Practice 
       writing Haskell codes in a development environment (eg. Class VMs). 
       Exercises from Hutton are recommended. 

ii.    ACST: Chapter 2, section 2 and section 2.3.1.

iii.   All students should be able to run Haskell with libraries HUnit and Quickcheck.
       We will use the libraries more often in the coming lectures.

d. Prof. Lee office hour today (Thurs, 9/22/2022) is moved to tomorrow (Friday, 9/23/2022) from 8:30 am - 10:am. 

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. List comprehension: more examples 
2. Local functions
3. Practice
4. Introduction to program testing (with demo)
5. Summary

-------------------------------------------------------------------------------
II.1. List comprehension: more examples 
-------------------------------------------------------------------------------

a. Recall the example: 

> factor :: Int -> [Int]
> factor n = [ x | x <- [1..n], n `mod` x == 0]

We can a function to tell if an integer is a prime or not:

> isPrime   :: Int -> Bool
> isPrime n = factor n == [1,n]

In addition, we can print the prime numbers without bounds:

> theprimes :: [Int]
> theprimes =  [ n  | n <- [2..], isPrime n]


b.  Let us "TRANSLATE" a mathematical definition using list comprehension.

Example:  

two positive integers n, m is said to be relative prime  provided 
the only common factor of n, m is 1.

This can be translated to the following implementation

> noCommonF     :: Int -> Int -> Bool
> noCommonF n m = null lst
>     where   lst = [ x | x <- factor n, y <- factor m, x==y, y > 1] 
>             -- lst is the list of common factors of n, m that is > 1


Discussions on list comprehension:

When will you prefer to use list comprehension ?  Why ?

Example: using zip functions

> index    :: [a] -> [(a,Integer)]
> index xs = zip xs [0..]

> charindexedLst :: [(Char,Integer)]
> charindexedLst = index ['a'..'z']

> pairs :: [a] -> [(a,a)]
> pairs xs = zip xs (tail xs)

> sorted :: Ord a => [a] -> Bool
> sorted xs = and [x <= y | (x,y) <- pairs xs]


c.  Case study: An implementation of Caecar's cipher with cryptanalysis

Code: cipher.hs (from Hutton, also see Hutton, chapter 5, section 4 to 5)

Practice:

> displayVowels     :: String -> [Int]
> displayVowels str = [i|(c,i) <- zip str [0..] , elem c ("aeiou" ++ "AEIOU") ]

-------------------------------------------------------------------------------
II.2. Local functions as helpers  
-------------------------------------------------------------------------------

a. Background

> fun1    :: String -> [Int]
> fun1 str = [ i | (c,i) <- zip str [0..], elem c vowelLst]
>      where vowelLst :: String
>            vowelLst = "aeiou"

> vowelLst1 :: String 
> vowelLst1 = "aeiou"

vowelLst is local, vowelLst1 is not


b. Defining local functions as helpers

> isort    :: Ord a => [a] -> [a]
> isort []     = []
> isort (x:xs) = insert x (isort xs)
>     where 
>       insert          :: Ord a => a -> [a] -> [a]
>       insert x []     = [x]
>       insert x (y:ys) 
>           | x <= y    = (x:y:ys)
>           | otherwise = y:(insert x ys) 


Remark: The insert function is local as a helper for isort.

-------------------------------------------------------------------------------
II.3. Practice   
-------------------------------------------------------------------------------

Write reverse function where all the helper functions are local.


> reverse    :: [a] -> [a]
> reverse []     = []
> reverse xs     = second (transfer (xs,[]))
>     where
>     transfer         :: ([a],[a]) -> ([a],[a])
>     transfer ([],ys)     = ([],ys)               -- transfer.1
>     transfer ((x:xs),ys) = transfer (xs,(x:ys))  -- transfer.2
>     second       :: (t1,t2) -> t2
>     second (u,v) = v                             -- second.1 


-------------------------------------------------------------------------------
II.4.  Introduction to program testing (with demo)
-------------------------------------------------------------------------------

a. HUnit


The function to be tested is:

> fun :: Int -> Int -> Int -> Int
> fun x y z = (x `max` y) `max` z

--------------------------------------------------------------------------------

Using HUnit, we can create four test cases as follows:  

> testcase1 = TestCase (assertEqual "for: fun 9 1 1" 9 (fun 9 1 1))
> testcase2 = TestCase (assertEqual "for: fun 9 9 9" 9 (fun 9 9 9))
> testcase3 = TestCase (assertEqual "for: fun 0 9 0" 9 (fun 0 9 0))
> testcase4 = TestCase (assertEqual "for: fun (-10) 0 9" 9 (fun (-10) 0 9))

where for each case, the output is always one.

We can group the four test cases as a "list":

> testsfun = TestList [testcase1, testcase2, testcase3, testcase4]
 

and Run the tests via and runTestTT function provided in HUnit. For this example, you will get:

*Main> runTestTT testsfun
Cases: 4  Tried: 4  Errors: 0  Failures: 0
Counts {cases = 4, tried = 4, errors = 0, failures = 0}



b. QuickCheck

Let check if our implementation of reverse is "Correct" ..

> prop_RevRev xs = reverse (reverse xs) == xs
>     where types = xs::[Int]


*Main> quickCheck prop_RevRev
+++ OK, passed 100 tests.


*Main> verboseCheck prop_RevRev
:
:
Passed:
[6,-2,0,-1]
:
:

+++ OK, passed 100 tests.


Discussions: 

What's the property being verified ?
In what way(s) it helps to test the implementation of reverse ?

