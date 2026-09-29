/*
 * SysY example program for Lab 1.
 *
 * The source intentionally uses the SysY subset rather than hosted C:
 * there are no headers, pointers, for-loops, or printf calls.  putint and
 * putch are supplied by the SysY runtime at link time.
 */

const int scale_factor = 2;
int positive_count = 0;

/* Multiply every element of values by factor. */
void scale_array(int values[], int length, int factor) {
    int i = 0;
    while (i < length) {
        values[i] = values[i] * factor;
        i = i + 1;
    }
}

/* Return the sum of positive elements and publish their count globally. */
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

/* Classify an integer average and exercise /, %, &&, ||, and !. */
int classify_average(int sum, int count) {
    if (count == 0) {
        return 0;
    }

    int average = sum / count;
    int remainder = sum % count;

    /* count is positive here, so remainder >= 0 is an invariant. */
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
    int sum = sum_positive(values, 0);
    int category = classify_average(sum, positive_count);

    putint(sum);
    putch(32);
    putint(positive_count);
    putch(32);
    putint(category);
    putch(10);
    return 0;
}
