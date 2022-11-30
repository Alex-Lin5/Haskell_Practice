Code for HW 06

> module Queue where
> import Test.QuickCheck

--------------------------------------------------------------------------------
An implementation of a Queue using a two "stacks"
--------------------------------------------------------------------------------


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

--------------------------------------------------------------------------------


