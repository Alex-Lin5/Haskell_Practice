-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 23                          

Mandatory security policies, commerical policies and a review on formal methods


         

-------------------------------------------------------------------------------


> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (until,iterate, map, filter, sqrt, foldr, foldl)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a.  Homework 06 due next week (12/09, end of day).
    Remarks on preparation. 
    Additional help available.


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
    
c.    Help for the preparation of final
 
d.    Review for final Dec 08, 2022, in class. 
      Mock final will be distributed.

** Any questions? **

------------------------------
II.  Lecture overview
------------------------------

1. Confidentiality policies: a key example
2. Integrity policies: Biba models
3. Review on formal methods (wrt. Final)
4. Summary

-------------------------------------------------------------------------------
II.1. Confidentiality policies: a key example (Bell La-Padula models)
-------------------------------------------------------------------------------

a.  Reference: ACST: ch.5 and ch.13  (** Please also review the slides **)
    Background: CIA: Confidentiality, Integrity and Availability

b.  Example: The defense contractors example

    Source:

    Section 5.4.3: An extended example on Military Security Policies
    Exercise 13.2.2 (Extension to Section 5.4.3)

c.  Discussions of Pre-class activity (see the table given in lecture)

d.  Additional remarks:

    - Interpretation of Bell La-Padula (See Slide 13 in chapter 13)
    - Interpret formal description expressed in ACL logic
    - Some practical considerations (See Slide 16 in chapter 13)


-------------------------------------------------------------------------------
II.2. Bibas Model 
-------------------------------------------------------------------------------

a.  Reference: ACST: ch.5 and ch.13  (** Please also review the slides **)
    Two cases:

    - simple case:   Do not consider invocation    (Slide 28, chapter 05)
    - full version:  Consider all three conditions (Slide 17, chapter 13)

      -- Simple integrity condition  (observe: read, execute)
      -- Integrity *-property        (modify:  write)
      -- Invocation condition        (invoke:  transfer rights)

b.  Transfer paths:  Prevent corrumption of subjects and objects

     - key example 1:  The meal preparation example
     - How to ensure that meat will not be placed in a Veg Meal ?  
       A reachability question ?

c.  Question:

     - What are the security policies ?
     - Does the Integrity of transfer path being preserved ?
    
 
d.  A key example that includes invocation (Exercise 13.11).  
    See also slides ch. 13, 19-20


-------------------------------------------------------------------------------
II.3 Review on formal methods (wrt. Final)
-------------------------------------------------------------------------------


Remarks: Formal methods and programming are not mutually exclusive. some 
         questions cover both formal methods and programming.


a.  Property testing and verification

    - Case study 2: Implementation of queue datatype via two stacks

    - Formulate, express and interpret properties (in QuickCheck)



b.  ACL formulas, Kripke's models and the model checking problem

    - Chapter 2.
    
    - Case study 1: Implementation for ACL 
      
      HW 4 and HW 5


c.  Inference proofs

    - Chapter 3.

    - Interpret proof rules

    - Apply proof rules to support reasoning regarding access control

    - Represent the reasoning via a proof tree


d.  Basic concepts (Chapter 4, upto 4.2)

    - reference monitors
    - access control matrix
    - policy statements
    - How requests are handled (word description. formal proofs)
    - Ticket rules
  

e.  Security policies

    - Discretionary security policies (ACST, 5.2)

      - Trojan horse example (Class example)

    - Mandatory access control  
      
      - Military Policies  

        - Revisions of languages and kripke's model
        - Bell La-Padula models
        - Examples


      - Commerical Policies  

        - Revisions of languages and kripke's model
        - Biba straight Integrity models
        - Examples
         

-------------------------------------------------------------------------------
II.4.   Summary
-------------------------------------------------------------------------------