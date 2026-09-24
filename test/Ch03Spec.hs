module Ch03Spec (spec) where

import Ch03
import Test.Hspec

spec :: Spec
spec = do
  describe "concat" $ do
    context "basic cases" $
      it "makes a list from a list of two lists" $
        a1 [[1, 2, 3], [4, 5, 6 :: Int]] `shouldBe` [1, 2, 3, 4, 5, 6]
  describe "append" $ do
    context "basic cases" $
      it "make a list of two lists" $
        b1 [1, 2, 3] [4, 5, 6 :: Int] `shouldBe` [1, 2, 3, 4, 5, 6]
