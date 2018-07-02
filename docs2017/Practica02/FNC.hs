module FNC where

import LProp
import LConj

nN :: Prop -> Int
nN TTrue = 0
nN FFalse = 0
nN (V p) = 0
nN (Neg p) = if ((peso p) > 0) then 1 + (nN p) else (nN p)
nN (Conj x y) = (nN x) + (nN y)
nN (Disy x y) =  (nN x) + (nN y)
nN (Imp x y) =  (nN x) + (nN y)
nN (Equiv x y) =  (nN x) + (nN y)


fnn :: Prop -> Prop
fnn TTrue = TTrue
fnn FFalse = FFalse
fnn (V p) = V p
fnn (Neg p) = aux_fnn p
fnn (Conj p1 p2) = (Conj (fnn p1) (fnn p2))
fnn (Disy p1 p2) = (Disy (fnn p1) (fnn p2))
fnn p = fnn(elimIE(p))


aux_fnn :: Prop -> Prop
aux_fnn TTrue = FFalse
aux_fnn FFalse = TTrue
aux_fnn (V p) = (Neg (V p))
aux_fnn (Neg p) = (fnn p)
aux_fnn (Disy p1 p2) = (Disy (aux_fnn p1) (aux_fnn p2))
aux_fnn (Conj p1 p2) = (Conj (aux_fnn p1) (aux_fnn p2))
aux_fnn  p = aux_fnn(elimIE(p))


cnf :: Prop -> Prop
cnf TTrue = TTrue
cnf FFalse = FFalse
cnf (V p) = V p
cnf (Neg x) = cnf (fnn(Neg x))
cnf (Conj x y) = Conj(cnf x)(cnf y)
cnf (Disy (Conj x y) p) = cnf (Conj (Disy (cnf x) (cnf p)) (Disy (cnf y) (cnf p)))
cnf (Disy p (Conj x y)) = cnf (Conj (Disy (cnf p) (cnf x)) (Disy (cnf p) (cnf y)))
cnf p = cnf (fnn p)


