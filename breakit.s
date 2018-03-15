.data

# Line 2: mov:int


	.comm _mov 4, 4

# Line 3: x:int


	.comm _x 4, 4

# Line 4: y:int



	.comm _y 4, 4
.text
.global main
main:

# Line 9: mov:=12*in.readint()

	pushl $12 

# Line 9: in.readint()

	call readint 
	pushl %eax 
	popl %ebx 
	popl %eax 
	xorl %ecx, %ecx
	movl %eax, %edx
	imull %ebx, %edx
	movl %edx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _mov

# 10: out.writeint(mov)

	pushl _mov 
	call writeint 
	addl $4, %esp

# Line 12: mov:=mov/-1

	pushl _mov 
	pushl $-1 
	popl %ebx 
	popl %eax 
	movl %ebx, %ecx
	cltd  
	idivl %ecx 
	pushl %eax 
	popl %eax 
	movl %eax, _mov

# 13: out.writeint(mov)

	pushl _mov 
	call writeint 
	addl $4, %esp

# Line 15: mov:=mov*-1

	pushl _mov 
	pushl $-1 
	popl %ebx 
	popl %eax 
	xorl %ecx, %ecx
	movl %eax, %edx
	imull %ebx, %edx
	movl %edx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _mov

# 16: out.writeint(mov)

	pushl _mov 
	call writeint 
	addl $4, %esp

# Line 18: if(true)then

	pushl $1 
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_0 
	jmp _IF_false_1 
_IF_true_0:

# Line 19: x:=1

	pushl $1 
	popl %eax 
	movl %eax, _x

# Line 20: loopwhilenot(x>3)

WHILE_top_3:
	pushl _x 
	pushl $3 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_6 
	pushl $1 
	jmp .DONE_7 
.GR_false_6:
	pushl $0 
.DONE_7:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	cmpl $0, %eax
	jne WHILE_start_4 
	jmp WHILE_end_5 
WHILE_start_4:

# Line 21: y:=2

	pushl $2 
	popl %eax 
	movl %eax, _y

# Line 22: loopwhiley>-2

WHILE_top_8:
	pushl _y 
	pushl $-2 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_11 
	pushl $1 
	jmp .DONE_12 
.GR_false_11:
	pushl $0 
.DONE_12:
	popl %eax 
	cmpl $0, %eax
	jne WHILE_start_9 
	jmp WHILE_end_10 
WHILE_start_9:

# Line 23: y:=y-1

	pushl _y 
	pushl $1 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _y

# Line 24: ifnot(y>=0)then

	pushl _y 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jl .GRE_false_13 
	pushl $1 
	jmp .DONE_14 
.GRE_false_13:
	pushl $0 
.DONE_14:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_15 
	jmp _IF_false_16 
_IF_true_15:

# 25: out.writeint(y)

	pushl _y 
	call writeint 
	addl $4, %esp
	jmp _IF_done_17 
_IF_false_16:
_IF_done_17:
	jmp WHILE_top_8 
WHILE_end_10:

# 28: out.writeint(x)

	pushl _x 
	call writeint 
	addl $4, %esp

# Line 29: x:=x+1

	pushl _x 
	pushl $1 
	popl %ebx 
	popl %eax 
	addl %ebx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _x
	jmp WHILE_top_3 
WHILE_end_5:
	jmp _IF_done_2 
_IF_false_1:
_IF_done_2:
	pushl $0 
	call exit 
