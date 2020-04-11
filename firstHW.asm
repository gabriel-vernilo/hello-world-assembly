section .data ; seção de dados, como uma definição de variaveis
msg1 db "Hello",0xA ;variavel de texto
len1 equ $-msg1; variavel que assume a quantidade de caracteres da variavel msg1
msg2 db "World",0xa ; outra variavel de texto
len2 equ $-msg2; variavel que assume a quantidade de caracteres da variavel msg2

section .text ; seção de texo, execução, código
global _start; inicia o _start
_start:
mov eax,4 ; faz o registrador eax assumir o valor 0x4
mov ebx,1; faz o registrador ebx assumir o valor 0x1
mov ecx,msg1 ; faz o registrador ecx assumir o valor da variável msg1
mov edx,len1; faz o registrador edx assumir o valor de len1
int 0x80; gera uma interrupção, nesse caso, como o eax esta 1 e ebx 4, ela escreverá acx, no tamanho de ebx no terminal
call _msg2text ; chama a função _msg2text (ou seja pula para a linha 21)

mov eax,1 ; define o eax como 1
xor ebx,ebx; zera o ebx (torna 0)
int 0x80; agora com eax 1 e ebx 0, a interrupção finaliza o programa

_msg2text:
mov eax,4; faz o registrador eax assumir o valor 0x4
mov ebx,1; faz o registrador ebx assumir o valor 0x1
mov ecx,msg2; faz o registrador ecx assumir o valor da variável msg2
mov edx,len2; faz o registrador edx assumir o valor de len2
int 0x80; gera uma interrupção, nesse caso, como o eax esta 1 e ebx 4, ela escreverá acx, no tamanho de ebx no terminal

ret ; retorna para uma linha após a chamada da função (neste caso voltará para a linha 16 )