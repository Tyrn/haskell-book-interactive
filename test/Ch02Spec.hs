module Ch02Spec (spec) where

import Ch02
import Test.Hspec

spec :: Spec
spec = do
  describe "id (identity)" $ do
    it "shows the meaning of identity" $
      identity "ego" `shouldBe` "ego"
