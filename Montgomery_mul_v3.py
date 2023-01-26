# A
# p=106697219132480173106064317148705638676529121742557567770857687729397446898790451577487723991083173010242416863238099716044775658681981821407922722052778958942891831033512463262741053961681512908218003840408526915629689432111480588966800949428079015682624591636010678691927285321708935076221951173426894836169
  
# q = 144819424465842307806353672547344125290716753535239658417883828941232509622838692761917211806963011168822281666033695157426515864265527046213326145174398018859056439431422867957079149967592078894410082695714160599647180947207504108618794637872261572262805565517756922288320779308895819726074229154002310375209

##########################Montgomery algorithm######################################
def Mon(A, B, M, An_bit, Bn_bit):
    n_a = '{:0%sb}' % An_bit
    A1_bin = n_a.format(A)  # 二进制A
    print('X:', A1_bin)

    n_b = '{:0%sb}' % Bn_bit
    B1_bin = n_b.format(B)  # 二进制B
    print('Y:', B1_bin)

    C = 0
    for a in A1_bin[::-1]:  # 最低位开始
        if int(a) == 1:
            C += B
        else:
            C = C

        C_bin = bin(C)
        if int(C_bin[-1]) == 1:
            C += M
            C //= 2
        else:
            C //= 2
            # print('C_each',bin(C))

    while C > M:  # 0 < C < M
        C = C - M
    print('MMM(X,Y,M) value:', C, '\n')

    return C


M = 29
#############################
A = 19
An_bit = 5  # 5bit

# R = 2**10
R = 2 ** 10 % M
Rn_bit = 10  # 10bit

C1 = Mon(A, R, M, An_bit, Rn_bit)  ###C1
#######################################

# R = 2**10
R = 2 ** 10 % M
Rn_bit = 10

B = 15
Bn_bit = 5

C2 = Mon(B, R, M, Bn_bit, Rn_bit)  # C2
############################################

C11n_bit = 5
C22n_bit = 5

C3 = Mon(C1, C2, M, C11n_bit, C22n_bit)  # C3
############################################

C33n_bit = 5

C4 = Mon(C3, 1, M, C33n_bit, 5)  # C4
############################################
print('A*B mod M = ', C4)
