{- |

== Definitions

In Haskell, data flows through a pipeline. Each stage either
/produces/ values, /consumes/ values, or does both. The four
core notions below describe the pieces of that flow.

=== 1. Declaration

A piece of syntax that /names/ something and gives it a meaning.

*"This thing is called X, and here's what it means."*

@
x = 5
f n = n + 1
data Color = Red | Green
@

Note: avoid the word /statement/ here -- Haskell is expression-based,
not statement-based.

=== 2. Expression

Anything you can /evaluate to get a value/.

*"A recipe that produces a value when you run it."*

@
2 + 3
map (*2) [1,2,3]
\\x -> x + 1
@

Every producer, consumer, and transducer below is itself an expression.

=== 3. Producer

Something that /emits/ values downstream, on demand.

*"A source that hands out values when asked."*

@
[1..]              -- infinite list
[1,2,3]            -- finite list
getLine            -- IO action producing input
@

In a pipeline, the producer sits at the head:

> [1,2,3]  ──▶  ...

=== 4. Consumer

Something that /pulls/ values from upstream and uses them up.

*"A sink that drains values in and does something with them."*

@
foldr
sum
print
sinkList
@

In a pipeline, the consumer sits at the tail:

> ...  ──▶  sum

=== Bonus: Transducer

A stage that is /both/ a consumer and a producer -- it pulls from
upstream, transforms, and emits downstream.

*"A pipe in the middle: takes in, gives out."*

@
map (+1)           -- consumes a list, produces a new list
filter even
mapC (+1)          -- conduit-style
@

=== Putting it together

> [1,2,3]  ──▶  map (+1)  ──▶  [2,3,4]
> producer      transducer      producer
>
> [1,2,3]  .|  mapC (+1)  .|  sinkList
> producer      transducer      consumer

Grouping @map (+1) [1,2,3]@:

* @[1,2,3]@    -- the producer (source)
* @map@        -- the consumer combinator
* @(+1)@       -- the transformer applied to each consumed value
* @map (+1)@   -- the transducer stage as a whole
* whole expr   -- a producer (emits @[2,3,4]@ for whatever comes next)

=== Mnemonic

[Producer] gives, [Consumer] takes, [Transducer] does both,
[Expression] computes, [Declaration] names.
-}
module Ch02 where

{- | One-sentence purpose: this is a template to be used
from now on in this omnibus.

>>> identity 42
42

'identity' is just 'id':
-}
identity :: a -> a
identity = id
