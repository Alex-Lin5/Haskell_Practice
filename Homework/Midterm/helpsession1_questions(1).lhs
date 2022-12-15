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
_________________________________________________________________________________________________

Question 3:

Try to use list comprehension to implement function remove3np1 in Question 1 and myCountDown in Question 2.

_________________________________________________________________________________________________

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

You may need to define additional functions, use the zip function, but DO NOT USE recursion
in any of the dunctions you wrote.

____________________________________________________________________________________________________

Question 6:

Using recursion, write a function doubleit which duplicates each element in a list and returns a new list, for example:

*Main> doubleit []
[]
*Main> doubleit [1,2,3]
[1,1,2,2,3,3]

doubleit :: [a] -> [a]

