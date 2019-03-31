module ChurchBooleans
    (true, false, not', and', or', xor', to_boolean) where


-- defining Church values: true and false
true :: t1 -> t -> t1
true= \x y -> x

false :: t -> t1 -> t1
false= \x y -> y

-- logical operations
not' :: ((t1 -> t2 -> t2) -> (t4 -> t3 -> t4) -> t) -> t
not'= \f -> f(false)(true)

and' :: (t1 -> (t2 -> t3 -> t3) -> t) -> t1 -> t
and'= \f g -> f(g)(false)

or' :: ((t3 -> t2 -> t3) -> t1 -> t) -> t1 -> t
or'= \f g -> f(true)(g)

-- xor' is working only if first element is true
xor' :: (t1 -> ((t2 -> t3 -> t3) -> (t5 -> t4 -> t5) -> t1) -> t) ->
        ((t2 -> t3 -> t3) -> (t5 -> t4 -> t5) -> t1) -> t
xor'= \f g -> f(not'(g))(g)

to_boolean= \f -> f(True)(False)
