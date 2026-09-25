{- |

== Things to remember

=== Declaration

A piece of syntax that /names/ something and gives it a meaning.

*"This thing is called X, and here's what it means."

@
x = 5
f n = n + 1
data Color = Red | Green
@

=== Expression

Anything you can /evaluate/ or /reduce/ to get a value.

*"A recipe that produces a value when you run it."

@
2 + 3
map (*2) [1,2,3]
\\x -> x + 1
@

==== Mnemonic

[Declaration] /names/.
[Expression] /computes/ or /reduces/ to a value.

=== Producer and Consumer (TODO: this concept is to be introduced later)

In Haskell, computation can be pictured as data flowing from a
/producer/ to a /consumer/. The two roles describe most
list-processing code you will meet. The richer machinery for
composing such stages into longer chains -- a /pipeline/ -- awaits
us later on.

Every producer and consumer below is an /expression/.

==== Producer

Something that /emits/ values on demand.

*"A source that hands out values when asked."

@
[1..]              -- infinite list
[1,2,3]            -- finite list
getLine            -- IO action producing input
@

==== Consumer

Something that /pulls/ values and uses them up.

*"A sink that drains values in and does something with them."

@
foldr
sum
print
@

==== A function can be both

The same function is often a consumer of its input and a producer
of its output. @map@ is the classic example:

@
map :: (a -> b) -> [a] -> [b]
@

* it /consumes/ the input list (via @foldr@);
* it /produces/ the output list (via @build@).

This dual role is what makes @map@ a candidate for /fusion/: the
compiler can collapse a producer directly into a consumer so that
no intermediate list is ever built. About fusion and
the @foldr@\/@build@ machinery, later on.

==== Grouping @map (+1) [1,2,3]@

@map (+1) [1,2,3]@, itself an expression and a producer, consists of:

+------------------------+------------------------------------------------+
| Component              | Role                                           |
+========================+================================================+
| @[1,2,3]@              | the producer                                   |
+------------------------+------------------------------------------------+
| @map@                  | the consumer /and/ producer                    |
+------------------------+------------------------------------------------+
| @(+1)@                 | the transformer applied to each consumed value |
+------------------------+------------------------------------------------+
| @map (+1)@             | the consumer /and/ producer, partially applied |
+------------------------+------------------------------------------------+

==== Mnemonic

[Producer] /gives/.
[Consumer] /takes/.
-}
module Ch02 where

{- | This is a doctest and unit test template to be used
from now on.

>>> identity 42
42

'identity' is just 'id':
-}
identity :: a -> a
identity = id
