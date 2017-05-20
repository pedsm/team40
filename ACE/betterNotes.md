# ACE

Jonny if you are reading this I am sorry but your notes are garbage so I am starting new ones.

# Algorithms basics
## Get ready to RUMBLE!!

![Mad algorithms](https://media.giphy.com/media/3o6Yg4GUVgIUg3bf7W/giphy.gif?response_id=59205e40e56f576c41a930ab)

Analysing dem algorithms. Alright an algorithm is simple give it an input and you get an output in a **finite** amount of time.

Alright we gucci knowing it is finite, but how long is it actually. That is pretty important, This isn't python it has to be fast. To measure the *running time* of an algorithm we always take in consideration the size of the input. Logically the more information it has to process the longer it is going to take.
![Lol python](https://media.giphy.com/media/ILmqMop0Q0xsQ/giphy.gif?response_id=59205caacc0846a83eca96ea)

Usually the algorithm will have different times based on the same input size, because of this we will usually take in consideration the worse case scenario because determining the average is quite hard. 

### Getting results 

Now you probably think we get an algorithm and do some insane maths to get values right? Well no we are computer scientists and we are lazy, we just make the program run a bunch of times with different size inputs and we put that all in our google drive spreadsheet. Then we grab that data and use tensor flow to find a function that fits(or the excel match the dots feature if you are boring).

![Tensorflow boyz](https://media.giphy.com/media/rfPnhoMtbeuwE/giphy.gif?response_id=59205f6d7a531425b6668040)

### Problems with experiments

The major problem with experiments is that you actually need to write the code for it and that takes time. While ideally we want to be able to look at some ideas for algorithms and be able to see which one is better before having to write code for every single one. With experiments we also need to guess what inputs are going to be given.

Let's say we make a calculator, we can't know what kind of operations are going to be done with more frequency, maybe our algorithm is very good at multiplication but our calculator code might be doing 10 times more divisions than multiplications when it actually gets implemented.

Another key thing to take in consideration is that different hardware will have different performance and therefore you must do all experiments in the same machine with the same amount of background processes for example. Ideally these will be ran on a fresh system.


### What about theoretical results.

Theoretical results are mostly bad for a series of reasons, most of them are the same as with experimentation. The only real benefit of this, is the fact that we are able to do calculations without the need of writing an implementation of the algorithm.

> “Never believe a theory until it has been 'confirmed’ by an experiment"

## Theoretical analysis

We look at some pseudo code and find all the problems with it pretty much. This is done all in relation to input size **n**

### Pseudocode

A high level representation of an algorithm in a syntax free language('Basically python but faster')

> I am not explaining this because the whole point of Pseudocode is to be universal.

### The random access machine

>I bet you 1 quid it is not coming in the exam 


## Big O and friends

![Lol what is this](https://media.giphy.com/media/LgB2sFodXQbAI/giphy.gif?response_id=59206612d0094723df4ed2da)

Alrith get ready for like 20% of this course *spoiler alert* the other 80% is [trees](https://reddit.com/r/trees)

Big O notation is a way of representing how the *average* runtime of an algorithm changes in relation to the input size. **Boom** this should guarantee you 10% of the exam. 

### Calculating big O  

To calculate big O is quite simple, first you will need to find how many primitive operations occur in base of n. Let's say an algorithm has the following o(*operations*).

\[o =  5 \log_2 n + 2\]

First we remove all terms that are not related to n, because we want to find how the runtime changes in relation to n and not the actual runtime(*don't ask me why becuase I think this is dumb as well*)

\[5 \log_2 n\]

Again we will now remove the 5 as it will stay constant regardless of the value of n. And finally we arrive to find the actual *time complexity* fancy word for what big O represents. We can also remove the base of the log function as that is also constant.

\[o \in O(\log n)\]

> Learn this because for some reason it is incredibly important 

### Big O
Grows at most as fast as
\[f(n) \text{ is } O(g(n)) \] 
And 
\[f(n) \leq c g(n) \text{ for all } n \geq n_{0} \]

### Big $\Omega$
Grows at least as fast as
\[f(n) \text{ is } \Omega(g(n)) \] 
And 
\[f(n) \geq c g(n) \text{ for all } n \geq n_{0} \]

### Big $\Theta$
Big O + Big $\Omega$
\[f(n) \text{ is } \Theta(g(n)) \] 
And 
\[f(n) \geq c' g(n) \]
\[f(n) \leq c'' g(n) \]
\[\text{ for all } n \geq n_{0} \]

## The 7 deadly functions
Here is the list of the most important functions you must take in consideration while talking about big O. Also draw these so you are fully understand them. This list go from best to worse.
![Mad exponential growth](https://media.giphy.com/media/3oKIPpFhwsMNrRIjN6/giphy.gif)

1. Constant      = 1
2. Logarithmic   = $\log n$
3. Linear        = $n$
4. n Log n       = $n\log n$
5. Quadratic     = $n^2$
6. Cubic         = $n^3$
7. Exponential   = $2^n$ 

# Data structures
