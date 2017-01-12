## Lecture 13: Memory Management

This lecture contains:

- Introduction to memory management
- **Modelling** of multi-programming
- Memory management based on **fixed partitioning** 

### Memory Hierarchies

There are several different types of computer memory, and these can be arranged into a hierarchy. This hierarchy and the reasons behind it influence how memory is managed in a system. Here is a detailed view of the hierarchy (don't need to memorise).

![Memory Hierarchy](img/memoryHierarchy.png)

- **Registers** and **cache** - These are fast because they are located close to the CPU. There are sub-levels of cache memory called L1, L2, L3. These have slightly increasing speeds.
- Main memory - This is basically **RAM**. Main memory isn't as fast because it takes a significant time for the CPU to access it. This time period is known as latency. 
- **Disks** - Includes things like Hard Drives. Used for important information. Is much *cheaper* than other types.

The operating system's job is to provide a memory abstraction. But how does it do this?

### OS Responsibilities

- The OS needs to **allocate** memory, and then keep track of whether or not the memory is being used. If it is not being used, it must **deallocate** this memory. 
- It needs to *control access* when multiprogramming is applied. In other words it needs to prioritise certain tasks.
- It needs to be able to transparently move data from memory to disk and vice versa.

### Memory models

There are two models which approach memory allocation in different ways. They are:

1. **Contiguous** memory management models
2. **Non-contiguous** memory management models

The easiest way to understand this is through a graphical example:

![Memory Models](img/memoryModels.png)
