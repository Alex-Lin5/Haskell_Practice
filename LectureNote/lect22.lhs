-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 22                                

More on property testing.  Introduction to Bell La-Padula Model

-------------------------------------------------------------------------------


> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (until,iterate, map, filter, sqrt, foldr, foldl)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a.  Homework 06 has been released.

b.  Final examination

    - overall schedule please see

https://registrar.syr.edu/wp-content/uploads/final-exams-2022-fall-overview.pdf

    Date: Fri, Dec 16, 8:00 am­10:00 am, Same lecture auditorium
    Time allowed:  1.5 hour 
    Coverage:

    - Programming:  Main focus:

      Types, Recursion, list comprehension, higher order functions and 
      data declarations

    - Formal methods: Main emphasis:

      Implementation ACL formula and Kripke's model. Proofs. Property testing.
      Security models and policies:  Discretionary access control, Mandatory 
      access control. Bell La-Padula and Biba polices
    
c.    Academic integrity 

d.    Help for the preparation of final 

** Any questions? **


------------------------------
II. Lecture overview
------------------------------

1. Discussions on Pre-class exercise and property testing
2. Homework 6: a walkthrough
3. Mandatory access control: Bell La-Padula model
4. Summary

-------------------------------------------------------------------------------
II.1. Discussions on Pre-class exercise and property testing
-------------------------------------------------------------------------------

1. Comparing two different implementations of queues
2. Examples of executable specification  

-------------------------------------------------------------------------------
II.2. Homework 6: a walkthrough
-------------------------------------------------------------------------------

a.  Homework objectives

b.  Practice on writing tests

c.  Implementation of a queue (via two stacks) in a procedural language

d.  Remarks on property testing 

-------------------------------------------------------------------------------
II.3. Mandatory access control: Bell La-Padula model
-------------------------------------------------------------------------------

a.  Reference:  ACST Chapter 5: 5.1, 5.2, 5.4, 13.1, 13.2

b.  Recap: Discretionary Access control policy

    - Access control matrix 

    - Access control lists and expressing them in the language of 
      access control

c.  Extending the logic with security levels 

    - Syntax
    - Semantics 
    - Inference rule
  

d.  Key examples 

    - ACST. 5.4.3 
    - ACST. Examples 13.1 to 13.4


-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------

