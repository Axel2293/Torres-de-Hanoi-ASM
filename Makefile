compileall: compilewin compilemac
runwin: exe
runmac: exec

mac: compilemac exec

win: compilewin exe

compilemac: algoritmo.c 
	gcc algoritmo.c -o hanoi_c.exec

compilewin: algoritmo.c 
	gcc algoritmo.c -o hanoi_c.exe

exec: compile
	./hanoi_c.exec

exe: compilewin
	./hanoi_c.exe

cleanwin: hanoi_c.exe
	rm -f hanoi_c.exe

cleanmac: hanoi_c.exec
	rm -f hanoi_c.exec
