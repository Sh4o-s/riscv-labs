
.data
    prompt:     .asciz "¬ведите число x: "
    msg_yes:    .asciz "1\n"
    msg_no:     .asciz "0\n"

.text
.globl main

main:
    
    li      t0, 5            

    
    la      a0, prompt
    li      a7, 4            
    ecall

   
    li      a7, 5            
    ecall
    mv      t1, a0           

    
    beq     t1, t0, equal    

    
    la      a0, msg_no
    li      a7, 4
    ecall
    j       exit

equal:
    la      a0, msg_yes
    li      a7, 4
    ecall

exit:
    li      a7, 10           
    ecall