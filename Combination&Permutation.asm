.data
str1: .string "s1113356\n" ###顯示學號字串
m: .string "input number M=" ###提示輸入M的字串
n: .string "input number N=" ###提示輸入N的字串
p_result: .string "P(M,N)=" ###P(M,N)結果的前綴字串
c_result: .string "C(M,N)=" ###C(M,N)結果的前綴字串
h_result: .string "H(M,N)=" ###H(M,N)結果的前綴字串
mn_result: .string "M^N=" ###M^N結果的前綴字串

.text
main:
    ### Display sID
    la a0, str1 ###加載str1的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用

    ###input m
    la a0, m ###加載m的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用
    li a7, 5 ###載入系統調用碼5(讀取整數)
    ecall ###執行系統調用
    mv s0, a0 ###將讀取到的整數M存入s0

    ###input n
    la a0, n ###加載n的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用
    li a7, 5 ###載入系統調用碼5(讀取整數)
    ecall ###執行系統調用
    mv s1, a0 ###將讀取到的整數N存入s1

    li t0,0 ###初始化t0為0

    ###計算 P(n, k) = n! / (n-k)!
    mv a0, s0 ###將M的值傳遞給a0(factorial函數的參數)
    jal factorial ###調用factorial函數計算M!
    mv s2, a0 ###將M!的值存入s2
    sub a0, s0, s1 ###計算M-N,結果存入a0(factorial函數的參數)
    jal factorial ###調用factorial函數計算(M-N)!
    div s2, s2, a0 ###將M!除以(M-N)!,結果存入s2(即P(M,N))
    mv s3, s2 ###將P(M,N)的值備份到s3

    jal pp ###調用pp函數打印P(M,N)的結果

    ###計算 C(n, k) = n! / (k! * (n-k)!)
    mv a0, s1 ###將N的值傳遞給a0(factorial函數的參數)
    jal factorial ###調用factorial函數計算N!
    div s3, s3, a0 ###將P(M,N)除以N!,結果存入s3(即C(M,N))
    jal pc ###調用pc函數打印C(M,N)的結果

    ###計算 H(M,N) = (M+N-1)! / (N! * (M-1)!)
    add t0, s0, s1 ###計算M+N,結果存入t0
    addi t0, t0, -1 ###計算M+N-1,結果存入t0
    mv a0, t0 ###將M+N-1的值傳遞給a0(factorial函數的參數)
    jal factorial ###調用factorial函數計算(M+N-1)!
    mv s4, a0 ###將(M+N-1)!的值存入s4

    mv a0, s1 ###將N的值傳遞給a0(factorial函數的參數)
    jal factorial ###調用factorial函數計算N!
    mv t1, a0 ###將N!的值存入t1

    mv a0, s0 ###將M的值傳遞給a0(factorial函數的參數)
    addi a0, a0, -1 ###計算M-1
    jal factorial ###調用factorial函數計算(M-1)!
    mul t1, t1, a0 ###計算N!*(M-1)!,結果存入t1

    div s4, s4, t1 ###將(M+N-1)!除以(N!*(M-1)!),結果存入s4(即H(M,N))
    jal ph ###調用ph函數打印H(M,N)的結果

    ###計算 M^N
    mv a0, s0 ###將M的值傳遞給a0(power函數的第一個參數)
    mv a1, s1 ###將N的值傳遞給a1(power函數的第二個參數)
    jal power ###調用power函數計算M^N
    mv s5, a0 ###將M^N的值存入s5
    jal pmn ###調用pmn函數打印M^N的結果

    j end ###跳轉到end標籤

pp:
    la a0, p_result ###加載p_result的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用
    mv a0, s3 ###將s3(P(M,N)的值)載入a0
    li a7, 1 ###載入系統調用碼1(打印整數)
    ecall ###執行系統調用
    li a0, '\n' ###載入換行符'\n'到a0
    li a7, 11 ###載入系統調用碼11(打印字符)
    ecall ###執行系統調用
    ret ###返回

pc:
    la a0, c_result ###加載c_result的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用
    mv a0, s3 ###將s3(C(M,N)的值)載入a0
    li a7, 1 ###載入系統調用碼1(打印整數)
    ecall ###執行系統調用
    li a0, '\n' ###載入換行符'\n'到a0
    li a7, 11 ###載入系統調用碼11(打印字符)
    ecall ###執行系統調用
    ret ###返回

ph:
    la a0, h_result ###加載h_result的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用
    mv a0, s4 ###將s4(H(M,N)的值)載入a0
    li a7, 1 ###載入系統調用碼1(打印整數)
    ecall ###執行系統調用
    li a0, '\n' ###載入換行符'\n'到a0
    li a7, 11 ###載入系統調用碼11(打印字符)
    ecall ###執行系統調用
    ret ###返回

pmn:
    la a0, mn_result ###加載mn_result的地址到a0
    li a7, 4 ###載入系統調用碼4(打印字串)
    ecall ###執行系統調用
    mv a0, s5 ###將s5(M^N的值)載入a0
    li a7, 1 ###載入系統調用碼1(打印整數)
    ecall ###執行系統調用
    li a0, '\n' ###載入換行符'\n'到a0
    li a7, 11 ###載入系統調用碼11(打印字符)
    ecall ###執行系統調用
    ret ###返回

factorial:
    li t0, 1 ###初始化t0為1
    mv t1, a0 ###將a0(函數參數)的值複製到t1
    addi t1, t1, -1 ###計算t1-1,結果存入t1(用於循環條件判斷)
loop:
    bge t0, t1, endfactorial ###如果t0>=t1,則跳轉到endfactorial標籤
    mul a0, a0, t1 ###計算a0*t1,結果存入a0
    addi t1, t1, -1 ###減小t1的值
    jal x0, loop ###跳轉到loop標籤(循環)
endfactorial:
    jr ra ###返回到調用者

power:
    li t0, 1 ###初始化t0為1(用於存儲累乘結果)
    mv t1, a1 ###將a1(第二個參數,即N)的值複製到t1(用於循環條件判斷)
loop_pow:
    beq t1, zero, end_pow ###如果t1(N)為0,則跳轉到end_pow標籤
    mul t0, t0, a0 ###計算t0*a0(M),結果存入t0
    addi t1, t1, -1 ###減小t1(N)的值
    j loop_pow ###跳轉到loop_pow標籤(循環)
end_pow:
    mv a0, t0 ###將t0(M^N的值)存入a0(作為返回值)
    jr ra ###返回到調用者

end:
    li a7, 10 ###載入系統調用碼10(退出程序)
    ecall ###執行系統調用