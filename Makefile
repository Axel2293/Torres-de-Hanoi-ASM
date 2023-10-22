
all: compile exec

compile: algoritmo.c 
	gcc algoritmo.c -o hanoi_c.exec

exec: compile
	./hanoi_c.exec

clean: hanoi_c.exec
	rm -f hanoi_c.exec
