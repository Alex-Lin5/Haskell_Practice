-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 10  Kripke Structures and inference. Data declarations
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 02 (Covers Programming) will be released on Friday.

b. Your progress:

i.     Hutton, chapter 4, 5 and 6 (and the slides associated to it). Practice 
       writing Haskell codes in a development environment (eg. Class VMs). 
       Exercises from Hutton are highly recommended. Also, Bird's text also have
       relevant worked examples with recursion and list comprehension as main 
       techniques to define function.
       
ii.    ACST: Chapter 2. Chapter 3.1 

c. Help session (via Zoom) by TAs (next Monday, starting at 10 am). Details 
   will be announced in blackboard.

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. Working with Kirpke structure and ACL formulas
2. Reasoning with Access control logic 
3. Data declarations
4. Summary

-------------------------------------------------------------------------------
II.1. Working with Kripke structures and ACL formulas
-------------------------------------------------------------------------------

Reference: ACST, Chapter 2.

a. Pre-class exercise continued.

  i.    Kripke model and its graph representation
  ii.   Applying recursion to evaluate of formula 
  iii.  Practice: continuation of pre-class exercise


b. From kripke models to reasoning about access control

-------------------------------------------------------------------------------
II.2. Reasoning with Access control logic 
-------------------------------------------------------------------------------

Reference: ACST, Chapter 3. (see slides from Chapter 3).

a. Logical rules 

    H1 ..... Hk
    -----------
         C   


   Hypothesis (premises)  H1, ... , Hk 

   and 

   consequence (conclusion)  C


b. Reasoning: beginning examples


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
II.3. Data declarations  
-------------------------------------------------------------------------------

Reference:  Hutton, chapter 8 (see slides for chapter 8)

a.   Motivation:  represent ACL formula via the Haskell langauge

     Beginnning Example: represent formula in propositional logic 
                         (see tautology.hs file)

b.   Declaring types and classes 


-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------


