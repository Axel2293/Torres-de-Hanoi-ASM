
compilar: algoritmo.c 
	gcc algoritmo.c -o hanoi_c.exec
	./hanoi_c.exec
	
execute: hanoi_c.exec
	./hanoi_c.exec

limpiar: hanoi_c.exec
	rm -f hanoi_c.exec
