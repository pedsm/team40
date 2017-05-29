#include "stdio.h"
#include "stdbool.h"
#define len(a) sizeof(a)/sizeof(a[0])
#define seg printf("Hello seg\n");

void print(int *arr,int len){
    printf("[");
    for(int i =0; i < len;i++)
        printf(" %d ",arr[i]);
    printf("]\n");
}
void swap(int* a, int* b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}
void sortCollision(int *arr, int len, int collision,int pivot){
    int tmp = arr[pivot];
    for(int i = pivot+1; i >= collision; i--){
        arr[i] = arr[i-1];
    }
    arr[collision-1] = tmp;
}

void sort(int *arr, int len){
    int lp = 0;  
    int rp = len-1;  
    int pivot = len/2;
    //no need to sort I think;
    if(len == 2){
        if(arr[0] > arr[1])
            swap(&arr[0],&arr[1]);
        return;
    }
    if(len < 2)
        return ;
    printf("Sorting pivot is %d\n",arr[pivot]);
    print(arr, len);

    while(lp <= rp){
        if(lp == pivot){
            //Skip the pivot
            lp++;
            continue;
        }

        if(arr[lp] >= arr[pivot]){
            //swap should occur
            bool swapped = false;
            while(rp > lp){
                /* printf("lp at %d rp at %d\n",arr[lp],arr[rp]); */
                if(rp == pivot){
                    //Skip the pivot
                    rp--;
                    continue;
                }
                if(arr[rp] < arr[pivot]){
                    //swap should occur
                    /* printf("Swapping\n"); */
                    swap(&arr[lp],&arr[rp]);
                    swapped = true;
                    break;
                }
                rp--;
            }
            if(!swapped){
                swap(&arr[lp],&arr[pivot]);
                pivot = lp;
            }
        }
        lp++;
    }
    printf("Collision at %d\n",lp);
    print(arr, len);
    sortCollision(arr,len,lp, pivot);
    printf("Sorted as \n");
    print(arr, len);
    sort(&arr[0],lp-1);
    sort(&arr[lp],len-lp);
    printf("Done\n");
}

int main()
{
    int arr[1000];
    for (int i = 0; i < len(arr); i++) {
        arr[i] = rand()%len(arr);
    }
    /* int arr[3] = {1,2,1}; */
    print(arr, len(arr));
    sort(arr, len(arr));
    print(arr, len(arr));
}
