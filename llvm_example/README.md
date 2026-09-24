# LLVM IR C 示例

这个示例只覆盖 C -> LLVM IR，不包含 RISC-V 汇编或 RISC-V 编译。

## 文件

- `llvm_example.c`：中等规模 C 程序。
- `llvm_example.ll`：由 WSL Clang 18.1.3 在 `-O0` 下实际生成的 opaque-pointer LLVM IR。
- `llvm_example_exercises.md`：后续实验练习。

## 程序行为

`main` 创建 5 个整数，调用 `scale_array` 将每个元素乘以 2，再调用 `sum_positive` 统计正数个数和正数总和，最后由 `classify_average` 根据平均值返回类别并打印结果。

预期输出：

```text
sum=28, positive_count=3, category=1
```

## 用 Clang 生成 LLVM IR

在安装 LLVM/Clang 的环境中运行：

```bash
clang -S -emit-llvm -O0 llvm_example.c -o llvm_example.ll
clang llvm_example.c -o llvm_example
./llvm_example
```

`-O0` 用于保留局部变量的 `alloca/load/store`，便于和 C 代码逐段对照。进行优化实验时可改用 `-O1` 或 `-O2`，比较基本块、内存访问和循环结构的变化。

## 当前环境验证边界

Windows 环境未安装 LLVM，但 WSL 实验环境已完成实际验证：Clang 18.1.3 成功生成 IR，程序输出符合预期，`opt -passes=verify llvm_example.ll -disable-output` 校验通过。后续在 WSL 中可直接重复上述命令。
