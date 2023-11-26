// 3.	Write a program to print message from child process and parent process in time sharing environment.

#include <stdio.h>
#include <unistd.h>

int main()
{
    int pid = fork();
    if (pid > 0)
    {
        printf("I am parent process\n");
        printf("Process id: %d\n", getpid());
        printf("Parent process id: %d\n", getppid());
    }
    else if (pid == 0)
    {
        printf("I am child process\n")
        printf("Process id: %d\n", getpid());
        printf("Parent process id: %d\n", getppid());
    }
    else
    {
        printf("Fork failed\n");
        return 1;
    }
    return 0;
}
