.text
MAIN:
  li t0, 10 # X
  li t1, 10 # Y
  # keep `equal` in a0
  beq t0, t1, .leq
  li a0, 0
  j .lexit
.leq:
  li a0, 1
.lexit:
