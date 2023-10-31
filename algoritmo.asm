# Authors: 	Axel Escoto Garcia
#			Roberto Mancilla

#			Practica 1: Arquitectura y organizacion de computadoras
#			Torres de Hanoi en ASM
#
#

.text
	# n - total of disks
	addi s0, zero, 3
	# Size of disk number
	addi t0, zero, 4
	#OFFSET Number bytes for every tower n * 4 (int)
	slli t1, s0, 2 
	# Towers top
		# First tower 
		lui s1, 0x10010
		# Second tower
		add s2, s1, t1
		# third tower
		add s3, s2, t1
	# OFFSET to move to last value in the tower (n-1*4)
	sub t4, t1, t0
	# MOVE T2 and T3 to last space or top of empty stack
	add s2, s2, t1
	add s3, s3, t1
	
	# TOTAL MOVES
	addi s6, zero, 0
	
	## INIT FIRST TOWER WITH DISKS
	addi t2, zero, 1
for:	blt s0, t2, next
	sw t2, 0(s1)
	addi s1, s1, 4
	addi t2, t2, 1
	jal zero, for
	
next:	sub s1, s1, t1
	jal hanoi
	jal exit

hanoi:	
	#addi t2, zero, 1
	if:	bne s0, t2, next2
		# Take disk from origin and move to destiny
		sw zero, 0(s1)
		addi s1, s1, 4
		addi s3, s3, -4
		sw s0, 0(s3)
		
		# Add one disk move
		addi s6, s6, 1
		
		# Return
		jalr ra	
	
	next2:	
	# FIRST RECURSIVE CALL
		# PUSH
		# 8 bytes to store n and ra
		addi sp ,sp, -8
		sw s0, 0(sp)
		sw ra, 4(sp)
		
		addi s0, s0, -1 # N-1
		add t5, s2, zero # SWAP AUX to DESTINY
		add s2, s3, zero
		add s3, t5, zero

		jal hanoi

		add t5, s2, zero # SWAP AUX to DESTINY
		add s2, s3, zero
		add s3, t5, zero
		
		#POP
		lw s0, 0(sp)
		lw ra, 4(sp)
		
		addi sp, sp 8
		
	# Move disk Origin to Dest
		sw zero, 0(s1)
		addi s1, s1, 4
		addi s3, s3, -4
		sw s0, 0(s3)

		# Add one disk move
		addi s6, s6, 1
		
		
	# SECOND RECURSIVE CALL
		# PUSH
		# 8 bytes to store n, ra
		addi sp ,sp, -8
		sw s0, 0(sp)
		sw ra, 4(sp)

		add t5, s1, zero # SWAP ORIGIN to AUX
		add s1, s2, zero
		add s2, t5, zero

		addi s0, s0, -1 # N-1
		
		jal hanoi
		
		add t5, s1, zero # SWAP ORIGIN to AUX
		add s1, s2, zero
		add s2, t5, zero
		#POP
		lw s0, 0(sp)
		lw ra, 4(sp)

		
		addi sp, sp 8
		
		jalr ra
	
	
	
	
	
