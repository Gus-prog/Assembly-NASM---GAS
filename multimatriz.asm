
	section .text
	global multimatriz_asm
	
;********** parametros	*************
%define 	matrizA 	dword [ebp+8]
%define 	matrizB 	dword [ebp+12]		;esse estao na high memory
%define 	matrizC 	dword [ebp+16]
%define 	tam		dword [ebp+20]

%define aux	dword	[ebp-4]			;alocar espaço na stack para as variaveis
%define i	dword	[ebp-8]			;desse jeito as variaveis sao acessadas deslocando valores negativos   ( esta na low memory)
%define j	dword	[ebp-12]
%define k	dword	[ebp-16]
%define bitINT	dword	4


multimatriz_asm:	
	push ebp
	mov ebp,esp
	sub esp,dword 16			;alocando espaço para 4 variaveis 	
	push ebx			;nao sei porque mas teve que salvar os registradores se n dava segmentation fault
	push ecx
	push edx
	push esi
	push edi	
	
	mov esi,matrizA	;move o endereço da matrizA pra esi (ebp+8)
	mov edi,matrizB	;move o endereço matrizB pra edi    (ebp+12)
	mov i,dword 0		;inicializa o i com 0
	
for_i:
	mov ecx,i			
	cmp ecx,tam		;compara se i eh maior ou igual a tam ( tam matriz)
	jge diagonal
	mov j,dword 0 		;inicializa o j com 0

for_j:
	mov ecx,j
	cmp ecx,tam		;compara se j eh maior ou igual que tam (tam matriz)
	jge endfor_i		;se for, ele saira do lopin do j e ira pro fim do for i
	mov aux,dword 0
	mov k,dword 0		;zera o aux e o contador k

for_k:
	mov ecx,k
	cmp ecx,tam		;analogo for j, compara se eh maior ou igual ao tam da matriz, se for, ele saira do k e entrara no fim do j
	jge endfor_j	
	
;*************** parte de calcular endereço da matrizA[i][ k ] ******************
	mov ebx,i		
	imul ebx,tam				;multiplica i com tam	
	add ebx,k		; ebx = (i * tam)+k
	imul ebx,bitINT		;multiplica por 4 porque eh o tam de bite de int
	mov eax,[esi+ebx]	;conteudo da matriz A, em eax
	
;*************** parte de calcular endereço da matrizB[k][ j ] ******************
	mov ebx,k		; move k pro ebx, e depois multiplica por tam da matriz
	imul ebx,tam		;	
	add ebx,j		;adiciona no ebx, o contador j, pois eh matrizB[k][j] (vetor grandao)
	imul ebx,bitINT		;multiplica o valor por tamanho de bites de inteirios ( 4 )
	mov ecx,[edi+ebx]	; move conteudo da matrizB pro ecx
	
;*************** parte do produto  ******************	
	imul eax,ecx		;multiplica matrizA[i][ k ] por matrizB[ k ][j]
	add aux,eax		;adiciona ao valor de aux, o produto ->  aux+=matrizA[i][k]*matrizB[k][j]       	;erro do aux?
	
;*************** parte dos fins  ******************	

endfor_k:	
	inc k		;incrementa o contador k
	jmp for_k	;pula pro for de k

endfor_j:
	mov ebx,i		;calcula o endereço da matrizC[i][j]
	imul ebx,tam    	;	*	
	add ebx,j		;	*
	imul ebx,bitINT	;	*
	mov eax,aux		;mov a soma de aux pro eax
	imul eax,bitINT	;por coincidencia o tamanh de bit eh o mesmo do exercicio -> 4( A x B)
	mov ecx,matrizC	;mov o endereço da matrizC pro ecx
	mov [ecx+ebx],eax	;mov eax ( soma de aux) pro conteudo da matrizC na posiçao [i][j] (vetor grandao)
	

	inc j			;incrementa o contador j
	jmp for_j		;pula pro for de j

endfor_i:	
	inc i			;incrementa o contador i
	jmp for_i		;pula pro for de i

;*************** Parte de calcular a maior diagonal *********************
diagonal:			
	mov edx,matrizC		;edx aponta pro endereo da matric C [ebp+12]
	mov i, dword 0
	mov aux, dword 0		;zera o contador i e o aux
	;xor eax,eax
for_diag:
	mov ecx,i		;condiçao do for ( i<tam / se for maior ou igual, ele sair do for)	
	cmp ecx,tam
	jge troca_final
;*************** calcular endereço da diag da matriz C [i][ i ] ******************
	mov ebx,i		
	imul ebx,tam				;multiplica i com tam	
	add ebx,i		; ebx = (i * tam)+i
	imul ebx,bitINT	;tamanho de int ebx = ((i*tam)+i) *4
	
	mov eax,[edx+ebx]	;move o conteudo do endereço  calculado pro aux	
	cmp eax,aux		;comparou o conteudo apontado por aux com eax
	jg troca		;se aux for maior, pula pra troca
	
end_for_diag:
	inc i
	jmp for_diag
	
troca:
	mov aux,eax		;eax recebe o conteudo de aux ( eax = aux)
	jmp end_for_diag	;dps da troca, pula pro end da diagonal, onde incrementa i e recomeça o loop
troca_final:
	mov eax,aux		;faz a troca a final, deixando a diagonal maior no eax
;***********************************************************************		

		
end:
	pop ebx                 ; restaura tudo que precisa kk
	pop ecx
	pop edx
	pop esi
	pop edi
	mov esp,ebp
	pop ebp					;ver os erros do contador
	ret
	
	
	
	
	
