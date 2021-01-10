
#include <stdio.h>

long *new_42(void);  // creates a new long in dynamic memory (stack)
void donotmuchofanything();

void main () {
    long *long_ptr;

    long_ptr = new_42();
    printf("The current value is %ld.\n", *long_ptr);
    donotmuchofanything();
    printf("The current value is %ld.\n", *long_ptr);
}

