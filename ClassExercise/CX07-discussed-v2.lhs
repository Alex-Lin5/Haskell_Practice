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

> import Test.QuickCheck 

-------------------------------------------------------------------------------

1. Type:  QueueI is represented by a pair of two lists (think of it as two  
          stacks)

> type QueueI a = ([a],[a])


2. Empty Queue: 

> emptyI = ([],[])

3. Add (Enqueue) an element

> addI         :: a -> QueueI a -> QueueI a 
> addI x (f,b) = flipQ (f,x:b)

4. Test if the queue is empty 

> isEmptyI       :: QueueI a -> Bool
> isEmptyI (f,b) =  null f

5. Access the front element in the queue 
   Note: the element is NOT being removed

> frontI         :: QueueI a -> a
> frontI (x:f,b) =  x

6. Remove the front element in the queue 
   Note: The queue is assumed to be not empty 

> removeI          :: QueueI a -> QueueI a
> removeI (x:f, b) = flipQ (f,b)

7. Utility function(s) for the Queue datatype

   a. flipQ: "re-adjust" the queue whenever the 
      front list f is empty

> flipQ        :: ([a],[a]) -> ([a],[a]) 
> flipQ ([],b) = (reverse b, [])
> flipQ q      = q


--------------------------------------------------------------------------------
II. Specification and testing
--------------------------------------------------------------------------------

1. Functions for composing specifications and tests for *queues of integers*

-- a. retreive: returns a list representation of a queue 
                from the two stack representation of a queue 
      
> retrieve :: QueueI Integer -> [Integer]
> retrieve (f,b) = f ++ reverse b

-- b. invariant: the Boolean condition:
 
                 either f is not null or the b is null
                 where the queue is the tuple (f,b) 

> invariant :: QueueI Integer -> Bool
> invariant (f,b) = not (null f) || null b

2. Properties, executable specifications and tests

-- a.  Define when will we consider two queues are equivalent.

> q `equiv` q' = invariant q && invariant q' && retrieve q == retrieve q'

-- b.  Property *isEmpty* :  

> prop_isEmpty q = invariant q ==> isEmptyI q == (q `equiv` emptyI)

-- c.  Property: *front_empty*: 

> prop_front_empty :: Integer -> Bool
> prop_front_empty x = frontI (addI x emptyI) == x

-- d.  Property: *front_add*:

> prop_front_add x q = invariant q && not (isEmptyI q) ==>
>                         frontI (addI x q) == frontI q

-- e.  Property: *remove_empty*:

> prop_remove_empty x = removeI (addI x emptyI) `equiv` emptyI

-- f.  Property: *remove_add*:

> prop_remove_add x q = invariant q && not (isEmptyI q) ==>
>                       removeI (addI x q) `equiv` addI x (removeI q)


--------------------------------------------------------------------------------



> equivQ   :: QueueI Integer -> Gen (QueueI Integer)
> equivQ q =  do k <- choose (0,0 `max` (n-1))
>                return (take (n-k) els, reverse (drop (n-k) els))
>                    where
>                    els = retrieve q
>                    n = length els


> prop_equivQ q = invariant q ==> forAll (equivQ q) $ \q' -> q `equiv` q'

> prop_add_equiv q x = invariant q ==> 
>                      forAll (equivQ q) $ \q' -> addI x q `equiv` addI x q'

Note:

*Main> :t forAll
forAll
  :: (Testable prop, Show a) => Gen a -> (a -> prop) -> Property

*Main> :t equivQ
equivQ :: QueueI Integer -> Gen (QueueI Integer)

*Main> :t ($)
($) :: (a -> b) -> a -> b

*Main> :t forAll.equivQ
forAll.equivQ
  :: Testable prop =>
     QueueI Integer -> (QueueI Integer -> prop) -> Property

*Main> 