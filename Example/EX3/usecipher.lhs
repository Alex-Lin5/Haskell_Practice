This file demonstrates how to use the module

Caesarcipher.hs 

> import Caesarcipher
> import Test.HUnit

--------------------------------------------------------------------------------

A. We 

1. create a message with a key
2. show the encode message
3. conduct an experiment and see if it can be cracked


> key :: Int
> key = 13

> myMessage :: [Char]
> myMessage = "structuredprogrammingandformalmethods"
> messagePosted = encode (key) myMessage
> experiment1 = crack messagePosted

--------------------------------------------------------------------------------

B. We create a list of messages and see all of them can be cracked.

i.  Create the test cases as a list

> message1 :: [Char]
> message1 = "syracuse"

> message2 :: [Char]
> message2 = "university"

> message3 :: [Char]
> message3 = "computerscience"

> message4 :: [Char]
> message4 = "cybersecurity"


> case1 = TestCase (assertEqual "for cracking message1" message1  (crack (encode (key) message1)))
> case2 = TestCase (assertEqual "for cracking message2" message2  (crack (encode (key) message2)))  
> case3 = TestCase (assertEqual "for cracking message3" message3  (crack (encode (key) message3)))  
> case4 = TestCase (assertEqual "for cracking message4" message4  (crack (encode (key) message4)))  

> testscrack = TestList [case1, case2, case3, case4]

ii. Run the test:

runTestTT testscrack

Does the crack function decode the messages correctly ?


--------------------------------------------------------------------------------
End of usecipher.lhs
--------------------------------------------------------------------------------

