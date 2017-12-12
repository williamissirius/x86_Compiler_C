	.text
.globl max
max:
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
	movq %rsi,120(%rsp)

	# push 0
	movq $0,%rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	#Assign to Local var m
	movq %rbx, 104(%rsp)
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 112(%rsp)
for_evaluation_0:
	#Push Local var i
	movq 112(%rsp), %rbx
	#Push Local var n
	movq 120(%rsp), %r10
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
	jne for_statement_0
	jmp for_endAll_0
for_update_0:
	#Push Local var i
	movq 112(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 112(%rsp)
	jmp for_evaluation_0
for_statement_0:
	#start the if statement
if_statement_1:
	#Push Local var m
	movq 104(%rsp), %r10
	#Push Local var i
	movq 112(%rsp), %r13
# Array Value
	movq 128(%rsp), %r14
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC4
LC3:
	movq $0, %r10
	jmp LC5
LC4:
	movq $1, %r10
LC5:
	cmpq $0, %r10
	je if_else_1
	#Push Local var i
	movq 112(%rsp), %r13
# Array Value
	movq 128(%rsp), %r14
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
	#Assign to Local var m
	movq %r13, 104(%rsp)
################# top = 0 ############
	jmp if_end_1
if_else_1:
if_end_1:
	jmp for_update_0
for_endAll_0:
	#Push Local var m
	movq 104(%rsp), %rbx
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
 # Reserve space
	.data
a:
	.long 0
	.long 0

 # Reserve space
	.data
n:
	.long 0
	.long 0

 # Reserve space
	.data
i:
	.long 0
	.long 0

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

	# push 10
	movq $10,%rbx
	#Assign to Global var n
	movq %rbx, n
################# top = 0 ############

	# push 10
	movq $10,%rbx

	# push 8
	movq $8,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Global var a
	movq %rbx, a
################# top = 0 ############

	# push 0
	movq $0,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 8
	movq $8,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 1
	movq $1,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 7
	movq $7,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 2
	movq $2,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 1
	movq $1,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 3
	movq $3,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 9
	movq $9,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 4
	movq $4,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 11
	movq $11,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 5
	movq $5,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 83
	movq $83,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 6
	movq $6,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 7
	movq $7,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 7
	movq $7,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 13
	movq $13,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 8
	movq $8,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 94
	movq $94,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 9
	movq $9,%rbx
#dereference the pointer from here
	movq a, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 1
	movq $1,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
for_evaluation_2:
	movq i, %rbx
	movq n, %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC7
LC6:
	movq $0, %rbx
	jmp LC8
LC7:
	movq $1, %rbx
LC8:
	cmpq $0, %rbx
	jne for_statement_2
	jmp for_endAll_2
for_update_2:
	movq i, %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
	jmp for_evaluation_2
for_statement_2:
	#top=1

	# push string "%d: %d\n" top=1
	movq $string0, %r10
	movq i, %r13
	movq i, %r14
# Array Value
	movq a, %r15

#GLOBAL ARRAY RECOGNIZED
	imulq $8, %r14
	addq %r14, %r15
	movq (%r15), %r15
	movq %r15, %r14
     # func=printf nargs=3
     # Move values from reg stack to reg args
	movq %r14, %rdx
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	jmp for_update_2
for_endAll_2:
	#top=0

	# push string "n=%d\n" top=0
	movq $string1, %rbx
	movq n, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "max=%d\n" top=0
	movq $string2, %rbx
	movq a, %r10
	movq n, %r13
     # func=max nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	call max
	movq %rax, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
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
	.string "%d: %d\n"

string1:
	.string "n=%d\n"

string2:
	.string "max=%d\n"

