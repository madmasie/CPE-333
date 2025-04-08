.text
MAIN:
  li t0, 10 # X
  li t1, 10 # Y
  # keep `equal` in a0
  bne t0, t1, .leq
  li a0, 1
  j .lexit
.lneq:
  li a0, 0
.lexit:
