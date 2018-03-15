.data

# Line 8: x:int



	.comm _x 4, 4
.text
.global main
main:

# Line 12: x:=in.readint()


# Line 12: in.readint()

	call readint 
	pushl %eax 
	popl %eax 
	movl %eax, _x

# Line 13: if(x>0)then

	pushl _x 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_0 
	pushl $1 
	jmp .DONE_1 
.GR_false_0:
	pushl $0 
.DONE_1:
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_2 
	jmp _IF_false_3 
_IF_true_2:

# 14: out.writeint(1)

	pushl $1 
	call writeint 
	addl $4, %esp
	jmp _IF_done_4 
_IF_false_3:

# Line 16: if(x=0)then

	pushl _x 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %eax, %ebx
	jne .EQ_false_5 
	pushl $1 
	jmp .DONE_6 
.EQ_false_5:
	pushl $0 
.DONE_6:
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_7 
	jmp _IF_false_8 
_IF_true_7:

# 17: out.writeint(0)

	pushl $0 
	call writeint 
	addl $4, %esp
	jmp _IF_done_9 
_IF_false_8:

# 19: out.writeint(-1)

	pushl $-1 
	call writeint 
	addl $4, %esp
_IF_done_9:

# 21: out.writeint(9)

	pushl $9 
	call writeint 
	addl $4, %esp
_IF_done_4:

# 23: out.writeint(9)

	pushl $9 
	call writeint 
	addl $4, %esp
	pushl $0 
	call exit 
