-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 18     Access control mechanisms & policies: 
               discretionary access control (DAC)

               Implementation of the evaluation function for ACL formula
               
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

a.  Homework 04 due on 11/08 (end of day).

b.  Progress:

i.  Hutton, chapter 7, 8 (and the slides associated to it). Please spend 
    time to use text examples (Hutton, also recommended Bird) for practice.

ii. ACST, Chapter 3, 4, 5. Note: We will cover Chapter 3-5 together.


** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. Access control mechanisms and policies: discretionary access control
2. Verification with Access control: Examples
3. Represent a Kripke Model
4. Summary

-------------------------------------------------------------------------------
II.1. Access control mechanisms and policies: discretionary access control
-------------------------------------------------------------------------------

Reference: ACST, chapter 4-5

a. Using the language of AC (Chapter 2) to support reasoning to make 
   (eg.  To answer the question: “Should this request be granted?”)
   
   -- Model: Access control matrix (ACM) (eg. Table 4.1 in ACST) 

      -- Subjects
      -- Objects 
      -- Previleges and Rights
      -- Authorization

         Does a subject P has jurisdiction (is authorized) for the Rights 
         specified

   -- Describing each entry in ACM

      -- (General form)   < access right , object>  (modelled by proposition)
        
   -- Request, Authority 
 
      -- (Request)            Subject says <access right, object>

      -- (Control of Rights)  Subject controls <access right, object>

   -- Trust Assumptions

      -- Proxy: (Speaks for)  P => Q

      -- Some terms

         -- Certificate (signed statement made by a recognized authority)

         -- Credential is a certificate: asserts a particular principal’s 
            authorization to perform some action

b. Reasoning Using the language of AC

    -- Precisely express a scenario/situation for exercising 
       access control

    -- Develop inference rules, Models to reflect acceptable 
       reasoning steps 

       -- Model:     (Eg. Access Control Matrix)
       -- Access Policies:  (See page 63-64 for details) Example: 

       authority controls (subject controls <access right, object>) 

       -- Rules:     (Eg. ticket rules)
       -- Access Control Lists
       -- Trust Assumptions
       -- Access requests

    -- Implementation 

-------------------------------------------------------------------------------
II.2. Verification with Access control: Examples and Practice
-------------------------------------------------------------------------------

a. Ticket Rules (See ACST, Figure 4.2)

b. Reasoning example (using Ticket Rule)  

   Example 4.2

c. Discussions and Practice


-------------------------------------------------------------------------------
II.3  Representation of a Kripke Model (for Access control formula)
-------------------------------------------------------------------------------

a. A beginning example

   To represent a kripke model M = (W, I, J) :

   -- Specify the type for the names of simple principals in the model

> type PName = String

   -- Specify the type for represent the atomic propositons in the model

> type PropVar = Char

   -- Represent all the simple principals in M as a list 

> princLst :: [PName]
> princLst = ["Al","Marcy"]

   -- Represent all the atomic propositions as a list 

> propLst :: [PropVar] 
> propLst = ['q','r','s']

   -- Represent the set W:

> lstW :: [Int]
> lstW = [0,1,2]

> setW :: Set Int
> setW = makeSet lstW

   -- Represent the set I:

> lstI :: [(Char,[Int])]
> lstI = [('q',[1,2]),('r',[1]),('s',[0,1])]

> setI :: Set (Char,[Int])
> setI = makeSet [('q',[1,2]),('r',[1]),('s',[0,1])]


Remarks/Discussions: 

  How can we be sure that given a proposition, there's a UNIQUE 
  tuple in setI that represent setI  ?


   -- Represent the set I (type Set (Char, [Int]):

> lstJ :: [(PName,[(Int,Int)])]
> lstJ =  [("Al",[(0,0),(1,1),(2,2),(2,1)]),
>          ("Marcy",[(0,0),(0,1),(1,1),(2,0)])
>          ]        


> setJ :: Set (PName,[(Int,Int)])
> setJ = makeSet [("Al",[(0,0),(1,1),(2,2),(2,1)]),
>                 ("Marcy",[(0,0),(0,1),(1,1),(2,0)])
>                ]


Remarks/Discussions: 

  How can we be sure that given a proposition, there's a UNIQUE 
  tuple in setI that represent setJ  ?

   -- Represent the model M:

> modelLstM :: ([Int], [(Char,[Int])], [(PName,[(Int,Int)])])
> modelLstM = (lstW, lstI, lstJ)

> modelM :: (Set Int, Set (Char,[Int]), Set (PName,[(Int,Int)]))
> modelM = (setW, setI, setJ)


