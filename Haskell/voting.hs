import Data.List 
type Party = String
type Ballot = [Party]

count :: Eq a=> a -> [a] -> Int
count x xs = length(filter (== x) xs)

rmdups :: Eq a => [a] -> [a] 
rmdups [] = []
rmdups (x:xs)   |elem x xs      = rmdups xs
         	    |otherwise      = x : rmdups xs

frequency :: Eq a => [a] -> [(Int, a)]
frequency xs = [(count x xs, x)| x <- rmdups xs]

results :: [Party] -> [(Int, Party)]
results xs = sort (frequency xs)

votes :: [Party]
votes = ["Red","Blue","Green","Blue","Blue","Red"]

winner :: [Party] -> Party 
winner x = snd (last (results x))

--Alternative
rmempty :: Eq a => [[a]] -> [[a]] 
rmempty [] = []
rmempty (xs) = [x |x <- xs, not (null x)]

remove :: Eq a => a -> [[a]] -> [[a]]
remove y [] = []
remove y xs = map (filter(/=y)) xs

ballots :: [Ballot]
ballots = [["Red","Green"],
        ["Blue"],
        ["Green","Red","Blue"],
        ["Blue","Green","Red"],
        ["Green"]]

rank :: [Ballot] -> [Party]
rank = map snd . results . map head 

election :: [Ballot] -> Party
election bs = case rank (rmempty bs) of 
        [p] -> p -- say [p] is = 1 item, will therefore return p
        (p:ps) -> election (remove p bs) 
