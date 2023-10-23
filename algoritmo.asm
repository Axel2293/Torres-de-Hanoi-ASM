
.text
	# n - total of disks
	addi s0, zero, 3
	# Ram - First tower 
	lui s1, 0x10010
	addi t0, zero, 4
	# Number bytes for every tower n * 4 (int)
	mul t0, t0, s0 
	
	# Second tower
	add s2, s1, t0
	# third tower
	add s3, s2, t0
	
	## INIT FIRST TOWER WITH DISKS
	addi t1, t1, 1
for:	blt s0, t1, next1
	sw t1, 0(s1)
	addi s1, s1, 4
	addi t1, t1, 1
	jal for
	
next1:	sub s1, s1, t0
	jal hanoi

hanoi:	

exit: nop
	
	
	
	
	