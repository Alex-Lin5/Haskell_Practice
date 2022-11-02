
--------------------------------------------------------------------------------

CIS 623 Structured programming and formal methods

Fall 2022

Homework 03  More on defining functions; Reasoning about Access control logic

-------------------------------------------------------------------------------

> import Prelude 

Total points: 175

-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name:

Email:

Number:

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Oct 09, 2022 
Due date:       Oct 16, 2022, 11:59 pm

Remarks:

This homework has two parts. Namely:

Part I:  Formal methods
Part II: Programming 


You will need to turn in Part I and Part II SEPARATELY, using two different 
links from our blackboard site.

For Part I, you will need to 

1. name your submission as a pdf file named XXX-hw03-I.pdf where XXX is the 3 
digit no. assigned to you in blackboard. 

2. To obtain a pdf copy, you are advised to write your answer using letter 
sized paper and scan them (use Library) after completion and use, upload the 
pdf file you obtained you obtained.

For Part II, you will follow the rules as in HW 00. That is:

1. (5 point) You submission should be named as XXX-hw03.lhs where XXX is the 3 
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

To answer the programming questions, add the haskell code according to the
requirement. DO NOT FORGET to add the > symbol below each line in your code.

--------------------------------------------------------------------------------
Part I: Formal methods (120 point)
--------------------------------------------------------------------------------

All the questions are taken from ACST. For your convenience, the detailed 
description of these problems are printed in the document HW03-Part1.pdf for
your reference.

Problem 1 (Total 30 point)

Given a Kripke structure (W, I, J), The function J can be extended to work over 
arbitrary principal expressions via the following definition:
J(P & Q) = J(P) ∪ J(Q),
J(P | Q) = J(P) ◦ J(Q).

p 51/348
Exercise 2.3.1
W0 = {sw,sc,ns}
J0(Gil) = {(sw,sw),(sc,sc),(ns,ns)}
J0(Flo) = {(sw,sw),(sw,sc),(sc,sw),(sc,sc),(ns,ns)}
J0(Hal) = {(sw,sw),(sc,sw),(ns,ns)}
J0(Ida) = {(sw,sc),(sc,sw),(ns,sc),(ns,ns)}.
Calculate the following relations:
a. J0(Hal & Gil)
b. J0(Gil | Hal)
c. J0(Flo & Ida)
d. J0(Hal | Ida)
e. J0(Ida | Hal)
f. J0(Hal & (Ida | Hal))
g. J0(Hal | (Ida & Hal))

S ∪ T = {x | x ∈ S or x ∈ T}
R ◦ S = {(x, z) | ∃y.((x, y) ∈ R and (y, z) ∈ S)}

a. (10 point)    Exercise 2.3.1, part a.
J0(Hal & Gil)
= J0(Hal) ∪ J0(Gil)
= {(sw,sw),(sc,sw),(ns,ns)} ∪ {(sw,sw),(sc,sc),(ns,ns)}
= {(sw,sw),(sc,sc),(sc,sw),(ns,ns)}

b. (10 point)    Exercise 2.3.1, part d.
J0(Hal | Ida)
= J0(Hal) ◦ J0(Ida)
= {(sw,sw),(sc,sw),(ns,ns)} ◦ {(sw,sc),(sc,sw),(ns,sc),(ns,ns)}
= {(sw,sc),(sc,sc),(ns,sc),(ns,ns)}

c. (10 point)    Exercise 2.3.1, part f.
J0(Hal & (Ida | Hal))
= J0(Hal) ∪ (J0(Ida) ◦ J0(Hal))
= {(sw,sw),(sc,sw),(ns,ns)} ∪ 
   ({(sw,sc),(sc,sw),(ns,sc),(ns,ns)} ◦ {(sw,sw),(sc,sw),(ns,ns)})
= {(sw,sw),(sc,sw),(ns,ns)} ∪ {(sw,sw),(sc,sw),(ns,sw),(ns,ns)}
= {(sw,sw),(sc,sw),(ns,sw),(ns,ns)}

---------------------------------------------------------------------
Problem 2 (Total 30 point)

This question refers to the Kripke model given in ACST, Exercise 2.3.3.
a) (10 point) Give a graphical representation of the given Kripke model M. That is:
i. Draw the directed graph which represents the relation J.
ii. Label each node with the corresponding name in W.
iii. For each proposition p in the set PropVar, put its name at each node 
where p is true in the world represented by the node.
Continue to complete the following parts of Exercise 2.3.3

Exercise 2.3.3
Let M be the Kripke structure <W,I,J>, where W, I, and J are
defined as follows:
• W = {t,u,v,x,y,z}
• I : PropVar → 2 W given by:
I(p) = {x,y,z}
I(q) = {x,y,t}
I(r) = {y,t,u,z}
• J : PName → 2 W×W given by:
J(A) = {(w,w) | w ∈ W} ∪ {(x,y),(x,z),(z,t),(y,v),(v,y),(v,x)}
J(A)(x) = {x,y,z}
J(A)(y) = {y,v}
J(A)(z) = {z,t}
J(A)(t) = {t}
J(A)(u) = {u}
J(A)(v) = {v,x,y}
J(B) = {(x,w) | w ∈ W} ∪ {(y,t),(z,t),(t,v)}
J(B)(x) = W
J(B)(y) = {t}
J(B)(z) = {t}
J(B)(t) = {v}
J(B)(u) = ∅
J(B)(v) = ∅

Calculate each of the following sets.
a. EM [[(p ⊃ q) ⊃ r]]
b. EM [[A says (p ⊃ r)]]
c. EM [[A says (B says q)]]
d. EM [[B says (B says q)]]
e. EM [[A controls (B says q)]]
f. EM [[A controls (B controls q)]]

a. (10 point) Give a graphical representation of the Kripke model in 
              Exercise 2.3.3.
b. (10 point)   Exercise 2.3.3, part b. 
EM [[A says (p ⊃ r)]]
= {w|J(A)(w) ⊆ EM[(p⊃r)]}
= {w|J(A)(w) ⊆ ((W-EM[(p)]) ∪ EM[(r)])}
= {w|J(A)(w) ⊆ ((W-I(p)) ∪ I(r))}
= {w|J(A)(w) ⊆ ({t,u,v} ∪ {y,t,u,z})}
= {w|J(A)(w) ⊆ {y,t,u,z,v}}
= {t,u,y,z}

c. (10 point)   Exercise 2.3.3, part d. 
EM [[B says (B says q)]]
= {w|J(B)(w) ⊆ Em[(B says q)]}
= {w|J(B)(w) ⊆ {w|J(B)(w) ⊆ EM[q]}}
= {w|J(B)(w) ⊆ {w|J(B)(w) ⊆ I(q)}}
= {w|J(B)(w) ⊆ {w|J(B)(w) ⊆ {x,y,t}}}
= {w|J(B)(w) ⊆ {u,v,y,z}}
= {t,u,v}

d. (10 point)   Exercise 2.3.3, part e. 
EM [[A controls (B says q)]]
= EM[(A says (B says q)) ⊃ (B says q)]
= (W-EM[(A says (B says q))]) ∪ EM[(B says q)]
= (W-{w|J(A)(w) ⊆ EM[(B says q)]}) ∪ {w|J(B)(w) ⊆ EM[q]}
= (W-{w|J(A)(w) ⊆ {w|J(B)(w) ⊆ EM[q]}}) ∪ {w|J(B)(w) ⊆ EM[q]}
= (W-{w|J(A)(w) ⊆ {u,v,y,z}}) ∪ {u,v,y,z}
= (W-{u,y})∪{u,v,y,z}
= W


---------------------------------------------------------------------
Problem 3 (Total 50 point)

a. (15point) Give a formal proof as required in Exercise 3.2.2.
(10 point) Draw a proof tree with respect to the proof you gave.
b. (15point) Give a formal proof as required in Exercise 3.2.4.
(10 point) Draw a proof tree with respect to the proof you gave.

Exercise 3.2.2 Technically speaking, the Equivalence rule given in Figure 3.1 
permits replacements in only direction: having deduced ϕ1 ≡ ϕ2, 
one can replace occurrences of ϕ1 in a formula by ϕ2, but not vice versa.
Give a formal proof of the following derived rule which permits replacements in
the opposite direction3:
ϕ1 ≡ ϕ2, ψ[ϕ2/q]
-----------
ψ[ϕ1/q]

Exercise 3.2.4 Give a formal proof for the Derived Controls rule given in Figure 3.5.
P ⇒ Q, Q controls ϕ
------------
P controls ϕ

a. (25 point) Exercise 3.2.2.
ϕ1 ≡ ϕ2, ψ[ϕ2/q]
-----------
ψ[ϕ1/q]

1. ϕ1 ≡ ϕ2        Assumption
2. ψ[ϕ2/q]        Assumption
3. (ϕ1 ≡ ϕ2) ⊃ (ϕ2 ≡ ϕ1)  1 Taut
4. ϕ2 ≡ ϕ1        1,3 Modus Ponens
5. ψ[ϕ1/q]        2,4 Equivalence

Attach Taut check truth table


b. (25 point) Exercise 3.2.4.
P ⇒ Q, Q controls ϕ
------------
P controls ϕ

1. P ⇒ Q            Assumption
2. Q controls ϕ      Assumption
3. (Q says ϕ) ⊃ ϕ    2 def controls
4. P ⇒ Q ⊃ (P says ϕ ⊃ Q says ϕ) 1 speak for
5. P says ϕ ⊃ Q says ϕ  1,4 Modus Ponens
6. P says ϕ ⊃ ϕ      3,5 Modus Ponens
7. P controls ϕ      6 def controls

--------------------------------------------------------------------------------
Part II: Programming ( point)
--------------------------------------------------------------------------------

Problem 4 (20 point)

Consider the following type and data declarations:

> type ID    = String

> data Role  = Manager | Secretary | Technician
>              deriving (Show, Eq)

They are used to represent the roles of each employee in a department within an
enterprise. For example, the following is a list of tuples, where each tuple 
represents an employee in department d.

> d :: [(ID, Role)] 
> d = [("a1",Manager),("a2",Secretary), ("a3",Technician), ("a4",Technician)]

Write a function organize, which take a lst of type [(ID, Role)] (as in the 
example d just stated), return a three element lst 

[(i, Manager), (j, Secretary), (k, Technician)]

where i (resp. j and k) is the number of Managers (resp. Secretary, Technician) 
in the department.

For example, when applying the the department d above, we get

*Main> organize d
[(1,Manager),(1,Secretary),(2,Technician)]
 
You can write helpers function in your implementation.


> count :: [(ID, Role)] -> Role -> Int
> count [] _ = 0
> count (x:xs) rolee
>     | (a,b) <- x, b == rolee = 1 + count xs rolee
>     | otherwise = count xs rolee

> organize :: [(ID, Role)] -> [(Int, Role)]
> organize [] = []
> organize a = [(x,y)|y <- [Manager, Secretary, Technician], x <- [count a y]]

--------------------------------------------------------------------------------

Problem 5 (20 point)

Consider the following data declaration:


> data Expr = Sym Char | Concat Expr Expr | Space Expr Expr
>             deriving Eq 

Write the show function for the data type Expr by define it an instance for the 
Show class so that

i.  Concat is the usual string concatenation, and
ii. Space is to add a space between two expressions (of type Expr)

For example, if

> eg1 :: Expr
> eg1 = (Sym 'c') 

> eg2 :: Expr
> eg2 = (Sym 'i')

> eg3 :: Expr
> eg3 = (Sym 's')

> eg4 :: Expr
> eg4 = (Space (Concat eg1 eg2) (Concat eg2 eg3)) 

> eg5 :: Expr
> eg5 = (Concat (Space eg1 eg2) (Space eg2 eg3)) 

then we will get

*Main> eg1
c
*Main> eg2
i
*Main> eg3
s
*Main> eg4
ci is
*Main> eg5
c ii s

> instance Show Expr where
>     show (Sym x) = [x]
>     show (Concat a b) = show a ++ show b
>     show (Space a b) = show a ++ " " ++ show b


Homework/hw03.lhs:343:3: error:
    Equations for ‘show’ have different numbers of arguments
      Homework/hw03.lhs:343:3-29
      Homework/hw03.lhs:344:3-46
    |
343 | > show Sym a = Prelude.show a
    |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^...