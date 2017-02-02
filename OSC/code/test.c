#include <stdio.h>

int iVar = 0;
int main(int argc, char *argv[])
{
    int i = 0;
    while(i<10)
    {
        iVar++;
        printf("Adress %p Value: %d\n", &iVar, iVar);
        i++;
    }
    return 0;
}
