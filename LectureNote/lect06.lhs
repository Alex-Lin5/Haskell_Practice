-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 6  Defining functions using recursion
-------------------------------------------------------------------------------

> import Prelude hiding (drop, product, length, (++), reverse)

-------------------------------------------------------------------------------

I. Announcement

a. Homework 00 Due Today (end of day).

Remarks:  Must turn in an properly named lhs file.

b. ACST 2.2 and Tues' class exercise.

c. Your progress:

i.     Hutton, chapter 3, 4 and 6 (and the slides associated to it)
ii,    ACST: Chapter 1, Chapter 2, section 1-2. Homework 01 will have both
       programming questions and ACST questions (Section 2.1, mathematical
       preliminaries for formal methods)

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. The language of access control logic: examples 
2. Recursion on lists
3. Case study: zip function (or insertion sort, if time permits)  
4. Summary

-------------------------------------------------------------------------------
II.1. The language of access control logic: examples
-------------------------------------------------------------------------------

Background: ACST, Chapter 2 Slides: 12 to 21.


a. Principal expressions

Rule:  

Princ ::= PName / Princ & Princ / Princ | Princ

Form  ::= (Princ => Princ) 

Examples:

PName:  Alice, Bob, Eve  (simple principals of the system)

Principal expressions

  Alice & Bob  : Alice and Bob
 
  Aice | Bob   : Alice quotes Bob


b. Access control formulas

  Eve => Bob   : Eve speaks for Bob

NOTE: it is a access control formula (ACL formula), not a Principal expression.

Examples of ACL formula:

i. Alice say (Bob controls uff)

[ Given Prop Var: uff (update file f) ]  


ii.  See ACST, example 2.6 for a well formed access control formula.


-------------------------------------------------------------------------------
II.2.  Recursion on lists (Hutton ch. 6)
-------------------------------------------------------------------------------

Background:  Hutton Slides: ch. 6. 

a.  Recap: a common pattern for defining a function via recursion  

> product    :: [Integer] -> Integer       -- function type
> product []     = 1                       -- base case
> product (x:xs) = x * (product xs)        -- recursion step 


> mystery :: [a] -> Int                    -- function type 
> mystery []  = 0                          -- base case
> mystery [x]   = 1                        -- base case 
> mystery [x,y]      = 2                   -- base case
> mystery (x:y:z:ws) = mystery ws          -- recursion step


Note the pattern used in the above two examples.

b. More examples (recursion on lists)

> (++) :: [a] -> [a] -> [a]
> [] ++ ys = ys 
> (x:xs) ++ ys = x : (xs ++ ys)


> reverse    :: [a] -> [a]
> reverse []     = []
> reverse (x:xs) = (reverse xs) ++ [x]


--------------------------------------------------------------------------------
II.3. Case study:  The zip function
--------------------------------------------------------------------------------

Class discussion

i.    Demo: show the type of zip function and see what it can do.

ii.   Potential usage of the zip function 
        
iii.  How to implement the function by recursion.
   
iv.   Lessons learned


If time permits:

Example:  Implement the insertion sort algorithm (Hutton 6.2)

Basic ideas
The insert step: insert
The insertion sorting algorithm: isort


