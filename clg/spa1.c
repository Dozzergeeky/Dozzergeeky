// 1.	Write a program to print the process id and parent process id.
#include <stdio.h>
#include <unistd.h>
int main(){
    printf("Process id: %d\n", getpid());
    printf("Parent process id: %d\n", getppid());
    return 0;
}
