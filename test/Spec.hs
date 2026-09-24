import Ch03Spec qualified
import Ch04Spec qualified
import Ch05Spec qualified
import Test.Hspec

main :: IO ()
main =
  hspec $ do
    describe "Chapter 3: Strings" Ch03Spec.spec
    describe "Chapter 4: Basic datatypes" Ch04Spec.spec
    describe "Chapter 5: Types" Ch05Spec.spec
