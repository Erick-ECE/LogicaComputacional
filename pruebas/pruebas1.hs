-- funcion que clona n veces cada elemento de una lista de enteros 
-- donde n es el valor del elemento de dicha lista
clona :: [Int]-> [Int]
clona [] = []
clona (x:xs) = (aux [] x) ++ clona xs

aux :: [Int] -> Int -> [Int]
aux [] 0 = []
aux ls n = if((length ls)/= n ) then aux (ls ++ [n]) n else ls 