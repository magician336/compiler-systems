# 1 "SysY_example.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 388 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "./sysy_runtime.h" 1




void putint(int value);
void putch(int value);
# 2 "<built-in>" 2
# 1 "SysY_example.c" 2








const int scale_factor = 2;
int positive_count = 0;


void scale_array(int values[], int length, int factor) {
    int i = 0;
    while (i < length) {
        values[i] = values[i] * factor;
        i = i + 1;
    }
}


int sum_positive(int values[], int length) {
    int sum = 0;
    int i = 0;
    positive_count = 0;

    while (i < length) {
        if (values[i] > 0) {
            sum = sum + values[i];
            positive_count = positive_count + 1;
        }
        i = i + 1;
    }

    return sum;
}


int classify_average(int sum, int count) {
    if (count == 0) {
        return 0;
    }

    int average = sum / count;
    int remainder = sum % count;


    if (average >= 5 && remainder >= 0) {
        return 1;
    }
    if (average < 0 || !(average >= 5)) {
        return -1;
    }
    return 1;
}

int main() {
    int values[5] = {3, -2, 7, 4, -1};

    scale_array(values, 5, scale_factor);
    int sum = sum_positive(values, 5);
    int category = classify_average(sum, positive_count);

    putint(sum);
    putch(32);
    putint(positive_count);
    putch(32);
    putint(category);
    putch(10);
    return 0;
}
