module Ch02 where

{- | Concatenate two lists.

>>> a1 [[1,2,3], [4,5,6]]
[1,2,3,4,5,6]

'a1' is just 'concat':
-}
a1 :: [[a]] -> [a]
a1 = concat

{- | Append two lists.

>>> b1 [1,2,3] [4,5,6]
[1,2,3,4,5,6]

'b1' is just '(++)':
-}
b1 :: [a] -> [a] -> [a]
b1 = (++)
