.data

# Line 6: x:int


	.comm _x 4, 4

# Line 7: div:int


	.comm _div 4, 4

# Line 8: good:boolean



	.comm _good 4, 4
.text
.global main
main:

# Line 12: x:=in.readint()


# Line 12: in.readint()

	call readint 
	pushl %eax 
	popl %eax 
	movl %eax, _x

# Line 13: loopwhilenot(x=0)

WHILE_top_0:
	pushl _x 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %eax, %ebx
	jne .EQ_false_3 
	pushl $1 
	jmp .DONE_4 
.EQ_false_3:
	pushl $0 
.DONE_4:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	cmpl $0, %eax
	jne WHILE_start_1 
	jmp WHILE_end_2 
WHILE_start_1:

# Line 14: good:=true

	pushl $1 
	popl %eax 
	movl %eax, _good

# Line 17: ifnot(x>1)then

	pushl _x 
	pushl $1 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_5 
	pushl $1 
	jmp .DONE_6 
.GR_false_5:
	pushl $0 
.DONE_6:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_7 
	jmp _IF_false_8 
_IF_true_7:

# Line 18: good:=false

	pushl $0 
	popl %eax 
	movl %eax, _good
	jmp _IF_done_9 
_IF_false_8:

# Line 22: ifnot(x>3)then

	pushl _x 
	pushl $3 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_10 
	pushl $1 
	jmp .DONE_11 
.GR_false_10:
	pushl $0 
.DONE_11:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_12 
	jmp _IF_false_13 
_IF_true_12:

# Line 23: good:=true

	pushl $1 
	popl %eax 
	movl %eax, _good
	jmp _IF_done_14 
_IF_false_13:

# Line 27: if(x-(x/2)*2)=0or(x-(x/3)*3)=0then

	pushl _x 
	pushl _x 
	pushl $2 
	popl %ebx 
	popl %eax 
	xorl %edx, %edx
	movl %ebx, %ecx
	cltd  
	idivl %ecx 
	pushl %eax 
	pushl $2 
	popl %ebx 
	popl %eax 
	imull %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %eax, %ebx
	jne .EQ_false_15 
	pushl $1 
	jmp .DONE_16 
.EQ_false_15:
	pushl $0 
.DONE_16:
	pushl _x 
	pushl _x 
	pushl $3 
	popl %ebx 
	popl %eax 
	xorl %edx, %edx
	movl %ebx, %ecx
	cltd  
	idivl %ecx 
	pushl %eax 
	pushl $3 
	popl %ebx 
	popl %eax 
	imull %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %eax, %ebx
	jne .EQ_false_17 
	pushl $1 
	jmp .DONE_18 
.EQ_false_17:
	pushl $0 
.DONE_18:
	popl %ebx 
	popl %eax 
	cmpl $0, %eax
	jne .OR_true_19 
	cmpl $0, %ebx
	jne .OR_true_19 
	pushl $0 
	jmp .DONE_20 
.OR_true_19:
	pushl $1 
.DONE_20:
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_21 
	jmp _IF_false_22 
_IF_true_21:

# Line 28: good:=false

	pushl $0 
	popl %eax 
	movl %eax, _good
	jmp _IF_done_23 
_IF_false_22:

# Line 31: div:=5

	pushl $5 
	popl %eax 
	movl %eax, _div

# Line 32: loopwhilenot(div*div>=x)

WHILE_top_24:
	pushl _div 
	pushl _div 
	popl %ebx 
	popl %eax 
	imull %ebx, %eax
	pushl %eax 
	pushl _x 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jl .GRE_false_27 
	pushl $1 
	jmp .DONE_28 
.GRE_false_27:
	pushl $0 
.DONE_28:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	cmpl $0, %eax
	jne WHILE_start_25 
	jmp WHILE_end_26 
WHILE_start_25:

# Line 33: if(x-(x/div)*div)=0or(x-(x/(div+2))*(div+2))=0then

	pushl _x 
	pushl _x 
	pushl _div 
	popl %ebx 
	popl %eax 
	xorl %edx, %edx
	movl %ebx, %ecx
	cltd  
	idivl %ecx 
	pushl %eax 
	pushl _div 
	popl %ebx 
	popl %eax 
	imull %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %eax, %ebx
	jne .EQ_false_29 
	pushl $1 
	jmp .DONE_30 
.EQ_false_29:
	pushl $0 
.DONE_30:
	pushl _x 
	pushl _x 
	pushl _div 
	pushl $2 
	popl %ebx 
	popl %eax 
	addl %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	xorl %edx, %edx
	movl %ebx, %ecx
	cltd  
	idivl %ecx 
	pushl %eax 
	pushl _div 
	pushl $2 
	popl %ebx 
	popl %eax 
	addl %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	imull %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %eax, %ebx
	jne .EQ_false_31 
	pushl $1 
	jmp .DONE_32 
.EQ_false_31:
	pushl $0 
.DONE_32:
	popl %ebx 
	popl %eax 
	cmpl $0, %eax
	jne .OR_true_33 
	cmpl $0, %ebx
	jne .OR_true_33 
	pushl $0 
	jmp .DONE_34 
.OR_true_33:
	pushl $1 
.DONE_34:
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_35 
	jmp _IF_false_36 
_IF_true_35:

# Line 34: good:=false

	pushl $0 
	popl %eax 
	movl %eax, _good
	jmp _IF_done_37 
_IF_false_36:
_IF_done_37:

# Line 36: div:=div+6

	pushl _div 
	pushl $6 
	popl %ebx 
	popl %eax 
	addl %ebx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _div
	jmp WHILE_top_24 
WHILE_end_26:
_IF_done_23:
_IF_done_14:
_IF_done_9:

# Line 43: ifgoodthen

	pushl _good 
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_38 
	jmp _IF_false_39 
_IF_true_38:

# 44: out.writeint(1)

	pushl $1 
	call writeint 
	addl $4, %esp
	jmp _IF_done_40 
_IF_false_39:

# 46: out.writeint(0)

	pushl $0 
	call writeint 
	addl $4, %esp
_IF_done_40:

# Line 49: x:=in.readint()


# Line 49: in.readint()

	call readint 
	pushl %eax 
	popl %eax 
	movl %eax, _x
	jmp WHILE_top_0 
WHILE_end_2:
	pushl $0 
	call exit 
