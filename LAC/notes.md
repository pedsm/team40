# Language and computation notes

## Lecture 3 - Non-deterministic Finite Automata
		
Example: Construct DFA over $\sum ={0,1}$ accepting all works were penultimate symbol is 1 

Maybe:
 - q0 initial state
 - q1 initial Last symbol is 1
 - q2 penultimate seen symbol is 1

We define

```Haskell
-> (0,1) -> q0 (1) -> q1 (0,1) -> q2
```

| Step| Input     | State 1 | State 2 | State 3|
| :-- | :-------- | -----   | ------  | ------ |
|  0  | 0         |   x     |         |        |
|  1  | 1         |   x     |   x     |        |
|  2  | 1         |   x     |   x     |   x    |
|  3  | 0         |   x     |         |   x    |
|  4  | 0         |   x     |         |        |

## Defining the achine

A NFA N = {Q,$\sum$,$\delta$, S, F} where

- Q: Finite set of states
- $\sum$ : Alphabet
- $\delta$ : Transitional function $\delta \in Q . \sum -> P(a)$
