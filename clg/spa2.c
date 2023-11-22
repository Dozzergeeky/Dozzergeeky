// 2.	Write a program to create a duplicate child process using fork() system call.

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
int main()
{
    pid_t child_pid;
    printf("Before fork()\n");
    child_pid = fork();

    if (child_pid == -1)
    {
        printf("Fork failed\n");
        return 1;
    }
    else if (child_pid == 0)
    {
        printf("I am child process\n");
        printf("Process id: %d\n", getpid());
        printf("Parent process id: %d\n", getppid());
    }
    else
    {
        printf("I am parent process\n");
        printf("Process id: %d\n", getpid());
        printf("Parent process id: %d\n", getppid());
    }
    printf("After fork()\n");
    return 0;
}
