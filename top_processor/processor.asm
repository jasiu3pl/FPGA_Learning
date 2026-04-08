movi R4, 1
movi R1, 255
movi R2, 255
add R2, R2, 255
jnz R2, 3
add R1, R1, 255
jnz R1, 2

movi R4, 2
movi R1, 1
and R2, R5, R1
jz R2, 9

movi R4, 4

movi R1, 255
movi R2, 255
add R2, R2, 255
jnz R2, 14
add R1, R1, 255
jnz R1, 13

movi R4, 8
movi R1, 2
and R2, R5, R1
jz R2, 20

jump 1