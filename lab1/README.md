# Compiler Systems - Lab 1

本实验使用一个 SysY 子集示例，演示从源程序到 LLVM IR、RISC-V 汇编和目标程序的完整链路。

完整实验文档：[`SysY_example/lab1_report.md`](SysY_example/lab1_report.md)。

LaTeX 实验报告：[`main.tex`](main.tex)；最近一次 XeLaTeX 编译结果：[`main.pdf`](main.pdf)。

## 文件

- `SysY_example/SysY_example.c`：不依赖 C 头文件的 SysY 示例源程序。
- `SysY_example/SysY_example.ll`：面向 `riscv64-unknown-elf` 的 LLVM IR。
- `SysY_example/SysY_example.riscv.s`：由 LLVM IR 生成的 RISC-V 汇编。
- `SysY_example/sysy_runtime.h`：运行库函数声明，使用编译器的强制包含选项注入。
- `SysY_example/sysy_runtime.c`：主机和 RISC-V simulator 使用的最小输出运行库适配层。
- `SysY_example/build_and_verify.sh`：一键生成、链接和验证脚本。
- `SysY_example/build_from_asm.sh`：直接装配已生成的 `.riscv.s`，再链接、检查 ELF 并运行。
- `SysY_example/SysY_example_exercises.md`：IR 阅读和对比练习。

## 覆盖的语言特性

示例覆盖：

- `const` 常量和全局变量；
- 一维数组和数组形参；
- `+`、`-`、`*`、`/`、`%` 数值运算；
- 赋值、关系运算、`&&`、`||`、`!`；
- `if/else` 条件分支；
- `while` 循环；
- `int` 和 `void` 函数、函数调用和返回值；
- SysY 运行库 `putint`、`putch`。

源程序经过数组缩放、正数求和与平均值分类后，预期输出为：

```text
28 3 1
```

## 验证

在 WSL 中运行：

```bash
cd "/mnt/d/code_warehouse/Curriculum/Compiler Systems/lab1/SysY_example"
bash build_and_verify.sh
```

脚本会依次完成：

1. 用 Clang 构建主机参考程序并验证输出；
2. 生成 RISC-V LLVM IR；
3. 用 `opt` 验证 IR，并用 `llc` 生成 RISC-V 汇编；
4. 用仓库中的 `riscv64-unknown-elf-gcc` 和 `sim.specs` 链接运行库；
5. 用 `riscv64-unknown-elf-run --model RV64GC` 执行目标程序并验证输出。

构建产物放在 `build/`。提交 `lab1` 文件夹时，保留 `build/report_results/` 中的报告结果文件，并与报告、源代码一起提交；其它临时缓存可以不提交。

若要验证 `llc` 生成的汇编确实进入了最终执行路径，在同一目录执行：

```bash
bash build_from_asm.sh
```

该脚本会把汇编装配为目标文件，与运行库链接，保存 ELF 信息、反汇编和模拟器输出到 `build/report_results/riscv_from_asm.*`。仓库已对该报告证据目录取消忽略；其它 `build/` 临时产物仍保持忽略。
