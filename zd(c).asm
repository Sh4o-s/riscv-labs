

.data
    array:      .space 84        
    prompt:     .asciz "¬ведите число (0 - стоп): "
    newline:    .asciz "\n"
    msg_count:  .asciz "—читано чисел: "

.text
.globl main

main:
    li      s0, 21           
    la      s1, array        
    li      s2, 0            

read_loop:
    
    bge     s2, s0, finish

    
    la      a0, prompt
    li      a7, 4
    ecall

    
    li      a7, 5
    ecall
    mv      t0, a0           

    
    beqz    t0, finish

   
    slli    t1, s2, 2        
    add     t1, s1, t1       
    sw      t0, 0(t1)

    
    addi    s2, s2, 1
    j       read_loop

finish:
    
    la      a0, msg_count
    li      a7, 4
    ecall

    mv      a0, s2
    li      a7, 1
    ecall

    la      a0, newline
    li      a7, 4
    ecall

    li      a7, 10
    ecall