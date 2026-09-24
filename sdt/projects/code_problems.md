# 代码补全练习集

## sdd_exercise
title: 语法制导定义设计练习
aux_file: 
ex_file: semantic_rules.txt, attr_steps.txt
compile_log: 
run_log: 
task_desc:
  对上下文无关文法：
  expr  → expr + term | expr - term | term
  term  → term * factor | term / factor | factor
  factor → digit | ( expr )
  digit → 0 | 1 | 2 | ... | 9
  学生需要完成两个任务：
  1. 设计语法制导定义——补全所有产生式的语义规则（填写在花括号 {} 内），实现表达式中缀形式转换为后缀形式
  2. 对表达式 7-3*4，利用语法制导定义进行翻译——按后序遍历顺序遍历语法树、写出属性计算步骤

  语义规则格式示例：{ expr.t = expr1.t + term.t + '+' }
  属性计算步骤格式示例：digit.t = '7'

  所有答案保存在 semantic_rules.txt 和 attr_steps.txt 中。
reference:
  - 设计语法制导定义：首先，为每个非终结符设计一个属性值，类型为字符串，保存转换得到的后缀形式。然后设计语义规则：对 digit 的每个产生式，digit属性值赋值为每个数字的字符串形式；对 factor 的两个产生式，factor 属性值赋值为右部digit、expr的属性值；对 term 的 *、/产生式，term 的属性值赋值为右部 term 的属性值拼接 factor 的属性值再拼接 *、/ 号，对 term → factor，term 的属性值赋值为 factor 的属性值；对 expr 的三个产生式，语义规则与 term 产生式的语义规则完全类似。
  - 执行翻译：后序遍历语法树，在每个非终结符节点，执行对应产生式的语义规则，利用孩子节点的属性值计算父节点的属性值，写出计算结果。

## tc_exercise
title: 前缀表达式翻译模式设计练习
aux_file: 
ex_file: translation_schemes.txt, exec_steps.txt
compile_log: 
run_log: 
task_desc:
  对上下文无关文法：
  expr  → expr + term | expr - term | term
  term  → term * factor | term / factor | factor
  factor → digit | ( expr )
  digit → 0 | 1 | 2 | ... | 9
  学生需要完成两个任务：
  1. 为文法设计翻译模式（TC），即，在每个产生式右部正确位置插入花括号 {} 包围的语义动作，实现表达式中缀形式转换为前缀形式
  2. 对表达式 9-5*2，利用翻译模式进行翻译，即，按后序遍历顺序遍历语法树、写出语义动作的执行过程

  翻译模式格式示例：{ print('+') }
  执行步骤格式示例："print '+'"

  所有答案保存在 translation_schemes.txt 和 exec_steps.txt 中。
reference:
  - 设计翻译模式：对 digit 的每个产生式，将打印数字的语义动作插入到产生式右部任何位置均可；对 factor 的两个产生式和 term → factor、expr → term，不插入任何语义动作；对剩余四个产生式，在产生式右部最左边插入打印运算符（+、-、*、/之一）的语义动作。
  - 执行翻译：按后序遍历顺序遍历语法树，遇到语义动作即执行——写出执行的语义动作，即形成一个语义动作执行序列。