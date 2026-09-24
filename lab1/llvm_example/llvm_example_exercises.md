# 后续 LLVM 实验练习

1. **定位变量**：在 `scale_array` 中找出循环变量 `i` 对应的 `alloca/load/store`，说明每条指令的作用。
2. **定位基本块**：画出 `sum_positive` 的控制流图，标出 `loop.cond`、`loop.body`、`positive`、`skip` 和 `loop.end`。
3. **观察数组寻址**：解释 `getelementptr inbounds i32` 如何把数组下标转换成元素地址。
4. **观察分支**：修改 C 程序中的平均值阈值，重新生成 `.ll`，比较 `icmp` 的立即数变化。
5. **优化对比**：分别用 `-O0` 和 `-O2` 生成 IR，记录循环、局部变量和内存访问发生的变化。
6. **指针实验**：把 `sum_positive` 的 `const int *values` 改成普通 `int *values`，观察语义是否变化以及 IR 是否变化。
7. **边界实验**：令数组长度为 0，验证 `classify_average` 的除零保护分支。
