# Loading initial data
.data
N:
.word 5
M:
.word 4
matrix:
.word -11, 5, 2, 3, -1
.word -3, 7, 1, 4, 0
.word 3, 1, -2, 6, 2
.word 2, -100, 45, 1, -10



.text

# Main function
main:
la a2, N # Saving the pointer to the varible N in the register a2
la a3, M # Saving the pointer to the varible M in the register a3
la a4, matrix # Saving the pointer to the matrix in the register a4
call process # process function call
call print # print function call
call exit # exit function call

print:
addi a0, x0, 1 # Environmental call with ID=1
ecall # print_int environmental call, prints integer in a1
addi a1, x0, 0x0D # Carriage return
addi a0, x0, 11 # Environmental call with ID=11
ecall # Print_character environmental call, prints ASCII character in a1
ret # Return from function

exit:
addi a0, x0, 10 # Environmental call with ID=10
ecall # exit environmental call, ends the program

process:
lw t1, 0(a2) #  Loading varible N
lw t2, 0(a3) #  Loading varible M
lw t3,  0(a4) # Loading the first element of the array
addi t4, x0, 0 # Row number

cycle2:
addi t5, x0, 0 # Row element number
cycle1:
lw t6, 0(a4) # Loading a value from an array
addi a4, a4, 4 # Increment array pointer
addi t5, t5, 1 # Increment row element number
bge t6, t3, asgn_skip # If the current element of the array is greater or equal to the current minimum elemnt, skip the next instruction
addi t3, t6, 0 #Saving a new minimum element
asgn_skip:
blt t5, t1 cycle1 # If the current row element number less then N, branch to "cycle1"
addi t4, t4, 1 # Increment row number
blt t4, t2 cycle2 # If the current row number less then M, branch to "cycle2"
addi a1, t3, 0 #Return the minimum element of the array
ret # Return from function
