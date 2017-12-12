	.text
.globl mysort
mysort:
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
	#start the For statement
	#Push Local var n
	movq 128(%rsp), %rbx

	# push 1
	movq $1,%r10

	# minus
	subq %r10, %rbx
	#Assign to Local var i
	movq %rbx, 112(%rsp)
for_evaluation_0:
	#Push Local var i
	movq 112(%rsp), %rbx

	# push 0
	movq $0,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jg LC1
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

	# minus
	subq %r13, %r10
	#Assign to Local var i
	movq %r10, 112(%rsp)
	jmp for_evaluation_0
for_statement_0:
	#start the For statement

	# push 0
	movq $0,%r10
	#Assign to Local var j
	movq %r10, 104(%rsp)
for_evaluation_1:
	#Push Local var j
	movq 104(%rsp), %r10
	#Push Local var i
	movq 112(%rsp), %r13
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
	jne for_statement_1
	jmp for_endAll_1
for_update_1:
	#Push Local var j
	movq 104(%rsp), %r13

	# push 1
	movq $1,%r14

	# +
	addq %r14,%r13
	#Assign to Local var j
	movq %r13, 104(%rsp)
	jmp for_evaluation_1
for_statement_1:
	#start the if statement
if_statement_2:
	#Push Local var j
	movq 104(%rsp), %r13
# Array Value
	movq 120(%rsp), %r14
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
	#Push Local var j
	movq 104(%rsp), %r14

	# push 1
	movq $1,%r15

	# +
	addq %r15,%r14
# Array Value
	movq 120(%rsp), %r15
	imulq $8, %r14
	addq %r14, %r15
	movq (%r15), %r15
	movq %r15, %r14
	# Equal Equal operator
	cmpq %r14, %r13
	jg LC7
LC6:
	movq $0, %r13
	jmp LC8
LC7:
	movq $1, %r13
LC8:
	cmpq $0, %r13
	je if_else_2
	#Push Local var j
	movq 104(%rsp), %r14
# Array Value
	movq 120(%rsp), %r15
	imulq $8, %r14
	addq %r14, %r15
	movq (%r15), %r15
	movq %r15, %r14
	#Assign to Local var tmp
	movq %r14, 96(%rsp)
################# top = 0 ############
	#Push Local var j
	movq 104(%rsp), %rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#Push Local var j
	movq 104(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
# Array Value
	movq 120(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#Push Local var j
	movq 104(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#Push Local var tmp
	movq 96(%rsp), %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	jmp if_end_2
if_else_2:
if_end_2:
	jmp for_update_1
for_endAll_1:
	jmp for_update_0
for_endAll_0:
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
.globl printArray
printArray:
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
	movq %rdx,112(%rsp)
	#top=0

	# push string "----------- %s -----------\n" top=0
	movq $string0, %rbx
	#Push Local var s
	movq 128(%rsp), %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 104(%rsp)
for_evaluation_3:
	#Push Local var i
	movq 104(%rsp), %rbx
	#Push Local var n
	movq 120(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC10
LC9:
	movq $0, %rbx
	jmp LC11
LC10:
	movq $1, %rbx
LC11:
	cmpq $0, %rbx
	jne for_statement_3
	jmp for_endAll_3
for_update_3:
	#Push Local var i
	movq 104(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 104(%rsp)
	jmp for_evaluation_3
for_statement_3:
	#top=1

	# push string "%d\n" top=1
	movq $string1, %r10
	#Push Local var i
	movq 104(%rsp), %r13
# Array Value
	movq 112(%rsp), %r14
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	jmp for_update_3
for_endAll_3:
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

	# push 10
	movq $10,%rbx
	#Assign to Local var n
	movq %rbx, 128(%rsp)
################# top = 0 ############
	#Push Local var n
	movq 128(%rsp), %rbx

	# push 8
	movq $8,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Local var a
	movq %rbx, 120(%rsp)
################# top = 0 ############

	# push 0
	movq $0,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
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
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 1
	movq $1,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#top=0

	# push string "Before" top=0
	movq $string2, %rbx
	#Push Local var n
	movq 128(%rsp), %r10
	#Push Local var a
	movq 120(%rsp), %r13
     # func=printArray nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call printArray
	movq %rax, %rbx
################# top = 0 ############
	#Push Local var n
	movq 128(%rsp), %rbx
	#Push Local var a
	movq 120(%rsp), %r10
     # func=mysort nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	call mysort
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "After" top=0
	movq $string3, %rbx
	#Push Local var n
	movq 128(%rsp), %r10
	#Push Local var a
	movq 120(%rsp), %r13
     # func=printArray nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call printArray
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
	.string "----------- %s -----------\n"

string1:
	.string "%d\n"

string2:
	.string "Before"

string3:
	.string "After"

