# Torres-de-Hanoi-ASM
Algoritmo de torres de Hanoi para n cantidad de discos hecho en ensamblador para la arquitectura RISC-V.

Algoritmo en C basado en apuntadores y movimientos basados en una estructra FIFO. Se tiene un solo apuntador a cada torre y la funcion de hanoi recibe donde esta guardado ese apuntador, de esta forma aunque entremos a recursividad podemos modificar la posicion a la que apunta el top de cada torre y hacer pop y push de los discos.

El programa de ensamblador esta directamente basado en el algoritmo de C. 

La cantidad de movimientos esta determinada por la siguiente formula:
  (2^n)-1
  El programa lleva un conteo cada vez que se hace un pop y un push.
