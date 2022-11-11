-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 19     

Case study: The syntax and semantics of Access Control Logic with 
            implementations 
            Program testing (Queues)                            
   
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

a.  Homework 05 releases today. Due on Nov 18, end of day.

b.  Progress:

i.  Review programming in Haskell Chapter 1 to 8. Please spend 
    time to use text examples (Hutton, also recommended Bird) 
    for practice.

ii. ACST, Chapter 3, 4, 5. Note: We will cover Chapter 3-5 together.

c.  Feedbacks
 
    -- Lectures
    -- Coverage
    -- Formal methods
    -- Programming

d.  New name: Assured programming with formal methods

** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. Discussions on HW05
2. Program testing: Queues
3. Summary

-------------------------------------------------------------------------------
II.1. Discussions on HW05
-------------------------------------------------------------------------------

Reference: ACST, chapter 2. Hutton, Chapter 1-8

a. Working with the Set data type

   -- makeSet and flatten functions

   -- showSet function


Practice examples:

   -- Create a set from a list

   -- Create a list from a set

   -- Displace the contents of a set


b. HW04 and HW05

   -- A case study for the syntax and semantics of Access control logic

      -- Syntax:     AC Formula 

      -- Semantics:  Kripke structures, evaluation functions

c. Discussions on HW 05

   -- Kripke structures' representation

   -- type: (Wkripke, IKripke, JKripke)

> type PropVar = Char
> type PName   = String
> type WKripke = Set Int
> type IKripke = Set (PropVar, Int)
> type JKripke = Set (PName,(Int,Int))

   -- Draw a diagram   

   -- Discussions (see below):

em             :: (WKripke, IKripke, JKripke) -> Form -> WKripke
em (w, i, j) (Var c)  =      -- Write the function I
em (w, i, j) (Not f)  =      -- Use set diff (Set.hs)               
em (w, i, j) (Or f g) =      -- Use set union (Set.hs)               
em (w, i, j) (And f g) =     -- Use set inter (Set.hs)   
em (w, i, j) (Imply f g) =   -- Use set diff and set union (Set.hs) 
em (w, i, j) (Equiv f g) =   -- Use set inter (Set.hs) and em recursively    
em (w, i, j) (Says  p f) =   -- What are the helpers we can use here ?
em (w, i, j) (Contr p f) =   -- Use em recursively 
em (w, i, j) (For p1 p2) =   -- What are the helpers we can use here ?

--------------------------------------------------------------------------------
II.2. Program testing: 
      A case study: Develop a Queue datatype
--------------------------------------------------------------------------------
  
a. The Queue type

> type Queue a = [a]
> empty = []
> add x q = q ++ [x]
> isEmpty q = null q
> front (x:q) = x
> remove (x:q) = q


Discussions: How to develop a Queue using two "Stacks" ?




--------------------------------------------------------------------------------

III. Summary