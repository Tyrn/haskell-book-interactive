import Ch03Spec qualified
import Ch04Spec qualified
import Ch05Spec qualified
import Test.Hspec

main :: IO ()
main =
  hspec $ do
    describe "Strings" Ch03Spec.spec
    describe "Basic datatypes" Ch04Spec.spec
    describe "Types" Ch05Spec.spec
