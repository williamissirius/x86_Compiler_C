 # Reserve space
	.data
queens:
	.long 0
	.long 0

 # Reserve space
	.data
solid:
	.long 0
	.long 0

	.text
.globl abs
abs:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbp
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#start the if statement
if_statement_0:
	#Push Local var v
	movq 128(%rsp), %rbx

	# push 0
	movq $0,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC1
LC0:
	movq $0, %rbx
	jmp LC2
LC1:
	movq $1, %rbx
LC2:
	cmpq $0, %rbx
	je if_else_0

	# push -1
	movq $-1,%r10
	#Push Local var v
	movq 128(%rsp), %r13

	# *
	imulq %r13,%r10
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	jmp if_end_0
if_else_0:
if_end_0:
	#Push Local var v
	movq 128(%rsp), %rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl check
check:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbp
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
for_evaluation_1:
	#Push Local var i
	movq 120(%rsp), %rbx
	#Push Local var depth
	movq 128(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC4
LC3:
	movq $0, %rbx
	jmp LC5
LC4:
	movq $1, %rbx
LC5:
	cmpq $0, %rbx
	jne for_statement_1
	jmp for_endAll_1
for_update_1:
	#Push Local var i
	movq 120(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 120(%rsp)
	jmp for_evaluation_1
for_statement_1:
	#start the if statement
if_statement_2:
	#Push Local var i
	movq 120(%rsp), %r10
# Array Value
	movq queens, %r13

#GLOBAL ARRAY RECOGNIZED
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	#Push Local var depth
	movq 128(%rsp), %r13
# Array Value
	movq queens, %r14

#GLOBAL ARRAY RECOGNIZED
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
	# Equal Equal operator
	cmpq %r13, %r10
	je LC7
LC6:
	movq $0, %r10
	jmp LC8
LC7:
	movq $1, %r10
LC8:
	#Push Local var i
	movq 120(%rsp), %r13
# Array Value
	movq queens, %r14

#GLOBAL ARRAY RECOGNIZED
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
	#Push Local var depth
	movq 128(%rsp), %r14
# Array Value
	movq queens, %r15

#GLOBAL ARRAY RECOGNIZED
	imulq $8, %r14
	addq %r14, %r15
	movq (%r15), %r15
	movq %r15, %r14

	# minus
	subq %r14, %r13
     # func=abs nargs=1
     # Move values from reg stack to reg args
	movq %r13, %rdi
	call abs
	movq %rax, %r13
	#Push Local var depth
	movq 128(%rsp), %r14
	#Push Local var i
	movq 120(%rsp), %r15

	# minus
	subq %r15, %r14
	# Equal Equal operator
	cmpq %r14, %r13
	je LC10
LC9:
	movq $0, %r13
	jmp LC11
LC10:
	movq $1, %r13
LC11:
	# logical OR operator
	orq %r13, %r10
	cmpq $0, %r10
	je if_else_2

	# push 0
	movq $0,%r13
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	jmp if_end_2
if_else_2:
if_end_2:
	jmp for_update_1
for_endAll_1:

	# push 1
	movq $1,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl bruteforce
bruteforce:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbp
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#start the if statement
if_statement_3:
	#Push Local var depth
	movq 128(%rsp), %rbx

	# push 8
	movq $8,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	je LC13
LC12:
	movq $0, %rbx
	jmp LC14
LC13:
	movq $1, %rbx
LC14:
	cmpq $0, %rbx
	je if_else_3
	#top=1

	# push string "Solution #%2ld = [ " top=1
	movq $string0, %r10
	movq solid, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	movq solid, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var solid
	movq %rbx, solid
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
for_evaluation_4:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 8
	movq $8,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC16
LC15:
	movq $0, %rbx
	jmp LC17
LC16:
	movq $1, %rbx
LC17:
	cmpq $0, %rbx
	jne for_statement_4
	jmp for_endAll_4
for_update_4:
	#Push Local var i
	movq 120(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 120(%rsp)
	jmp for_evaluation_4
for_statement_4:
	#top=1

	# push string "%ld " top=1
	movq $string1, %r10
	#Push Local var i
	movq 120(%rsp), %r13
# Array Value
	movq queens, %r14

#GLOBAL ARRAY RECOGNIZED
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13

	# push 1
	movq $1,%r14

	# +
	addq %r14,%r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	jmp for_update_4
for_endAll_4:
	#top=0

	# push string "]\n" top=0
	movq $string2, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############

	# push 0
	movq $0,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	jmp if_end_3
if_else_3:
if_end_3:
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
for_evaluation_5:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 8
	movq $8,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC19
LC18:
	movq $0, %rbx
	jmp LC20
LC19:
	movq $1, %rbx
LC20:
	cmpq $0, %rbx
	jne for_statement_5
	jmp for_endAll_5
for_update_5:
	#Push Local var i
	movq 120(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 120(%rsp)
	jmp for_evaluation_5
for_statement_5:
	#Push Local var depth
	movq 128(%rsp), %r10
#dereference the pointer from here
	movq queens, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %r10
	addq %r10, %rbp
	#Push Local var i
	movq 120(%rsp), %r13
# dereference the array here
	movq %r13, (%rbp)
################# top = 0 ############
	#start the if statement
if_statement_6:
	#Push Local var depth
	movq 128(%rsp), %rbx
     # func=check nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call check
	movq %rax, %rbx

	# push 0
	movq $0,%r10
	# Not Equal operator
	cmpq %r10, %rbx
	jne LC22
LC21:
	movq $0, %rbx
	jmp LC23
LC22:
	movq $1, %rbx
LC23:
	cmpq $0, %rbx
	je if_else_6
	#Push Local var depth
	movq 128(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
     # func=bruteforce nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	call bruteforce
	movq %rax, %r10
################# top = 0 ############
	jmp if_end_6
if_else_6:
if_end_6:
	jmp for_update_5
for_endAll_5:

	# push 0
	movq $0,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl main
main:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbp
	subq $128,%rsp
	#Save arguments

	# push 8
	movq $8,%rbx

	# push 8
	movq $8,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Global var queens
	movq %rbx, queens
################# top = 0 ############

	# push 1
	movq $1,%rbx
	#Assign to Global var solid
	movq %rbx, solid
################# top = 0 ############

	# push 0
	movq $0,%rbx
     # func=bruteforce nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call bruteforce
	movq %rax, %rbx
################# top = 0 ############
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "Solution #%2ld = [ "

string1:
	.string "%ld "

string2:
	.string "]\n"

