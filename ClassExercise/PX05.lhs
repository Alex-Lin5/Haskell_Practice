-------------------------------------------------------------------------------
Fall 2022
CIS 623
Pre-class activity
PX05  Queues
-------------------------------------------------------------------------------

Name:

Label your file as:

Y-XXX-CX05.lhs

Where 

XXX is your class student number and 

Y is the group number assigned to  you 

(You can find it from your blackboard's record)

-------------------------------------------------------------------------------

> module QueueA where
> import Test.QuickCheck

--------------------------------------------------------------------------------
Part I: Implementing a Queue using two stacks in Haskell
--------------------------------------------------------------------------------

> type Queue a = [a]

> empty :: [a]
> empty =  []

> add :: a -> [a] -> [a]
> add x q = q ++ [x]

> isEmpty   :: [a] -> Bool
> isEmpty q =  null q

> front       :: [a] -> a 
> front (x:q) =  x

> remove       :: [a] -> [a]
> remove (x:q) =  q

Consider the following implementation of a Queue datatype using two stacks that
we discussed in class:

> type QueueI a = ([a],[a])

> emptyI = ([],[])

> addI x (f,b) = flipQ (f,x:b)

> isEmptyI (f,b) = null f

> frontI (x:f,b) = x

> removeI (x:f,b) = flipQ (f,b)

> flipQ ([],b) = (reverse b,[])
> flipQ q = q

> retrieve :: QueueI Integer -> [Integer]
> retrieve (f,b) = f ++ reverse b

> invariant :: QueueI Integer -> Bool
> invariant (f,b) = not (null f) || null b


Question:

Write a precise description for each of the following property (A to H) in 
the space provided:

--------------------------------------------------------------------------------
Property A.

> prop_empty = retrieve emptyI == empty

Description:  <Give a precise description below >

test the empty property of type QueueI and Queue by method retrieve
test the empty queue equivalence of queue represented by 2 stacks or 1 queue

--------------------------------------------------------------------------------

Property B.

> prop_add x q = invariant q ==> retrieve (addI x q) == add x (retrieve q)

Description:  <Give a precise description below >

test add operation by method retrieve, addI, add that eventually returns single list in this test
test add operation performed on queue of 2 different representation

--------------------------------------------------------------------------------

Property C.

> prop_isEmpty q = invariant q ==> isEmptyI q == isEmpty (retrieve q)

Description:  <Give a precise description below >

test isEmpty method for queue of 2 different representation
--------------------------------------------------------------------------------

Property D.

> prop_front q = invariant q && not (isEmptyI q) 
>                ==> frontI q == front (retrieve q)

Description:  <Give a precise description below >

test front method that get the front element of queue in 2 different representation with assumption that queue is not empty
--------------------------------------------------------------------------------

Property E.

> prop_remove q = invariant q && not (isEmptyI q) 
>                 ==> retrieve (removeI q) == remove (retrieve q)

Description:  <Give a precise description below >

test if remove element that added the most earlier in 2 different representation
--------------------------------------------------------------------------------

Property F.

> prop_inv_empty = invariant emptyI

Description:  <Give a precise description below >

test if empty queue represented by 2 stacks returns true value
--------------------------------------------------------------------------------

Property G.

> prop_inv_add x q = invariant q ==> invariant (addI x q)

Description:  <Give a precise description below >

test if invariant property of queue represented by 2 stacks holds true when adding 1 element to it
--------------------------------------------------------------------------------

Property H.

> prop_inv_remove q = invariant q && not (isEmptyI q) ==> invariant (removeI q)

Description:  <Give a precise description below >

test if invariant property of queue represented by 2 stacks holds true when removing 1 element from it
--------------------------------------------------------------------------------
Part II: Implementing a Queue as two stacks another language 
--------------------------------------------------------------------------------

Task:

Please spend time to implement the queue data type by using two stacks in the 
language specified.  You do not need to turn in any code at this time but please 
make sure you make a serious attempt before Lecture 22. We will spend time for 
discussions on this topic and it is related to HW06, the last homework in this
semester.

Remarks:

The group number assigned to you is extracted from the class questionaire you 
completed at the beginning semester. This is the language that you like to work 
with.  The following table describes the assignment of groups.


------------------------------
Language        Group
------------------------------

Java             1

Python           2

C, C++ or C#     3

Javascript
or Typescript    4

Others           5
(Non-Haskell)

------------------------------




