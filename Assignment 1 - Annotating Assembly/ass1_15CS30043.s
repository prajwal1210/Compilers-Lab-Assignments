	.file	"test.c"		 # C filename from which this code was generated 
	.text					 # Text section where function is usually stored
	.globl	func             # .gloabal makes the parameter func to be global 
	.type	func, @function  # specifies func as a function 
func:						 
.LFB0:
	.cfi_startproc           #It initializes some internal data structures.(CFI directive)
	pushq	%rbp		     #save the current frame pointer	
	.cfi_def_cfa_offset 16	 #modifies a rule for computing CFA. Register remains the same, but offset is new = 16. Note that it is the absolute offset that will be added to a defined register to compute CFA address	
	.cfi_offset 6, -16		 #Previous value of register 6 is saved at offset -16 from CFA.
	movq	%rsp, %rbp	     #create a new frame pointer pointing to the current stack top
	.cfi_def_cfa_register 6	 #modifies a rule for computing CFA. From now on register 6 will be used instead of the old one. Offset remains the same. 
	pushq	%rbx		     #push the value of rbx on the stack because rbx is a callee saved register and its value needs to be saved before the callee can modifiy it 
	subq	$56, %rsp        #Assign 56 bytes on the stack for local variables 
	.cfi_offset 3, -24		 #Previous value of register 3 is saved at offset -24 from CFA.
	movl	%edi, -52(%rbp)	 #store first argument(say n) = 9(int32) at -52 offset to the base pointer 
	movq	%fs:40, %rax	 #copy value from segment register %fs:40 to rax	
	movq	%rax, -24(%rbp)	 #move 8 bytes from rax to base pointer offset by 24 i.e. save value of %fs:40 at -24(%rbp)
	xorl	%eax, %eax	     #clear eax to 0 
	movq	%rsp, %rax	     #store the stack pointer in rax
	movq	%rax, %rsi	     #store the value of rax in rsi i.e. store a copy of the stack pointer in rsi
	movl	-52(%rbp), %eax	 #store the first arguement which is 9(int32) in eax, call this arguement n lets say 
	addl	$1, %eax	     #32 bit addition to add 1 to 9 - We do this to calculate the size of the array that is n+1 = 9+1 = 10 in the array declaration int arr[n+1]
	movslq	%eax, %rdx	     #convert int to long int and store 10(int64) in rdx (Signed Extension)	
	subq	$1, %rdx	     #subtract 1 from the value in rdx i.e 10 - 1 = 9 to get back n
	movq	%rdx, -40(%rbp)  #store 9(int64) as a local variable say temp in the stack at -40 offset from the base pointer					
	movslq	%eax, %rdx	     #convert int to long int and store 10(int64) in rdx (Signed Extension)	
	movq	%rdx, %r8	     #store 10(int64) in r8 general purpose register 
	movl	$0, %r9d	     #store 0(int32) in r9d
	movslq	%eax, %rdx	     #convert int to long int and store 10(int64) in rdx (Signed Extension)				
	movq	%rdx, %rcx	     #store 10(int64) in rcx
	movl	$0, %ebx	     #move 0(int32) to ebx		
	cltq 			    	 #convert eax to int64 and stores in rax - Signed Extension 
	salq	$2, %rax	     #multiply value in rax - 10(int64) by 4 using left shift operation twice and store the result in rax, value in rax = 40 now
	leaq	3(%rax), %rdx	 #add 3 to the value in rax and store in rdx : 40+3 = 43(int64) --> rdx. leaq calculates address of value in rax6  and adds 3 to the value at that address and then stores it
	movl	$16, %eax        #store 16(int32) in eax : rax also contains 16 with 0 extension 
	subq	$1, %rax 		 #subtract 1 from the value at rax and store result in rax : value in rax = 15    	     	   
	addq	%rdx, %rax 		 #add the value in rdx to the value in rax : new value in rax = 43+15 = 58
	movl	$16, %edi		 #store 16(int32) in edi 
	movl	$0, %edx		 #clear edx(and so rdx) to 0 
	divq	%rdi			 #divides (%rdx:%rax)(128 bits) = 58 by value in rdi = 16(64 bit) - stores the quiotient = 3 in rax and remainder = 10 in rdx
	imulq	$16, %rax, %rax  #multiplies (%rax) * 16 = 3*16 = 48 and stores in rax - This value is going to be used to allocate memory for array 
	subq	%rax, %rsp		 #subtract stack pointer by 48 thus allocating space where the array will be present ==> static allocation of array 			
	movq	%rsp, %rax       #move rax to the stack pointer to use rax as an array pointer for addressing 
	addq	$3, %rax         #add a positive 3 offset(moves the pointer to a higher address) to rax (remember rax now contains a memory address on the stack and not a value)
	shrq	$2, %rax     	 #right shift the address in rax twice
	salq	$2, %rax         #left shift the address in rax twice - both these operations lead to the address in rax being a multiple of 4 which is required as the array is of int32 type : rax now points to the start of the array(1st bit)  
	movq	%rax, -32(%rbp)  #store the pointer to the array address (rax) as a local variable at -32 offset fro base pointer - this has created a variable say named arr pointing to an array of size = n+1 thus completing the decleration of the array 
	movq	-32(%rbp), %rax  #move the content from -32 offset of rbp to rax (quad word) => rax is a pointer to the array 
	movl	$0, (%rax)		 #assign the first element of array as 0 - arr[0] = 0 (%rax contains the address of first element and (%rax)is the value)
	movq	-32(%rbp), %rax  #move the contents from -32 offset of rbp to rax (quad word) => rax is a pointer to the array 
	movl	$1, 4(%rax)		 #store 1 at rax offset by +4 bytes i.e. assign to the second element of the array - arr[1] = 1 
	movl	$2, -44(%rbp)	 #initialize loop variable(say i) to 2
	jmp	.L2					 #unconditional jump to block .L2 (which starts the loop)
.L3:
	movl	-44(%rbp), %eax	  		#store the contents at -44(%rbp) which is the loop variable i to eax 
	leal	-1(%rax), %edx	  		#computes value of rax - 1 = i-1 and stores it in edx. This to access the i-1th element  
	movq	-32(%rbp), %rax   		#copy the pointer to the array stored in -32(%rbp) to rax
	movslq	%edx, %rdx		  		#convert int value in edx to long and store in rdx i.e. store i-1(int64) to rdx (Signed Extension)
	movl	(%rax,%rdx,4), %ecx		#move the value at (%rax + (%rdx)*4) = = (arr + 4*(i-1)) to ecx. This loads arr[i-1]
	movl	-44(%rbp), %eax			#store the contents at -44(%rbp) which is the loop variable i to eax
	leal	-2(%rax), %edx			#computes value of (%rax) - 2 = i-2 and stores it in edx. This to access the i-2th element
	movq	-32(%rbp), %rax         #copy the pointer to the array stored in -32(%rbp) to rax
	movslq	%edx, %rdx              #convert int value in edx to long and store in rdx i.e. store i-1(int64) to rdx (Signed Extension)
	movl	(%rax,%rdx,4), %eax		#move the value at (%rax + (%rdx)*4) = (arr + 4*(i-2)) to eax. This loads arr[i-2]
	addl	%eax, %ecx				#add arr[i-2] in eax and arr[i-2] in ecx and store in ecx
	movq	-32(%rbp), %rax 		#copy the pointer to the array stored in -32(%rbp) to rax
	movl	-44(%rbp), %edx			#store the loop index i in edx 
	movslq	%edx, %rdx 				#convert int value in edx to long and store in rdx i.e. store i(int64) to rdx (Signed Extension)
	movl	%ecx, (%rax,%rdx,4) 	#move arr[i-1] + arr[i-2] to the location (%rax + i*4) i.e arr[i] = arr[i-1] + arr[i-2]
	addl	$1, -44(%rbp)			#increament the loop index by 1 => i = i+1
.L2:
	movl	-44(%rbp), %eax  		#store the contents at -44 offset to rbp which is the loop variable i to eax  
	cmpl	-52(%rbp), %eax         #compare n = 9 stored at -52 offset from base pointer and the value in eax which is the loop inex (check i < = n) 
	jle	.L3							#jump to .L3(execute the loop statements) if i <= n - This is the point where the loop control flow takes place
	movq	-32(%rbp), %rax         #copy the pointer to the array stored in -32(%rbp) to rax
	movl	-52(%rbp), %edx			#copy n = 9 stored at -52 offset to base pointer to edx : 9 --> edx
	movslq	%edx, %rdx				#convert int value in edx to long and store in rdx i.e. store 9(int64) to rdx (Signed Extension)
	movl	(%rax,%rdx,4), %eax		#move the value at (%rax + (%rdx)*4) = (arr + 4*9) to eax. This loads arr[9] i.e arr[n] in eax. This is our final return value 
	movq	%rsi, %rsp				#restores the previous stack pointer stored in rsi  (moves the contents of rsi to rsp)
	movq	-24(%rbp), %rbx			#copies the contents at (-24 offset to %rbp) into rbx (this is the content of %fs:40 that was stored earlier)
	xorq	%fs:40, %rbx			#clears %fs:40 to 0 
	je	.L5							#jumps to block .L5 if equal to
 	call	__stack_chk_fail@PLT	#call to check if stack memory is full or not 
.L5:
	movq	-8(%rbp), %rbx			#restore rbx 
	leave							#restore stack and frame pointers
	.cfi_def_cfa 7, 8				#defines a rule for computing CFA as: take address from register 7 and add offset +8 to it
	ret                             #return
	.cfi_endproc					#closes unwind entry opened by .cfi_startproc
.LFE0:
	.size	func, .-func  			#size of the function func is defined here
	.section	.rodata				#A zero terminated string included in this section, ro means
.LC0:
	.string	"%d"                    #Stores the string "%d"                                                                  
	.text 							#Text block to store function
	.globl	main 					# .globl connects main to linker and makes it visible globally in the program		
	.type	main, @function  		#specifies main as a function 
main:
.LFB1:
	.cfi_startproc			  #It initializes some internal data structures.(CFI directive)
	pushq	%rbp		 	  #save the current frame pointer 
	.cfi_def_cfa_offset 16    #modifies a rule for computing CFA. Register remains the same, but offset is new = 16. Note that it is the absolute offset that will be added to a defined register to compute CFA address	  
	.cfi_offset 6, -16		  #Previous value of register 6 is saved at offset -16 from CFA.
	movq	%rsp, %rbp	 	  #create a new frame pointer pointing to the top of the stack
	.cfi_def_cfa_register 6	  #store the Call frame address in register 6 - used only when debugging 
	subq	$16, %rsp		  #allocate 16 bytes for local variables
	movl	$9, -4(%rbp)	  #store 9(int32) at the base pointer offset by 4 i.e. int <variable_name> = 9 
	movl	-4(%rbp), %eax	  #move 9(int32) to eax 
	movl	%eax, %edi		  #Load 9(int32) as the first arguement by moving it from eax to edi 
	call	func			  #Function call to .LFE0 - func
	movl	%eax, %esi		  #store the return value(value in eax) to esi - %esi will be the second argument to printf 
	leaq	.LC0(%rip), %rdi  #copy the string "%d" to rdi which will be the first argument to printf 
	movl	$0, %eax		  #clear eax to 0
	call	printf@PLT		  #Call printf with first arg - "%d" and second arg - value in esi(int 32) -> printf("%d", a) where a was the function return value 
	call	getchar@PLT		  #Call getchar 
	movl	$0, %eax		  #Clear eax to 0
	leave					  #restore the stack and frame pointers
	.cfi_def_cfa 7, 8		  #defines a rule for computing CFA as: take address from register 7 and add offset +8 to it
	ret						  #return
	.cfi_endproc			  #closes unwind entry opened by .cfi_startproc
.LFE1:
	.size	main, .-main						#size of the main function defined here 
	.ident	"GCC: (GNU) 7.1.1 20170630"			#Identifies the version of compiler that generated this assembly code
	.section	.note.GNU-stack,"",@progbits	#Choose whether to have an executable stack or not


# Description of what program does : 
# The program contains two functions - main and func.
# func takes an integer(32 bit) say n as its only argument and computes the nth Fibonacci term using Dynamic Programming approach (bottom up) (n should not be negative or there is gonna be an error)
# func takes F0 = 0 and F1 = 1 as the starting Fibonacci terms.
# The main function calls func with argument 9.
# The final output on the screen is 34.
