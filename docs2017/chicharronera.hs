--CHICHARRONERA

-- | C. Tipo de datos que representa los numeros complejos.

type C = (Double,Double)

-- | P2. Tipo que representa los polinomios de segundo grado

-- en el campo de los numeros reales, es decir,

-- (a,b,c) representa ax^2+bx+c.

type P2 = (Double,Double,Double)

-- | R. Tipo que representa las dos posibles raices de un

-- polinomio de segundo grado.

type R = (C,C)


chicharron :: P2 -> R
chicharron (a,b,c)
	| d >= 0 = ((((-b) + sqrt(d))/t,0),(((-b) - sqrt(d))/t,0))
	| d < 0 = (((-b/t,sqrt(-d)/t)),((-b/t,-sqrt(-d)/t)))
    where d = (b^2 - 4*a*c)
          t = 2*a

         
