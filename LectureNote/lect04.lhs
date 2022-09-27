--------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 4  The Basics (continue)
--------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

1. Updates on running class VM/Haskell 

2. Pre-class exercises (quick walkthrough)

3. Homework 00 released (remarks, in particular,  on blackboard testing)

4. Remember your student class number

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. Types 

Reference Hutton, chapter 3 (lecture use chapter 3 slides)

a. Basic types: Int, Integer, Float, Char etc.

b. Tuple types, List types and Function types

c. Type inference and currying

The main inference rule:

f :: X -> Y, e :: X
--------------------
f e :: Y


eg. Type inference examples

> f       :: Int -> Int -> Int -> Int
> f x y z = x + y + z

f is a function with f :: Int -> (Int -> (Int -> Int))

f is of type Int - > (Int -> (Int -> Int)) and 3 is of type Int

Therefore 

f 3   is of type (Int -> (Int -> Int))
f 3 4 is of type (Int -> Int)

d. Polymorphic types

> g    :: [a] -> [a]
> g xs = take 3 xs

2. Syntax and semantics of propositional logic

a. Syntax (what are the well formed formulas)

i. definition:

The well-formed formulas of propositional logic are those which we obtain by 
using the construction rules below, and only those, finitely many times:


Atom: 

Every propositional atom p, q, r, . . . and p_1 , p_2 , p_3 , . . . is a 
well-formed formula.


¬: If φ is a well-formed formula, then so is (¬φ).
∧: If φ and ψ are well-formed formulas, then so is (φ ∧ ψ).
∨: If φ and ψ are well-formed formulas, then so is (φ ∨ ψ).
→: If φ and ψ are well-formed formulas, then so is (φ → ψ).


ii. BNF (Backus Naur Form)

φ ::= p | (¬φ) | (φ ∧ φ) | (φ ∨ φ) | (φ → φ)


iii. Each formula has a tree structure


b. Semantics 

The truth of an well-formed formula are completed characterized by a 
truth table.

3. Practice examples (CX03) 


6. Summary



