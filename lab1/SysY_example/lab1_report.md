# Lab 1 验证记录

## 实验对象

`SysY_example.c` 使用 SysY 子集编写，覆盖：

- `const`、全局变量和一维数组；
- `+`、`-`、`*`、`/`、`%`；
- 赋值、关系运算、`&&`、`||`、`!`；
- `if/else`、`while`；
- `int`、`void` 函数及函数调用；
- `putint`、`putch` 运行库调用。

程序先把数组 `[3, -2, 7, 4, -1]` 乘以 2，再求正数和与个数，最后输出分类结果。

## 验证命令

```bash
cd "/mnt/d/code_warehouse/Curriculum/Compiler Systems/lab1/SysY_example"
bash build_and_verify.sh
```

脚本使用 WSL 中的 Clang/LLVM 18.1.3，以及仓库中的 `riscv64-unknown-elf` GCC 15.1.0 和 simulator。

## 验证结果

```text
host output: 28 3 1
risc-v output: 28 3 1
all checks passed
```

同时确认：

- `opt -passes=verify SysY_example.ll -disable-output` 通过；
- `llc` 成功生成 `SysY_example.riscv.s`；
- `riscv64-unknown-elf-gcc` 使用 `sim.specs` 完成运行库链接；
- `riscv64-unknown-elf-run --model RV64GC` 执行目标程序并得到与主机参考程序相同的结果。

## 链接边界

`sysy_runtime.c` 提供本实验所需的最小 `putint`、`putch` 适配层。它在主机和 RISC-V simulator 中都使用可用的 C 运行库输出。若课程另有正式 SysY runtime，只需要替换该适配层，`SysY_example.c` 的接口保持不变。
