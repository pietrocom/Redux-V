sub r0, r0
sub r1, r1
sub r2, r2  
sub r3, r3   

; os vetores comecarao no endereco de memoria 72

; inicia valores 
addi 7
addi 3          ; r0 = 10
sub r1, r0      ; r1 = -10
muli 7          ; r0 = 70
addi 2          ; r0 = 72
add r3, r0      ; r3 = 72
sub r2, r2
sub r0, r0
add r0, r1      ; r0 = i      

loop:
brzruie 8       ; 8 * 2 + 8
; ajusta i 
sub r0, r0
addi 7          ; r0 = 7
addi 3          ; r0 = 10
add r1, r0      ; i += 10
; guarda 1 
sub r0, r0      ; r0 = 0
add r3, r1      ; end = base + deslocamento (i)
st r2, r3       ; M[end] = x
; guarda 2 
addi 1          ; r0 = 1
add r2, r0      ; x += 1
addi 7          ; r0 = 8
addi 2          ; r0 = 10
add r3, r0      ; end = base + deslocamento + 10
st r2, r3       ; M[end] = x
sub r3, r1      ; r3 = base + 10
sub r3, r0      ; r3 = base
; ajusta parametros para reiniciar loop 
addi -1         ; r0 = 9
sub r1, r0      ; i -= 9
sub r0, r0      ; r0 = 0
addi 1          ; r0 = 1
add r2, r0      ; x += 1
sub r0, r0      ; r0 = 0
add r0, r1      ; se i = 0 saira do loop
jie 8           ; -(8 * 2 + 7)

fim_loop:



; soma dos vetores

sub r2, r2
addi 7
addi 3          ; r0 = 10
sub r1, r0      ; i = -10
sub r0, r0
add r0, r1      ; r0 = i
or r0, r0       ; jump pula para ca

loop_2:
brzruie 9       ; PC = 44
sub r0, r0      ; r0 = 0
addi 7
addi 3          ; r0 = 10
add r1, r0      ; i += 10
;
sub r0, r0
add r3, r1      ; r3 += deslocamento (i)
ld r2, r3       ; r2 = M[end]
addi 7          ; r0 = 7
addi 3          ; r0 = 10
add r3, r0      ; r3 = base + 10
ld r0, r3       ; r0 = M[end]
add r2, r0      ; soma dos vetores
sub r0, r0
addi 7
addi 3          ; r0 = 10
add r3, r0      ; r3 = base + 10
st r2, r3       ; M[end] = r2
sub r3, r1
sub r3, r0
sub r3, r0      ; r3 = base
;
addi -1         ; r0 = 9
sub r1, r0      ; i -= 9
sub r0, r0
add r0, r1      ; r0 = i
jien 8          ; PC = 68


fim_loop_2:
or r0, r0
ji 0            ; halt (PC = PC + 0)