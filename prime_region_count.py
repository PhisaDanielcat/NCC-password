# 素数域算数
# 素数选择2**192-2**64-1，为一个192位二进制数
# 在64位操作系统中占3个字
# print(bin(2**192-2**64-1))

##多字整数加法
# def mul_words_add_mod(a,b,p=2**192-2**64-1):
#     return (a+b)%p
#
# a=2
# b=2**192-2**64-2
#
# print(mul_words_add_mod(a,b))

# Barrett约简
# 对于给定的正整数z和p，求z mod p
# 输入整数p,b>=3, k=int(logbp+1) 0<=z<=b**2k, miu=int(b**2k/p)
# 输出z mod p
import math
z=255
p=2
b=4
k=int(math.log(p,b))+1 #k=2,0<=z<256
miu=int(b**(2*k)/p)
q_hat=int(int(z/b**(k-1))*miu/b**(k+1))
r=(z%b**(k+1))-(q_hat*p%b**(k+1))
if r<0:
    r=r+b**(k+1)
while(r>=p):
    r=r-p
# print(r)
# print(z%p)

# Montgomory 约简

# 扩展的整数Euclidean算法
# 输入正整数a和b，a<=b
# 输出d=gcd(a,b),满足ax+by=d的整数x和y
# 也可用于求逆
p=97#prime number
# a= a number in region Fp
a1=2
a=a1
b=p
u=a
v=b
x1=1
y1=0
x2=0
y2=1
while(u!=0):
    q=int(v/u)
    r=v-q*u
    x=x2-q*x1
    y=y2-q*y1

    v=u
    u=r
    x2=x1
    x1=x
    y2=y1
    y1=y
d=v
x=x2
y=y2
# return(d,x,y)
# print("gcd(",a,",",b,")=",v)
# print("ax+by=d,x=",x,"y=",y)
# print(a,"*",x,"+",b,"*",y,"= 1")

# 基于扩展的Euclidean算法求Fp上的逆
# 输入素数p和域Fp上的数a
# 输出a模p的模逆a_ni
p=97
a=3
u=a
v=p
x1=1
x2=0
while(u!=1):
    q=int(v/u)
    r=v-q*u
    x=x2-q*x1

    v=u
    u=r
    x2=x1
    x1=x
# return a_ni
x=x1%p
print(x)

# Montgomery乘法
# R and p, gcd(R,p)=1,
# Montegomery 约简运算 for an input z<pR
# compute zR_ni mod p
# p_pie=-p_ni mod R
