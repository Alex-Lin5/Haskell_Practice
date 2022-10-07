-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 12 More on types. Inference for Access control logic 
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 02 Due (Friday) Oct 7, 11:59pm.

b. Your progress:

i.     Hutton, chapter 5, 6 and 8(and the slides associated to it). Practice 
       writing Haskell codes in a development environment (eg. Class VMs). 
       Exercises from Hutton are highly recommended. Also, Bird's text also has
       relevant worked examples with recursion and list comprehension as main 
       techniques to define function.

	 Review Help session(s) recordings.

ii.    ACST: Chapter 2. Chapter 3

iii.   Midterm:  Oct 20, 2022 (one hour written test, in-class).
	 Final: 	Dec 16, 2022, 8am -10am (90 minutes written exam. in-class)	

c. Homework 03 release soon.

** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. Recap on recent topics in programming
2. More on Recursive data types
3. Inference rules
4. Class practice 
5. Summary

-------------------------------------------------------------------------------
II.1. Recap on recent programming topics
-------------------------------------------------------------------------------

a. Homework 02  

Problem 4

i.  The function implement the composition of relations  as defined in ACST. 
    That is, your function must be of a type general enough to incorporate all 
    possible uses of the composition operation.


ii. Defining an operator #

(Update: do not use o in that question, use # instead)

In your code: (note > is omitted in this explanation)

infix #
(#)    ::  (the type of the composition of relation function)
(#) xs ys = (the definition of the composition of relation function)


Expected result:

*Main> q
[(1.0,1),(2.0,3),(3.0,3),(4.0,4)]
*Main> r
[(1,'a'),(2,'b'),(3,'b'),(3,'c')]
*Main> q#r
[(1.0,'a'),(2.0,'b'),(2.0,'c'),(3.0,'b'),(3.0,'c')]
*Main> 



b. Class exercise 5 revisited (Data declarations)

Code Example: CX05-discussed.lhs

c. Type classes

an alternative for using the "deriving" mechanism
Defining the functions/operations associated to the type class  manually 

Code Example: Nat.lhs (from bird)



--------------------------------------------------------------------------------	
c. More on recursive datatypes
--------------------------------------------------------------------------------


i.  Example: arithmetic expressions and its evaluations

 data AExp = Val Int | Add AExp AExp | Mult AExp AExp

 eval              :: AExp -> Int
 eval Val n        = n
 eval (Add e1 e2)  = (eval e1) + (eval e2) 
 eval (Mult e1 e2) = (eval e1) * (eval e2)

	ii. Remarks


-------------------------------------------------------------------------------
II.3. Inference rules
-------------------------------------------------------------------------------


Ref. ACST chapter 3 (see slides for chapter 3)

a. What are inference rules?
b. Examples
i. Taut rule
ii. Substitutions, instance of formula and derived rules

c. Formal reasoning (proofs) and inference rules

i. Inference rules and their justifications (Kripke structures)
ii. Proofs: Constructing a proof vs verifying a proof  
iii. Proof trees


-------------------------------------------------------------------------------
II.4. Class practice 
-------------------------------------------------------------------------------

Practice example:

a. Perform substitution to create instances

b. Proof trees and the construction of a proof


Review Rules for Access control and its usage (Section 4.1)


-------------------------------------------------------------------------------
II.5. Summary
-------------------------------------------------------------------------------



