module Pairs
    (first, second,pair) where

--needed for first and second operations, uses true and false
-- from ChurchBooleans
import ChurchBooleans

-- functions that are needed for list operations
first :: ((t1 -> t2 -> t1) -> t) -> t
first = \f -> f(true)

second :: ((t1 -> t2 -> t2) -> t) -> t
second = \f -> f(false)

pair :: t1 -> t2 -> (t1 -> t2 -> t) -> t
pair= \x y f -> f(x)(y)

-- to_integer(second(pair(one)(two))) returns 2
-- unchurch(second(pair(one)(church(15)))) returns 15
-- unchurch(second(pair(one)(church(15)))) returns 1
