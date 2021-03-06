# Data structures

A data structure is a form of storing data in an organised manner to improve efficiency and control of this data. The simplest example of a data structure is an Array. It stores data in a continuous block of memory. And on low level languages like C does very little to optimise its operations.


## Abstract data structures

An Abstract data structure is the concept of a data structure without its actual implementation. It is important to think of these as abstract because the implementation of these structures can vary. If we take a look at the array example. In C an array is a block of memory of a fixed size, that holds no metadata. But on languages such as JavaScript arrays hold metadata such as it's size as well as it allows for dynamically increase of decrease the size of this array through different methods. Although both are considered arrays as on the abstract sense they both store information in a sequence they are very different in terms of efficiency and usage.

Apart from efficiency the major advantage of data structures is the fact that we are able to implement methods on top of theses data structures. As I mentioned Arrays can have methods such as Push and Pop in higher level languages allowing for manipulating with a much easier syntax. This can also translate in error checking, as for example a data structure designed to take only numbers can throw an error if a the user tries to add a letter to it.

## Concrete data types

This is the actual implementation of your data structure, the point of this is that a concrete data type will hide or encapsulate all the login inside the structure. In other words the user of the CDT does not have to worry about what is going on in the background as it will simply use whatever features are available to him.

To make a concrete data type it should be relatively simple, you just apply the ideas of an ADT in whatever language you are planning to use. However some ADT's will come with requirements, such as a PUSH operation(add element to back of the array) must be $O(n)$. This guarantees that the CDT will have the efficiency benefits desired by the ADT

### Implementation

In many programming languages there are features which are basically designed for abstract data structures. One example of this is Java's interface. Interfaces allow you to create a class which cannot be instanciated, that means you will not be able to create an Interface object, but you will be able to create an object which extends that interface. Here is some code example

```Java
public interface ADT {
	public int f1(); // no implementation!!
	…
}
public Vector implements ADT {
	public int f1() { return 99; } // (dummy) implementation
}
```

### Why?

The whole reason we have abstract data structures is so we can theorise about very complex but efficient ways of handling data without having to care about implementation. For example defining an ADT for an array which also stores it's length sounds very simple at first but it brings huge benefits as it allows certain operations such as finding the last object, finding the middle object, and even pushing an element to the end to all become $O(1)$ where before they would be $O(n)$

## And here is a bunch of examples you probably need to know 

# Stack ADT

A stack is and ADT that stores references to objects(Pointers),
insertions and deletions work as LIFO(last in first out). Imagine it as a pile of documents on a stack. The last document put on the stack will be the first one you will read.

**Methods** 
```Java
Object push(Object obj){
	//Inserts element
}
Object pop(){
	//Removes and returns the last added object
}
```
**Auxiliary methods also consist in**

| Method | Description     |
| :------------- | :------------- |
| top()       | returns last inserted element |
| size()      | returns size of the stack   |
| isEmpty()   | returns bool true if stack is empty   |

Simple Java implementation

```Java
public interface Stack {
	public void push(Object o);
	public Object pop() throws EmptyStackException;
	public Object top() throws EmptyStackException;
	public int size();
	public boolean isEmpty();
}
```
> Take in consideration exceptions will occur as that is one of the advantages of having an adt.

#### Applications 
1. Browser History
2. Undo commands
3. Chain of method calls for VMS(JVM)

# Queue ADT

The queue ADT is very similar to the stack, however we have a FIFO(first in first out system) for the removal of elements.

**Methods**

```Java
Object enqueue(Object obj){
    //Inserts element
}
Object dequeue(){
    //Removes and returns the oldest object
}
```

**Auxiliary methods also consist in**

| Method | Description     |
| :------------- | :------------- |
| front()       | returns oldest element |
| size()      | returns size of the queue   |
| isEmpty()   | returns bool true if queue is empty   |

### Implementation
```Java
public interface Queue {
	public int size();
	public boolean isEmpty();
	public Object front() throws EmptyQueueException;
	public void enqueue(Object o);
	public Object dequeue() throws EmptyQueueException;
}
```

## Why use a queue?

A queue offers advantages when it comes to performance and abstraction, queue operations can be optimised in different ways. For example instead of adding the shifting elements to the front of the array when one element is removed we can remove that object, and keep the back of the array just shifting the *front()* pointer for example. This allows dequeueing to become $O(1)$ instead $O(n)$

Another big advantage is the ability to limit the size of the queue and apply a round robin approach to maximise the efficiency of operations while keeping the same size of the container class.

>Fun fact use linked lists and booom mad efficiency bruf.

# Vector ADT

It is a dynamic array.

A vector stores the size of the array as well as an array. Storing the size will allow us to relloc memory this way allowing us to resize the array. However the resize operation is costly and should be taken in consideration when and how often it is going to be done. Resizing has complexity of $O(n)$. However space complexity also should be taken in consideration.

# Heap

A heap is an implementation of priority queues represented by a binary tree. Storing key value pairs. Maintaining order on a tree like structure, such as in a linked list, works fairly well. Shifting is never necessary as it is done as a side effect of changing a reference pointer properly. This means that a heap can easily maintain a nice structure with some sort of order. Therefore maintaining a sorted heap can be more efficient than a simple priority queue.


# Trees