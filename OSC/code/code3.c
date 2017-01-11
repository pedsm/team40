#include <stdio.h>
#include <stdlib.h>

int main()
{
	/*Lets start by creating two values these two are Ints and therefore
	go in the stack because their size will never be bigger than sizeof(int)
	they might change but never stop being an int */
	int value = 104;
	int value2 = 125;
	printf("The two are in the stack at positions:\n%p and \n%p \n", &value, &value2);
	printf("Position difference = %d \n", (int)(&value2 -  &value));
	/*You can see that they are about in the same position with a difference
	 = sizeof(int) Now i am defining a pointer with malloc this is different
	because I am using malloc I am telling it to have a size of 1 int but I
	could tell it to have the size of 100 ints in the case of an array.*/
	int *p = (int *) malloc(sizeof(int));
	printf("The pointer is at position:%p\n", p);
	printf("Position difference = %d \n", (int)(&value2 - p));
	/*With this you will be able to see that the difference between the
	stack elements are constant because they are always placed in the same
	spot. While the distance between that and the pointer is always changing
	because the heap is a lot more dynamic*/
	return 0;
}
