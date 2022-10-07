-------------------------------------------------------------------------------
Fall 2022
CIS 623
CX05  Data declarations and algebraic data types 
-------------------------------------------------------------------------------

Name:

Label your file as:

XXX-CX05.lhs

Where XXX is your class student number.

-------------------------------------------------------------------------------



a. Write a function count which will, given a list of shapes (type Shape) as
   input, return (c,r) where

   c = the number of shapes in the list that are circles 
   r = the number of shapes in the list that are rectangles

> data Shape = Circle Float | Rect Float Float
>            deriving (Show)

> count    :: [Shape] -> (Int,Int)
> count []              =  (0,0)
> count ((Circle f):xs) =  add (1,0) (count xs)  
> count ((Rect f g):xs) =  add (0,1) (count xs)

> add                 :: (Int,Int) -> (Int,Int) -> (Int,Int)
> add (x1,y1) (x2,y2) = ((x1+x2),(y1+y2))  


----------


b. Define a recursive data type:

   Define a new data type: Simple expression SimE where the it is either
   
   i.   a character 
   ii.  Concatenation of two Simple expressions 

   Write a function that compute the number of characters of an 
   Simple expressions

> data SimE = S Char | Concat SimE SimE
>           deriving (Show)


----------

c. Consider the following data types:

> data Lst a = Nil | Cons a (Lst a)
>              deriving (Show)

> yours :: Lst Int
> yours = (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))) 

What is the above type trying to represent ?

Lst a represents a list where the elements are of type a.
In other words, 


The datatype Lst a is "Equivalent" to the list type [a]

One more example (show how to define a function operates
on Lst Int)

> fun :: Lst Int -> Lst Int 
> fun Nil          = Nil
> fun (Cons x lst) =  Cons (x+1) (fun lst)
