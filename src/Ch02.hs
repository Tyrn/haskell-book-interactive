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

=== Pipeline (TODO: make in simpler and clearer)

In Haskell, data flows through a /pipeline/. Each stage either
/produces/ values, /consumes/ values, or does both. The
core notions below describe the pieces of that flow.

Every producer, consumer, and transducer below is an /expression/.

==== Producer

Something that /emits/ values downstream, on demand.

*"A source that hands out values when asked."

@
[1..]              -- infinite list
[1,2,3]            -- finite list
getLine            -- IO action producing input
@

In a pipeline, the producer sits at the head:

> [1,2,3]  ──▶  ...

==== Consumer

Something that /pulls/ values from upstream and uses them up.

*"A sink that drains values in and does something with them."

@
foldr
sum
print
sinkList
@

In a pipeline, the consumer sits at the tail:

> ...  ──▶  sum

==== Transducer

A stage that is /both/ a consumer and a producer -- it pulls from
upstream, transforms, and emits downstream.

*"A pipe in the middle: takes in, gives out."

@
map (+1)           -- consumes a list, produces a new list
filter even
mapC (+1)          -- conduit-style
@

==== Putting it together

> [1,2,3]  ──▶  map (+1)  ──▶  [2,3,4]
> producer      transducer      producer
>
> [1,2,3]  .|  mapC (+1)  .|  sinkList
> producer      transducer      consumer

@map (+1) [1,2,3]@, itself an expression and a producer, consists of:

+------------------------+-------------------------------------------------------------+
| Component              | Role                                                        |
+========================+=============================================================+
| @[1,2,3]@              | the producer (source)                                       |
+------------------------+-------------------------------------------------------------+
| @map@                  | the consumer combinator                                     |
+------------------------+-------------------------------------------------------------+
| @(+1)@                 | the transformer applied to each consumed value              |
+------------------------+-------------------------------------------------------------+
| @map (+1)@             | the transducer stage as a whole                             |
+------------------------+-------------------------------------------------------------+

==== Mnemonic

[Producer] gives,
[Consumer] takes,
[Transducer] does both,
[Expression] computes,
[Declaration] names.
-}
module Ch02 where

{- | This is a doctest and unit test template to be used
from now on along the way.

>>> identity 42
42

'identity' is just 'id':
-}
identity :: a -> a
identity = id
