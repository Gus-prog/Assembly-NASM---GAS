#include <stdio.h>
#include <time.h>
#include <math.h>

int main (){
	
  //gerando matriz de forma aleatória
  int l=5, aux=0;
  int i,j, matrizA[l][l],matrizB[l][l],matrizC[l][l];
  
  srand(time(NULL));
  
  for (i=0; i<l ; i++){	
  		for (j=0; j<l ;j++){
  			matrizA[i][j]=rand()%20+1;     //matriz A e B, recebendo numero aleatorios de 1 a 20, por isso +1
  			matrizB[i][j]=rand()%20+1;
		                   }						    		
                      }
                      
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
//****************************************************************





	
	
}
