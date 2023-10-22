#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define NUMDISK 3

void print_towers (int32_t n, int32_t *tA, int32_t *tB, int32_t *tC);

int main(){

    printf("Sizeof int 32: %d \n", sizeof(int32_t));

    // FIFO Towers structures
    int32_t *torre_A = calloc(NUMDISK, sizeof(int32_t));
    printf("%p\n", torre_A);
    int32_t *torre_B = calloc(NUMDISK, sizeof(int32_t));
    printf("%p\n", torre_B);
    int32_t *torre_C = calloc(NUMDISK, sizeof(int32_t));
    printf("%p\n", torre_C);


    printf("Agregando circulos a torres:\n");
    for(int32_t i=NUMDISK; i>0; i--){
        *torre_A = i;
        printf("%p\n", torre_A);
        torre_A+=1;
    }
    torre_A-=NUMDISK;

    print_towers(NUMDISK, torre_A, torre_B, torre_C);

}

void print_towers(int32_t n, int32_t *tA, int32_t *tB, int32_t *tC){
    
    printf("%p : [", tA);
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
        int32_t disk = *origen;
         
    }
    
}

int8_t addtotower(int32_t n, int32_t disk, int32_t*tower){
    // Move on the array then find the free spot to place the disk
    for (int32_t i = 0; i < n; i++)
    {
        if (*tower == 0)
        {
            *tower = disk;
        }else{
            tower++;
        }
        
    }
    
}