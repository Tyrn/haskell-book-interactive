{-# LANGUAGE OverloadedStrings #-}

import Ch03Spec qualified
import Ch04Spec qualified
import Ch05Spec qualified
import Test.Hspec

main :: IO ()
main =
  hspec $ do
    describe "Ch03Spec" Ch03Spec.spec
    describe "Ch04Spec" Ch04Spec.spec
    describe "Ch05Spec" Ch05Spec.spec
