--------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 3  The Basics
--------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

1. If you did not fill in the activity sheet CX00 (eg. arrive/register late, please fill in now and return by the end of this lecture

2. Updates on running class VM/Haskell 

3. A note on  Pre-class exercises and In-class exercises

4. Homework 00 released soon

5. Remember and use your student class number

** Any questions ? **

------------------------------
II. Lecture overview
------------------------------

1. Applying formal methods to Access control (ACST Ch.1 and 2)

2. Working with Haskell scripts (note the layout rules)

3. Evaluation of Haskell expressions with Feijen notation

4. Types 

5. Class practice exercises

6. Summary

----------------------------------------------------------------------
II.1  Applying formal methods to Access control (ACST Ch.1 and 2)
----------------------------------------------------------------------

1. Introducing Access control (recall Pre-class reading). Why we study access control in this class ?

2. When using a logical approach to Access control, what will we start with ?

3. Mathematical background: propositional logic 

----------------------------------------------------------------------
II.2. Working with Haskell scripts (note the layout rules)
----------------------------------------------------------------------

1. Beginning examples

> f1     :: Bool -> Bool -> Bool
> f1 x y = (not x) && y

> test1 = f1 True False

2. Example: The Anagrams program (Bird, chapter 1) and a walk through



------------------------------------------------------------
II.3  Evaluation of Haskell expressions via Feijen notation
------------------------------------------------------------

1. The quicksort example (Hutton: chapter 1) 

2. Revisit the sum example:

> sum1    :: [Int] -> Int    -- type
> sum1 []     = 0            -- sum1.1   base case
> sum1 (n:ns) = n + sum ns   -- sum1.2   recursion step

Evaluate sum1 

: use Feijen's notation to specify the steps. Reasoning 
  show the exact rule used 

sum1 [1,2,3]
= { applying sum1.2 }
1 + sum1 [2,3]
= { applying sum1.2 }
1 + (2 + sum1 [3])
= { applying sum1.2 }
1 + (2 + (3 + sum []))
= { applying sum1.1 }
1 + (2 + (3 + 0))
= { applying + }
6

----------------------------------------------------------------------
II.4 Types
----------------------------------------------------------------------

We refer to Hutton's chapter 3's slides


----------------------------------------------------------------------
II.5  Class practice exercises
----------------------------------------------------------------------

Follow the instructions given by the instructor and Work on CX02.lhs



----------------------------------------------------------------------
II.5  Lecture summary
----------------------------------------------------------------------

To be given at the end of the lecture.






