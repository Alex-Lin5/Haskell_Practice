
--------------------------------------------------------------------------------

Using HUnit: a (minimal) beginning example 

--------------------------------------------------------------------------------

> import Test.HUnit

--------------------------------------------------------------------------------

Example: 

Use the library HUnit to compose and run tests based on blackbox testing method 

--------------------------------------------------------------------------------

Get HUnit:

In our class VMs, issue the following command:

1. Get cabal (the VMs given this time does not come with cabal)

prompt> sudo apt install cabal-install  

2. type 

prompt> cabal update
prompt> cabal install HUnit


--------------------------------------------------------------------------------

The function to be tested is:

> fun :: Int -> Int -> Int -> Int
> fun x y z = (x `max` y) `max` z

--------------------------------------------------------------------------------

Using HUnit, we can create four test cases as follows:  

> testcase1 = TestCase (assertEqual "for: fun 9 1 1" 9 (fun 9 1 1))
> testcase2 = TestCase (assertEqual "for: fun 9 9 9" 9 (fun 9 9 9))
> testcase3 = TestCase (assertEqual "for: fun 0 9 0" 9 (fun 0 9 0))
> testcase4 = TestCase (assertEqual "for: fun (-10) 0 9" 9 (fun (-10) 0 9))

where for each case, the output is always one.

We can group the four test cases as a "list":

> testsfun = TestList [testcase1, testcase2, testcase3, testcase4]


and Run the tests via and runTestTT function provided in HUnit. For this example, you will get:

*Main> runTestTT testsfun
Cases: 4  Tried: 4  Errors: 0  Failures: 0
Counts {cases = 4, tried = 4, errors = 0, failures = 0}









