sub r0, r0
sub r1, r1
sub r2, r2  
sub r3, r3   

; os vetores comecarao no endereco de memoria 110

; inicia valores 
addi 1
sub r3, r0      ; r3 = -1
addi 7
addi 2          ; r0 = 10
sub r1, r0      ; r1 = -10
add r0, r0      ; r0 = 20
add r0, r0      ; r0 = 40
addi 5          ; r0 = 45
addi 5          ; r0 = 50
add r2, r0      ; r2 = 50
sub r0, r1      ; r0 = 60
st r0, r3       ; 60 armazenado em 0xff
add r3, r3      ; r3 = -2
add r2, r2      ; r2 = 100
sub r2, r1      ; r2 = 110
st r2, r3       ; 110 armazenado em 0xfe
sub r0, r0
sub r2, r2
sub r3, r3


; calcula o fim_loop (PC = 23)
addi 1
sub r3, r3
sub r3, r0      ; end = -1
ld r3, r3       ; end = fim_loop
sub r0, r0

loop:
brzr r1, r3
; ajusta i 
addi 7          ; r0 = 7
addi 3          ; r0 = 10
add r1, r0      ; i += 10
; guarda 1 
sub r0, r0      ; r0 = 0
addi 2          ; r0 = 2
sub r3, r3
sub r3, r0      ; end = -2
ld r3, r3       ; end = 110
add r3, r1      ; end = 110 + deslocamento (i)
sub r0, r0      ; r0 = 0
st r2, r3       ; M[end] = x
; guarda 2 
addi 1          ; r0 = 1
add r2, r0      ; x += 1
addi 7          ; r0 = 8
addi 2          ; r0 = 10
add r3, r0      ; end = 110 + deslocamento + 10
st r2, r3       ; M[end] = x
; ajusta parametros para reiniciar loop 
sub r0, r0
addi 7
addi 2          ; r0 = 9
sub r1, r0      ; i -= 9
addi 1          ; r0 = 10
add r0, r0      ; r0 = 20
addi 3          ; r0 = 23
sub r3, r3      ; end = 0
add r3, r0      ; end = 23
sub r0, r0      ; r0 = 0
addi 1          ; r0 = 1
add r2, r0      ; x += 1
sub r0, r0      ; r0 = 0
brzr r0, r3     ; forca o salto para PC = 23

fim_loop:



; soma dos vetores

sub r2, r2      ; PC = 60
sub r3, r3
addi 7
addi 3          ; r0 = 10
sub r1, r0      ; i = -10
sub r0, r0

; calcula r3 (PC = 66) 
sub r3, r3
addi 2          ; r0 = 2
sub r3, r0      ; r3 = -2
ld r3, r3       ; r3 = 110
addi 2          ; r0 = 4
sub r3, r0      ; r3 = 106
sub r0, r0

loop_2:
brzr r1, r3
addi 7
addi 3          ; r0 = 10
add r1, r0      ; i += 10
;
sub r0, r0
sub r3, r3
addi 2          ; r0 = 2
sub r3, r0      ; r3 = -2
ld r3, r3       ; r3 = 110
add r3, r1      ; r3 += deslocamento (i)
ld r2, r3       ; r2 = M[end]
addi 7          ; r0 = 9
addi 1          ; r0 = 10
add r3, r0      ; r3 += 10
ld r0, r3       ; r0 = M[r3]
add r2, r0      ; soma dos vetores
sub r0, r0
addi 7
addi 3          ; r0 = 10
add r3, r0      ; r3 += 10
st r2, r3       ; M[end] = r2
sub r0, r0      ; r0 = 0
;
addi 7
addi 2          ; r0 = 9
sub r1, r0      ; i -= 9
addi 7          ; r0 = 16
add r0, r0      ; r0 = 32
add r0, r0      ; r0 = 64
addi 2          ; r0 = 66
sub r3, r3
add r3, r0      ; r3 = 66
sub r0, r0
brzr r0, r3


fim_loop_2:
addi 3          ; PC = 106
add r3, r0      ; r3 = 109
sub r0, r0
ji 0            ; halt (PC = PC + 0)