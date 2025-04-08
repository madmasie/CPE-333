
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
    beq t1, t4, .1after_i       #branch if equal
    

# for (j=0, j<4, j++)
li t2, 0            #reset j to 0
.jloop:
    beq t2, t4, 1after_j
    #addi a5, a5, 1      #add 1 to sum sanity counter

    #a[j]
    #need base address of a, j + sizeof(int), add together
    #gives us address we need to load

    slli t3, t1, 2      #j shifted left twice to get byte offset
    add t5, a0, t3      # address of a[j]
    lw t6, 0(t5)        #load value into t6

    addi t2, t2, 1      #increment jloop
    j .iloop            #jump to iloop       


.1after_j:
    addi t1, t1, 1
    j .iloop        #jump to iloop

    add a5, a5, t5      #sum +=a[j]

.1after_i:

.lafter_i:
  # test #2, see if we can load a[2]
  # load the 3 into t6
  # a is in a0 
  # li t2, 3 # access 3rd element
  # slli t3, t2, 2 # figure out number of bytes for offset
  # add t0, a0, t3 # base address a + offset bytes
  # lw t6, 0(t0)
  
  # test 4?
  # load a[2][1]
  li t1, 2 # i = 2
  li t2, 1 # j = 1
  slli t3, t1, 2 # i * size
  add t3, t3, t2 # i * size + j
  slli t3, t3, 2 # (i * size + j) * 4 
  add t0, a0, t3 # a[(i*size + j)*4]
  lw  t5, 0(t0)  # load it

EXIT:





