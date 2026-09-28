#include <stdio.h>

/* Host and simulator-compatible adapter for the SysY output functions. */
void putint(int value) {
    printf("%d", value);
}

void putch(int value) {
    putchar(value);
}
