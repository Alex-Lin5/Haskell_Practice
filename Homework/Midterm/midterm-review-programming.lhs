
--------------------------------------------------------------------------------
Fall 2022
CIS 623 Structured programming and formal methods
Review for midterm
--------------------------------------------------------------------------------

> import Prelude hiding (reverse)

--------------------------------------------------------------------------------

I.    Date: 10/20/2022. One hour exam. in lecture (2:00 pm - 3:20 pm).

II.   Coverage

1.    Formal methods: Main reference: ACST, Chapter 1 to 3 (up to section.3.2) 
2.    Programming:    Main reference: Hutton, Chapter 1-6, Chapter 8.


---------------------
II.2  Programming
---------------------

-------------------
a.    Introduction 
-------------------

--------------------------------------------------------------------------------
a.i.  Literate programming 
--------------------------------------------------------------------------------

--    Write programs that your peers can read and understand

--------------------------------------------------------------------------------
a.ii. The functional pragramming paradigm
--------------------------------------------------------------------------------

--    Functional style (apply functions to arguments)

--------------------------------------------------------
b.    Basic features of a functional language (Haskell)
--------------------------------------------------------

--------------------------------------------------------------------------------
b.i   Expressions: Evaluation of expressions
--------------------------------------------------------------------------------

--    We evaluate a Haskell expression when we apply a function to an argument
   
--    We can show the evaluation steps via Feijen notation.

      Representative examples

      Use Feijen's notation to show the evaluation steps of f (quick sort):

> f    :: (Ord a) => [a] -> [a] 
> f []     =  []
> f (x:xs) =  f ys ++ [x] ++ f zs
>     where
>     ys = [a | a <- xs, a <=x]
>     zs = [b | b <- xs, b > x]


--------------------------------------------------------------------------------
b.ii. Expressions: types
--------------------------------------------------------------------------------

--    A type is a collection of related values. 
--    Every Haskell expression has a type.
--    Can determine the type of an expression via type inference (verify if
      are type errors (important in debugging) 

--    The main type inference rule:

if f is a function that maps arguments of type A to results of type B , and e is
an expression of type A , then the application f e has type B


--    Example: See Hutton chapter 3 for major examples.

---------------------------
c.    Defining functions I
---------------------------

--------------------------------------------------------------------------------
c.i.  Write functions via pre-defined functions (from Prelude) 
--------------------------------------------------------------------------------

--    Prelude (See: Hutton, Appendix B)

--    Representative examples

      Write the reverse function 

      -- using (++) (concatenation of two lists)

> reverse    :: [a] -> [a]                     -- type of function reverse
> reverse []     =  []                         -- reverse.1  base case
> reverse (x:xs) =  reverse xs ++ [x]          -- reverse.2  recursion step

      -- by using transfer (and snd) (homework 00)

> transfer         :: ([a],[a]) -> ([a],[a])   -- type of function transfer
> transfer ([],ys)     = ([],ys)               -- transfer.1 base case
> transfer ((x:xs),ys) = transfer (xs,(x:ys))  -- transfer.2 recursion step

  
--------------------------------------------------------------------------------
c.ii. Apply basic principles and simple constructs  
--------------------------------------------------------------------------------

-- Specify the functions' type 

-- Write definitions 

   key ideas: use pattern matching 

   Supported by a variety of basic constructs, such as: if-then-else, 
   guard-equations, operator sections, lambda expressions, etc.  
   (see chapter 3 and 4 for more details)

-- Representative examples

   HW01  Problem 3
   HW02  Problem 1 and 2


--------------------------------------------------------------------------------
c.iii. Additional remarks
--------------------------------------------------------------------------------


-- Currying (or Curried functions)

   Interpret the meaning of curried function definitions

   See: Hutton, Section 3.6 and Chapter 4 (Ch.3 and 4 slides)

   HW 02, Problem 1   


-- Helper functions (local)

   Decompose the implementation into simplier parts. Define local  
   functions to help implementing each part 


-- Representative examples 

   HW 02 Problem 2 
   HW 03 Problem 4

------------------------------------------
d. Defining functions II. Using Recursion
------------------------------------------

--------------------------------------------------------------------------------
d.i  The basic form
--------------------------------------------------------------------------------

-- Base case

-- Recursion step(s)

   Examples throughout the text

--------------------------------------------------------------------------------
d.ii  Advise on recursion (The five steps listed in Hutton Chapter 6)
--------------------------------------------------------------------------------

-- The five steps 

   Step 1: define the type
   Step 2: enumerate the cases
   Step 3: define the simple cases 
   Step 4: define the other cases
   Step 5: generalise and simplify

-- Some representative examples 

   HW 01: problem 4 and 5
   HW 02: problem 3

   Representative examples are almost everywhere 
   (eg. see functions defined in prelude)

----------------------------------------------------
e. Defining functions III. Using List comprehension
----------------------------------------------------

--------------------------------------------------------------------------------
e.i  Core paradigm 
--------------------------------------------------------------------------------

-- Analogous to defining sets via Set builder notation 

-- Definition translation  
   
-- General steps

   Generate a list, eliminate those "un-fit" elements and transform the  
   elements retreived to the required form

   Eg:  The list [ i  | (k,i) <- zip lst [0..], p k] will 
    
        select those elements in a list lst
        select those element satisfy the property p
        report the positions of these elements as a list (the original order
        are maintained).

--------------------------------------------------------------------------------
e.ii. Helpful tools and examples
--------------------------------------------------------------------------------

-- Index the list via zip function and its variants

-- Examples: On factoring and prime numbers


> factor   :: Integer -> [Integer]
> factor n = [ x | x <- [1..n], n `mod` x == 0]

> isPrime   :: Integer -> Bool
> isPrime n = factor n == [1,n]

> theprimes :: [Integer]
> theprimes =  [ n  | n <- [2..], isPrime n]

    
-- Examples: Caesar ciphers (Hutton: cipher.hs) 

-- Examples: HW02, problem 4 


-------------------------------
f. Data declarations and types
-------------------------------

--------------------------------------------------------------------------------
f.i Defining a data type 
--------------------------------------------------------------------------------

-- Renaming:  using the keyword *type* for renaming  to improve readability of
   your code

-- Data declaration mechanism

   Use the data keyword
   Analogous to efining strings via a context free grammar
   Recursion can be used (defining a recursive data type
   Use pattern matching when defining functions for the new data 

--------------------------------------------------------------------------------
f.ii. Joining a type class
--------------------------------------------------------------------------------

-- Use the deriving keyword
-- Define required functions as instances ourselves (see Nat.lhs file). 


--------------------------------------------------------------------------------
f.iii.  Examples
--------------------------------------------------------------------------------


-- The Shape datatype:   

> data Shape = Circle Float | Rect Float Float
>            deriving (Show)

> mine :: Shape
> mine = Circle 1.0

> area            :: Shape -> Float
> area (Circle n) = pi*n*n
> area (Rect a b) = a*b

> allarea    :: [Shape] -> Float
> allarea []            = 0
> allarea ((Circle a):xs) = area (Circle a) + allarea xs
> allarea ((Rect b c):xs) = area (Rect b c) + allarea xs

-- The tautology datatype (Hutton, chapter 8, See the tautology.hs file) 

-- ACL formulas (Defined as in ACST)

-- The Nat datatype (Also see Bird, Chapter 3. See the Nat.lhs file)

> data Nat = Zero | Succ Nat

> instance Show Nat where
>     show Zero     = "0"
>     show (Succ n) = "(" ++ show n ++ "+1)"

> egNat :: Nat
> egNat = (Succ (Succ (Succ (Succ Zero))))

    Sample test case: 

    *Main> egNat
    ((((0+1)+1)+1)+1)


-- HW03, Problem 3 and 4


------------ 
g. Reminder
------------

Also study and review Examples from help sessions and class activities


--------------------------------------------------------------------------------
***** End of review notes for midterm 1 (programming) *****
--------------------------------------------------------------------------------




