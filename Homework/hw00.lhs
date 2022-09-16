--------------------------------------------------------------------------------
CIS 623 Structured programming and formal methods

Fall 2022

Homework 00  Functional programming: beginning steps

-------------------------------------------------------------------------------

> import Prelude hiding (init)

Total points: 120 

-------------------------------------------------------------------------------


(10 point) Fill in the following information. You will lose 3 point for each 
missing or incorrect answer.

Name:

Email:

Number:

ie. The 3 digit number assigned to you

-------------------------------------------------------------------------------

Due date:

Release:        Sep 08, 2022 
Due date:       Sep 15, 2022, 11:59 pm

Remarks:

1. (5 point) You submission should be named as XXX-hw00.lhs where XXX is the 3 
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

   when email is available. Your grader will not
   grade your work but you may receive an exemption.

--------------------------------------------------------------------------------

Note:

To answer the programming questions, add the haskell code according to the
requirement. DO NOT FORGET to add the > symbol below each line in your code.

--------------------------------------------------------------------------------
Problems
--------------------------------------------------------------------------------

Problem 1 (Total 25 point)

Consider the following function:

> fac   :: Integer -> Integer 
> fac 0 = 1               -- fac.1
> fac n = n * fac (n-1)   -- fac.2

a. (10 point)  Evaluate 

fac 4 

and display the steps using Feijen's notation.

Answer: 

fac 4
= applying fac
  4 * fac(4-1)
= applying fac
  4 * 3 * fac (3-1)
= applying fac
  4 * 3 * 2 * fac (2-1)
= applying fac
  4 * 3 * 2 * 1 * fac(0)
= applying fac
  4 * 3 * 2 * 2 * 1 * 1
= applying *
  48

--------------------------------------------------------------------------------

b. (5 point) Run GHCi and evaluate the expression

fac 26

Copy your answer and paste it in the space below.

Answer:

ghci> fac 26
403291461126605635584000000

--------------------------------------------------------------------------------

c.  (5 point)  Consider the following function fac1:

> fac1   :: Int -> Int 
> fac1 0 = 1
> fac1 n = n * fac1 (n-1) 

Run GHCi and evaluate the expression

fac1 26

Copy your answer and paste it in the space below.

Answer:

ghci> fac1 26
-1569523520172457984

--------------------------------------------------------------------------------

d. (5 point)  Is your answer to part b and c the same ? Give
reason(s) to support your answer.

Answer:

Int type is limited in machine-size, in my case it is 64 bit. 
While Integer type holds larger length that storage of computer has.
The result from Int type cause a overflow, so it is negative, while 
Integer type is correct.
Ref:
https://wiki.haskell.org/FAQ#What.27s_the_difference_between_Integer_and_Int.3F

--------------------------------------------------------------------------------

Problem 2 (Total 15 point)

Consider the cons operation (:), where we use it to build lists. 

a. (5 point) Use GHCi to determine the type of (:) (the cons operation) and 
write your answer below.

Answer:

ghci> :t (:)
(:) :: a -> [a] -> [a]

--------------------------------------------------------------------------------


b. (5 point) Explain why the following expression

[1,2]:[1,2]

is not a well defined Haskell expression.


Answer:

<interactive>:14:1: error:
    • No instance for (Num [Integer]) arising from a use of ‘it’
    • In the first argument of ‘print’, namely ‘it’
      In a stmt of an interactive GHCi command: print it

: operator takes an type to a list of type, 
while ++ operator concatenate two list in the same type.
Otherwise it is a not defined behavior.
--------------------------------------------------------------------------------


c.  (5 point) Is 

[]:[] 

a legitimate Haskell expression ?  Give reason(s) to support your answer.


Answer:

ghci> []:[] 
[[]]

It is a legitimate expression according to the response from GHCI.
: operator takes first [] as a list type, and second [] as a list.
The expression prepend the empty list, also list type to another empty list.
If the first argument is not empty list, then there is more than one type variables,
which does not satisfy the requirement of : operator.


--------------------------------------------------------------------------------

Problem 3 (Total 35 point)

Consider the following function transfer:
 
> transfer         :: ([a],[a]) -> ([a],[a])
> transfer ([],ys)     = ([],ys)
> transfer ((x:xs),ys) = transfer (xs,(x:ys))

a).  (10 point)  Evaluate the expression

transfer ([1,2],[3])

display the steps using Feijen's notation.

Answer:

ghci> transfer ([1,2],[3])
([],[2,1,3])

transfer ([1,2],[3])
= apply transfer
  transfer ([2], [1,3])
= apply transfer
  transfer ([], [2,1,3])
= apply transfer
  ([], [2,1,3])


--------------------------------------------------------------------------------

b). Use the transfer function, together with another function written by you to 
    implement the reverse function. Create two test cases to verify your code.

Answer:

(15 point) Implementation:

transfer         :: ([a],[a]) -> ([a],[a])
transfer ([],ys)     = ([],ys)
transfer ((x:xs),ys) = transfer (xs,(x:ys))
 
> med :: ([a], [a]) -> [a]
> med ([],[]) = []
> med ([xs],[ys]) = [ys]

> wrap :: [a] -> [a]
> wrap [] = []
> wrap [xs] = med(transfer ([xs], []))

Had this bug in 9.4.2
Fixed the problem in GHCI 8.10.7, and MacOS docker environment

*** Exception: hw00.lhs:219:3-44: Non-exhaustive patterns in function wrap

`unlit' failed in phase `Literate pre-processor'. (Exit code: 1)
Failed, no modules loaded.

Test Cases:


(5 point) Case 1:  

Test 1 Input: [2..6]

Expected result: [6,5,4,3,2]

Test Run:


(5 point) Case 2:  

Test 2 Input: [3,6,77,2]

Expected result: [2,77,6,3]

Test Run: [2,77,6,3]

Remarks:  

Example: Test cases preparation

Suppose you compose an alternative version of the length function 
(as defined in Prelude). You may create the following tests:

 
(Mock Test 1) 

Test 1 Input: []

Expected result: 0

Test Run:

*Main> length []
0

(Mock Test 2) 

Test 1 Input: [1,2,3]

Expected result: 3

Test Run:

*Main> length [1,2,3]
3

--------------------------------------------------------------------------------

Problem 4 (Total 20 point)

a. (20 point)  In your own words, describe blackbox testing in the context of 
software testing methodology. Do not use more than 100 words.

Blackbox testing is a method of software testing that examines the functionality
of an application without knowing the internal structure and machanism. It is
available to implement in every level of software testing from unit, integration,
system and acceptance. 
The test is only focus on a specific input to output mapping. It is based on
the spcification and requirement of software. Test cases include valid and 
invalid input to determin coresponding output, in purpose of verify the functionality.
Ref:
https://en.wikipedia.org/wiki/Black-box_testing

b. (10 point) Give an example that you will use blackbox testing, where the 
underlying programming language is not a functional language.

Javascript is a language that has functional programing feature, and it is
applied in a lot application, especially in web app. Unit test and integration
test is applied from logic and interactive level that the app communicates
with either server or client. The test part feeds the designed input to the app,
or one of part in the app, and compare the expect output with actual running
result. If they match the test is passed, then continue to another set of test.
The test part is independ of the app, it is avaiable to write test case first
then construct the app, which is called test-driven development.

Remarks:

If you prefer, you may watch an online video you find useful regarding blackbox
testing and give a summary (includes a link to the video) as the answer to the 
first part of this question.

In the second part of this question, please refer to the language you are most 
familiar with.  


--------------------------------------------------------------------------------
End of Homework 00 submission
--------------------------------------------------------------------------------