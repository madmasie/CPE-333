.text
MAIN:
  li sp, 0x10000
  addi sp, sp, -8
    
  li s0, 7 # X
  li s1, 10 # Y

  mv a0, s0
  mv a1, s1
  jal FUNC

  j EXIT

# a is first arg, b is second arg
FUNC:
  addi sp, sp, -12
  sw a0, 0(sp) # sp is a
  sw a1, 4(sp) # sp+4 is b
  sw ra, 8(sp) # sp+8 is ra
  
  # call with address a, address b
  addi a0, sp, 0
  addi a1, sp, 4
  jal SWAP
  
  # call with values a, b
  lw a0, 0(sp)
  lw a1, 4(sp)
  jal SUM
  
  lw ra, 8(sp)
  ret



SUM:
  add a0, a0, a1
  ret  


SWAP:
  lw t0, (a0)
  lw t1, (a1)
  sw t0, (a1)
  sw t1, (a0)
  ret  


EXIT:
