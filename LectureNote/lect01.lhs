--------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 1  Organization meeting and course introduction
--------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

1. Welcome to class 
2. Visit class blackboard site
3. Purpose of this announcement

------------------------------
II. About the lecture
------------------------------

1. Format: in-person
2. Attendance

a. expected to attend all lectures. Bring your laptop
b. first week: signature for each lecture are required

3. Lecture script posted at the start of the lecture.

------------------------------
III. Syllabus
------------------------------

1. Course information
2. Contents
3. Assessment
4. Academic integrity
5. Other info.


------------------------------
IV.  Preliminaries
------------------------------

1. CIS 607 (or CIS 375 Discrete Mathematics)
2. Programming experience (eg. CIS 351 Data structures)
3. Working in a Unix/Linux environment


------------------------------
V.  Functional programming 
------------------------------

1.  Programs are functions
2.  Functional language: Haskell, ML, Scheme etc.
3.  This class: We start with learning Haskell

eg. A simple Haskell function

> double   :: Int -> Int
> double x = x + x

4.  A taste of Haskell

a.  The sum of a list of integers

> sum1    :: [Int] -> Int    -- type
> sum1 []     = 0            -- sum1.1   base case
> sum1 (n:ns) = n + sum ns   -- sum1.2   recursion step

b.  How Haskell evaluates sum1 [1,2,3]  (Feijen's notation)

sum1 [1,2,3]
={sum1.2}
1 + sum1 [2,3]
={sum1.2}
1 + (2 + sum1 [3])
={sum1.2}
1 + (2 + (3 + sum1 []))
={sum1.1}
1 + (2 + (3 + 0))
={apply +}
6

More on using Feijen's notation later.

c. A not so simple example  

> q    :: [Int] -> [Int]
> q []     = []
> q (x:xs) = q smaller ++ [x] ++ q larger
>     where 
>       smaller = [a | a <- xs, a <= x]
>       larger  = [b | b <- xs, b > x]

What's function q ? 


d. Pratice literate programming


------------------------------
VI.  Formal methods
------------------------------

1. (Wikipedia)

In computer science, formal methods are mathematically rigorous techniques for the specification, development, and verification of software and hardware systems. The use of formal methods for software and hardware design is motivated by the expectation that, as in other engineering disciplines, performing appropriate mathematical analysis can contribute to the reliability and robustness of a design.

Formal methods employ a variety of theoretical computer science fundamentals, including logic calculi, formal languages, automata theory, control theory, program semantics, type systems, and type theory.


2. Information assurance and cybersecurity education


https://dl.dod.cyber.mil/wp-content/uploads/cae/pdf/unclass-cae-cd_ku.pdf



3. This class

a. Reasoning about programs and security systems

   - (Functioanl programming) Is the program (a function) correct ?
   - (Access control) Is the system secure (maintain Confidentiality, Integrity and Availabilty adequately ?)

b. Program design, specification and verification

   - Techniques to identify and/or compose software that provide high assurance that meets or exceeds the given requirements (eg. correctness, meeting specifications etc.)


