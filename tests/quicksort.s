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
	#start the For statement
	#Push Local var left
	movq 120(%rsp), %rbx
	#Assign to Local var i
	movq %rbx, 104(%rsp)
for_evaluation_0:
	#Push Local var i
	movq 104(%rsp), %rbx
	#Push Local var right
	movq 112(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jle LC1
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
	movq 104(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 104(%rsp)
	jmp for_evaluation_0
for_statement_0:
	#top=1

	# push string "%d\n" top=1
	movq $string0, %r10
	#Push Local var i
	movq 104(%rsp), %r13
# Array Value
	movq 128(%rsp), %r14
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
.globl print
print:
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
	#top=0

	# push string "==%s==\n" top=0
	movq $string1, %rbx
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
.globl quicksortsubrange
quicksortsubrange:
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
	#start the if statement
if_statement_1:
	#Push Local var left
	movq 120(%rsp), %rbx
	#Push Local var right
	movq 112(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jge LC4
LC3:
	movq $0, %rbx
	jmp LC5
LC4:
	movq $1, %rbx
LC5:
	cmpq $0, %rbx
	je if_else_1

	# push 0
	movq $0,%r10
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
	jmp if_end_1
if_else_1:
if_end_1:
	#Push Local var right
	movq 112(%rsp), %rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	#Assign to Local var x
	movq %rbx, 104(%rsp)
################# top = 0 ############
	#Push Local var left
	movq 120(%rsp), %rbx
	#Assign to Local var l
	movq %rbx, 96(%rsp)
################# top = 0 ############
	#Push Local var right
	movq 112(%rsp), %rbx

	# push 1
	movq $1,%r10

	# minus
	subq %r10, %rbx
	#Assign to Local var g
	movq %rbx, 88(%rsp)
################# top = 0 ############
while_start_2:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
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
	je while_end_2
while_start_3:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC10
LC9:
	movq $0, %rbx
	jmp LC11
LC10:
	movq $1, %rbx
LC11:
	#Push Local var l
	movq 96(%rsp), %r10
# Array Value
	movq 128(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	#Push Local var x
	movq 104(%rsp), %r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC13
LC12:
	movq $0, %r10
	jmp LC14
LC13:
	movq $1, %r10
LC14:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je while_end_3
	#Push Local var l
	movq 96(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var l
	movq %rbx, 96(%rsp)
################# top = 0 ############
	jmp while_start_3
while_end_3:
while_start_4:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC16
LC15:
	movq $0, %rbx
	jmp LC17
LC16:
	movq $1, %rbx
LC17:
	#Push Local var g
	movq 88(%rsp), %r10
# Array Value
	movq 128(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	#Push Local var x
	movq 104(%rsp), %r13
	# Equal Equal operator
	cmpq %r13, %r10
	jg LC19
LC18:
	movq $0, %r10
	jmp LC20
LC19:
	movq $1, %r10
LC20:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je while_end_4
	#Push Local var g
	movq 88(%rsp), %rbx

	# push 1
	movq $1,%r10

	# minus
	subq %r10, %rbx
	#Assign to Local var g
	movq %rbx, 88(%rsp)
################# top = 0 ############
	jmp while_start_4
while_end_4:
	#start the if statement
if_statement_5:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC22
LC21:
	movq $0, %rbx
	jmp LC23
LC22:
	movq $1, %rbx
LC23:
	cmpq $0, %rbx
	je if_else_5
	#Push Local var l
	movq 96(%rsp), %r10
# Array Value
	movq 128(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	#Assign to Local var tmp
	movq %r10, 80(%rsp)
################# top = 0 ############
	#Push Local var l
	movq 96(%rsp), %rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#Push Local var g
	movq 88(%rsp), %r10
# Array Value
	movq 128(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#Push Local var g
	movq 88(%rsp), %rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#Push Local var tmp
	movq 80(%rsp), %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	jmp if_end_5
if_else_5:
if_end_5:
	jmp while_start_2
while_end_2:
	#Push Local var right
	movq 112(%rsp), %rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#Push Local var l
	movq 96(%rsp), %r10
# Array Value
	movq 128(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#Push Local var l
	movq 96(%rsp), %rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#Push Local var x
	movq 104(%rsp), %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#Push Local var a
	movq 128(%rsp), %rbx
	#Push Local var left
	movq 120(%rsp), %r10
	#Push Local var l
	movq 96(%rsp), %r13

	# push 1
	movq $1,%r14

	# minus
	subq %r14, %r13
     # func=quicksortsubrange nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksortsubrange
	movq %rax, %rbx
################# top = 0 ############
	#Push Local var a
	movq 128(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Push Local var right
	movq 112(%rsp), %r13
     # func=quicksortsubrange nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksortsubrange
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
	.text
.globl quicksort
quicksort:
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
	#Push Local var a
	movq 128(%rsp), %rbx

	# push 0
	movq $0,%r10
	#Push Local var n
	movq 120(%rsp), %r13

	# push 1
	movq $1,%r14

	# minus
	subq %r14, %r13
     # func=quicksortsubrange nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksortsubrange
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
	#top=0

	# push string "Hello" top=0
	movq $string2, %rbx
     # func=print nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call print
	movq %rax, %rbx
################# top = 0 ############

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

	# push string "-------- Before -------\n" top=0
	movq $string3, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#Push Local var a
	movq 120(%rsp), %rbx

	# push 0
	movq $0,%r10
	#Push Local var n
	movq 128(%rsp), %r13

	# push 1
	movq $1,%r14

	# minus
	subq %r14, %r13
     # func=printArray nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call printArray
	movq %rax, %rbx
################# top = 0 ############
	#Push Local var a
	movq 120(%rsp), %rbx
	#Push Local var n
	movq 128(%rsp), %r10
     # func=quicksort nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksort
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "-------- After -------\n" top=0
	movq $string4, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#Push Local var a
	movq 120(%rsp), %rbx

	# push 0
	movq $0,%r10
	#Push Local var n
	movq 128(%rsp), %r13

	# push 1
	movq $1,%r14

	# minus
	subq %r14, %r13
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
	.string "%d\n"

string1:
	.string "==%s==\n"

string2:
	.string "Hello"

string3:
	.string "-------- Before -------\n"

string4:
	.string "-------- After -------\n"

