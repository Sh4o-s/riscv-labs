
.data
    prompt:     .asciz "¬ведите число x: "
    space:      .asciz " "

.text
.globl main

main:
    # y = 101, h = 5
    li      s0, 101          # s0 = y
    li      s1, 5            # s1 = h

    
    la      a0, prompt
    li      a7, 4
    ecall

    # --- ввод x ---
    li      a7, 5
    ecall
    mv      s2, a0           # s2 = x


    blt     s2, s0, x_less   # если x < y

    
    mv      t0, s0           # t0 = min = y
    mv      t1, s2           # t1 = max = x
    j       loop_start

x_less:
    mv      t0, s2           # t0 = min = x
    mv      t1, s0           # t1 = max = y

loop_start:
   
    bgt     t0, t1, done     # если текущее > max -> выход

    
    mv      a0, t0
    li      a7, 1            # ecall 1 = print int
    ecall

    
    la      a0, space
    li      a7, 4
    ecall

    
    add     t0, t0, s1
    j       loop_start

done:
    li      a7, 10
    ecall