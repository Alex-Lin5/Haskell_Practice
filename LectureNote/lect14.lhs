
-------------------------------------------------------------------------------
Fall 2022
CIS 623
Lecture 14  Basic access control concepts (mechanisms and policies) 
            Introduction to higher order functions
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

> import Test.HUnit
> import Test.QuickCheck
> import Prelude hiding (map, filter)

-------------------------------------------------------------------------------

------------------------------
I. Announcement
------------------------------

a. Homework 03 

   i.   Due (Friday) Oct 16, 11:59pm.
   ii.  We will continue discuss some of the questions (briefly) in this 
        lecture. 

b. Midterm Oct 20, 2022 (an one hour in class examination)

   Coverage:  

   i.   (Formal methods)  ACST, Chapter 1, 2 and 3.
   ii.  (Programming)     Hutton, chapter 1-6, 8. 
   iii. (Review)          Review notes will be posted this weekend.
   iv.  (Mock test)       Will be given and discussed on Oct 18, 2022 
                          (in-lecture)
   v.    Remarks:         Information sheet on Access control logic covering 
                          syntax, semantics and inference rules used will be 
                          provided.

-------------------------------------------------------------------------------

c. Final: 	Dec 16, 2022, 8am -10am (90 minutes written exam. in-class)	

d. Today's discussions (activities) are tied to the problems in Homework 03. 

** Any questions? **

------------------------------
II. Lecture overview
------------------------------

1. Homework 03 
2. Concepts for access control mechanisms and policies
3. Higher order functions: Introduction
4. Summary

-------------------------------------------------------------------------------
II.1. Homework 3
-------------------------------------------------------------------------------

1. Graphical representation of Kripke model (for ACL).
2. Proof trees (features)
3. Do not use derived inference rule, except that you can use Hypothetical 
   Syllogism (proven in last lecture) in Exercise 3.2.4.

-------------------------------------------------------------------------------
II.2. Concepts for access control mechanisms and policies
-------------------------------------------------------------------------------

Ref ACST, Chapter 4 (and slides)

1. Reference monitors
2. The tickets rule.

-------------------------------------------------------------------------------
II.3. Higher order functions: Introduction 
-------------------------------------------------------------------------------

Ref. Hutton, Chapter 7 and its slides

Beginning examples

The functions: map, filter, (.), takewhile, dropwhile

> map      :: (a -> b) -> [a] -> [b]
> map f []     = []
> map f (x:xs) = (f x):(map f xs)

> eg1 = map (\x -> x+1) [1..10]

> filter      :: (a -> Bool) -> [a] -> [a]
> filter p []     = []
> filter p (x:xs) 
>        | p x       = x:(filter p xs)
>        | otherwise = filter p xs


> eg2 = filter (\x -> even x) [1..10]


Exercise: Rewrite the two functions using list comprehension



Question: 


Is 

map (f . g) = (map f) . (map g) ?

Other common higher order functions: (.) (ie. function composition), takeWhile, dropWhile ..

-------------------------------------------------------------------------------
II.4. Summary
-------------------------------------------------------------------------------



