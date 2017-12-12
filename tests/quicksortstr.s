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

	# push string "%d: %s\n" top=1
	movq $string0, %r10
	#Push Local var i
	movq 104(%rsp), %r13
	#Push Local var i
	movq 104(%rsp), %r14
# Array Value
	movq 128(%rsp), %r15
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
.globl mystrcmp
mystrcmp:
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
while_start_1:

	# push 0
	movq $0,%rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $1, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	andq $255, %rbx

	# push 0
	movq $0,%r10
# Array Value
	movq 120(%rsp), %r13
	imulq $1, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	andq $255, %r10
	# logical AND operator
	andq %r10, %rbx

	# push 0
	movq $0,%r10
# Array Value
	movq 128(%rsp), %r13
	imulq $1, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	andq $255, %r10

	# push 0
	movq $0,%r13
# Array Value
	movq 120(%rsp), %r14
	imulq $1, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13
	andq $255, %r13
	# Equal Equal operator
	cmpq %r13, %r10
	je LC4
LC3:
	movq $0, %r10
	jmp LC5
LC4:
	movq $1, %r10
LC5:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je while_end_1
	#Push Local var s1
	movq 128(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var s1
	movq %rbx, 128(%rsp)
################# top = 0 ############
	#Push Local var s2
	movq 120(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var s2
	movq %rbx, 120(%rsp)
################# top = 0 ############
	jmp while_start_1
while_end_1:
	#start the if statement
if_statement_2:

	# push 0
	movq $0,%rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $1, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	andq $255, %rbx

	# push 0
	movq $0,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	je LC7
LC6:
	movq $0, %rbx
	jmp LC8
LC7:
	movq $1, %rbx
LC8:

	# push 0
	movq $0,%r10
# Array Value
	movq 120(%rsp), %r13
	imulq $1, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	andq $255, %r10

	# push 0
	movq $0,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	je LC10
LC9:
	movq $0, %r10
	jmp LC11
LC10:
	movq $1, %r10
LC11:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je if_else_2

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
	jmp if_end_2
if_else_2:
if_end_2:
	#start the if statement
if_statement_3:

	# push 0
	movq $0,%rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $1, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	andq $255, %rbx

	# push 0
	movq $0,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	je LC13
LC12:
	movq $0, %rbx
	jmp LC14
LC13:
	movq $1, %rbx
LC14:

	# push 0
	movq $0,%r10
# Array Value
	movq 120(%rsp), %r13
	imulq $1, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	andq $255, %r10

	# push 0
	movq $0,%r13
	# Not Equal operator
	cmpq %r13, %r10
	jne LC16
LC15:
	movq $0, %r10
	jmp LC17
LC16:
	movq $1, %r10
LC17:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je if_else_3

	# push -1
	movq $-1,%r10
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
	#start the if statement
if_statement_4:

	# push 0
	movq $0,%rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $1, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	andq $255, %rbx

	# push 0
	movq $0,%r10
	# Not Equal operator
	cmpq %r10, %rbx
	jne LC19
LC18:
	movq $0, %rbx
	jmp LC20
LC19:
	movq $1, %rbx
LC20:

	# push 0
	movq $0,%r10
# Array Value
	movq 120(%rsp), %r13
	imulq $1, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	andq $255, %r10

	# push 0
	movq $0,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	je LC22
LC21:
	movq $0, %r10
	jmp LC23
LC22:
	movq $1, %r10
LC23:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je if_else_4

	# push 1
	movq $1,%r10
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
	jmp if_end_4
if_else_4:
if_end_4:
	#start the if statement
if_statement_5:

	# push 0
	movq $0,%rbx
# Array Value
	movq 128(%rsp), %r10
	imulq $1, %rbx
	addq %rbx, %r10
	movq (%r10), %r10
	movq %r10, %rbx
	andq $255, %rbx

	# push 0
	movq $0,%r10
# Array Value
	movq 120(%rsp), %r13
	imulq $1, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
	andq $255, %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jg LC25
LC24:
	movq $0, %rbx
	jmp LC26
LC25:
	movq $1, %rbx
LC26:
	cmpq $0, %rbx
	je if_else_5

	# push 1
	movq $1,%r10
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
	jmp if_end_5
if_else_5:
if_end_5:

	# push -1
	movq $-1,%rbx
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
if_statement_6:
	#Push Local var left
	movq 120(%rsp), %rbx
	#Push Local var right
	movq 112(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jge LC28
LC27:
	movq $0, %rbx
	jmp LC29
LC28:
	movq $1, %rbx
LC29:
	cmpq $0, %rbx
	je if_else_6

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
	jmp if_end_6
if_else_6:
if_end_6:
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
while_start_7:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC31
LC30:
	movq $0, %rbx
	jmp LC32
LC31:
	movq $1, %rbx
LC32:
	cmpq $0, %rbx
	je while_end_7
while_start_8:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC34
LC33:
	movq $0, %rbx
	jmp LC35
LC34:
	movq $1, %rbx
LC35:
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
     # func=mystrcmp nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	call mystrcmp
	movq %rax, %r10

	# push 0
	movq $0,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC37
LC36:
	movq $0, %r10
	jmp LC38
LC37:
	movq $1, %r10
LC38:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je while_end_8
	#Push Local var l
	movq 96(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var l
	movq %rbx, 96(%rsp)
################# top = 0 ############
	jmp while_start_8
while_end_8:
while_start_9:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC40
LC39:
	movq $0, %rbx
	jmp LC41
LC40:
	movq $1, %rbx
LC41:
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
     # func=mystrcmp nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	call mystrcmp
	movq %rax, %r10

	# push 0
	movq $0,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jge LC43
LC42:
	movq $0, %r10
	jmp LC44
LC43:
	movq $1, %r10
LC44:
	# logical AND operator
	andq %r10, %rbx
	cmpq $0, %rbx
	je while_end_9
	#Push Local var g
	movq 88(%rsp), %rbx

	# push 1
	movq $1,%r10

	# minus
	subq %r10, %rbx
	#Assign to Local var g
	movq %rbx, 88(%rsp)
################# top = 0 ############
	jmp while_start_9
while_end_9:
	#start the if statement
if_statement_10:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC46
LC45:
	movq $0, %rbx
	jmp LC47
LC46:
	movq $1, %rbx
LC47:
	cmpq $0, %rbx
	je if_else_10
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
	jmp if_end_10
if_else_10:
if_end_10:
	jmp while_start_7
while_end_7:
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

	# push 6
	movq $6,%rbx
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
	#top=1

	# push string "Rachael" top=1
	movq $string2, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 1
	movq $1,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#top=1

	# push string "Monica" top=1
	movq $string3, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 2
	movq $2,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#top=1

	# push string "Phoebe" top=1
	movq $string4, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 3
	movq $3,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#top=1

	# push string "Joey" top=1
	movq $string5, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 4
	movq $4,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#top=1

	# push string "Ross" top=1
	movq $string6, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 5
	movq $5,%rbx
#dereference the pointer from here
	movq 120(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp
	#top=1

	# push string "Chandler" top=1
	movq $string7, %r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#top=0

	# push string "-------- Before -------\n" top=0
	movq $string8, %rbx
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
	movq $string9, %rbx
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
	.string "%d: %s\n"

string1:
	.string "==%s==\n"

string2:
	.string "Rachael"

string3:
	.string "Monica"

string4:
	.string "Phoebe"

string5:
	.string "Joey"

string6:
	.string "Ross"

string7:
	.string "Chandler"

string8:
	.string "-------- Before -------\n"

string9:
	.string "-------- After -------\n"

