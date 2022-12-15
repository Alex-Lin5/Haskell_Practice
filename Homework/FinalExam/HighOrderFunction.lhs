> import Prelude hiding (sqrt)



Question 1:

Show how the list comprehension [f x | x <- xs, p x ] can be re-expressed using the higher-order functions map and filter 

p :: a -> Bool
f :: a -> b

1. select x from the list, where (p x) is True
2. apply f on the x's

> func :: (a -> b) -> (a -> Bool) -> [a] -> [b]
> func f p xs = map f (filter p xs)


Question 2:

Recall foldr function is defined as follows:

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f v []     = v
foldr f v (x:xs) = f x (foldr f v xs)

Redefine the functions map f and filter p using foldr

> map1 :: (a -> b) -> [a] -> [b]
> map1 g xs = foldr (\x xs -> g x : xs) [] xs

in foldr, f = (\x xs -> g x : xs), v = []

g = (*2)

map1 (*2) [1,2,3]
= foldr (\x xs -> (2) x : xs) [] 1:[2,3]
= f 1 (foldr f [] 2:[3])
= f 1 (f 2 (foldr f [] 3:[]))
= f 1 (f 2 (f 3 (foldr f [] [])))
= f 1 (f 2 (f 3 []))
= f 1 (f 2 (2*3):[])
= f 1 (f 2 [6])
= f 1 (4:[6])
= 2:[4,6]

> filter1 :: (a -> Bool) -> [a] -> [a]
> filter1 p xs = foldr (\x xs -> if p x then x:xs else xs) [] xs

in foldr, f = (\x xs -> if p x then x:xs else xs), v = []

p = (>2)

filter1 (>2) [1,2,3]
= foldr f [] 1:[2,3]
= f 1 (foldr f [] 2:[3])
= f 1 (f 2 (foldr f [] 3:[]))
= f 1 (f 2 (f 3 (foldr f [] [])))
= f 1 (f 2 (f 3 []))
= f 1 (f 2 (3:[]))
= f 1 (f 2 [3])
= f 1 [3]
= [3]

Question 3:

Let lst = [x1, x2, x3,..., xn] be a list of integers (type of [Int]), prefix sums of the lst is [y1, y2, y3, ..., yn]
where
	y1 = x1, y2 = x1 + x2, y3 = x1 + x2 + x3, ..., yn = x1 + x2 + ... + xn

Write a function fun, so that foldr fun [] xs will compute the prefix sums of xs. For example,

*Main> foldr fun [] []
[]
*Main> foldr fun [] [1..3]
[1,3,6] -- 1, 1+2, 1+2+3
*Main> foldr fun [] [1..5]
[1,3,6,10,15]

y1 = x1, y2 = y1 + x2, y3 = y2 + x3, ..., yn = y(n-1) + xn

> fun :: Int -> [Int] -> [Int]
> fun x lst = x : map (+x) lst

foldr f v []     = v
foldr f v (x:xs) = f x (foldr f v xs)

foldr fun [] [1,2]
= fun 1 (foldr fun [] [2])
= fun 1 (fun 2 (foldr fun [] []))
= fun 1 (fun 2 [])
=....
= [1, 3]

fun x lst = x : map (+x) lst



Question 4:

Without looking at the definitions from the standard prelude, define the higher-order functions all, any, takeWhile, and dropWhile.

foldr f v []     = v
foldr f v (x:xs) = f x (foldr f v xs)

a. all, check if every element x in the list makes (p x) True

> all1 :: (a -> Bool) -> [a] -> Bool
> all1 p xs = and (map p xs)

> all2 :: (a -> Bool) -> [a] -> Bool
> all2 p xs = foldr (\x y -> p x && y) True xs

f = (+) v = 0
f = (*) v = 1
f = && v = True

f = (\x y -> p x && y), v = True
p = (>3), xs = [1,2]
foldr (\x y -> p x && y) True [1,2]
= f 1 (foldr f True [2])
= f 1 (f 2 (foldr f True []))
= f 1 (f 2 True)
= f 1 (((>3) 2) && True )
= f 1 False
= False


> all3 :: (a -> Bool) -> [a] -> Bool
> all3 p [] = True
> all3 p (x:xs) = (p x) && all3 p xs

-- b. any, check if there is at least one element x in the list makes (p x) True

> any1 :: (a -> Bool) -> [a] -> Bool
> any1 p xs = or (map p xs)

> any2 :: (a -> Bool) -> [a] -> Bool
> any2 p xs = foldr (\x y -> p x || y) False xs

f = (\x y -> p x || y), v = False


> any3 :: (a -> Bool) -> [a] -> Bool
> any3 p [] = False
> any3 p (x:xs) = (p x) || (any3 p xs)

-- c. takeWhile, returns x until p x is False

> takeWhile' :: (a -> Bool) -> [a] -> [a]
> takeWhile' p xs = foldr (\x xs -> if p x then x:xs else []) [] xs
 
 f = (\x xs -> if (<2) x then x:xs else [])
 
 takeWhile' (<2) [1,2]
 = foldr (\x xs -> if (<2) x then x:xs else []) [] 1:[2]
 = f 1 (foldr f [] 2:[])
 = f 1 (f 2 (foldr f [] []) )
 = f 1 (f 2 [])
 = f 1 []
 = 1:[]

> takeWhile'' :: (a -> Bool) -> [a] -> [a]
> takeWhile'' p [] = []
> takeWhile'' p (x:xs) = if p x then x : takeWhile' p xs else []



-- d. dropWhile, discard x until p x is False

> dropWhile' :: (a -> Bool) -> [a] -> [a]
> dropWhile' p [] = []
> dropWhile' p (x:xs) = if p x then dropWhile' p xs else x:xs


Question 5:

Function applyfuns will take a list of functions [f1, f2, ..., fn] (each of type a->b) and a value k (type a) as input, return the list 
[f1 k, f2 k, ..., fn k]. For example:

*Main> applyfuns [(+1), (*2), (+3)] 5
[6,10,8]

a. Write a version of the function applyfunsa

applyfunsa :: [a -> b] -> a -> [b]

by using recursion.

> applyfunsa :: [a -> b] -> a -> [b]
> applyfunsa [] k = []
> applyfunsa (f:fs) k = f k : applyfunsa fs k

b. write a version of the function applyfunsb, using library function map.

> applyfunsb :: [a -> b] -> a -> [b]
> applyfunsb fs k = map (\f -> f k) fs

fs :: [a->b], 
(\f -> f k) :: (a->b)->b


Question 6:
An example of computing the square root of a number.

until p f x 
= if p (f x) then until p f (f x) else f x

until (>2) (+1) 1

= if (>2) ((+1) 1)? NO, 

until (>2) (+1) 2
= if (>2) ((+1) 2)? Yes, returns (+1) 2 = 3

until :: (a -> Bool) -> (a -> a) -> a -> a
 until (> 100) (*2) 1 

keep applying the function until the condition is False

> type Interval = (Integer,Integer)

> isqrt :: Float -> Integer
> isqrt x = fst (until unit (shrink x) (bound x))
>           where unit (m,n) = (m+1 == n)

> shrink :: Float -> Interval -> Interval
> shrink x (m,n) = if (p*p) `leq` x then (p,n) else (m,p)
>                  where p = (m+n) `div` 2


shrink 10 (0, 4)
= if (2*2) 'leq' 10 then (2, 4) else (0, 2)



> bound :: Float -> Interval
> bound x = (0,until above (*2) 1)
>           where above n = x `lt` (n*n)


bound 10 
= (0, until above (*2) 1)

above ((*2) 1) = 10 'lt' 4 -> False

= (0, until above (*2) 2)

above ((*2) 2) = 10 'lt' 16 -> True

= (0, 4)

> sqrt :: Float -> Float
> sqrt x = until goodenough improve x
>   where goodenough y = abs (y*y-x) < eps*x
>         improve y = (y+x/y)/2
>         eps = 0.000001



> leq :: Integer -> Float -> Bool -- <=
> m `leq` x = fromInteger m <= x

> lt :: Float -> Integer -> Bool -- >
> x `lt` n = x < fromInteger n
