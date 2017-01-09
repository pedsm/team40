#include <stdio.h>
int iVar = 0;
void main() {
    int i = 0;
    while(i < 10) {
        iVar++;
        /* sleep(2); */
        printf("Address:%d; Value:%d\n",&iVar, iVar);
        i++;
    }
}
