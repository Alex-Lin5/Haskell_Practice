> compose :: Eq a => [(a,a)] -> [(a,a)] -> [(a,a)]
> compose la lb = [(r,t)|(r,s1)<-la, (s2,t)<-lb, s1==s2]

Question 2

> data RTree a = Vertex a [RTree a]
>   deriving Show

a.  Create an object of type RTree Int with height 1 (root is at height 0) 
    and 4 vertices.

We construct rt (type: RTree Int) to meet the requirements:

> rt1 :: RTree Int
> rt1 =  Vertex 1 []

> rt2 :: RTree Int
> rt2 =  Vertex 2 []

> rt3 :: RTree Int
> rt3 =  Vertex 3 []

> rt :: RTree Int
> rt = Vertex 4 [rt1, rt2, rt3]

> rt4 :: RTree Int
> rt4 =  Vertex 5 []

> rtt :: RTree Int
> rtt =  Vertex 6 [rt, rt4]

> countVer :: RTree a -> Int
> countVer (Vertex a []) = 1
> countVer (Vertex a (x:xs)) = countVer x + countVer (Vertex a xs) 

> vexGreater :: RTree Int -> Int -> Int
> vexGreater (Vertex a (x:xs)) num = vexGreater x num + vexGreater (Vertex a xs) num 
> vexGreater (Vertex a []) num = greater a num where
>   greater :: Int -> Int -> Int
>   greater comp num
>       | comp>num = 1
>       | otherwise = 0

Question 3

> takeWhile :: (a->Bool) -> [a] -> [a]
> takeWhile f [] = []
> takeWhile f (x:xs) 
>   | f x == True = [x] ++ (Main.takeWhile f xs)
>   | otherwise = []

> dropWhile :: (a->Bool) -> [a] -> [a]
> dropWhile f [] = []
> dropWhile f (x:xs)
>     | f x == True =  Main.dropWhile f xs
>     | otherwise = (x:xs)

*Main> Main.takeWhile (<3) [1..9]
[1,2]
*Main> Main.dropWhile (<3) [1..9]
[3,4,5,6,7,8,9]