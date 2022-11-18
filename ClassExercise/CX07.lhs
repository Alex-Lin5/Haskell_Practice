-------------------------------------------------------------------------------
Fall 2022
CIS 623
CX07  Queue data type: implementation with testing  
-------------------------------------------------------------------------------

Name:

Label your file as:

XXX-CX07.lhs

Where XXX is your class student number.

-------------------------------------------------------------------------------
1. Definition

> type QueueI = ([a], [a])

2. Empty Queue:

> emptyI :: ([a], [a])
> emptyI = ([], [])

3. add(enqueue) an element

> addI :: a -> QueueI a -> QueueI a
> addI x (f,b) = flipQ (f,x:b)

> flipQ :: QueueI a -> QueueI a
> flipQ ([], b) = (reverse b, [])
> flipQ (f, b) = (f, b) --- no need to flip, keep the ordering

4. remove an element, precondition for removeI: the input list is not emptyI

> removeI :: QueueI a -> QueueI a
> removeI (x:f, b) = flipQ (f,b)

> isEmptyI :: QueueI a -> Bool
> inEmptyI (f,b) = null f

5. get the element in the front, precondition: the input list is not emptyI

> frontI :: QueueI a -> a
> frontI (x:f, b) = x

quickCheck prop_isEmpty
verboseCheck prop_isEmpty
-------------

add x ([],[])
add x ([y],[])
add x ([],[z])
add x ([y],[z])