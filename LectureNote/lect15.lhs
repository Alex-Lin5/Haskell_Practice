
-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 15     Higher order functions
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (until,iterate, map, filter, sqrt)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 04 

   i.   Will be released soon
   ii.  Covers data declaration (Focus: syntax and semantics of ACL logic)


b. Your progress:

i.     Hutton, chapter 7, 8 (and the slides associated to it). Please spend 
       time to use text examples (Hutton, also recommended Bird) for practice.

ii.    ACST, Chapter 3, 4.

** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. More on Higher order functions and examples
2. Practice
3. Homework: Define access control formula, implement evaluation functions
4. Summary

-------------------------------------------------------------------------------
II.1. More on Higher order functions and examples
-------------------------------------------------------------------------------

1. Reference: Hutton, chapter 7 (and slides)

2. Recall the functions: map, filter, (.), takewhile, dropwhile

> map      :: (a -> b) -> [a] -> [b]
> map f []     = []
> map f (x:xs) = (f x):(map f xs)

> eg1 = map (\x -> x+1) [1..10]

> filter      :: (a -> Bool) -> [a] -> [a]
> filter p [] =  []
> filter p (x:xs) 
>        | p x       =  x:(filter p xs)
>        | otherwise =  filter p xs


> eg2 = filter (\x -> even x) [1..10]


Exercise: Rewrite the two functions (as map1, filter1
          using list comprehension


> map1 :: (a -> b) -> [a] -> [b]
> map1 f xs = [ f x | x <- xs] 


> filter1      :: (a -> Bool) -> [a] -> [a]
> filter1 p xs = [ x | x <- xs, p x]

Question: 

Is 

map (f . g) = (map f) . (map g) ?

Other common higher order functions: (.) (ie. function composition), takeWhile, 
dropWhile ..



2. More Examples

   a. computations of sqrt with the until function (See sqrt.lhs, Bird)

> until           :: (a -> Bool) -> (a -> a) -> a -> a
> until p f x 
>     | p x       = x
>     | otherwise = until p f (f x)


   b. using until in iterations (compute sqrt, see file sqrt.lhs from Bird)

> sqrt :: Float -> Float
> sqrt x = until goodenough improve x
>   where goodenough y = abs (y*y-x) < eps*x
>         improve y = (y+x/y)/2
>         eps = 0.000001

The above function carries out the following iterations:

compute a solution to the equation x^2 = a by the iteration:

Guess x1 (> 0)
x_{n+1} = 1/2 [x_{n} + (a / x_{n})]
 


      see also the computation of floor function (floor.lhs from Bird)


   c. fixed point computations via the function iterate    

    - What is fixed point iterations

> iterate     :: (a -> a) -> a -> [a]
> iterate f x =  x:iterate f (f x)

    - iterate shows a list of values such that if f has a fixed point, then
      the values of f will eventually stablize. That is, it will eventually
      generate the same value

    - relating iterate and until:

      Is until p f = head . filter p . iterate f ?

   d. The function foldr (see Hutton's chapter 7 slides)


-------------------------------------------------------------------------------
II.2. Practice
-------------------------------------------------------------------------------

    a. Define a function altMap :: (a -> b) -> (a -> b) -> [a] -> [b] that 
       alternately applies its two argument functions to successive elements 
       in a list, in turn about order. For example:

       main> altMap (+10) (+100) [0,1,2,3,4]
       [10,101,12,103,14]



> altMap        :: (a -> b) -> (a -> b) -> [a] -> [b]
> altMap f g []  = []
> altMap f g [x]      = [f x]
> altMap f g (x:y:zs) = (f x):(g y):(altMap f g zs)


-------------------------------------------------------------------------------
II.3. Homework: Define access control formula, implement evaluation functions
-------------------------------------------------------------------------------

Representing the formula

> data Form  = Var Char
>            | Not   Form
>            | Or    Form Form
>            | And   Form Form
>            | Imply Form Form
>            | Equiv Form Form
>            | Says  Prin Form
>            | Contr Prin Form
>            | For   Prin Prin
>              deriving Show

> type Pname = String

> data Prin = Name String | Together Prin Prin | Quote Prin Prin
>              deriving Show

-- Sample data

> p1 :: Prin
> p1 =  Name "Alice"

> p2 :: Prin
> p2 =  Name "Bob"

> v1 :: Form
> v1 = Var 'p'

> v2 :: Form
> v2 = Var 'q'

> f0 :: Form
> f0 = And v1 v2

> f1 :: Form
> f1 = For p1 p2
  
> f2 :: Form
> f2 = Says p1 f1




-- Evaluation function Em

em         ::   What is the type of em ?
em w i j (Var c) = ?
em w i j (Not f)  = ?
em w i j (Or f g)  = ?   
em w i j (And f g)   = ?   
em w i j (Imply f g) = ?
em w i j (Equiv f g) = ?
em w i j (Says  p f) = ?
em w i j (Contr p f) = ?
em w i j (For p q)   = ?


-- Support 
-- Use a Set data type
-- See Set.hs file


-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------



