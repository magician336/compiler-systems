#!/usr/bin/env bash
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BUILD_DIR="$ROOT_DIR/build"
mkdir -p "$BUILD_DIR"

: "${CLANG:=clang}"
: "${OPT:=opt}"
: "${LLC:=llc}"
: "${RISCV_GCC:=$ROOT_DIR/../../riscv-elf-toolchains/bin/riscv64-unknown-elf-gcc}"
: "${RISCV_RUN:=$ROOT_DIR/../../riscv-elf-toolchains/bin/riscv64-unknown-elf-run}"

IR_FILE="$ROOT_DIR/SysY_example.ll"
ASSEMBLY_FILE="$ROOT_DIR/SysY_example.riscv.s"

echo '[1/5] Build and run the host reference program'
(
    cd "$ROOT_DIR"
    "$CLANG" -std=c11 -Wall -Wextra -Werror \
        -include sysy_runtime.h SysY_example.c sysy_runtime.c \
        -o "$BUILD_DIR/SysY_example.host"
)
HOST_OUTPUT=$("$BUILD_DIR/SysY_example.host")
printf 'host output: %s\n' "$HOST_OUTPUT"
test "$HOST_OUTPUT" = '28 3 1'

echo '[2/5] Generate target LLVM IR'
(
    cd "$ROOT_DIR"
    "$CLANG" -target riscv64-unknown-elf -march=rv64gc -mabi=lp64d \
        -std=c11 -O0 -S -emit-llvm -include sysy_runtime.h \
        SysY_example.c -o SysY_example.ll
)

echo '[3/5] Verify IR and lower it to RISC-V assembly'
"$OPT" -passes=verify "$IR_FILE" -disable-output
"$LLC" -mtriple=riscv64-unknown-elf -mattr=+m,+a,+f,+d,+c \
    -filetype=asm "$IR_FILE" -o "$ASSEMBLY_FILE"

echo '[4/5] Link the source and SysY runtime for the RISC-V simulator'
(
    cd "$ROOT_DIR"
    "$RISCV_GCC" -march=rv64gc -mabi=lp64d -specs=sim.specs \
        -std=c11 -Wall -Wextra -Werror -include sysy_runtime.h \
        SysY_example.c sysy_runtime.c -o "$BUILD_DIR/SysY_example.riscv.elf"
)

echo '[5/5] Run the linked RISC-V target'
TARGET_OUTPUT=$("$RISCV_RUN" --model RV64GC "$BUILD_DIR/SysY_example.riscv.elf")
printf 'risc-v output: %s\n' "$TARGET_OUTPUT"
test "$TARGET_OUTPUT" = '28 3 1'

echo 'all checks passed'
