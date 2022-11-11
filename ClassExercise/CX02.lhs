> import Prelude hiding (init)
--------------------------------------------------------------------------------
Fall 2022  CIS 623
In-class activity 01 (CX01)
Date: 9/6/2022
--------------------------------------------------------------------------------


1. Look up your class student number and rename this file as xxx-CX02.lhs where xxx is your class student number.

2. The library function last selects the last element of a non-empty list; for example,

last [1,2,3,4,5] = 5 .

redefine the function last in terms of the other library functions from Prelude.

Answer:
a.
> last :: [a] -> a
> last xs = xs !! (length xs - 1)

b.
> init :: [a] -> a
> init xs = take(length xs - 1) xs

Create a test to verify your implementation.




3. The library function init removes the last element from a non-empty list; for example,

init [1,2,3,4,5] = [1,2,3,4] .

redefine the function init in terms of the other library functions from Prelude.

Answer:


Create a test to verify your implementation.


4. Following the instructions given by the instructions, Upload your file xxx-CX02.lhs via blackboard.
