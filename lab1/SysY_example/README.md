# SysY 到 LLVM IR 和 RISC-V 示例

## 程序行为

`SysY_example.c` 创建 5 个整数，调用 `scale_array` 将数组元素乘以 2，再调用 `sum_positive` 统计正数总和与个数，最后由 `classify_average` 根据整数平均值返回分类。输出通过 SysY 运行库的 `putint` 和 `putch` 完成。

预期输出：

```text
28 3 1
```

## 生成和验证

推荐在 WSL 中运行：

```bash
bash build_and_verify.sh
```

手动生成 LLVM IR：

```bash
clang -target riscv64-unknown-elf -march=rv64gc -mabi=lp64d \
  -std=c11 -O0 -S -emit-llvm \
  -include sysy_runtime.h SysY_example.c -o SysY_example.ll
opt -passes=verify SysY_example.ll -disable-output
```

从 IR 生成 RISC-V 汇编：

```bash
llc -mtriple=riscv64-unknown-elf -mattr=+m,+a,+f,+d,+c \
  -filetype=asm SysY_example.ll -o SysY_example.riscv.s
```

链接和运行：

```bash
riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -specs=sim.specs \
  -std=c11 -include sysy_runtime.h \
  SysY_example.c sysy_runtime.c -o build/SysY_example.riscv.elf
riscv64-unknown-elf-run --model RV64GC build/SysY_example.riscv.elf
```

## 运行库边界

`SysY_example.c` 不包含 `stdio.h`，也不直接调用 `printf`。`sysy_runtime.c` 是本实验的最小运行库适配层：在主机上使用 C 标准库，在 RISC-V simulator 上通过 `sim.specs` 提供的 newlib/libsim 链路输出。替换为课程正式运行库时，只需保留 `putint` 和 `putch` 接口。
