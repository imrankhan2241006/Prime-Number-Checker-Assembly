INCLUDE Irvine32.inc

.data
    prompt BYTE "Enter a number: ", 0
    primeMsg BYTE "The number is PRIME.", 0
    notPrimeMsg BYTE "The number is NOT PRIME.", 0

.code
main PROC

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt

    mov ebx, eax

    cmp ebx, 2
    jl NotPrime

    mov ecx, 2

CheckLoop:
    cmp ecx, ebx
    jge Prime

    mov eax, ebx
    cdq
    idiv ecx

    cmp edx, 0
    je NotPrime

    inc ecx
    jmp CheckLoop

Prime:
    mov edx, OFFSET primeMsg
    call WriteString
    jmp Finish

NotPrime:
    mov edx, OFFSET notPrimeMsg
    call WriteString

Finish:
    call Crlf
    exit

main ENDP
END main