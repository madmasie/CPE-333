
#Write this in asm:
#int a[4][4]
#for (i=0, i<4, i++)
#    for (j=0, j<4, j++)
#        sum +=a[i][j]

.data
A:	.word	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
size:	.word	4

#initializes acum, i, j temp registers
MAIN:
    li sp, 0x10000  #load stack pointer
    li t0, 0        #initialize acum temp register
    li t1, 0        #i in t1
    li t2, 0        #j in t2

    li t4, 4        #size in t4

    la a0, A        #base address of A in a0


#for (i=0, i < 4, i++)
li t1, 0            #reset i to 0
.iloop:
    beq t1, t4, .1after_i
    

# for (j=0, j<4, j++)
li t2, 0            #reset j to 0
.jloop:
    beq t2, t4, 1after_j
    addi a5, a5, 1      #add 1 to sum sanity counter
    addi t2, t2, 1      #increment jloop
    j .iloop            #jump to iloop       


.1after_i:


.1after_j:
    addi t1, t1, 1
    j .iloop        #jump to iloop

EXIT:





