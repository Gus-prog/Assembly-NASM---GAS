#include <stdio.h>
#include <time.h>
#include <math.h>

int main (){
	
  //gerando matriz de forma aleatória
  int l=10, aux=0;
  int i,j,k, matrizA[l][l],matrizB[l][l],matrizC[l][l];
  
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

//produto entre matrizes

	for (i=0; i<l;i++){
		for (j=0; j<l ; j++){
			for (k=0; k<l;k++){
				aux+=matrizA[i][k]*matrizB[k][j];
			                  }
			    matrizC[i][j]=aux;
			    aux=0;
		                    }
                      }

//****************************************************************
//matriz C print
	printf("\n");
 	for (i=0; i<l ; i++){	
  		for (j=0; j<l ;j++){
  		    printf(" %2d",matrizC[i][j]);
		                   }
			printf("\n");
                        }
//****************************************************************
//achar maior valor diagonal principal ( qual compensa mais? aqui, que roda so na diagonal ou na multiplicação?)
	i=0;
	aux=0;
	while (i<l){
		if(aux < matrizC[i][i]){
			aux = matrizC[i][i];
		                       }
	//	printf(" %d", matrizC[i][i]);
			i++;				   		
	           }	
	printf("\n");
	printf(" %d",aux);
	printf("\n");
	printf(" Maior valor diagonal multiplicado por 4 = %d",aux*4);
	
}
