
--------------------------------------------------------------------------------
Fall 2022
CIS 623 Structured programming and formal methods
Review for midterm
--------------------------------------------------------------------------------

I.    Date: 10/20/2022. One hour exam. in lecture (2:00 pm - 3:20 pm).

II.   Coverage

1.    Formal methods:   Main reference: ACST, Chapter 1 to 3 (up to 
section.3.2) 
2.    Programming:      Main reference: Hutton, Chapter 1-6, Chapter 8.


---------------------
II.1  Formal methods
---------------------

a.    The motivations of study Access control  (ACST, chapter 1)
b.    The language of Access Control

--------------------------------------------------------------------------------
b.i.  Background:  Sets, relations and functions (discrete Mathematics) 
--------------------------------------------------------------------------------

Able to apply the basic definitions to construct a given structure (ie. sets,
relations, functions). 

Able to apply the basic definitions to verify and explain if a given property
(regarding these structures) is true or not.

----------------------------------------
** Sample questions in this area **
----------------------------------------

Examples in section 2.1 and those cover this topic that are included in ACST,  
Chapter 2 slides. 

Homework 1, problem 1 
Homework 3, problem 1 

are representative examples. 


--------------------------------------------------------------------------------
b.ii. The (logical) language of access control
--------------------------------------------------------------------------------

--------------------
ACL formulas
--------------------

Extending the langauge of propositional logic. Introduce Principals and 
statements of the form (phi is a ACL formula):

P says phi
P controls phi
P speaks for phi

--------------------
Syntax      
--------------------

Given a formula, use the given grammar to verify if the formula is a 
well-formed 
ACL formula --- (ACL Syntax *)

That is, 

Either

Show the derivation steps that generate the fomula.

Or 

Explain why the grammar cannot derive the given formula.

----------------------------------------
** Sample questions in this area **
----------------------------------------

Examples in section 2.2 and those cover this topic that are included in ACST,  
Chapter 2 slides. 

Homework 1, question 2 is a representative example.

--------------------
Semantics
--------------------

Regarding the semantics of an ACL formula, one crucial question is to 

Specify under what circumstances the ACL formula is true  --- (ACL Semantics *)

To answer this question, we consider:

-- A Kripke model M = (W,I,J) and 
-- ACL formulas that can be constructed via M.

An evaluation function E_M is developed to compute the collection of possible 
worlds, say S, (S is a subset of W) is true with respect to the model M.

If S = W, we will write

M |= phi
 
and say phi is true with respect to model M. 

In case phi is true FOR ANY Kripke model M, we will write 

|= phi


----------------------------------------
** Sample questions in this area **
----------------------------------------

Examples in section 2.3 and those cover this topic that are included in ACST,  
Chapter 2 slides. 

Homework 3, problem 2 (all parts) a representative example.


----------------------------------------
Proof theory (Inference) 
----------------------------------------

Given a collection of Hypothesis 

 H1 , ... , Hn

and a conclusion C, all of them are ACL formulas, we write

 Hn , ... , Hn
 -------------   ----- (ACL Proof theory *)
       C

when C is a logical consequence of  H1 , ... , Hn. That is, C is true whenever
all of the hypotheses Hi's are true. Inference rules for ACL formulas are 
formulated in the above form. Among these rules, we divide them into two groups:
The basic rules (axioms) and the derived rules (those can be inferred from the 
basic rules). 

Our objective is to, given a ACL formula (eg. a desired property) and a list of 
 
hypotheses (eg. knowledge about the model M): 

Use inference rules to present the reasoning that shows the ACL formula phi is 
true  given a list of hypotheses are all true. --- (ACL Proof Theory *)


----------------------------------------
** Sample questions in this area **
----------------------------------------

Examples in section 3.1 and 3.2 and those cover this topic that are included in 
ACST, Chapter 3 slides. 

Homework 3, problem 3 (all parts) a representative example.


--------------------------------------------------------------------------------
***** End of review notes for midterm 1 (formal methods) *****
--------------------------------------------------------------------------------




