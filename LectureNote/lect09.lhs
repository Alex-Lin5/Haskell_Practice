-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 8  More on list comprehensions. Introduction to program testing
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 01 (Covers both Programming and ACST) Due today.

b. Your progress:

i.     Hutton, chapter 4, 5 and 6 (and the slides associated to it). Practice 
       writing Haskell codes in a development environment (eg. Class VMs). 
       Exercises from Hutton are highly recommended. Also, Bird's text also have
       relevant worked examples with recursion and list comprehension as main 
       techniques to define function.
       
ii.    ACST: Chapter 2, section 2, section 2 to 3.

iii.   All students are expected to run Haskell with libraries HUnit and 
       Quickcheck. 

c. Help session (via Zoom) by TAs (Friday). Details to be announced.

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. Haskell Modules (the cipher.hs example revisited).  
2. Program specification: examples
3. Semantic of Access control logic via Kirpke structures.
4. The evaluation for ACL formulas
5. Summary

-------------------------------------------------------------------------------
II.1. Haskell Modules 
-------------------------------------------------------------------------------

a. Reference: Bird, chapter 2, section 6.

b. List comprehension

c. Example: Revisit the cipher.hs example

   Turning cipher.hs to a module (named: caesarcipher.hs)

d. The benefits of using Modules:

   i.   incorporate useful programs/functions developed and re-use them.
   ii.  programs developed are better structured.
   iii. compiled module are much faster to evaluate


-------------------------------------------------------------------------------
II.2. Program specification: examples
-------------------------------------------------------------------------------

(See slides from ACST, chapter 2)

a.  Basic setup for defining Access control logic: Sets, functions & relations

b.  Implementing sets for Access control logic

Discussions: 

What's are needed ?

c.  Program specification:

Sets



-------------------------------------------------------------------------------
II.3. Semantic of Access control logic via Kirpke structures  
-------------------------------------------------------------------------------

a.   Reference: ACST, Section 2.2.1 (handling Principals)

                      (Simple principals, P and Q, P quotes Q)
                      
                      Section 2.2.2 (Handing ACL formulas with
                      "Speaks for", "Says", "Controls")                      

                      See ACST, chapter 2 slides        


b.   ASSIGN meanings to ACL formulas requires a definite interpretation of the 
     meaning of the FORMULAS involving 

i.   Speaks for:

ii.  Says: 

iii. Controls:


c.   Overall meaning of a ACL formula is defined via RECURSION


Discussions:


i.   Given a Kripke model M, an ACL formula f:

i.   What is the meaning of  M |= f  (M models f) ?
 
     *Guess*: Within our context (ACL logic), what does this mean:   |= f ?

iii. How to implement the evaluation E ?
   


-------------------------------------------------------------------------------
II.4. The evaluation of ACL formulas
-------------------------------------------------------------------------------


