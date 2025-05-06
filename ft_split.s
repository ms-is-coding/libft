	.text
	.file	"ft_split.c"
	.globl	ft_split                        # -- Begin function ft_split
	.p2align	4, 0x90
	.type	ft_split,@function
ft_split:                               # @ft_split
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movb	%sil, %al
	movq	%rdi, -16(%rbp)
	movb	%al, -17(%rbp)
	movl	$0, -40(%rbp)
	movq	-16(%rbp), %rdi
	movsbl	-17(%rbp), %esi
	callq	ft_count_words
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.LBB0_2
# %bb.1:
	movq	$0, -8(%rbp)
	jmp	.LBB0_13
.LBB0_2:
	jmp	.LBB0_3
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB0_12
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_5
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-16(%rbp), %rax
	movsbl	(%rax), %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, %ecx
	movb	%al, -45(%rbp)                  # 1-byte Spill
	je	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	movq	-16(%rbp), %rdi
	movsbl	-17(%rbp), %esi
	callq	ft_is_sep
	cmpl	$0, %eax
	setne	%al
	movb	%al, -45(%rbp)                  # 1-byte Spill
.LBB0_7:                                #   in Loop: Header=BB0_5 Depth=2
	movb	-45(%rbp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_8
	jmp	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_5 Depth=2
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB0_5
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=1
	movq	-16(%rbp), %rdi
	movsbl	-17(%rbp), %esi
	callq	ft_count_letters
	movl	%eax, -44(%rbp)
	movq	-16(%rbp), %rdi
	movl	-44(%rbp), %esi
	callq	ft_strndup
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movq	-32(%rbp), %rax
	movslq	-40(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	jne	.LBB0_11
# %bb.10:
	movq	$0, -8(%rbp)
	jmp	.LBB0_13
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=1
	movl	-44(%rbp), %ecx
	movq	-16(%rbp), %rax
	movslq	%ecx, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB0_3
.LBB0_12:
	movq	-32(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	$0, (%rax,%rcx,8)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB0_13:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	ft_split, .Lfunc_end0-ft_split
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function ft_count_words
	.type	ft_count_words,@function
ft_count_words:                         # @ft_count_words
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movl	$0, -20(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	je	.LBB1_5
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movsbl	-9(%rbp), %esi
	callq	ft_is_sep
	cmpl	$0, %eax
	je	.LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movsbl	-9(%rbp), %esi
	callq	ft_count_letters
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %ecx
	movq	-8(%rbp), %rax
	movslq	%ecx, %rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -16(%rbp)
	je	.LBB1_7
# %bb.6:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_8:
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	ft_count_words, .Lfunc_end1-ft_count_words
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function ft_is_sep
	.type	ft_is_sep,@function
ft_is_sep:                              # @ft_is_sep
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%sil, %al
	movq	%rdi, -16(%rbp)
	movb	%al, -17(%rbp)
	movq	-16(%rbp), %rax
	movsbl	(%rax), %eax
	movsbl	-17(%rbp), %ecx
	cmpl	%ecx, %eax
	jne	.LBB2_2
# %bb.1:
	movl	$1, -4(%rbp)
	jmp	.LBB2_3
.LBB2_2:
	movl	$0, -4(%rbp)
.LBB2_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	ft_is_sep, .Lfunc_end2-ft_is_sep
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function ft_count_letters
	.type	ft_count_letters,@function
ft_count_letters:                       # @ft_count_letters
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movl	$0, -16(%rbp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movsbl	(%rax,%rcx), %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, %ecx
	movb	%al, -17(%rbp)                  # 1-byte Spill
	je	.LBB3_3
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rdi
	movslq	-16(%rbp), %rax
	addq	%rax, %rdi
	movsbl	-9(%rbp), %esi
	callq	ft_is_sep
	cmpl	$0, %eax
	setne	%al
	xorb	$-1, %al
	movb	%al, -17(%rbp)                  # 1-byte Spill
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	movb	-17(%rbp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	.LBB3_4
	jmp	.LBB3_5
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB3_1
.LBB3_5:
	movl	-16(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	ft_count_letters, .Lfunc_end3-ft_count_letters
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function ft_strndup
	.type	ft_strndup,@function
ft_strndup:                             # @ft_strndup
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	shlq	$0, %rdi
	callq	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.LBB4_2
# %bb.1:
	movq	$0, -8(%rbp)
	jmp	.LBB4_6
.LBB4_2:
	movq	-32(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movb	$0, (%rax,%rcx)
.LBB4_3:                                # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	addl	$-1, %ecx
	movl	%ecx, -20(%rbp)
	cmpl	$0, %eax
	je	.LBB4_5
# %bb.4:                                #   in Loop: Header=BB4_3 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movb	(%rax,%rcx), %dl
	movq	-32(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movb	%dl, (%rax,%rcx)
	jmp	.LBB4_3
.LBB4_5:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB4_6:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	ft_strndup, .Lfunc_end4-ft_strndup
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 12.0.1-19ubuntu3"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ft_count_words
	.addrsig_sym malloc
	.addrsig_sym ft_is_sep
	.addrsig_sym ft_count_letters
	.addrsig_sym ft_strndup
