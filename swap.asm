.text
MAIN:
  li sp, 0x10000
  addi sp, sp, -8 # x stored at sp, y stored at sp+4
  
  li t0, 0xcafe0000 # X
  li t1, 0x0000b0ba # Y
  
  sw t0, 0(sp)
  sw t1, 4(sp)

  
  addi a0, sp, 0
  addi a1, sp, 4
  jal SWAP

  lw t0, 0(sp)
  lw t1, 4(sp)

  j EXIT


SWAP:
  lw t0, (a0)
  lw t1, (a1)
  sw t0, (a1)
  sw t1, (a0)
  ret  


EXIT: