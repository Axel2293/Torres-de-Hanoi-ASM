#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define NUMDISK 3

void hanoi(int32_t N, int32_t **origen, int32_t **auxiliar, int32_t **destino);

int moves=0;

int main(){

    // Create towers and init with zeros
    int32_t *torre_A = calloc(NUMDISK, sizeof(int32_t));
    printf("%p\n", torre_A);
    int32_t *torre_B = calloc(NUMDISK, sizeof(int32_t));
    printf("%p\n", torre_B);
    int32_t *torre_C = calloc(NUMDISK, sizeof(int32_t));
    printf("%p\n", torre_C);

    printf("Agregando discos a torres:\n");
    for(int32_t i=1; i<=NUMDISK; i++){
        *torre_A = i;
        printf("%p\n", torre_A);
        torre_A+=1;
    }

    // Return source tower pointer to top
    torre_A-=NUMDISK;
    // Move pointers to end of memory for towers
    torre_B+=NUMDISK;
    torre_C+=NUMDISK;

    
    
    // Double pointer to tower pointers
    // Uses the original pointers of the towers and then it moves through them to pop and push disks
    hanoi(NUMDISK, &torre_A, &torre_B, &torre_C);
    
    printf("[");
    for (size_t i = 0; i < NUMDISK; i++)
    {
        printf("%d,", *torre_C);
        torre_C+=1;
    }
    printf("]\n");

    printf("\nTOTAL MOVES: %d\n", moves);

}

void hanoi(int32_t N, int32_t **origen, int32_t **auxiliar, int32_t **destino){
    if (N == 1)
    {
        // Remove the disk from origin tower N (Only one disk left)
        **origen=0;
        *origen+=1;
        // Move removed disk to destination tower
        *destino-=1;
        **destino=N;
        moves++;
        
        printf("After moving disk %d to dest tower: TS: %p TD: %p\n", N, *origen, *destino);
        return;
    }
    // Destiny now becomes auxiliar tower
    hanoi(N-1, origen, destino, auxiliar);
    // Remove the disk from origin tower N (Only one disk left)
    **origen=0;
    *origen+=1;
    // Move removed disk to destination tower
    *destino-=1;
    **destino=N;
    printf("After moving disk %d to dest tower: TS: %p TD: %p\n", N, *origen, *destino);
    moves++;
    // Auxiliar is now origin, and origin is now auxiliar
    hanoi(N-1, auxiliar, origen, destino);
    

}