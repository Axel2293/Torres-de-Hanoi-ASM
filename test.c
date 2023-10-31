#include <stdio.h>

void moverPuntero(int **ptr, int pasos) {
    // Aumenta el puntero en el número de pasos especificado
    *ptr += pasos;
}

int main() {
    int arreglo[] = {1, 2, 3, 4, 5};
    int *ptr = &arreglo[0]; // Puntero al primer elemento del arreglo

    printf("Valor apuntado inicialmente: %d\n", *ptr);

    moverPuntero(&ptr, 2); // Mueve el puntero dos posiciones hacia adelante
    printf("Valor apuntado después de moverse: %d\n", *ptr);

    return 0;
}
