module Ch02Spec (spec) where

import Ch02
import Test.Hspec

spec :: Spec
spec = do
  describe "concat (a1)" $ do
    it "flattens a list of lists" $
      a1 [[1, 2, 3], [4, 5, 6]] `shouldBe` ([1, 2, 3, 4, 5, 6] :: [Int])
  describe "++ (b1)" $ do
    it "appends two lists" $
      b1 [1, 2, 3] [4, 5, 6] `shouldBe` ([1, 2, 3, 4, 5, 6] :: [Int])
