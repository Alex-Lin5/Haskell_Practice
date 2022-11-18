-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 21     Case Study: Implementation of Queue data type 
                           (with verification)  cont'd
               Haskell IO                           

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Set
> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (until,iterate, map, filter, sqrt, foldr, foldl)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a.  Homework 05 due on 11/17 (end of day).

b.  Progress:

i.  Practice writng Haskell programs (Hutton, Chapter 1-8)

ii. ACST, Chapter 4.2, 4.3 (two factor authentication)
          Chapter 5.2, 5.3. 

c.  Coming Homework 6 Highlights

    Implementing a queue data type in another langauge 
    Addressing how quickCheck help ..


d.  CIS 700  (Prof. G. Katz)

     Deep Automated Theorem Proving

     It will cover some deep learning techniques (transformers, graph NNs) that have been applied to guide symbolic proof search.
     Use theorem provers (working with/running automated and interactive proof systems)




** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. More on queue as two stacks
2. Implementation of Queue with two stacks and testing with QuickCheck 
   (cont'd)
3. Haskell IO
4. Summary

-------------------------------------------------------------------------------
II.1. More on queue as two stacks
-------------------------------------------------------------------------------

a. Continue with the code in CX07-discussed-v2.lhs

Interpret the list of properties 

-------------------------------------------------------------------------------
II.2. Implementation of Queue with two stacks and testing with QuickCheck 
      (cont'd)
-------------------------------------------------------------------------------

a. Writing Tests (More examples)

-- Explicit quantification

   the  forAll function 

b. Generators

-- Defining Generators: 

   the equivQ 

-- Interpreting the sample test results


-------------------------------------------------------------------------------
II.3. Haskell IO
-------------------------------------------------------------------------------

a.  Hutton Ch.10 (Also see the slides)

b.  Side effects 

d.  The do notation


-------------------------------------------------------------------------------
II.3. Summary
-------------------------------------------------------------------------------

1. A beginning example (see the document mac.pdf)

2. Overview  (ACST, Chapter 5 slides).


-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------


