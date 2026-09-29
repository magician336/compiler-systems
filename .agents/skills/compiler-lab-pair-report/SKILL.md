---
name: compiler-lab-pair-report
description: "Plan, execute, and document two-person compiler-system lab experiments, including shared report sections, independently owned compiler stages, reproducible artifacts, and submission checks."
---

# Compiler Lab Pair Report

Use this skill for compiler-system course labs in which two students collaborate on one submission. The concrete division of stages is assigned per experiment and may change; never assume that LLVM IR, RISC-V, ARM, MLIR, or any other backend belongs to a particular member.

## Stable project author information

For this project, the user's own report identity is fixed and should be reused unless the user explicitly changes it:

- 姓名：李培涛
- 学号：2411041
- 专业：计算机科学与技术

不要在封面或检查清单中添加班级字段，除非用户之后明确要求。队友的身份信息仍是提交时填写的字段。

## Collaboration model

- Ask for, or extract from the assignment, the actual owner of each stage before writing role-specific claims.
- Treat the pair as producing one submission with two accountable contributors. Public sections may be written independently by both members when the assignment requires two complete reports; preserve the requested structure rather than silently deduplicating shared chapters.
- Put one cover and one explicit division-of-labor statement before the member reports. Identify the author of every independently written section and artifact.
- When only one member's report is being prepared, retain the cover and division statement, but keep the other member's body as a clearly marked placeholder or omit it only when the user explicitly asks. Do not present a teammate's unverified output as the current author's result.
- Keep responsibility and execution status separate: a member may own a stage that another person temporarily runs to unblock artifact generation.

## Map the assignment before drafting

Organize the report around the actual grading points. For the standard compiler-system lab, keep these as distinct sections:

1. The complete language-processing pipeline: preprocessing, compiler front end and middle/back end stages, assembler, linker, and execution.
2. The concrete language/IR/assembly experiment: a SysY (or assigned language) example, equivalent intermediate representation and target assembly, runtime-library linkage, target execution, and correctness evidence.
3. The advanced MLIR/AscendNPU or other multi-level IR exploration, if assigned. Keep it separate from the single-level LLVM IR experiment.

Use the course template for typography and front matter. Do not merge the three grading points merely because they use the same source program.

## Evidence and artifact discipline

Record the command, tool version, input, output path, exit status, and semantic result for each completed stage. Distinguish these states in prose and tables:

- **Executed and verified:** attach the generated file or log and state the observed output.
- **Toolchain available but owned by another member:** state who must incorporate the artifact and analysis into the combined submission.
- **Not executed because a toolchain is unavailable:** state the missing tool and leave a reproducible command template; never invent lowering output, simulator output, or screenshots.

Keep source, runtime adapter, generated IR/assembly, target files, logs, and boundary-case outputs under the project lab directory. Prefer a dedicated result directory such as `build/report_results/` so the report can link each table row to a file. Include the result directory in the submission when the user requests code and result files; a repository `.gitignore` may require explicit staging.

At minimum, map the following artifacts when their stages are assigned:

| Stage | Typical artifact or evidence |
| --- | --- |
| Preprocessing | `.i`/preprocessed source and the command using the runtime header or macros |
| IR generation/validation | `.ll`/`.mlir`, verifier output, and tool version |
| Optimization/comparison | O0/O2 or equivalent IR diff and a semantic output comparison |
| Assembly generation | `.s` plus the target triple, ISA, and ABI |
| Assembling/linking | `.o`, `.elf`/executable, linker/runtime command, and symbol or relocation evidence when relevant |
| Execution | stdout, exit status, simulator model, and a reference result |
| Advanced lowering | every intermediate IR file, pass list, version, and a statement of which lowering steps were actually run |

The automatic all-in-one build script is useful for end-to-end evidence, but if the assignment asks for the generated assembly to be assembled, separately run the explicit `.s` to `.o` to link path. A script that recompiles the source does not by itself prove that the saved assembly file was used.

## Program and experiment design

Choose one small deterministic example that exercises the required language features without making the IR unreadable. Cover the features named by the assignment, typically numeric operators, assignment, conditions, loops, functions, arrays, and runtime calls. Add focused variations that expose compiler behavior, such as a threshold change, optimization-level comparison, and a zero-length or divide-by-zero guard case. For every variation, state the expected semantic change before looking at the generated output.

For IR analysis, connect source constructs to operations and control-flow blocks: stack slots and memory operations, address calculation, comparisons, branches, calls, returns, and external runtime declarations. For assembly analysis, connect the same constructs to stack frames, calling convention, address arithmetic, branches, and runtime calls. Do not infer correctness from one output alone.

## Report wording and submission

- Use exact ownership language: “负责撰写” describes responsibility; “已运行并验证” describes evidence. They are not interchangeable.
- Keep placeholders only for information the user has not supplied, such as a teammate's name or an unavailable toolchain. Remove class fields or references when the user requests their removal.
- If references are not part of the requested deliverable, remove bibliography commands, citation calls, and unused bibliography files consistently across the report files.
- Include a pre-submission table listing remaining manual fields, the responsible member, the required artifact, and whether the gap is a writing gap or an execution/toolchain gap.
- When the user requests GitHub submission, inspect the repository root, remote, branch, staged diff, and ignore rules. Commit and push only after that explicit authorization. If ignored results are required, stage those paths deliberately and report the commit and remote branch.

## Validation checklist

Before declaring the report ready:

1. Compile the LaTeX source with the project's XeLaTeX/template command and inspect the log for actual errors, undefined references, and overfull boxes.
2. Re-run the assigned toolchain commands or inspect saved logs; do not claim a fresh run from an old record without saying so.
3. Confirm every result-table path exists under the lab directory and that expected outputs match the stated reference result.
4. Check that the cover, division statement, member sections, assignment-point headings, and submission checklist agree with the current division of labor.
5. If pushing to Git, run `git status`, `git diff --cached --check`, and verify the pushed commit/branch after the push.
