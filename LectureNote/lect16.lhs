
-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 16     Specification-based testing. 
               Implementations of ACL formulas and evaluation functions

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck
> import Set
> import Prelude hiding (until,iterate, map, filter, sqrt)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 04 

   i.   Will be released soon
   ii.  Focus: 

        Executable specification
        Syntax and semantics of ACL logic
  

b. Your progress:

i.     Hutton, chapter 7, 8 (and the slides associated to it). Please spend 
       time to use text examples (Hutton, also recommended Bird) for practice.

ii.    ACST, Chapter 3, 4.

** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. The Set data type 
2. Executable specifiications
3. Representing a Kripke's structure
4. Feedbacks from Midterm
5. Summary

-------------------------------------------------------------------------------
II.1. The Set data type
-------------------------------------------------------------------------------

Reference: Set.hs file

a. Overview of Set.hs

i.   Sets are implemented as ordered lists without repetitions

ii.  A walkthrough of the Set datatype

--   newtype (Note the difference between: type and newtype, see Hutton 
     section 8.3)

     a mechanism to declare a new type that has 

     -- single constructor 
     -- a single argument


--   To create a set from a list, we can use the function makeSet

> intSetA :: Set Int
> intSetA =  makeSet [1..10]

> intSetB :: Set Int
> intSetB =  makeSet ([1..10]++[3..12]) 


--  Practice (using the functions in Set.hs)

--  a. Create a singleton set and demonstrates the set is not empty.

> setS :: Set Int 
> setS =  sing 1

> testNonEmpty  = not (eqSet setS empty) 

--  b. display (show) the contents of a set

--   When working with the functions in Set.hs, use the showSet function
--   Note: it is not the original showSet function from Set.hs


> setA = showSet (show) intSetA

> setB = showSet (show) intSetB

This will show: 

*Main> setA
"{ 1 2 3 4 5 6 7 8 9 10 }"
*Main> setB
"{ 1 2 3 4 5 6 7 8 9 10 11 12 }"


In particular, empty set and singleton set (say {1}) are shown as:

*Main> showSet (show) empty
"{ }"

*Main> showSet (show) (sing 1)
"{ 1 }"


--  c. Practice set operations






--  The flatten function unwrap a set X (type Set a) to a list (type [a])   

*Main> :t intSetA
intSetA :: Set Int

*Main> :t flatten intSetA
flatten intSetA :: [Int]

    It allows us to apply functions to a list (type [a]) and can cast it 
    to Set type via the function makeSet. 

    For example, adding 1 to each element in intSetA can be done by the 
    following steps:
    
    Step 1:  map (+1) (flatten intSetA)

            returns a list of type [Int]

*Main> map (+1) (flatten intSetA) 
[2,3,4,5,6,7,8,9,10,11]


    Step 2:  Turn the list to a Set (of type Set Int)

    makeSet (map (+1) (flatten intSetA)) 

    and it looks 

*Main> showSet (show) (makeSet (map (+1) (flatten intSetA))) 
"{ 2 3 4 5 6 7 8 9 10 11 }"

*Main> :t makeSet (map (+1) (flatten intSetA))
makeSet (map (+1) (flatten intSetA)) :: Set Int



-------------------------------------------------------------------------------
II.1. Executable specifications
-------------------------------------------------------------------------------

To understand programs we must know what it is supposed to do. That is, we must 
know its specification. Thus a rigorous, unambiguous specification is an 
invaluable tool for reasoning about programs.

In functional programming, an executable specification is an automated test 
that verifies if a program (ie. functions) meet its specification. 

For the data type Sets,  we can write specifications regarding sets as 
QuickCheck properties. The properties are executable and help to verify if 
a function meet its specification.

-- Beginning examples:

> prop_PlusAssociative       :: Integer -> Integer -> Integer -> Bool
> prop_PlusAssociative x y z =  (x+y)+z ==  x+(y+z) 

Our testing result will look like:

*Main> quickCheck prop_PlusAssociative
+++ OK, passed 100 tests.

The above verify if the addition operation are associative.

-- How about the following property:

> prop_PlusAssociative2       :: Float -> Float -> Float -> Bool
> prop_PlusAssociative2 x y z =  (x+y)+z ==  x+(y+z) 






--------------------------------------------------------------------------------


-- For the Set data type, what are the specifications ? Can be be verified (via
   tools such as QuickCheck ?


-- Example:
        
> prop_RevRev xs = reverse (reverse xs) == xs
>     where types = xs::[Int]

> prop_Sing  x  = not (eqSet (sing x) empty)


> prop_Sub xs  = subSet empty (makeSet xs)
>     where types = xs::[Int]



--------------------------------------------------------------------------------
II.3. Representing a Kripke's structure
--------------------------------------------------------------------------------

A Kripke model M = (W,I,J)

Discussions:  How do we represent a kripke structure M, in Haskell 

-- W: Set of all worlds in the model



-- I: The interpretation function for propositions in the model




-- J: The interpretation function for each principal regarding the principal's 
   understanding of the worlds 


For a specific model, the model includes


-- PropVal: the collection of atomic propositions in the model


-- PName: a collection of all simple principals in the model


Remarks on How to make use of the Set data type specified



-------------------------------------------------------------------------------
II.4. Feedback on Midterm 
-------------------------------------------------------------------------------

a. Statistics 

   -- types
   -- using pattern matching 

b. Grade distribution

   -- Only a prediction 
   -- Overall pattern 


c. Suggestions and feedbacks




-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------



