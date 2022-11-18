-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 20     Case Study: Implementation of Queue data type 
                           (with verification)
               Mandatory Access Control

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

i.  Practice writng Hutton programs (Hutton, Chapter 1-8)

ii. ACST, Chapter 4.2, 4.3 (two factor authentication)
          Chapter 5.2, 5.3. 

c.  Help videos       


** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. Queue as two stacks
2. Activity: Implementation of Queue with two stacks
             and testing with QuickCheck
3. Introduction to Mandatory Access Control
4. Summary

-------------------------------------------------------------------------------
II.1. Queue as two stacks
-------------------------------------------------------------------------------

a. What is the type of Queue ?

b. What the functions and data included ?

- Empty Queue

- front element

- add (Enqueue) an element

- test if the queue is empty 

- remove the front element in the queue 
   Note: The queue is assumed to be not empty 

c. A Utility function for the Queue datatype

flipQ: "re-adjust" the queue whenever the 
      front list f is empty

Whenever the first list is empty, pop the elements in the second list
and push them to the first list one by one


-------------------------------------------------------------------------------
II.2. Class Activity 7
-------------------------------------------------------------------------------

Implement a queue datatype (with support data and functions)

Download the file CX07.lhs. Put your work inside and rename it according 
to our convention. Turn it in by 3:30 pm.


-------------------------------------------------------------------------------
II.3. Introduction to Mandatory Access Control
-------------------------------------------------------------------------------

1. A beginning example (see the document mac.pdf)

2. Overview  (ACST, Chapter 5 slides).


-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------


