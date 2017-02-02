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
nodeups :: Eq a => [a] -> Bool
nodeups []     = True
nodeups (x:xs) = not (elem x xs) && nodeups xs
```