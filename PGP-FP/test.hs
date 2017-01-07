ziperino          :: [a] -> [b] -> [(a,b)]
ziperino (x:xs) (y:ys) = (x,y) :  ziperino xs ys
ziperino  _ []     = []
ziperino [] _      = []

