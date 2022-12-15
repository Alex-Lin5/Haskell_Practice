
Question 1:

Consider the data type Shapes:

> data Shapes = Circle Float | Rect Float Float | Tri Float Float Float
>               deriving  Show

a. Write a Haskell function:

dropcircle :: [Shapes] -> [Shapes]

which will take a list of Shapes objects as input, removes all the Circles in the list.


> isCircle :: Shapes -> Bool
> isCircle (Circle _) = True 
> isCircle _ = False 

> dropcircle :: [Shapes] -> [Shapes]
> dropcircle = filter (not.isCircle)

b. Write a Haskell function compare, which compares the number of Rect and Tri in a list of Shapes objects. If the number of Rect is greater, it returns True,
otherwise, it returns False.

> countRect :: [Shapes] -> Int
> countRect [] = 0
> countRect ((Rect _ _):xs) = countRect xs + 1
> countRect (_:xs) = countRect xs

> countTri :: [Shapes] -> Int
> countTri [] = 0
> countTri ((Tri _ _ _):xs) = countTri xs + 1
> countTri (_:xs) = countTri xs

> compare :: [Shapes] -> Bool
> compare xs = (countRect xs > countTri xs)

____________________________________________________________________

Question 2: 

Consider the data type BTree (binary tree)

> data BTree a = Nil | BNode (BTree a) a (BTree a) 
>                deriving (Eq, Show)

a. Create objects of BTree Int.

> nt :: BTree Int
> nt = Nil

> leafA :: BTree Int
> leafA = BNode nt 1 nt


> leafB :: BTree Int
> leafB = BNode nt 2 nt

> treeA :: BTree Int
> treeA = BNode leafA 3 leafB

     3
    / \
   1   2
   
> treeB :: BTree Int
> treeB = BNode treeA 4 leafA

           4
	    /  \
	   3	1
	  / \
       1  2
 
b. Compute the height of a BTree (root is at height 0).

> height :: BTree a -> Int
> height Nil = -1
> height (BNode l v r) = 1 + max (height l) (height r)

c. Given a tree of type BTree Int, write a function numGreater which computes the number of nodes whose value is greater than a given number x.

 numGreater :: BTree Int -> Int -> Int

For example:  

*Main> numGreater treeA 1
2 
*Main> numGreater treeA 3
0

> numGreater :: BTree Int -> Int -> Int
> numGreater Nil x = 0
> numGreater (BNode l v r) x
>		| v > x     = 1 + numGreater l x + numGreater r x
>		| otherwise = numGreater l x + numGreater r x

____________________________________________________________________

Question 3:


Consider the data type RTree (rooted tree)

> data RTree a = Vertex a [RTree a] deriving Show

a. Create an object of type RTree Int with height 2 (root is at height 0) and 5 vertices.

> rvtx1 :: RTree Int 
> rvtx1 = (Vertex 1 [Vertex 0 []])
       

> rvtx2 :: RTree Int 
> rvtx2 = (Vertex 2 [])

> rvtx3 :: RTree Int 
> rvtx3 = (Vertex 3 [])

	
> rtr :: RTree Int 
> rtr = (Vertex 4 [rvtx1, rvtx2, rvtx3])

              4
             /|\
            1 2 3
           /
          0
b. Write a function CountVer which counts the number of vertex in a rooted tree.

> countvertex :: RTree a -> Int
> countvertex (Vertex x []) = 1
> countvertex (Vertex x ts) = 1 + sum (map countvertex ts)

c. Given a tree of type RTree Int, write a function vexGreater which computes the number of vertex whose value is greater than a given number x.


> vexGreater :: RTree Int -> Int -> Int
> vexGreater (Vertex v []) x = if v > x then 1 else 0 -- not necessary
> vexGreater (Vertex v ts) x
> 		| v > x     = 1 + sum(map (\t -> vexGreater t x) ts)
> 		| otherwise = sum(map (\t -> vexGreater t x) ts)

> vexGreater' ::  Int -> RTree Int -> Int
> vexGreater' x (Vertex v [])= if v > x then 1 else 0
> vexGreater' x (Vertex v ts) 
> 		| v > x     = 1 + sum(map (vexGreater' x) ts)
> 		| otherwise = sum(map (vexGreater' x) ts)
