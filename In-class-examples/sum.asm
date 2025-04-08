.text
MAIN:
  li t0, 0xcafe0000 # X
  li t1, 0x0000b0ba # Y
  # keep `equal` in a0
  
  mv a0, t0
  mv a1, t1
  jal SUM

  j EXIT


SUM:
  add a0, a0, a1
  ret  


EXIT: