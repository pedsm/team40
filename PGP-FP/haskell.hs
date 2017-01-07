import Data.List 
import Data.Ord
type Party = String
type Ballot = [Party]

--1
count :: Eq a => a -> [a] -> Int
count x = length . filter(==x)

--2
rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : rmdups (filter(/= x) xs) 

--3
frequency :: Eq a => [a] -> [(Int, a)]
frequency xs = [(count y xs, y) | y <- rmdups xs] 

--4
results :: [Party] -> [(Int,Party)]
results  = sort . frequency 

votes :: [Party]
votes = ["Red","Blue","Green","Blue","Blue","Red"]

--5
winner :: [Party] -> Party
winner = snd . last . results


--6
rmempty :: Eq a => [[a]] -> [[a]] --high order function
rmempty [] = []
rmempty (xs) = [x |x <- xs, not (null x)]

--7
remove :: Eq a => a -> [[a]] -> [[a]]
remove y [] = []
remove y xs = map (filter(/=y)) xs

ballots :: [Ballot]
ballots = [["Red","Green"],
        ["Blue"],
        ["Green","Red","Blue"],
        ["Blue","Green","Red"],
        ["Green"]]

--8
rank :: [Ballot] -> [Party]
rank = map snd . results . map head


--9
election :: [Ballot] -> Party
election bs = case rank (rmempty bs) of -- case looks at all items in a list
        [p] -> p -- say [p] is = 1 item, will therefore return p
        (p:ps) -> election (remove p bs) 