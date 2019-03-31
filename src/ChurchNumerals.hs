{-# LANGUAGE RankNTypes #-}
module ChurchNumerals
    ( church, unchurch, zero, one, two, three, four,
      five, six, seven, eight, nine, ten
    ) where

-- we define natural numbers of Church
type Church a = (a -> a) -> a -> a

-- converting functions
church:: Integer -> Church Integer
church 0 = \f x -> x
church n = \f x -> f(church(n-1) f x)

unchurch:: Church Integer -> Integer
unchurch cn = cn(+1) 0

--
zero :: Church x
zero= \f x -> x

one :: Church x
one= \f x -> f $ x

two :: Church x
two= \f x -> f . f $ x

three :: Church x
three= \f x-> f.f.f$x

four :: Church x
four= \f x-> f.f.f.f$x

five :: Church x
five= \f x -> f.f.f.f.f$x

six :: Church x
six= \f x-> f.f.f.f.f.f$x

seven :: Church x
seven= \f x-> f.f.f.f.f.f.f$x

eight :: Church x
eight= \f x-> f.f.f.f.f.f.f.f$x

nine :: Church x
nine= \f x-> f.f.f.f.f.f.f.f.f$x

ten :: Church x
ten= \f x->f.f.f.f.f.f.f.f.f.f$x

--kazdy nastepny liczebnik Churcha dodatkowo mozemy
-- utworzyc poprzez operacje arytmetyczne z modulu Calculation
