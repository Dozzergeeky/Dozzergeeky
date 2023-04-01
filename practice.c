//operations on array
#include "myfile.h"
#define MAX 50
// int n;
// int a[100];
// void create()
// {
//     int i;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
// }
// void insert()
// {
//     int i, pos, ele;
//     int n = sizeof(a)/sizeof(a[0]);
//     printf("Enter the position: ");
//     scanf("%d", &pos);
//     printf("Enter the element: ");
//     scanf("%d", &ele);
//     for(i=n-1; i>=pos; i--)
//         a[i+1] = a[i];
//     a[pos] = ele;
//     n++;

// }
// void display()
// {
//     int i;
//     n = sizeof(a)/sizeof(a[0]);
//     printf("The elements are: ");
//     for(i=0; i<n; i++)
//         printf("%d ", a[i]);

// }
// void delete()
// {
//     int i, pos;
//     printf("Enter the position: ");
//     scanf("%d", &pos);
//     for(i=pos; i<n; i++)
//         a[i] = a[i+1];
//     n--;
// }
// void main()
// {
//     int ch = 1;
//     while(ch)
//     {
//         printf("\n1. Create\n2. Insert\n3. Display\n4. Delete\n5. Exit\n");
//         printf("Enter your choice: ");
//         scanf("%d", &ch);
//         switch(ch)
//         {
//             case 1: create();
//                     break;
//             case 2: insert();
//                     break;
//             case 3: display();
//                     break;
//             case 4: delete();
//                     break;
//             case 5: exit(0);
//             default: printf("Invalid choice\n");
//         }
//     }
// }

// int stack[50], top,ch,n;
// void push()
// {
//     int ele;
//     if(top == n-1)
//         printf("Stack is full\n");
//     else
//     {
//         printf("Enter the element: ");
//         scanf("%d", &ele);
//         top++;
//         stack[top] = ele;
//     }
// }
// void pop()
// {
//     if(top == -1)
//         printf("Stack is empty\n");
//     else
//     {
//         printf("The popped element is %d ", stack[top]);
//         top--;
//     }
// }
// void display()
// {
//     int i;
//     if(top == -1)
//         printf("Stack is empty\n");
//     else
//     {
//         printf("The elements are: ");
//         for(i=top; i>=0; i--)
//             printf("%d ", stack[i]);
//     }
// }
// void main()
// {
//     top = -1;
//     printf("Enter the size of the stack: ");
//     scanf("%d", &n);
//     do
//     {
//         printf("\n1. Push\n2. Pop\n3. Display\n4. Exit\n");
//         printf("Enter your choice: ");
//         scanf("%d", &ch);
//         switch(ch)
//         {
//             case 1: push();
//                     break;
//             case 2: pop();
//                     break;
//             case 3: display();
//                     break;
//             case 4: exit(0);
//             default: printf("Invalid choice\n");
//         }
//     }
//     while(ch!=4);
    
// }

// int queue[MAX], front = -1, rear = -1, n;
// void enqueue()
// {
//     int ele;
//     if(rear == n-1)
//         printf("Queue is full\n");
//     else
//     {
//         printf("Enter the element: ");
//         scanf("%d", &ele);
//         rear++;
//         queue[rear] = ele;
//     }
// }
// void dequeue()
// {
//     if(front == rear)
//         printf("Queue is empty\n");
//     else
//     {
//         printf("The dequeued element is %d ", queue[front+1]);
//         front++;
//     }
// }
// void display()
// {
//     int i;
//     if(front == rear)
//         printf("Queue is empty\n");
//     else
//     {
//         printf("The elements are: ");
//         for(i=front+1; i<=rear; i++)
//             printf("%d ", queue[i]);
//     }
// }
// void delete()
// {
//     int i, pos;
//     printf("Enter the position: ");
//     scanf("%d", &pos);
//     for(i=pos; i<n; i++)
//         queue[i] = queue[i+1];
//     n--;
// }
// void main()
// {
//     int ch = 1;
//     printf("Enter the size of the queue: ");
//     scanf("%d", &n);
//     while(ch)
//     {
//         printf("\n1. Enqueue\n2. Dequeue\n3. Display\n4. Exit\n");
//         printf("Enter your choice: ");
//         scanf("%d", &ch);
//         switch(ch)
//         {
//             case 1: enqueue();
//                     break;
//             case 2: dequeue();
//                     break;
//             case 3: display();
//                     break;
//             case 4: exit(0);
//             default: printf("Invalid choice\n");
//         }
//     }
// }

//tower of hanoi
// void TOH(int n, char A, char B, char C)
// {
//     if(n>0)
//     {
//         TOH(n-1, A, C, B);
//         printf("Move from %c to %c \n", A, C);
//         TOH(n-1, B, A, C);
//     }
// }
// void main()
// {
//     int n;
//     printf("Enter the number of disks: ");
//     scanf("%d", &n);
//     TOH(n, 'A', 'B', 'C');
// }
//gcd using recursion
// int gcd(int a, int b)
// {
//     if(b == 0)
//         return a;
//     else
//         return gcd(b, a%b);
// }
// void main()
// {
//     int a, b;
//     printf("Enter the two numbers: ");
//     scanf("%d %d", &a, &b);
//     printf("The GCD is %d", gcd(a, b));
// }
//factorial using recursion
// int fact(int n)
// {
//     if(n == 0)
//         return 1;
//     else
//         return n*fact(n-1);
// }
// void main()
// {
//     int n;
//     printf("Enter the number: ");
//     scanf("%d", &n);
//     printf("The factorial is %d", fact(n));
// }
// fibonacci using recursion
// int fib(int n)
// {
//     if(n == 0)
//         return 0;
//     else if(n == 1)
//         return 1;
//     else
//         return fib(n-1) + fib(n-2);
// }
// void main()
// {
//     int n;
//     printf("Enter the number: ");
//     scanf("%d", &n);
//     printf("The fibonacci number is %d", fib(n));
// }

// linked list

// struct node
// {
//     int data;
//     struct node *next;
// }*head = NULL;
// void create()
// {
//     struct node *newnode, *temp;
//     int n;
//     printf("Enter the number of nodes: ");
//     scanf("%d", &n);
//     for(int i=0; i<n; i++)
//     {
//         newnode = (struct node*)malloc(sizeof(struct node));
//         printf("Enter the data: ");
//         scanf("%d", &newnode->data);
//         newnode->next = NULL;
//         if(head == NULL)
//             head = newnode;
//         else
//         {
//             temp = head;
//             while(temp->next != NULL)
//                 temp = temp->next;
//             temp->next = newnode;
//         }
//     }
// }
// void display()
// {
//     struct node *temp;
//     if(head == NULL)
//         printf("List is empty\n");
//     else
//     {
//         temp = head;
//         while(temp != NULL)
//         {
//             printf("%d ", temp->data);
//             temp = temp->next;
//         }
//     }
// }
// void insert_beg()
// {
//     struct node *newnode;
//     newnode = (struct node*)malloc(sizeof(struct node));
//     printf("Enter the data: ");
//     scanf("%d", &newnode->data);
//     newnode->next = head;
//     head = newnode;
// }
// void insert_end()
// {
//     struct node *newnode, *temp;
//     newnode = (struct node*)malloc(sizeof(struct node));
//     printf("Enter the data: ");
//     scanf("%d", &newnode->data);
//     newnode->next = NULL;
//     temp = head;
//     while(temp->next != NULL)
//         temp = temp->next;
//     temp->next = newnode;
// }
// void insert_pos()
// {
//     struct node *newnode, *temp;
//     int pos, i=1;
//     newnode = (struct node*)malloc(sizeof(struct node));
//     printf("Enter the data: ");
//     scanf("%d", &newnode->data);
//     printf("Enter the position: ");
//     scanf("%d", &pos);
//     temp = head;
//     while(i<pos-1)
//     {
//         temp = temp->next;
//         i++;
//     }
//     newnode->next = temp->next;
//     temp->next = newnode;
// }
// void delete_beg()
// {
//     struct node *temp;
//     temp = head;
//     head = head->next;
//     free(temp);
// }
// void delete_end()
// {
//     struct node *temp, *prev;
//     temp = head;
//     while(temp->next != NULL)
//     {
//         prev = temp;
//         temp = temp->next;
//     }
//     prev->next = NULL;
//     free(temp);
// }
// void delete_pos()
// {
//     struct node *temp, *prev;
//     int pos, i=1;
//     printf("Enter the position: ");
//     scanf("%d", &pos);
//     temp = head;
//     while(i<pos)
//     {
//         prev = temp;
//         temp = temp->next;
//         i++;
//     }
//     prev->next = temp->next;
//     free(temp);
// }
// void main()
// {
//     int ch = 1;
//     while(ch)
//     {
//         printf("\n1. Create\n2. Display\n3. Insert\n4. Delete\n5. Exit\n");
//         scanf("%d", &ch);
//         switch(ch)
//         {
//             case 1: create();
//                     break;
//             case 2: display();
//                     break;
//             case 3:
//                 printf("1) Insert at beginning\n 2) Insert at end \n 3)Insert at position\n");
//                 printf("Enter your choice: ");
//                 scanf("%d", &ch);
//                 switch(ch)
//                 {
//                     case 1: insert_beg();
//                             break;
//                     case 2: insert_end();
//                             break;
//                     case 3: insert_pos();
//                             break;
//                     default: printf("Invalid choice\n");
//                 }
//                 break;
//             case 4:
//                 printf("1) Delete at beginning\n 2) Delete at end \n 3)Delete at position\n");
//                 printf("Enter your choice: ");
//                 scanf("%d", &ch);
//                 switch(ch)
//                 {
//                     case 1: delete_beg();
//                             break;
//                     case 2: delete_end();
//                             break;
//                     case 3: delete_pos();
//                             break;
//                     default: printf("Invalid choice\n");
//                 }
//                 break;
//             case 5: exit(0);
//             default: printf("Invalid choice\n");
//         }
//     }
// }

// insertion sort
// void insertion_sort(int a[], int n)
// {
//     int i, j, temp;
//     for(i=1; i<n; i++)
//     {
//         temp = a[i];
//         j = i-1;
//         while(j>=0 && a[j]>temp)
//         {
//             a[j+1] = a[j];
//             j--;
//         }
//         a[j+1] = temp;
//     }
// }
// void main()
// {
//     int a[100], n, i;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
//     insertion_sort(a, n);
//     printf("The sorted array is: ");
//     for(i=0; i<n; i++)
//         printf("%d ", a[i]);
// }

// // selection sort
// void selection_sort(int a[], int n)
// {
//     int i, j, temp, min;
//     for(i=0; i<n-1; i++)
//     {
//         min = i;
//         for(j=i+1; j<n; j++)
//         {
//             if(a[j] < a[min])
//                 min = j;
//         }
//         temp = a[i];
//         a[i] = a[min];
//         a[min] = temp;
//     }
// }
// void main()
// {
//     int a[100], n, i;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
//     selection_sort(a, n);
//     printf("The sorted array is: ");
//     for(i=0; i<n; i++)
//         printf("%d ", a[i]);
// }

// // bubble sort
// void bubble_sort(int a[], int n)
// {
//     int i, j, temp;
//     for(i=0; i<n-1; i++)
//     {
//         for(j=0; j<n-i-1; j++)
//         {
//             if(a[j] > a[j+1])
//             {
//                 temp = a[j];
//                 a[j] = a[j+1];
//                 a[j+1] = temp;
//             }
//         }
//     }
// }
// void main()
// {
//     int a[100], n, i;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
//     bubble_sort(a, n);
//     printf("The sorted array is: ");
//     for(i=0; i<n; i++)
//         printf("%d ", a[i]);
// }

// // merge sort
// void merge(int a[], int l, int m, int r)
// {
//     int i, j, k, n1, n2;
//     n1 = m-l+1;
//     n2 = r-m;
//     int L[n1], R[n2];
//     for(i=0; i<n1; i++)
//         L[i] = a[l+i];
//     for(j=0; j<n2; j++)
//         R[j] = a[m+1+j];
//     i = 0;
//     j = 0;
//     k = l;
//     while(i<n1 && j<n2)
//     {
//         if(L[i] <= R[j])
//         {
//             a[k] = L[i];
//             i++;
//         }
//         else
//         {
//             a[k] = R[j];
//             j++;
//         }
//         k++;
//     }
//     while(i<n1)
//     {
//         a[k] = L[i];
//         i++;
//         k++;
//     }
//     while(j<n2)
//     {
//         a[k] = R[j];
//         j++;
//         k++;
//     }
// }
// void merge_sort(int a[], int l, int r)
// {
//     if(l<r)
//     {
//         int m = l+(r-l)/2;
//         merge_sort(a, l, m);
//         merge_sort(a, m+1, r);
//         merge(a, l, m, r);
//     }
// }
// void main()
// {
//     int a[100], n, i;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
//     merge_sort(a, 0, n-1);
//     printf("The sorted array is: ");
//     for(i=0; i<n; i++)
//         printf("%d ", a[i]);
// }

// // quick sort
// int partition(int a[], int l, int r)
// {
//     int i, j, temp, pivot;
//     pivot = a[r];
//     i = l-1;
//     for(j=l; j<r; j++)
//     {
//         if(a[j] <= pivot)
//         {
//             i++;
//             temp = a[i];
//             a[i] = a[j];
//             a[j] = temp;
//         }
//     }
//     temp = a[i+1];
//     a[i+1] = a[r];
//     a[r] = temp;
//     return i+1;
// }
// void quick_sort(int a[], int l, int r)
// {
//     if(l<r)
//     {
//         int p = partition(a, l, r);
//         quick_sort(a, l, p-1);
//         quick_sort(a, p+1, r);
//     }
// }
// void main()
// {
//     int a[100], n, i;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
//     quick_sort(a, 0, n-1);
//     printf("The sorted array is: ");
//     for(i=0; i<n; i++)
//         printf("%d ", a[i]);
// }

// // linear and binary search
// void linear_search(int a[], int n, int key)
// {
//     int i, flag = 0;
//     for(i=0; i<n; i++)
//     {
//         if(a[i] == key)
//         {
//             printf("The element is found at position %d", i+1);
//             flag = 1;
//             break;
//         }
//     }
//     if(flag == 0)
//         printf("The element is not found");
// }
// void binary_search(int a[], int n, int key)
// {
//     int l, r, m, flag = 0;
//     l = 0;
//     r = n-1;
//     while(l<=r)
//     {
//         m = l+(r-l)/2;
//         if(a[m] == key)
//         {
//             printf("The element is found at position %d", m+1);
//             flag = 1;
//             break;
//         }
//         else if(a[m] < key)
//             l = m+1;
//         else
//             r = m-1;
//     }
//     if(flag == 0)
//         printf("The element is not found");
// }
// void main()
// {
//     int a[100], n, i, key, ch;
//     printf("Enter the number of elements: ");
//     scanf("%d", &n);
//     printf("Enter the elements: ");
//     for(i=0; i<n; i++)
//         scanf("%d", &a[i]);
//     printf("Enter the element to be searched: ");
//     scanf("%d", &key);
//     printf("Enter 1 for linear search and 2 for binary search: ");
//     scanf("%d", &ch);
//     switch(ch)
//     {
//         case 1: linear_search(a, n, key);
//                 break;
//         case 2: binary_search(a, n, key);
//                 break;
//         default: printf("Invalid choice");
//     }
//}

// // circular ll
// struct node
// {
//     int data;
//     struct node *next;
// };
// struct node *head = NULL;
// void create(int x)
// {
//     struct node *temp = (struct node*)malloc(sizeof(struct node));
//     temp->data = x;
//     temp->next = head;
//     head = temp;
// }
// void display()
// {
//     struct node *temp;
//     temp = head;
//     while(temp->next != head)
//     {
//         printf("%d ", temp->data);
//         temp = temp->next;
//     }
//     printf("%d ", temp->data);
// }
// void insert_beg(int x)
// {
//     struct node *temp = (struct node*)malloc(sizeof(struct node));
//     temp->data = x;
//     temp->next = head;
//     head = temp;
// }
// void insert_end(int x)
// {
//     struct node *temp = (struct node*)malloc(sizeof(struct node));
//     temp->data = x;
//     temp->next = head;
//     struct node *temp1 = head;
//     while(temp1->next != head)
//         temp1 = temp1->next;
//     temp1->next = temp;
// }
// void insert_pos(int x, int pos)
// {
//     struct node *temp = (struct node*)malloc(sizeof(struct node));
//     temp->data = x;
//     temp->next = head;
//     struct node *temp1 = head;
//     int i;
//     for(i=0; i<pos-2; i++)
//         temp1 = temp1->next;
//     temp->next = temp1->next;
//     temp1->next = temp;
// }
// void delete_beg()
// {
//     struct node *temp = head;
//     head = head->next;
//     free(temp);
// }
// void delete_end()
// {
//     struct node *temp = head;
//     while(temp->next->next != head)
//         temp = temp->next;
//     free(temp->next);
//     temp->next = head;
// }
// void delete_pos(int pos)
// {
//     struct node *temp = head;
//     int i;
//     for(i=0; i<pos-2; i++)
//         temp = temp->next;
//     struct node *temp1 = temp->next;
//     temp->next = temp1->next;
//     free(temp1);
// }
// void main()
// {
//     int ch, x, pos;
//     do
//     {
//         printf("\n1) create\n2) display\n 3) insert \n4)  delete \n5) exit \n");
//         scanf("%d", &ch);
//         switch(ch)
//         {
//             case 1: printf("Enter the element: ");
//                     scanf("%d", &x);
//                     create(x);
//                     break;
//             case 2: display();
//                     break;
//             case 3: printf("Enter the element: ");
//                     scanf("%d", &x);
//                     printf("Enter the position: ");
//                     scanf("%d", &pos);
//                     if(pos == 1)
//                         insert_beg(x);
//                     else if(pos == 2)
//                         insert_end(x);
//                     else
//                         insert_pos(x, pos);
//                     break;
//             case 4: printf("Enter the position: ");
//                     scanf("%d", &pos);
//                     if(pos == 1)
//                         delete_beg();
//                     else if(pos == 2)
//                         delete_end();
//                     else
//                         delete_pos(pos);
//                     break;
//             case 5: exit(0);
//             default: printf("Invalid choice");
//         }
//     }while(ch != 5);
// }

//doubly linked list
// struct node
// {
//     int data;
//     struct node *prev;
//     struct node *next;
// };
// struct node *start,*current;
// void create_list(void)
// {
//     start=(struct node *)malloc(sizeof(struct node));
//     if(start==NULL)
//     {
//         printf("\nMemory allocation failed");
//         exit(0);
//     }
//     else
//     {
//         printf("\nEnter data for node: ");
//         scanf("%d",&start->data);
//         start->prev=NULL;
//         start->next=NULL;
//         current=start;
//     }
// }
// void insert_beg(void)
// {
//     struct node *temp;
//     temp=(struct node *)malloc(sizeof(struct node));
//     printf("\nEnter data: ");
//     scanf("%d",&temp->data);
//     temp->prev=NULL;
//     temp->next=start;
//     start->prev=temp;
//     start=temp;
// }
// void insert_end(void)
// {
//     struct node *temp;
//     temp=(struct node *)malloc(sizeof(struct node));
//     printf("\nEnter data: ");
//     scanf("%d",&temp->data);
//     temp->next=NULL;
//     temp->prev=current;
//     current->next=temp;
//     current=temp;
// }
// void insert_pos(void)
// {
//     struct node *temp,*ptr;
//     int pos,i;
//     temp=(struct node *)malloc(sizeof(struct node));
//     printf("\nEnter data: ");
//     scanf("%d",&temp->data);
//     printf("\nEnter position: ");
//     scanf("%d",&pos);
//     ptr=start;
//     for(i=1;i<pos-1;i++)
//     {
//         ptr=ptr->next;
//     }
//     temp->next=ptr->next;
//     temp->prev=ptr;
//     ptr->next=temp;
//     temp->next->prev=temp;
// }
// void display(void)
// {
//     struct node *ptr;
//     ptr=start;
//     while(ptr!=NULL)
//     {
//         printf("%d\t",ptr->data);
//         ptr=ptr->next;
//     }
// }
// void main()
// {
//     int ch;
//     start=(struct node *)malloc(sizeof(struct node));
//     printf("\n1.Create list \n2.Insert at beginning \n3.Insert at end \n4.Insert at pos\n5.Display \n6.Exit");
//         do{
//                 printf("\nEnter your choice: ");
//                 scanf("%d",&ch);
//                 switch(ch)
//                 {
//                         case 1:
//                                     create_list();
//                                     break;
//                         case 2:
//                                     insert_beg();
//                                     break;
//                         case 3:
//                                     insert_end();
//                                     break;
//                         case 4:
//                                     insert_pos();
//                                     break;
//                         case 5:
//                                     display();
//                                     break;
//                         case 6:
//                                     printf("\nProgram termination...");
//                                     exit(0);
//                         default:
//                                     printf("\nEnter proper choice");
//                 }
//         }while(ch!=6);
// }

// doubly circular linked list
// struct node
// {
//     int data;
//     struct node *prev;
//     struct node *next;
// };
// struct node *start,*current;
// void create_list(void)
// {
//     start=(struct node *)malloc(sizeof(struct node));
//     if(start==NULL)
//     {
//         printf("\nMemory allocation failed");
//         exit(0);
//     }
//     else
//     {
//         printf("\nEnter data for node: ");
//         scanf("%d",&start->data);
//         start->prev=start;
//         start->next=start;
//         current=start;
//     }
// }
// void insert_beg(void)
// {
//     struct node *temp;
//     temp=(struct node *)malloc(sizeof(struct node));
//     printf("\nEnter data: ");
//     scanf("%d",&temp->data);
//     temp->prev=start;
//     temp->next=start;
//     start->prev=temp;
//     start=temp;
//     current->next=start;
// }
// void insert_end(void){
//     struct node *temp;
//     temp=(struct node *)malloc(sizeof(struct node));
//     printf("\nEnter data: ");
//     scanf("%d",&temp->data);
//     temp->next=start;
//     temp->prev=current;
//     current->next=temp;
//     current=temp;
//     start->prev=current;
// }
// void insert_pos(void){
//     struct node *temp,*ptr;
//     int pos,i;
//     temp=(struct node *)malloc(sizeof(struct node));
//     printf("\nEnter data: ");
//     scanf("%d",&temp->data);
//     printf("\nEnter position: ");
//     scanf("%d",&pos);
//     ptr=start;
//     for(i=1;i<pos-1;i++){
//         ptr=ptr->next;
//     }
//     temp->next=ptr->next;
//     temp->prev=ptr;
//     ptr->next=temp;
//     ptr->next->prev=temp;
// }
// void display(void){
//     struct node *ptr;
//     ptr=start;
//     while(ptr->next!=start){
//         printf("%d\t",ptr->data);
//         ptr=ptr->next;
//     }
//     printf("%d\t",ptr->data);
// }
// void main(){
//     int ch;
//     start=(struct node *)malloc(sizeof(struct node));
//     printf("\n1.Create list \n2.Insert at beginning \n3.Insert at end \n4.Insert at pos\n5.Display \n6.Exit");
//         do{
//                 printf("\nEnter your choice: ");
//                 scanf("%d",&ch);
//                 switch(ch){
//                         case 1:
//                                     create_list();
//                                     break;
//                         case 2:
//                                     insert_beg();
//                                     break;
//                         case 3:
//                                     insert_end();
//                                     break;
//                         case 4:
//                                     insert_pos();
//                                     break;
//                         case 5:
//                                     display();
//                                     break;
//                         case 6:
//                                     printf("\nProgram termination...");
//                                     exit(0);
//                         default:
//                                     printf("\nEnter proper choice");
//                 }
//         }while(ch!=6);
// }

// //chain-matrix manupulation
// // See the Cormen book for details of the following algorithm
// #include <limits.h>
// #include <stdio.h>

// // Matrix Ai has dimension p[i-1] x p[i] for i = 1..n
// int MatrixChainOrder(int p[], int n)
// {

// 	/* For simplicity of the program, one extra row and one
// 	extra column are allocated in m[][]. 0th row and 0th
// 	column of m[][] are not used */
// 	int m[n][n];

// 	int i, j, k, L, q;

// 	/* m[i, j] = Minimum number of scalar multiplications needed
// 	to compute the matrix A[i]A[i+1]...A[j] = A[i..j] where
// 	dimension of A[i] is p[i-1] x p[i] */

// 	// cost is zero when multiplying one matrix.
// 	for (i = 1; i < n; i++)
// 		m[i][i] = 0;

// 	// L is chain length.
// 	for (L = 2; L < n; L++) {
// 		for (i = 1; i < n - L + 1; i++) {
// 			j = i + L - 1;
// 			m[i][j] = INT_MAX;
// 			for (k = i; k <= j - 1; k++) {
// 				// q = cost/scalar multiplications
// 				q = m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j];
// 				if (q < m[i][j])
// 					m[i][j] = q;
// 			}
// 		}
// 	}

// 	return m[1][n - 1];
// }

// int main()
// {
// 	int arr[] = { 1, 2, 3, 4 };
// 	int size = sizeof(arr) / sizeof(arr[0]);

// 	printf("Minimum number of multiplications is %d ",
// 		MatrixChainOrder(arr, size));

// 	getchar();
// 	return 0;
// }
// find max and min in a array using divide and conquer
#include<stdio.h>
#include<conio.h>

int max(int a, int b)
{
    if (a > b)
        return a;
    else
        return b;
}
int min(int a, int b)
{
    if (a < b)
        return a;
    else
        return b;
}
int maxmin(int a[], int i, int j, int *max, int *min)
{
    int max1, min1, mid;
    if (i == j)
    {
        *max = *min = a[i];
    }
    else if (i == j - 1)
    {
        if (a[i] < a[j])
        {
            *min = a[i];
            *max = a[j];
        }
        else
        {
            *min = a[j];
            *max = a[i];
        }
    }
    else
    {
        mid = (i + j) / 2;
        maxmin(a, i, mid, max, min);
        maxmin(a, mid + 1, j, &max1, &min1);
        *max = max(*max, max1);
        *min = min(*min, min1);
    }
}
int main()
{
	int a[100], n, i, max, min;
	printf("Enter the number of elements in the array: ");
	scanf("%d", &n);
	printf("Enter the elements of the array: ");
	for (i = 0; i < n; i++)
		scanf("%d", &a[i]);
	maxmin(a, 0, n - 1, &max, &min);
	printf("Maximum element: %d", max);
	printf("Minimum element: %d", min);
	return 0;
}
