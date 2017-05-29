# Advanced Functional Programming 

## Lecture 1 Sudoku

### Basic type declarations

```Haskell
type Grid     = Matrix Value
type Matrix a = [Row a]
type Row a    = [a]
type Value    = Char

-- Alternatively Grid could be defined as(Not optimal verbose is life)
type Grid     = [[Char]]
```
On the basic definitions we want to define all our types as we will be working with functions that will be taken those types as parameters.

### Basic definitions 
This can be seen as the init functions.

```Haskell
boxsize :: Int
boxsize = 3

values :: [Value]
values = [1..9]

empty :: Value -> Bool
empty = (== '.')

single :: [a] -> Bool 
single [_] = True
single  _  = Flase
```

#### Making a empty grid with sexy functions 
```Haskell
blank :: Grid
blank = replicate n(replicate n '.')
       where n = boxsize ^ 2
-- This makes an array of arrays based on box size square
```
#### Validator function 
```Haskell
valid :: Grid -> Bool
valid g = all nodeups (rows g) &&
         all nodeups (cols g) &&
         all nodeups (boxs g)
-- rows, cols and boxs check if one square is valid in a row a column and a box respectively
rows, cols, boxs :: Matrix a -> [Row a]
rows = id
cols = tranpose
boxs = unpack . map cols . pack
       where
         pack   = split . map split
         split  = chop boxsize
         unpack = map concat . concat
chop :: Int -> [a] -> [[a]]
chop n [] = []
chop n xs = take n xs : chop n (drop n xs)

nodeups :: Eq a => [a] -> Bool
nodeups []     = True
nodeups (x:xs) = not (elem x xs) && nodeups xs
```
## Lecture 2 More Sudoku

### Function composition not that hard so learn it and use it 
The dot(.) notation can be use to easily pass a function as a parameter of another function and create chained functions

```Haskell
solve :: Grid -> [Grid]
solve  = filter valid . collapse . choices
-- Both do the same but the first version is sexier arguments can be hidden because curry stuff
solve g = filter valid(collapse(choices g))
```

### Choices function
```Haskell
-- This uses the parametric type of Matrix to allow it to take not only a single value but also a list of values
type Choices = [Value]
choices :: Grid -> Matrix Choices
choices g = map(map choice) g
  where 
    choice v = 
      if v == '.' then
        [1..9]
      else
          [v]
```

### The solver definitions 
These are the functions that actually solve the puzzle

```Haskell
-- Cartesian product
cp :: [[a]] -> [[a]]
cp []       = [[]]
cp (xs:xss) = [y:ys | y <- xs, ys <- cp xss]
-- Optimization(lazy brute forcing)
collapse :: Matrix[a] -> [Matrix a]
collapse  = cp . map cp
-- This is the same as
-- collapse g = cp(map cp g)
-- Apply cp to all inputs and then apply cp to the final result
```

### Optimizations
These optimizations will drastically improve the brute force algorithm by adding lazy evaluation(based on pre existing numbers on the grid)

```Haskell
lazySolver :: Grid -> [Grid]
lazySolver  = filter valid . collapse . prune . choice
--Still slow af fam
prune :: Matrix Choices -> Matrix Choices
prune  = pryneBy boxs . prubeBy cols . pruneBy roows
        where pruneBy f = f . map reduce . f
        --niiiiice code right there 
        
--removes the obivious cases(in case brute force worked)
recude :: Row Choices -> Row Choices
recude xss = [xs 'minux' singles | xs <- xss]
            where singles = concat (filter single xss)
minus :: Choices -> Choices -> Choices
xs 'minus' ys  = if single xs then xs else xs \\ ys
-- look at that next level pattern matching

-- Super lazy solver
llSolver :: Grid -> [Grid]
llSolver  = filter valid . collapse . fix . prune . choice
```


## Cw1 - Game A.I.

### Game trees:
To use a game tree you will need to define a maximum depth, and expand every single possible outcome.

1. Produce the game trees
2. Label each leaf with the winner or with B if the game is a draw
3. Work up the grid(By copying the child's classification to their parents)
4. Decide which is the best possible next step

### Checking
While checking for winners make one check row function and reapply that to matrix operations of the same board.

# A simple evaluator
This is a simple evaluator which evaluates expressions with a division operator. This is done recursively and uses the Maybe monad to achieve error checking(for division on 0)

```Haskell
--Simple div evaluator
data Expr = Val Int | Div Expr Expr

eval :: Expr -> Maybe Int
eval(Val n) = Just n
eval(Div x y) = 
  case eval n of
    Nothing -> Nothing
    Just n -> case eval y of
      Nothing -> Nothing
      Just m -> safediv n m

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv n m = Just(x 'Div' y)

--More error checking with fancy stuff
--I will call this fancy error propagating monad(aka bind), this evaluates Maybe types and only follows with it in the case of a successful result
--(>>=)
eval(Val n) = Just n
eval(Div x y) = eval x >>= (\n)
                eval y >>= (\m)
-- Now the op thing is that is applied automatically to do notation. Now watch this
eval :: Expr -> Maybe Int
eval(Val n) = Just n
eval(Div x y) = do n <- eval x 
                   m <- eval y
                   safediv n m
```

# Exam revision 

## Defining a Monad

A monad is a parameterised type that supports the return and >>= *bind* functionsit can be defined as follows

```Haskell
class Monad m where
  return :: a -> m a
  (>>=)  :: m a -> (a -> mb) -> m b
```

### Example of the Maybe monad

```Haskell
instance Monad Maybe where
  return  :: a -> Maybe a
  return x = Just x

  (>>=) ::  Maybe a -> (a -> Maybe b) -> Maybe b
  Nothing >>= f  = Nothing
  (Just x) >>= f = f x
```

## The bind function

The bind function allows us to apply functions to our monadic values in such a way that allows us to skip exception handling as all will be handled by the recursive binding itself. One major example of this is the following.

Assume we have the following code for a simple evaluator.

```Haskell
data Expr = Val Int | Add Expr Expr

eval           :: Expr -> Maybe Int
eval (Val n)    = if n == 0 then nothing else Just n
eval (Add x y)  = case eval x of
                    Nothing -> Nothing
                    Just n  -> case eval y of
                      Nothing -> Nothing
                      Juxt m  -> Just (n+m)
```

As you can see this code will handle expceptions. However it is quite complicated and long. This makes it error prone as well as hard to read and therefore maintain. To improve this we can use the bind operator to abstract our error handling.

```Haskell
data Expr = Val Int | Add Expr Expr

eval           :: Expr -> Maybe Int
eval (Val n)    = if n == 0 then nothing else Just n
eval (Add x y)  = eval x >>= (\n ->
                  eval y >>= (\m ->
                  return n + m))
```

This code is already much shorter and will handle the same expceptions with no problems. However we can take this a step further by using the <- which simply takes the bind operator and puts it in a much nicer syntax.

```Haskell
data Expr = Val Int | Add Expr Expr

eval           :: Expr -> Maybe Int
eval (Val n)    = if n == 0 then nothing else Just n
-- Pay attention to the do block
eval (Add x y)  = do
                    n <- eval x
                    m <- eval y
                    return (x+y)

```

## Monadic laws

All Monads apart from having the two basic functions *return* and *(>>=)* also must follow 3 simple rules. These are the following.

1. Left Identity `return a >>= f = f a`
2. Right Identity `m a >>= return = m a`
3. Associativity `(m >>= f) >>= g = m >>= (\x -> f x >>= g)`

## Proof

He is the inductive proof for these laws all based on the Maybe Monad.

1. Left Identity

```Haskell
P(Maybe a)
return Maybe a >>= f
= {applying return}
Just a >>= f
= {applying bind}
f a
```

2. Right Identity

```Haskell
P(Nothing)
Nothing >>= return
={Applying bind}
return Nothing
={Applying return}
Nothing

Just x >>= return
={Applying bind}
return Just x
={Applying return}
Just x
```

3. Associativity

```Haskell
P(Nothing)
(Nothing >>= f) >>= g
={Applying bind}
Nothing >>= g
={Applying bind}
Nothing
={Unapplying bind}
Nothing >>= (\x -> f x)
={Unapplying bind}
Nothing >>= (\x -> f x >>= g)

P(Just x)
(Just x >>= f) >>= g
={Applying bind}
f x >>= g
={Applying bind}
f . g x
={Unapplying bind}
Just x >>= (\x -> f x)
={Unapplying bind}
Just x >>= (\x -> f x >>= g)
```

### Why Monad laws?

Monad laws allow for a couple of benefits, they can be use to prove propreties in monads. They can also be sued to optimise monadic rules. They also underpi the use of the do notation, which allows for more concise programs which take full advantage of functions such as bind(>>=).

## Term monad example

Here is an exmaple of a monad defined through terms in a mathematical equation.

```Haskell
-- Given the following
data Term a = Val int | Var a | Add (Term a) (Term a)

instance Monad Term where
  return  :: a -> Term a
  return a = Var a

  (>>=)         :: Term -> a -> (a -> Term b) -> Term b
  (Val n) >>= f   = f n
  --This is infered
  (Var n) >>= f   = Val n
  (Add x y) >>= f = Add (x>>=f) (y>>=f)
```

## The state Monad

If we have a  type as follows

```Haskell
type State = Int
--newtype is used with the S dummy constructor as for Monad implementation
newtype ST a = S (State -> (a,State))
```

We can define this as a Monad. Firstival we need to declare the default moandic functions.

```Haskell
instance Monad ST where
  return   :: a -> (State->(a, State))
  return x = S (\s -> (x,s))
  (>>=)    :: ST a -> (a -> ST b) -> ST b
  --Wut?
  st >>= f = S (\s -> let (x,s') = app st s in app (f x) s')
```
