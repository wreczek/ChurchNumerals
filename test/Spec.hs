-- module CalculationSpec(calcTest) where
-- module ChurchBooleansSpec(ChuBooTest) where

--import main
  --import HUnit
  import Test.Hunit
  import Pairs
  import ChurchNumerals
  import ChurchBooleans
  import Calculation

  test1 = TestCase (assertEqual "multiplicationTest" 6 $ mul (\x -> 2*x) (\y -> y+1) 2)
  test2 = TestCase (assertEqual "powTest" 16 $ pow 5 (\x -> 3*x+1) )

  test3 = TestCase (assertEqual "trueTest" 'a' $ true 'a' 'b')
  test4 = TestCase (assertEqual "falseTest" 'b' $ false 'a' 'b')

  test5 = TestCase (assertEqual "churchTest" 16 $
    unchurch $ four $ church 2)
  test6 = TestCase (assertEqual "churchTest2" 256 $
    unchurch (two (four (church 2))))

  test7 = TestCase(assertEqual "pairsTest" 15 $
    unchurch $ second $ pair one $ church 15)

  testList = TestList [TestLabel "test1" test1
                      ,TestLabel "test2" test2
                      ,TestLabel "test3" test3
                      ,TestLabel "test4" test4
                      ,TestLabel "test5" test5
                      ,TestLabel "test6" test6]

--main :: IO ()
--main = do
  hUnitTest = runTestTT testList
