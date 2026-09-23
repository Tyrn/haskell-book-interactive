module Ch05Spec (spec) where

import Ch05
import Test.Hspec

spec :: Spec
spec = do
  describe "concat" $ do
    it "works" $
      a1 [[1, 2, 3], [4, 5, 6 :: Int]] `shouldBe` [1, 2, 3, 4, 5, 6]
  describe "++" $ do
    it "works" $
      b1 [1, 2, 3] [4, 5, 6] `shouldBe` [1, 2, 3, 4, 5, 6 :: Int]
