#include <stdio.h>
#include <time.h>
#include <math.h>
#include <stdlib.h>

int main (){
	
  //gerando matriz de forma aleatória
  int l=10, aux=0;
  int i, j, matrizA[l][l], matrizB[l][l], matrizC[l][l];   //inicializamos a matriz C com o valor zero emt odas as casas.
  int diag=0;
  int x1=5,x2=6;
  
  srand(time(0));
  
  for (i=0; i<l ; i++){	
  		for (j=0; j<l ;j++){
  			matrizA[i][j]=(rand()%20+1);     //matriz A e B, recebendo numero aleatorios de 1 a 20, por isso +1
  			matrizB[i][j]=(rand()%20+1);
		                   }						    		
                      }
    
    extern int multimatriz_asm( int*, int*,int*, int );    
    diag = multimatriz_asm(*matrizA,*matrizB,*matrizC,l);
    //printf("\n");
    printf ("Maior valor da diagonal: %d \n", diag);
    printf("\n");
                      
 //**************************************************************	
//printando a matriz na tela para conferir
//matriz A
	for (i=0; i<l ; i++){	
  		for (j=0; j<l ;j++){
  		    printf(" %2d",matrizA[i][j]);
		                   }
			printf("\n");						    		
                        }
   	printf("\n");  
  	                   
//matriz B
 	for (i=0; i<l ; i++){	
  		for (j=0; j<l ;j++){
  		    printf(" %2d",matrizB[i][j]);
		                   }
			printf("\n");						    		
                        }
        printf("\n");
//matriz C         
	for (i=0; i<l ; i++){	
  		for (j=0; j<l ;j++){
  		    printf(" %2d",matrizC[i][j]);
		                   }
			printf("\n");						    		
                        }
//****************************************************************




	
	
}
