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
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
for_evaluation_0:
	movq i, %rbx

	# push 15
	movq $15,%r10
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
	movq i, %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
	jmp for_evaluation_0
for_statement_0:
	#top=1

	# push string "i=%d\n" top=1
	movq $string0, %r10
	movq i, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	#start the if statement
if_statement_1:
	movq i, %rbx

	# push 6
	movq $6,%r10
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
	je if_else_1
	movq i, %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
################# top = 0 ############
###################handling break############################
	jmp for_update_0
	jmp if_end_1
if_else_1:
if_end_1:
	jmp for_update_0
for_endAll_0:
	#top=0

	# push string "for i=%d\n" top=0
	movq $string1, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
################# top = 0 ############
while_start_2:
	movq i, %rbx

	# push 15
	movq $15,%r10
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
	#top=0

	# push string "i=%d\n" top=0
	movq $string2, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#start the if statement
if_statement_3:
	movq i, %rbx

	# push 8
	movq $8,%r10
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
	je if_else_3
	movq i, %r10

	# push 2
	movq $2,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
################# top = 0 ############
###################handling break############################
	jmp while_start_2
	jmp if_end_3
if_else_3:
if_end_3:
	movq i, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var i
	movq %rbx, i
################# top = 0 ############
	jmp while_start_2
while_end_2:
	#top=0

	# push string "while i=%d\n" top=0
	movq $string3, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
################# top = 0 ############
	#start the Do While statement
do_statement_4:
	#top=0

	# push string "i=%d\n" top=0
	movq $string4, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#start the if statement
if_statement_5:
	movq i, %rbx

	# push 10
	movq $10,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC13
LC12:
	movq $0, %rbx
	jmp LC14
LC13:
	movq $1, %rbx
LC14:
	cmpq $0, %rbx
	je if_else_5
	movq i, %r10

	# push 2
	movq $2,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
################# top = 0 ############
###################handling break############################
	jmp do_update_4
	jmp if_end_5
if_else_5:
if_end_5:
	movq i, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var i
	movq %rbx, i
################# top = 0 ############
do_update_4:
	movq i, %rbx

	# push 15
	movq $15,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC16
LC15:
	movq $0, %rbx
	jmp LC17
LC16:
	movq $1, %rbx
LC17:
	cmpq $1, %rbx
	je do_statement_4
do_endAll_4:
	#top=1

	# push string "do/while i=%d\n" top=1
	movq $string5, %r10
	movq i, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	#top=0

	# push string "OK\n" top=0
	movq $string6, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
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
	.string "i=%d\n"

string1:
	.string "for i=%d\n"

string2:
	.string "i=%d\n"

string3:
	.string "while i=%d\n"

string4:
	.string "i=%d\n"

string5:
	.string "do/while i=%d\n"

string6:
	.string "OK\n"

