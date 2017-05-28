main = putStrLn "Hello"
-- This example shows a simple expression evaluator as well as how do blocks can hide bind operations 'syntatic sugar'
data Expr =  Val Int | Add Expr Expr | Div Expr Expr


safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv x y = Just (x `div` y)

eval:: Expr -> Maybe Int
eval (Val n)  = return(n)
eval (Add l r)= do x <- eval l
                   y <- eval r
                   return(x + y)
eval (Div l r)= do x <- eval l
                   y <- eval r
                   x `safediv` y


