	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"colour_space_conversion.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"rb\000"
	.align	2
.LC1:
	.ascii	"Unable to open file: %s. Exiting.\012\000"
	.text
	.align	2
	.global	get_bmp_info
	.type	get_bmp_info, %function
get_bmp_info:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #128
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-120]
	ldr	r0, [fp, #-120]
	ldr	r1, .L4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L4+4
	ldr	r1, [fp, #-120]
	bl	printf
	ldr	r0, [fp, #-28]
	bl	fclose
	mvn	r0, #0
	bl	exit
.L2:
	mov	r0, #60
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-24]
	bl	read_bmp_info
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-120]
	mov	r1, #0
	bl	open
	mov	r3, r0
	str	r3, [fp, #-12]
	sub	r3, fp, #116
	ldr	r0, [fp, #-12]
	mov	r1, r3
	bl	fstat
	ldr	r3, [fp, #-72]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	str	r3, [sp, #0]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r0, #0
	mov	r1, r2
	mov	r2, #1
	mov	r3, #1
	bl	mmap
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	memcpy
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #56]
	ldr	r0, [fp, #-12]
	bl	close
	ldr	r0, [fp, #-28]
	bl	fclose
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	.LC1
	.size	get_bmp_info, .-get_bmp_info
	.align	2
	.global	free_bmp_info
	.type	free_bmp_info, %function
free_bmp_info:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #56]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-8]
	bl	free
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	free_bmp_info, .-free_bmp_info
	.align	2
	.global	get_pixel_array
	.type	get_pixel_array, %function
get_pixel_array:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	mov	r0, #16
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #20]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #30
	add	r3, r2, r1
	and	r3, r3, #3
	rsb	r3, r1, r3
	and	r3, r3, #255
	ldr	r2, [fp, #-8]
	strb	r3, [r2, #10]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldrh	r2, [r3, #30]
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #56]
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	get_rgb_pixel_array
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	get_pixel_array, .-get_pixel_array
	.align	2
	.global	free_pixel_array
	.type	free_pixel_array, %function
free_pixel_array:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L11
.L12:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L12
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-16]
	bl	free
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	free_pixel_array, .-free_pixel_array
	.section	.rodata
	.align	2
.LC2:
	.ascii	"converted.bmp\000"
	.align	2
.LC3:
	.ascii	"wb\000"
	.text
	.align	2
	.global	write_to_bmp
	.type	write_to_bmp, %function
write_to_bmp:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, .L16
	ldr	r1, .L16+4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
	bl	write_bmp_info
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-20]
	bl	write_pixel_array
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L17:
	.align	2
.L16:
	.word	.LC2
	.word	.LC3
	.size	write_to_bmp, .-write_to_bmp
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Error allocating memory. Exiting.\000"
	.text
	.align	2
	.global	mmalloc
	.type	mmalloc, %function
mmalloc:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L19
	ldr	r0, .L21
	bl	puts
	mvn	r0, #0
	bl	exit
.L19:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L22:
	.align	2
.L21:
	.word	.LC4
	.size	mmalloc, .-mmalloc
	.align	2
	.type	read_bmp_info, %function
read_bmp_info:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #10
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #16
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #20
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #24
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #28
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #30
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #32
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #36
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #40
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #44
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #48
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	ldr	r3, [fp, #-12]
	add	r3, r3, #52
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fread
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	read_bmp_info, .-read_bmp_info
	.align	2
	.type	write_bmp_info, %function
write_bmp_info:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #10
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #16
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #20
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #24
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #28
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #30
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #32
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #36
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #40
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #44
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #48
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #52
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-8]
	bl	fwrite
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	write_bmp_info, .-write_bmp_info
	.align	2
	.type	write_pixel_array, %function
write_pixel_array:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #48
	strb	r3, [fp, #-17]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L28
.L33:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L29
.L30:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	add	r3, r3, #2
	mov	r0, r3
	mov	r1, #1
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fwrite
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	add	r3, r3, #1
	mov	r0, r3
	mov	r1, #1
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fwrite
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, #1
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L29:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bgt	.L30
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L31
.L32:
	sub	r3, fp, #17
	mov	r0, r3
	mov	r1, #1
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fwrite
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L31:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L32
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L28:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L33
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	write_pixel_array, .-write_pixel_array
	.global	__aeabi_ui2f
	.global	__aeabi_fdiv
	.align	2
	.type	get_rgb_pixel_array, %function
get_rgb_pixel_array:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #52
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #4]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L36
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L37
.L36:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-48]
.L37:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #0]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L39
.L38:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-52]
.L39:
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #12
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L40
.L45:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r4, r3, r2
	ldr	r3, [fp, #-52]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r0, r3
	bl	mmalloc
	mov	r3, r0
	str	r3, [r4, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L41
.L42:
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_ui2f
	mov	r3, r0
	ldr	r2, .L53	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #8]	@ float
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_ui2f
	mov	r3, r0
	ldr	r2, .L53	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #4]	@ float
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_ui2f
	mov	r3, r0
	ldr	r2, .L53	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r2, [fp, #-28]
	mov	ip, r3
	mov	r3, r2
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L41:
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L42
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L43
.L44:
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L43:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L44
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L40:
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L45
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L46
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L47
.L48:
	ldr	r3, [fp, #-48]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r0, r1, r3
	ldr	r3, [fp, #-48]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	mov	ip, r0
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L47:
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L48
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #4]
.L46:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L49
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L50
.L51:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-52]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r0, r1, r3
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-52]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r3, r1, r3
	mov	ip, r0
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L50:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	blt	.L51
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-52]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-52]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #30
	add	r3, r2, r1
	and	r3, r3, #3
	rsb	r3, r1, r3
	and	r3, r3, #255
	ldr	r2, [fp, #-60]
	strb	r3, [r2, #10]
.L49:
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-28]
	bl	free
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L54:
	.align	2
.L53:
	.word	1132462080
	.size	get_rgb_pixel_array, .-get_rgb_pixel_array
	.global	__aeabi_fmul
	.global	__aeabi_f2iz
	.global	__aeabi_i2f
	.global	__aeabi_fadd
	.align	2
	.global	convert_rgb_to_ycc
	.type	convert_rgb_to_ycc, %function
convert_rgb_to_ycc:
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #116
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-104]
	str	r1, [fp, #-108]
	ldr	r3, [fp, #-108]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-96]
	ldr	r3, .L61
	str	r3, [fp, #-92]
	ldr	r3, .L61+4
	str	r3, [fp, #-88]
	ldr	r3, .L61+8
	str	r3, [fp, #-84]
	ldr	r3, .L61+12
	str	r3, [fp, #-80]
	ldr	r3, .L61+16
	str	r3, [fp, #-76]
	ldr	r3, .L61+20
	str	r3, [fp, #-72]
	ldr	r3, .L61+24
	str	r3, [fp, #-68]
	mvn	r3, #580
	str	r3, [fp, #-64]
	ldr	r3, .L61+28	@ float
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-104]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-104]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L56
.L59:
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L57
.L58:
	mov	r3, #0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #4]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-92]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-88]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-52]
	add	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #4]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-52]
	add	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-92]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-88]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #4]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-92]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-88]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-52]
	add	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #4]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-96]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	ldr	r2, .L61+32	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-52]
	add	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-92]
	ldr	r2, [fp, #-120]
	mul	r2, r3, r2
	ldr	r3, [fp, #-88]
	ldr	r1, [fp, #-116]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-112]
	mul	r3, r1, r3
	add	r3, r2, r3
	mov	r2, r3, asr #12
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	mov	r3, r3, asr #2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-56]
	mov	r3, r3, asr #2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-52]
	mov	r3, r3, asr #2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-104]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r0, [fp, #-60]
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r2, [fp, #-48]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r2, .L61+36	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [r4, #0]	@ float
	ldr	r3, [fp, #-104]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r0, [fp, #-56]
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r2, [fp, #-48]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r2, .L61+40	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [r4, #4]	@ float
	ldr	r3, [fp, #-104]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-44]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r0, [fp, #-52]
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r2, [fp, #-48]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r2, .L61+40	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [r4, #8]	@ float
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L57:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcc	.L58
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L56:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bcc	.L59
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L62:
	.align	2
.L61:
	.word	2105
	.word	4128
	.word	802
	.word	-1212
	.word	-2383
	.word	3596
	.word	-3014
	.word	973078528
	.word	1149239296
	.word	1098907648
	.word	1124073472
	.size	convert_rgb_to_ycc, .-convert_rgb_to_ycc
	.align	2
	.global	allocate_ycc_array
	.type	allocate_ycc_array, %function
allocate_ycc_array:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-32]
	mov	r0, #16
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #4]
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #0]
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L64
.L65:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r4, r3, r2
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r0, r3
	bl	mmalloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L64:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L65
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	allocate_ycc_array, .-allocate_ycc_array
	.align	2
	.global	free_ycc_array
	.type	free_ycc_array, %function
free_ycc_array:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L68
.L69:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L68:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L69
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-16]
	bl	free
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	free_ycc_array, .-free_ycc_array
	.align	2
	.global	allocate_rgb_array
	.type	allocate_rgb_array, %function
allocate_rgb_array:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	mov	r0, #16
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #10]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	mmalloc
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L72
.L73:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r4, r3, r2
	ldr	r2, [fp, #-36]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r0, r3
	bl	mmalloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L72:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L73
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	allocate_rgb_array, .-allocate_rgb_array
	.align	2
	.global	free_rgb_array
	.type	free_rgb_array, %function
free_rgb_array:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L76
.L77:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L76:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L77
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-16]
	bl	free
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	free_rgb_array, .-free_rgb_array
	.global	__aeabi_fsub
	.global	__aeabi_f2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.global	__aeabi_f2uiz
	.align	2
	.global	convert_ycc_to_rgb
	.type	convert_ycc_to_rgb, %function
convert_ycc_to_rgb:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #52
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L80
.L83:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L81
.L82:
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-64]	@ float
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	str	r3, [fp, #-60]	@ float
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #4]	@ float
	str	r3, [fp, #-56]	@ float
	ldr	r3, [fp, #-64]	@ float
	ldr	r2, .L85+40	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r7, r3
	mov	r8, r4
	ldr	r3, [fp, #-60]	@ float
	ldr	r2, .L85+44	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85+8
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r7
	mov	r1, r8
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [fp, #-52]	@ float
	ldr	r3, [fp, #-64]	@ float
	ldr	r2, .L85+40	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r7, r3
	mov	r8, r4
	ldr	r3, [fp, #-60]	@ float
	ldr	r2, .L85+44	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85+16
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r7
	mov	r1, r8
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r7, r3
	mov	r8, r4
	ldr	r3, [fp, #-56]	@ float
	ldr	r2, .L85+44	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85+24
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r7
	mov	r1, r8
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-64]	@ float
	ldr	r2, .L85+40	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r7, r3
	mov	r8, r4
	ldr	r3, [fp, #-56]	@ float
	ldr	r2, .L85+44	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L85+32
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r7
	mov	r1, r8
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-52]	@ float
	ldr	r2, .L85+48	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2uiz
	mov	r3, r0
	strb	r3, [fp, #-31]
	ldr	r3, [fp, #-48]	@ float
	ldr	r2, .L85+48	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2uiz
	mov	r3, r0
	strb	r3, [fp, #-30]
	ldr	r3, [fp, #-44]	@ float
	ldr	r2, .L85+48	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2uiz
	mov	r3, r0
	strb	r3, [fp, #-29]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-31]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-30]
	strb	r3, [r2, #1]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-29]
	strb	r3, [r2, #2]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	b	.L86
.L87:
	.align	3
.L85:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	-1821066134
	.word	-1075182568
	.word	-584115552
	.word	-1076296156
	.word	790273982
	.word	1073751261
	.word	1098907648
	.word	1124073472
	.word	1132462080
.L86:
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3
	add	r2, r1, r3
	ldrb	r3, [fp, #-31]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3
	add	r2, r1, r3
	ldrb	r3, [fp, #-30]
	strb	r3, [r2, #1]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #3
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3
	add	r2, r1, r3
	ldrb	r3, [fp, #-29]
	strb	r3, [r2, #2]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-31]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-30]
	strb	r3, [r2, #1]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-29]
	strb	r3, [r2, #2]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3
	add	r2, r1, r3
	ldrb	r3, [fp, #-31]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3
	add	r2, r1, r3
	ldrb	r3, [fp, #-30]
	strb	r3, [r2, #1]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3
	add	r2, r1, r3
	ldrb	r3, [fp, #-29]
	strb	r3, [r2, #2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L81:
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L82
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L80:
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L83
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, pc}
	.size	convert_ycc_to_rgb, .-convert_ycc_to_rgb
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Usage: ./csc <bmp_file_name>\000"
	.align	2
.LC6:
	.ascii	"Can only read 24bpp bmp files to convert from rgb t"
	.ascii	"o ycc.\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	beq	.L89
	ldr	r0, .L93
	bl	puts
	mvn	r0, #0
	bl	exit
.L89:
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	get_bmp_info
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	get_pixel_array
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldrh	r3, [r3, #8]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #24
	bne	.L90
	ldr	r0, [fp, #-16]
	bl	allocate_ycc_array
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-16]
	bl	convert_rgb_to_ycc
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	mov	r0, r2
	mov	r2, r3
	bl	allocate_rgb_array
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-8]
	bl	convert_ycc_to_rgb
	ldr	r0, [fp, #-12]
	bl	free_ycc_array
	ldr	r0, [fp, #-8]
	bl	free_rgb_array
	b	.L91
.L90:
	ldr	r0, .L93+4
	bl	puts
.L91:
	ldr	r0, [fp, #-20]
	bl	free_bmp_info
	ldr	r0, [fp, #-16]
	bl	free_pixel_array
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L94:
	.align	2
.L93:
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
