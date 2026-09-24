#include <stdio.h>

/* 将数组中的每个元素乘以 factor，演示指针写入和循环。 */
void scale_array(int *values, int length, int factor) {
    for (int i = 0; i < length; ++i) {
        values[i] = values[i] * factor;
    }
}

/* 通过指针参数返回正数的个数，并返回这些正数的和。 */
int sum_positive(const int *values, int length, int *positive_count) {
    int sum = 0;
    int count = 0;

    for (int i = 0; i < length; ++i) {
        if (values[i] > 0) {
            sum += values[i];
            ++count;
        }
    }

    *positive_count = count;
    return sum;
}

/* 根据平均值选择一个分支，避免整数除零。 */
int classify_average(int sum, int count) {
    if (count == 0) {
        return 0;
    }

    int average = sum / count;
    if (average >= 5) {
        return 1;
    }
    return -1;
}

int main(void) {
    int values[5] = {3, -2, 7, 4, -1};
    int positive_count = 0;

    scale_array(values, 5, 2);
    int sum = sum_positive(values, 5, &positive_count);
    int category = classify_average(sum, positive_count);

    printf("sum=%d, positive_count=%d, category=%d\n",
           sum, positive_count, category);
    return 0;
}
