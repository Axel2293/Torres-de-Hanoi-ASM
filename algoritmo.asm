
.text
	# n - total of disks
	addi s0, zero, 3
	#CONSTANT of disks
	add s7, zero, s0
		# Ram - First tower 
		lui s1, 0x10010
	
	# Size of disk number
	addi t0, zero, 4
	#OFFSET Number bytes for every tower n * 4 (int)
	mul t1, t0, s0 
	
		# Towers top
		# Second tower
		add s2, s1, t1
		# third tower
		add s3, s2, t1
	
	# OFFSET to move to last value in the tower
	sub t4, t1, t0
	
	# POP DISK VALUE
	addi s4, zero, 0
	
	# temporal pointer to tower
	addi s5, zero, 0
	
	# TOTAL MOVES
	addi s6, zero, 0
	
	## INIT FIRST TOWER WITH DISKS
	addi t2, zero, 1
for:	blt s0, t2, next
	sw t2, 0(s1)
	addi s1, s1, 4
	addi t2, t2, 1
	jal for

	
next:	sub s1, s1, t1
	jal hanoi
	jal exit

hanoi:	
	addi t2, zero, 1
	if:	bne s0, t2, next2
		
		add t5, ra, zero
		# Take disk from origin and move to destiny
		jal pop
		jal push
		addi s6, s6, 1
		
		# Return
		jalr t5	
	
	next2:	
	# FIRST RECURSIVE CALL
		# PUSH
		# 20 bytes to store n, ra, s1, s2, s3
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
		
		# STORE RA before pop and push
		addi sp, sp, -4
		sw ra, 0(sp)
		jal pop
		jal push
		addi s6, s6, 1
		lw ra, 0(sp)
		addi sp, sp, 4
		
		
	# SECOND RECURSIVE CALL
		# PUSH
		# 20 bytes to store n, ra, s1, s2, s3
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
		
		
		

# Always push to Tower 3 - Destiny
push: 	addi sp, sp, -4
	sw ra, 0(sp)
	addi t2, zero, 0 # i
	add s5, s3, t4
	for2:	blt s7,t2, next3
		lw t6, 0(s5)
		
		ifph:	bne t6, zero, elseph
			sw s4, 0(s5)
			jal next3
		elseph:	addi t2, t2, 1
			addi s5, s5, -4
			jal for2
	next3: 	lw ra, 0(sp)
		addi sp, sp, 4
		jalr ra
	


#sw s4, 0(s3)
#addi s3, s3, -4
#jalr ra
	

# Always pop from Tower 1 - Origin
pop:	addi sp, sp, -4
	sw ra, 0(sp)
	addi t2, zero, 0 # i
	add s5, s1, zero # s5 -> origin tower-start-top
	
	for3:	blt s7,t2, next4
		lw t6, 0(s5)
		ifpop:	beq t6, zero, elsepop
			lw s4, 0(s5)
			sw zero, 0(s5)
			jal next4
		elsepop:addi t2, t2, 1
			addi s5, s5, 4
			jal for3
	next4: 	lw ra, 0(sp)
		addi sp, sp, 4
		jalr ra

	#lw s4, 0(s1)
	#sw zero, 0(s1)
	#addi s1, s1, 4
	#jalr ra

exit: nop
	
	
	
	
	