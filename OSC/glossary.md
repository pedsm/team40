<<<<<<< HEAD
# Glossary

## File systems
 - Disks:
 	- Cylinders: Collection of tracks
	- Tracks: Concentric circle on single side
	- Sectors: Segment of a track
 - Cylinder Skew: an offset added to sector 0
 - Access time = seek time + rotational delay + transfer time
 - Seek time = Ts = n x m + s
  	- n = number of Tracks
	- m = crossing time per track
	- s start-up delay
 - Average rotational latency = half of disk rotation time
 - Transfer time: tt = b/N x ms per minute/rpm (data transferred per rotation)
 - Disk scheduling:
 	- FCFS
	- Shortest seek time first
	- (SCAN) Lift algorithm: Zig zags up and down
	- C-Scan; Up(reading) and straight down.
	- Look scan:
 - User views: define abstractions
 - Implementation view: define low level Implementation
 - In UNIX
	 - Character special files: used for IO devices such as keyboards and printers
	 - Block special files: Hard drives
 - File control blocks: only accessible on Kernel mode
 - Directed acyclic graph (DAG): Allow file sharing cycles are forbidden
 	- Dag allows for file sharing(aliases)
 	- Cycles can generate infinite loops
	- Removing files is complicated(links must be removed as well) : Garbage collection is required
 - Generic graph structure: Cycles are allowed here
 - Fat(file allocation table)
 - Log structured file systems(Inodes are next to their data this means that it is contiguous and faster to be read by a spinning hard drive)
 	- Require a cleaner thread
=======
#Glossary

**Concurrency** - Allowing programs to run at the same  without them causing conflicts.
**Kernel Mode** - Complete version of lower level OS - allows instructions for CPU
**CPU Basic Cycle** - CPU's follow the following basic cycle (always) 1) Fetching 2) decoding 3) executing

**Register** - Fast memory type close to CPU - limited in size
**Interrupt** - Temporary pause on a process - can be due to I/0 interrupts, errors or CPU clock waiting for other processes for multi-tasking
**Parallelism** - When you have two or more tasks running at the same time and they don't interrupt each other.
**Stack** - Static data that doesn't change in respect to the amount of memory that it requires- stays the same throughout the program - resolved at compile time.
**Heap** - Data that can change in memory length in a program e.g. dynamic arrays

**Context switching** - When the OS switches between multiple processes to generate parallelism 
**Time slice** - Length of time before context switching
**Response time** - Average of start times
**Turnaround Time** - Average of end times
**Predictability** - Predictable if processes have roughly the same amount of time before a context switch

**Program control block** - Kernel data structure with information needed for context switching. They include: *PID*, *process control information* (state for scheduling), *process state information* (stuff saved from context-switching).
**Long term process scheduler** - Used for high performance tasks such as multi-processing
**Medium term process scheduler** - Schedules process queues (doesn't impact order of ready queue)
**Short term process scheduler**  - Organises ready queue (order within process)
**Pre-emptive scheduler** - Scheduler that implements clock interrupts
**Non pre-emptive scheduler** - Only interrupts if the process forces it

**Multi-Level Feedback Queue** - Name given to windows 7 scheduler. Has dynamic priorities which means if a process is taking too long, the priority will decrease. Called *variable* if dynamic, *real-time* for static time e.g. kernel tasks.

**Relative thread priority** - When different threads are given different priorities

**Target latency** - The necessary amount of time needed to run every process at least once. 

**Time slice** - *Target Latency* divided by the total number of processes- linux uses this to decide how much time to allocate for a process

**Minimum time slice** - Set by linux so that too much context switching does not take place - improves turnaround time


**Multi process scheduling** - Scheduler which also defines which core to execute the processes

**Single level queue** - when each core has its own queue - reduces context switching because same cache is used every time

**Load balancing** - When all CPU cores are equally being used - can be ensured by swapping processes from a busy core to a non busy core

**Multi level queue** - When all cores share one big queue - processes lose cached data when swapping to another core which makes it slower

**Critical Sections** - Safeguarded areas of code which can't be run in multiple threads simultaneously

**Race Conditions** - When multiple threads access shared data and results are different depending on when the thread accesses the data

**Mutual exclusion** - Used to solve race conditions - ensures only one process accesses critical section at a time

**Mutex** - Uses boolean to enforce mutual exclusion

**Semaphore** - Uses a number to enforce mutual exclusion

**Deadlocks** When two processes are stuck waiting for each other in an infinite loop

**Starvation** - When a process is treated unfairly and may never receive CPU time


**Mono-programming** - One single partition for all user processes - one process being fulfilled at any time - no address translation 

**Overlays** - hack in mono programming to allow programmer to use more memory than actually available

**Swapping** - Swapping a process out to the disk and loading a new one - can be done in mono programming but takes time - can be used as a play to reallocate memory e.g. put process in a larger or smaller partition

**Fixed partition of equal size** - splitting main memory into static, contiguous and equal sized partitions (chunks)

**Internal fragmentation** - process not using all the partition therefore wasting memory - very common with fixed partitions of equal sizes

**fixed partition of non-equal size** - Fixed sizes but non equal e.g. 3M, 4M, 5M, 6M, 7M. Reduces *internal fragmentation*.

**One process queue per partition** - queue of processes for each partition- first come first served - some partitions could become very busy

**Single queue** - Processes partitions are decided on the go - increases internal fragmentation is more likely

**logical address** - Address given to item at compile time.

**Relocation** - translating logical address into physical address

**Protection** - enforced if you have two or more programs running at the same time

**MMU** - Memory Management Unit

**Offset** - distance from the beginning of array to end of process

**Static relocation** - yolo approach done at compile time

**Dynamic relocation** - uses offset for translation - can be done at *load time* or *load time*- run time is fastest

**Base-register** - stores start address of partition - physical address generated by adding logical address to this base-register,

**Limit Register** - Stores required size for partition - is compared once in physical memory - acts as *protection*

**Dynamic partitioning** - Dynamically assigns a variable number of partitions - still contiguous in memory - no internal fragmentation -exact memory not known in advanced because heap can still grow- good to allocate a bit extra space because of this

**External fragmentation** - when things like swapping create holes - can be too large or too small

**Compacting memory** - merging free slots when things like external fragmentation occurs

**Allocation structures** - Keeps track of available memory - uses linked lists or bitmaps

**linked lists** - contains flag for whether or not its free and links free nodes together which makes it faster to find a free block- also stores offset and start address 

**bitmaps** - splits up physical memory into blocks - assigns binary number for whether or not this block is free. - can potentially be slow to process depending on how small blocks are - causes internal fragmentation - process of actually filling a hole is easier because just need to change number

**first fit** - goes along list seeing if enough free space is present for a process and then splits - idea of buddy system - calls gg after it thinks its done its job

**next fit** - same as first fit but restarts at same place for next search- worse than first fit overall

**best fit** - searches entire list every time to find the smallest hole - lots of external fragmentation


>>>>>>> 3ecbd515af358a001efdf5dcbcc29d0b6b311dab
