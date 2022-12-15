
--------------------------------------------------------------------------------
CIS 623
Fall 2022
Solution outline to Mock Final 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Part I: Short Questions 
--------------------------------------------------------------------------------

Question 1

> add     :: Int -> Int -> Int
> add x y = x + y

> add1     :: Int -> Int -> Int
> add1     =  (\ x -> (\ y -> x + y))

--------------------------------------------------------------------------------


> data BTree a = Nil | BNode (BTree a) a (BTree a)
>                deriving (Eq, Show)

> height     :: BTree a -> Int
> height Nil           =  -1
> height (BNode l v r) =  1 + max (height l) (height r)


Question 2

The type of:   BNode Nil

BNode Nil :: a -> BTree a -> BTree a

--------------------------------------------------------------------------------

Question 3

> bt1 :: BTree Integer
> bt1 =  BNode Nil 1 Nil

height bt1 = 1 + max (-1) (-1) = 0

> bt :: BTree Integer
> bt =  BNode bt1 2 Nil

height bt = 1 + max (0) (-1) = 1

--------------------------------------------------------------------------------

Question 4

Answer: True. 

The function highF defines the higher order function: foldr, and,

foldr (+) 4 [1,2,3] are being evaluated in the following order:

1+(2+(3+4)) 

--------------------------------------------------------------------------------

Question 5

Answer: True

> positions      :: Eq a => a -> [a] -> [Int]
> positions x xs = [i | (y,i) <- zip xs [0..], x == y]

*Main> positions 'A' "A+A+A"
[0,2,4]

--------------------------------------------------------------------------------

> pairs :: [a] -> [(a,a)]
> pairs xs = zip xs (tail xs)


Question 6

> sorted    :: Ord a => [a] -> Bool
> sorted xs = and [ (x <= y) | (x,y) <- pairs xs ]
             

Question 7

Answer: False

> isDistinct    :: Ord a => [a] -> Bool
> isDistinct xs =  and [ x /= y | (x,y) <- pairs xs]

Counterexample: 

> testQ7 = isDistinct [1, 2, 1]

The element 1 occurs in the list  [1,2,1] twice but  
testQ7 still return True (since 1 /= 2 and 2 /= 1).

--------------------------------------------------------------------------------

For Ticket rule (Given. Also see ACST page 62) 


Question 8

In Ticket Rule,    Ticket => authority  represents a

trust assumption

--------------------------------------------------------------------------------

Question 9

In Ticket Rule,    authority controls (subject controls φ)  represents

an access policy

--------------------------------------------------------------------------------

Question 10

Explain (in words) what is meant by:

q `equiv` q' = invariant q && invariant q' && retrieve q == retrieve q'

where q and q' are of type QueueI.

Answer:  

Given q and q' (each of type QueueI), we write

q `equiv` q' 

iff 

q, q satisfy the invariant condition, and the list representation of q
(computed by retreive q) equals the list representation of q' (computed
by retreive q').


--------------------------------------------------------------------------------

Question 11

prop_isEmpty q = invariant q ==> isEmptyI q == (q `equiv` emptyI)  ... (*)

Answer:

(*) is the quickCheck property which says:

Given q (of type QueueI) which satisfy the invariant condition (the 
pre-condition),  then isEmptyI q holds if q is `equiv` to emptyI 
(given. of type queueI)

--------------------------------------------------------------------------------

Question 12

The answer (a Hasse Diagram) can be found in ACST (Figure 13.1).

--------------------------------------------------------------------------------

Question 13

Answer:

The access control rules:

For O_1:

Rule 1:

U says [ ( U controls <read, O_1>)  and 
         ( U controls <write, O_1>) and 
         (I controls <read, O_1>)       ]

For O_k:

Rule 2:

K says [ ( U controls <read, O_k>) and 
         ( I controls <read, O_k>)     ]

--------------------------------------------------------------------------------
Part II: Programming questions 
--------------------------------------------------------------------------------

Question 1:

> compose       :: (Eq a, Eq b, Eq c) => [(a,b)] -> [(b,c)] -> [(a,c)]
> compose xs ys = [ (x1,y2)  | (x1, y1) <- xs, (x2, y2) <- ys, (y1 == x2) ]


--------------------------------------------------------------------------------

Question 2:

> data RTree a = Vertex a [RTree a]

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

which has 4 vertices (labelled 1,2,3 and 4) and height rt is 1 (since
the heights of rt1, rt2, rt3 are 0).


b.  Write a function countVer which counts the number of vertex in a rooted tree

> countVer               :: RTree a -> Integer
> countVer (Vertex x [])     =  1
> countVer (Vertex x (t:ts)) =  1 + (countVer t) + sum (map (countVer) ts)


c.   Given a tree tr of type RTree Int, write a function vexGreater where 

     vexGreater tr x 

     will compute the number of vertex whose value is greater than a given number x

> boolTo10      :: Bool -> Int
> boolTo10 True  = 1
> boolTo10 False = 0

> verGreater                :: RTree Int -> Int -> Int
> verGreater  (Vertex v [])     x =   boolTo10 (v > x)
> verGreater  (Vertex v (t:ts)) x =   boolTo10 (v > x) + (verGreater t x)  + sum (map (verGreater' x) ts)
>     where verGreater' x tr = verGreater tr x   



--------------------------------------------------------------------------------
Part III: Formal methods for Access Control 
--------------------------------------------------------------------------------

Question 1

The given derived proof rule is:   

Derived Controls Rule.

Proof Tree (see appendix).

--------------------------------------------------------------------------------

Question 2

Example: 

Consider the following scenario:

1. There are two subjects:   A,  B

   A : An executive which have read access to company secret information
   B : A  sub-ordinate programmer works for A


2. There are three objects:  

   Prog1 (program 1) 
   File1 (file 1)
   File2 (file 

The access control matrix is:

----------------------------------------------
       Prog1 (A)       File1 (A)     File2 (B)
----------------------------------------------

A      exec            read          write

B      write                         read, write 


Consider the following steps performed by B When A ask the programmer B to 
write an application program Prog1 for A.

**Step 1 **  B create Prog1. It will

a. perform the work requested by A
    
b. also execute the following (i.e. the embedded trojan horse program) 
 
   i.    read File1     (secret information)
   ii.   write File1 to File2 (contains leaked information)
 
Remark:  

--   File2 is created by B. B specifies the access right of File2 so that A 
     (and hence the program owned by A) can update the File2 but B did not 
     disclose the existence of File2 to A.
     
 
** Step 2 **

B send A the completed program Prog1 and ask A to test run Prog1.

** Step 3 **

After A execute the program Prog1, the embedded trojan horse will copy the secret 
information (File1) to the leaked file (File2).

** Step 4 **

B retreived File2, and remove it afterwards. Note that A does not know the secret 
(Fiie2) has been stolen.


Hence,  B can steal the  secret information (File1) owned by A without A’s knowledge.


--------------------------------------------------------------------------------

Question 3:


The verification steps are:

1. Check read acccess:

– Alice can read all documents since Alice security level is at least as high as the security levels of
all three documents.

- Bob can read D2 and D3 since Bob’s security level (S) is at least as high as the security levels of
D2 and D3 .

- Eve should be able to read D3 because 

slev(D3) ≤ s slev(C) 

but 

- Eve should not be able to read D2

It is because the condition: slev(D2) ≤ slev(C), fails. A violation is detected. 
Hence Bell-La Pudala policy is not satisfied.

- Check write access:

– Eve can have write access to D3 because the slev(C) ≤ slev(D3).

