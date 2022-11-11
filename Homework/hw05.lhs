--------------------------------------------------------------------------------

CIS 623 Structured programming and formal methods

Fall 2022

Homework 05 Kripke's model for ACL formula

> import Prelude 
> import Set
> import Test.QuickCheck

Total points: 10 + 5 + 60 + 45 = 120


-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name:

Email:

Number:

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Nov 08, 2022 
Due date:       Nov 17, 2022, 11:59 pm

Remarks:

1. (5 point) You submission should be named as XXX-hw05.lhs where XXX is the 3 
digit no. assigned to you in blackboard.

You will lose 5 point if you do not following this naming convention. 

2. We do not accept any late submissions.
3. If you encounter any difficulties, and but you can upload your submission
   within an hour after the due date, please state the reason below:

State the reason(s) for late submission below (if needed):


4. If you cannot upload your submission within an hour after the due date
   because of a valid reason (eg. network/power outage etc.)  contact the
   grader at 

   ymfarhat@syr.edu 

   when email is available. Your grader will not grade your work but you may 
   receive an exemption.

--------------------------------------------------------------------------------

Note:

1. To answer the programming questions, add the haskell code according to the
requirement. DO NOT FORGET to add the > symbol below each line in your code.

2. Use the given Set.hs file (this differs from the standard one we once used
   in our lectures), save it in the same directory when you are working on this 
   homework.

-------------------------------------------------------------------------------
Preliminaries:

-- Represent single principals and propostional variables
-- Define Principal expression and ACL formula 

-------------------------------------------------------------------------------

> type PName   = String        -- Represent the name of a simple princlpal  
> type PropVar = Char          -- Represent the name of a propositional var.

> data Prin = Name PName       -- Define a principal expression 
>     | Together Prin Prin     -- ie. the expression Princ & Princ  in ACST                               
>     | Quote Prin Prin        -- ie. the expression Princ | Princ  in ACST
>       deriving (Eq, Show)

> data Form  = Var Char
>            | Not   Form
>            | Or    Form Form
>            | And   Form Form
>            | Imply Form Form
>            | Equiv Form Form
>            | Says  Prin Form  -- Written as (Princ controls Form) in ACST
>            | Contr Prin Form  -- Written as (Princ controls Form) in ACST
>            | For   Prin Prin  -- Written as  P ⇒ Q in ACST
>              deriving Show


-------------------------------------------------------------------------------
Represent a Kripke Model (for Access control formula)
-------------------------------------------------------------------------------

A kripke model M for ACL formula consists of:

1. a list of simple principals       (each member is a simple principal in M)

2. a list of propositional variables (each member is a prop. variable   in M)

3. a list/set of elements each represents a possible world in M

4. a list/set of tuples that represents the interpretation function that maps 
   each propositional variable to a set of worlds of M. 

5. a list/set of tuples that represents the J function that maps each principal 
   name to a relation on worlds (a subset of W ×W) of M.

6. We write M = (W, I, J) when the simple principals and propositional variables
in the model M are specified properly.

Remarks: 

There are multiple ways to specify a Kripke Model.  The following are
typical examples:

Example 2.8 (ACST):  Let the model in the question be m28 = (W,I,J)

--------------------------------------------------------------------------------
1  -- Represent all the simple principals in m28 as a list 
--------------------------------------------------------------------------------

> princLst :: [PName]
> princLst = ["Alice","Bob"]

--------------------------------------------------------------------------------
2  -- Represent all the atomic propositions of m28 as a list 
--------------------------------------------------------------------------------

> propLst :: [PropVar] 
> propLst = ['q','r','s']

--------------------------------------------------------------------------------
3a  -- Represent the set W as a list:
--------------------------------------------------------------------------------

> lstW :: [Int]
> lstW = [0,1,2]

--------------------------------------------------------------------------------
3b   -- Transform the list lstW to a Set using makeSet:
--------------------------------------------------------------------------------

> setW :: Set Int
> setW = makeSet lstW

--------------------------------------------------------------------------------
4a   -- Represent the set I as a list:
--------------------------------------------------------------------------------

> lstI :: [(Char,[Int])]
> lstI = [('q',[0,2]),('r',[1]),('s',[1,2])]

--------------------------------------------------------------------------------
4b   -- Transform the list lstI to a Set using makeSet
--------------------------------------------------------------------------------

> setI :: Set (Char,[Int])
> setI = makeSet [('q',[0,2]),('r',[1]),('s',[1,2])]

--------------------------------------------------------------------------------
4c   -- An Alterative
--------------------------------------------------------------------------------

> i :: Set (Char,Int)
> i = makeSet [('q',0),('q',2),('r',1), ('s',1), ('s',2)]

--------------------------------------------------------------------------------
5a  -- Represent the set J as a list:
--------------------------------------------------------------------------------

> lstJ :: [(PName,[(Int,Int)])]
> lstJ =  [("Alice",[(0,0),(1,1),(2,2)]),
>          ("Bob",[(0,0),(0,1),(1,2),(2,1)])
>          ]        

--------------------------------------------------------------------------------
5b   -- Transform the list lstJ to a Set using makeSet
--------------------------------------------------------------------------------

> setJ :: Set (PName,[(Int,Int)])
> setJ = makeSet [("Al",[(0,0),(1,1),(2,2)]),
>                 ("Bob",[(0,0),(0,1),(1,2),(2,1)])
>                ]


--------------------------------------------------------------------------------
5c   -- An alternative 
--------------------------------------------------------------------------------

We can also represent the set J as the following:

> j :: Set (PName,(Int,Int))
> j = makeSet [("Alice",(0,0)), ("Alice",(1,1)), ("Alice",(2,2)),
>              ("Bob",(0,0)), ("Bob",(0,1)), ("Bob",(1,2)),("Bob",(2,1))
>             ]



--------------------------------------------------------------------------------
6a   -- Represent the model M = (W,I,J) as a triple where each of the member
        is a list
--------------------------------------------------------------------------------


> modelLstM :: ([Int], [(Char,[Int])], [(PName,[(Int,Int)])])
> modelLstM = (lstW, lstI, lstJ)

--------------------------------------------------------------------------------
6b   -- Represent the model M = (W,I,J) as a triple where each of the member
        is a Set
--------------------------------------------------------------------------------

> modelM :: (Set Int, Set (Char,[Int]), Set (PName,[(Int,Int)]))
> modelM = (setW, setI, setJ)

--------------------------------------------------------------------------------
6c   -- Represent the model M = (W,I,J) as a triple using 
        3b (for W), 4c (for I), 5c (for J)
--------------------------------------------------------------------------------

In this homework, we will represent a Kripke model via 6c.

--------------------------------------------------------------------------------
Problem 1. (60 point)  

Implement the evaluation for ACL formula with kripke's structure
--------------------------------------------------------------------------------

Follow the definitions and notations listed below (given in ACST Chapter 2): 

-  Definition 2.1 (page 23) 
-  Definitions for J (P & Q), J (P | Q)  (page 27) 
-  Figure 2.1     (page 29) 

implement the evaluation function: 

em 

for ACL formulas using the following type definition 

> type WKripke = Set Int
> type IKripke = Set (PropVar,Int)
> type JKripke = Set (PName,(Int,Int))

and the template below:

em             :: (WKripke, IKripke, JKripke) -> Form -> WKripke
em (w, i, j) (Var c)  =  
em (w, i, j) (Not f)  =                  
em (w, i, j) (Or f g) =  
em (w, i, j) (And f g) =  
em (w, i, j) (Imply f g) = 
em (w, i, j) (Equiv f g) 
em (w, i, j) (Says  p f) =  
em (w, i, j) (Contr p f) = 
em (w, i, j) (For p1 p2) =


If you use helper functions in your code, please provide a concise specification
for each of these functions.


*** Put your answer below. For codes, DO NOT FORGET to add the > symbol ***






--------------------------------------------------------------------------------
Problem 2. (45 point)  

Verification of em functions based on known examples
--------------------------------------------------------------------------------

For each of the examples (selected from ACST) below, use the em function you
developed in problem 3 to verify the answers printed on the test.  In ease case,
please represent the kripke model, the formula and the results in the space 
provided.



a. Example 2.13 (15 point)


*** i. Put your representation of the given kripke model in the space below ***



*** j. Put your representation of the given formula in the space below ***



*** k. Put the results after running the em problem in the space below ***




--------------------------------------------------------------------------------

b. Example 2.14 (15 point)



*** i. Put your representation of the given kripke model in the space below ***



*** j. Put your representation of the given formula in the space below ***



*** k. Put the results after running the em problem in the space below ***




--------------------------------------------------------------------------------

c. Example 2.15 (15 point) 



*** i. Put your representation of the given kripke model in the space below ***



*** j. Put your representation of the given formula in the space below ***



*** k. Put the results after running the em problem in the space below ***






--------------------------------------------------------------------------------
