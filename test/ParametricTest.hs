{-# LANGUAGE TemplateHaskell #-}
module Church.ParametricTests(
        parametricTests ) where

-- tested module
-- import main
import ChurchNumerals

-- tests deps
import Test.QuickCheck.All
import Test.QuickCheck
import System.Random

main = do
  g <- getStdGen
  list = take 10 (randoms g :: [Double])

church_convertion :: [Integer] -> Bool
church_convertion list = is_true list
  where
  is_true [] = True
  is_true [x] = unchurch (church x) == x
  is_true (x:xs)
      | (unchurch (church x) == x) = is_true xs
      | otherwise = False

return []
parametricTests = $quickCheckAll
