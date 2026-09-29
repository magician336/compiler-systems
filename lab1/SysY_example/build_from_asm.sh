#!/usr/bin/env bash
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BUILD_DIR="$ROOT_DIR/build"
REPORT_DIR="$BUILD_DIR/report_results"
TOOLCHAIN_ROOT="${TOOLCHAIN_ROOT:-$ROOT_DIR/../../riscv-elf-toolchains}"
RISCV_GCC="${RISCV_GCC:-$TOOLCHAIN_ROOT/bin/riscv64-unknown-elf-gcc}"
RISCV_RUN="${RISCV_RUN:-$TOOLCHAIN_ROOT/bin/riscv64-unknown-elf-run}"
RISCV_READELF="${RISCV_READELF:-$TOOLCHAIN_ROOT/bin/riscv64-unknown-elf-readelf}"
RISCV_OBJDUMP="${RISCV_OBJDUMP:-$TOOLCHAIN_ROOT/bin/riscv64-unknown-elf-objdump}"
SIM_SPECS="${SIM_SPECS:-$TOOLCHAIN_ROOT/riscv64-unknown-elf/lib/sim.specs}"

mkdir -p "$BUILD_DIR" "$REPORT_DIR"

ASM_FILE="$ROOT_DIR/SysY_example.riscv.s"
OBJECT_FILE="$BUILD_DIR/SysY_example.from_asm.riscv.o"
ELF_FILE="$BUILD_DIR/SysY_example.from_asm.elf"
LOG_FILE="$REPORT_DIR/riscv_from_asm.log"
ELF_INFO_FILE="$REPORT_DIR/riscv_from_asm.elf_info.txt"
DISASSEMBLY_FILE="$REPORT_DIR/riscv_from_asm.disassembly.txt"
OUTPUT_FILE="$REPORT_DIR/riscv_from_asm.output.txt"

exec > >(tee "$LOG_FILE") 2>&1

echo "[1/5] Check generated RISC-V assembly"
test -s "$ASM_FILE"
grep -q '^main:' "$ASM_FILE"
grep -q 'call[[:space:]]\+putint' "$ASM_FILE"
grep -q 'call[[:space:]]\+putch' "$ASM_FILE"

echo "[2/5] Assemble .riscv.s into a target object"
"$RISCV_GCC" -march=rv64gc -mabi=lp64d \
    -c "$ASM_FILE" -o "$OBJECT_FILE"

echo "[3/5] Link the assembled object with the SysY runtime"
"$RISCV_GCC" -march=rv64gc -mabi=lp64d -specs="$SIM_SPECS" \
    "$OBJECT_FILE" "$ROOT_DIR/sysy_runtime.c" -o "$ELF_FILE"

echo "[4/5] Inspect ELF headers, sections, symbols, and disassembly"
"$RISCV_READELF" -h -S -s "$ELF_FILE" > "$ELF_INFO_FILE"
"$RISCV_OBJDUMP" -d "$ELF_FILE" > "$DISASSEMBLY_FILE"

echo "[5/5] Run the ELF on the RV64GC simulator"
TARGET_OUTPUT=$("$RISCV_RUN" --model RV64GC "$ELF_FILE")
printf '%s\n' "$TARGET_OUTPUT" | tee "$OUTPUT_FILE"
test "$TARGET_OUTPUT" = '28 3 1'
echo "direct assembly pipeline passed"
