#include <stdio.h>

void main()
{
	int iStatus;
	int iPID = fork();
	if(iPID < 0)
	{
		printf("fork error\n");
	}
	else if(iPID == 0)
	{
		printf("hello from child process\n");
		execl("/bin/ls", "ls", "-l", 0);
	}
	else if(iPID > 0)
	{
		waitpid(iPID, &iStatus, 0);
		printf("hello from parent process\n");
	}
}
