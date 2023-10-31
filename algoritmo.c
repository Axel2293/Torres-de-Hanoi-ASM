#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define NUMDISK 3

void print_towers (int32_t n, int32_t *tA, int32_t *tB, int32_t *tC);
int8_t push(int32_t n, int32_t disk, int32_t*tower);
void hanoi(int32_t N, int32_t *origen, int32_t *auxiliar, int32_t *destino);
int32_t pop (int32_t *st);

int moves=0;

int main(){

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
    torre_A-=NUMDISK;

    print_towers(NUMDISK, torre_A, torre_B, torre_C);

    hanoi(NUMDISK, torre_A, torre_B, torre_C);

    printf("\nTOTAL MOVES: %d\n", moves);

}

void print_towers(int32_t n, int32_t *tA, int32_t *tB, int32_t *tC){
    
    printf("\n TOWERS:\n[");
    for (size_t i = 0; i < n; i++)
    {
        printf("%d,", *tA);
        tA+=1;
    }
    printf("]\n");

    printf("[");
    for (size_t i = 0; i < n; i++)
    {
        printf("%d,", *tB);
        tB+=1;
    }
    printf("]\n");

    printf("[");
    for (size_t i = 0; i < n; i++)
    {
        printf("%d,", *tC);
        tC+=1;
    }
    printf("]\n");

    
}

void hanoi(int32_t N, int32_t *origen, int32_t *auxiliar, int32_t *destino){
    if (N == 1)
    {
        // get the disk at origin tower (Only one disk left)
        int32_t disk = pop(origen);
        // Move it to dest tower
        push(NUMDISK, disk, destino);
        moves++;
        
        printf("After moving disk %d to dest tower:\n", disk);
        print_towers(NUMDISK, origen, auxiliar, destino);
        return;
    }
    // Destiny now becomes auxiliar tower
    hanoi(N-1, origen, destino, auxiliar);
    int32_t disk = pop(origen);
    printf("After moving disk %d to dest tower:\n", disk);
    push(NUMDISK, disk, destino);
    moves++;
    print_towers(NUMDISK, origen, auxiliar, destino);
    // Auxiliar is now origin, and origin is now auxiliar
    hanoi(N-1, auxiliar, origen, destino);

}

int8_t push(int32_t n, int32_t disk, int32_t*tower){
    // Move on the array then find the free spot to place the disk at the top of the stack
    tower+=n-1;
    for (int32_t i = 0; i < n; i++)
    {
        if (*tower == 0)
        {
            *tower = disk;
            return 1;
        }else{
            tower--;
        }
        
    }
    return 0;
    
}

int32_t pop (int32_t *st){
    for (size_t i = 0; i < NUMDISK; i++)
    {
        if(*st!=0){
            int32_t disk_pop = *st; 
            *st=0;
            return disk_pop;
        }
        else{
            st++;
        }
    }
    return 0;
    
}