-------------------------------------------------------------------------------
Fall 2022
CIS 623

Lecture 23                          

Security policies: 

Bell La-Padula Model (for confidentiality) and 

Biba Model (for integrity)
         

-------------------------------------------------------------------------------


> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (until,iterate, map, filter, sqrt, foldr, foldl)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a.  Homework 06 due next week (12/09, end of day).

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
 

** Any questions? **


------------------------------
II. Lecture overview
------------------------------

1. Bell La-Padula Model revisited

2. Examples of writing access control policies (maintain confidentiality) that 
   satisfies Bell La-Padula conditions 

3. Commerical policies  and key examples

4. Biba Models

5. Summary

-------------------------------------------------------------------------------
II.1. Bell La-Padula Model revisited
-------------------------------------------------------------------------------

a. Recap: What's introduced

   - Security levels 
   - Each object and principal are labelled
   - A partial ordering 

Syntax, semantics and proof rules are expanded to incorporate these changes


b. Conditions in Bell La-Padula Policy 

   - Simple security condition
   - star property

   Motto: No read up, No write down


-------------------------------------------------------------------------------
II.2. Examples of writing access control policies (maintain confidentiality) 
      that satisfies Bell La-Padula conditions 
-------------------------------------------------------------------------------

a.   An Extended example (Projects by multiple Defense contractors) 
     Example 5.4.3

     - Informal description 
     - Formal specification via ACL

     - Verification of Bell La-Padula properties
   
b.   Exercise 13.2.2 (an extension to Example 5.4.3)


-------------------------------------------------------------------------------
II.3  Commerical policies and key examples
-------------------------------------------------------------------------------

a.  Developing commerical policies to support Integrity 

    - Syntax
    - Semantics
    - inference rules

    - Access types 
       
      > direct access       

      (observation: read, execute)
      (modifications: write)
      
      (modifications: write)

       > indirect access

       (invocation: Subject 1 invokes Subject 2)

    - Graphical representation 
    
       > Transfer paths (should meet strict integrity requirements)

       > Example 5.5.4

--------------------------------------------------------------------------------
II.4.  Biba Models
--------------------------------------------------------------------------------

a.   Biba straight integrity policy (Biba Model)
    
     - Guiding principle (See chapter 13 slides: page 17

       > Simple integrity acess-control condition
       > Integrity star property access control condition    
       > Invocation access control condition


 b. Invocation: Example 13.11


-------------------------------------------------------------------------------
II.5. Summary
-------------------------------------------------------------------------------

