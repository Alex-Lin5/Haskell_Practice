

Question 1:

By using recursion, write the function remove3np1:

remove3np1 :: [Int] -> [Int]

such that it will take a list of type [Int], returns a list created by droppung the elements ate the
positions at 1, 4, 7, ..., (3n+1) of the input list, whenever possible. For example:

*Main> remove3np1 [ ]
[ ]
*Main> remove3np1 [1]
[ ]
*Main> remove3np1 [1,2]
[2]
*Main> remove3np1 [1, 2, 3]
[2, 3]
*Main> remove3np1 [1, 2, 3, 4]
[2, 3]
*Main> remove3np1 [1, 2, 3, 4, 5]
[2, 3, 5]

> remove3np1 :: [Int] -> [Int]
> remove3np1 (x:y:z:ws) = y:z:remove3np1 ws
> remove3np1 [y,z] = [z]
> remove3np1 _ = []

________________________________________________________________________________________________

Question 2:

Complete the code for the helper function in the following Haskell function myCountDown

myCountDown :: Int -> [(Int, Int)]
myCountDown k
	| k<=0 = []
	| otherwise = helper 1 k

helper :: Int -> Int -> [(Int, Int)]

Note: helper function must be defined via recursion and myCountDown k will return a list
[(2(k-1), k-1), ... , (0,0)]. For example:

*Main> myCountDown 5
[(8,4), (6,3), (4,2), (2,1), (0,0)]
*Main> myCountDown 1
[(0,0)]

> myCountDown :: Int -> [(Int, Int)]
> myCountDown k
>	| k<=0 = []
>	| otherwise = helper 1 k
	
> helper :: Int -> Int -> [(Int, Int)]
> helper r k
>    | r > k     = []
>    | r == k    = [(0,0)]
>    | otherwise = (2*(k-r), (k-r)):helper (r+1) k
    
_________________________________________________________________________________________________

Question 3:

Try to use list comprehension to implement function remove3np1 in Question 1 and myCountDown in Question 2.

> remove3np1' :: [Int] -> [Int]
> remove3np1' xs = [x | (index, x) <- zip [1..] xs, mod index 3 /= 1]

> myCountDown' :: Int -> [(Int,Int)]
> myCountDown' k = [ (2*(k-i), k-i) | i <- [1..k]]


_______________________________________________________________________________________________

Question4:

The prefix sum of a sequence of numbers x0, x1, x2, ... is a sequence of numbers y0, y1, y2, ... where
y0 = x0, y1 = x0 + x1, y2 = x0 + x1 + x2 ...

Using recursion and list comprehension, write a Haskell function pSums:

pSums :: [Int] -> [Int]

which takes a list of numbers as input, return the prefix sum of the list of numbers. For example,
*Main> pSums []
[]
*Main> pSums [1]
[1]
*Main> pSums [1,2]
[1, 3]
*Main> pSums [1, 2, 3]
[1, 3, 6]
*Main> pSums [1, 2, 3, 4]
[1, 3, 6, 10]

> psums1::[Int] -> [Int]
> psums1 [] = []
> psums1 xs = helper 1 xs
>      where 
>	  helper::Int -> [Int] -> [Int]
>	  helper n xs 
>	      | n>length(xs) = []
>	      | otherwise = sum(take n xs) :helper (n+1) xs

> psums2 :: [Int] -> [Int]
> psums2 xs = [sum (take n xs) | n <-[1..length xs]]

__________________________________________________________________________________________________

Question 5

Recall that a prime number p is an integer such that p >= 2 and the only factor of p is either
1 or p. An integer greater than 1 that is not prime is called a composite number. By using
list comprehension, write a Haskell function kthComposite, that will take an integer k (of type
Integer) as input, return the k-th composite number. For example:

*Main> kthComposite 1
4
*Main> kthComposite 2
6
*Main> kthComposite 3
8

You may need to define additional functions, use the zip function, but DO NOT USE recursion in any of the dunctions you wrote.

> factor::Int -> [Int]
> factor n = [k|k<-[1..n],  mod n k ==0]

> isComposite::Int->Bool
> isComposite x = (x>1) && (length (factor x) >2)

> composites::[Int]
> composites = [i | i<-[2..],isComposite i]

> kthComposite:: Int -> Int
> kthComposite k = head [c|(i,c) <- zip [1..] composites, (i==k)]

____________________________________________________________________________________________________

Question 6:

Using recursion, write a function doubleit which duplicates each element in a list and returns a new list, for example:

*Main> doubleit []
[]
*Main> doubleit [1,2,3]
[1,1,2,2,3,3]

> doubleit :: [a] -> [a]
> doubleit [] = []
> doubleit (x:xs) = x:x:doubleit xs
