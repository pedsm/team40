main :: IO()
main = print "hello"

type State = Int
newtype St a = S(State -> (a,State))

instance Functor St where
  fmap g st = S (\s -> let(x,s') = app st s in (g x, s'))
instance Applicative St where
  pure x = S (\s -> (x,s))
  stf <*> stx = S (\s ->
    let (f,s') = app stf s
        (x,s'')= app stx s' in (f x, s''))

instance Monad St where
  return v = S (\s -> (v, s))
  st >>= f = S (\s -> let (x,s') = app st s in app (f x) s')

app :: St a -> State -> (a, State)
app (S st) = st
-- app (S st) x = st x

fresh :: St Int
fresh =  S (\n -> (n,n+1))


-- replace :: [Int] -> Int -> ([Int],Int)
replace [] n     =  ([],n)
replace (x:xs) n = if x == 0 then
                      let (xs', n') = replace xs (n+1) in (n:xs',n')
                   else
                      let (xs', n') = replace xs n     in (x:xs',n')

replace' :: [Int] -> St [Int]
replace' [] = return []
replace' (x:xs) = if x == 0 then
                    do x' <- fresh
                       xs'<- replace' xs
                       return(x':xs')
                 else
                    do xs' <- replace' xs
                       return(x:xs')

delete y (x:xs) = if y == x then
                     xs
                  else
                     x:(delete y xs)
perms :: [Int] -> [[Int]]
perms [] = [[]]
perms xs = [x:ys | x <- xs, ys <- perms (delete x xs)]

split xs = [(take n xs, drop n xs) | n <- [1..(length xs-1)] ]

data Expr = Val Int | App Op Expr Expr
data Op   = Add | Mul

exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs xs = [App o l r | (ls,rs) <- split xs
                    , l <- exprs ls
                    , r <- exprs rs
                    , o <- [Add,Mul]]



-- exprs ns  =	[App o l r | (ls,rs) <- split ns
--                   , l	     <- exprs ls
--                   , r	     <- exprs rs
--                   , o	     <- [Add,Mul]]
