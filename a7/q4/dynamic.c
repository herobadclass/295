
long *new_42(void) {
    long x;
    long *ret;

    x = 42;
    ret = &x;
    return ret;
} // new_42

long N = 10;

void donotmuchofanything() {
    if (N--) {
        donotmuchofanything();
        N++;
    }
} // donotmuchofanything

