module Calculation
    (increment, decrement, add, mul, pow) where


-- arithmetic operations, additionally give us the
-- view of new, undefined numerals
increment :: ((a -> b) -> c -> a) -> (a -> b) -> c -> b
increment = \g f x -> f(g(f)(x))

decrement :: (((r -> b) -> (b -> c) -> c) ->
             (t1 -> t2) -> (t3 -> t3) -> t) -> r -> t2 -> t
decrement = \a f x -> a(\g h -> h.g$f)(\y -> x)(\y -> y)

add :: r -> ((((t2 -> t1) -> t3 -> t2) ->
       (t2 -> t1) -> t3 -> t1) -> r -> t) -> t
add = \f g -> g(increment) $ f

mul :: (b -> c) -> (r -> b) -> r -> c -- function composition
mul= \f g x -> f . g $ x

pow :: a -> (a -> b) -> b -- use the function on the argument
pow = \f g -> g $ f
