# ACE

Jonny if you are reading this I am sorry but your notes are garbage so I am starting new ones.

## Lecture 1 - Get ready to RUMBLE!!

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
