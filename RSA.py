# choose Prime number p and q
# n=p*q
# fai_n=(p-1)*(q-1)
# choose prime e that > p and q
# choose d which (de)modfai_n=1
#
# public key:(n,e)
# secret_key:(n,d)
# Plaintext m<n
# secrettext c
# c=m**e mod n
# m=c**d mod n
p=9941
q=9949
e=10007
plaintext=9252302

n=p*q
fai_n=(p-1)*(q-1)

k=1
d=(k*fai_n+1)/e

while(d-int(d)>1E-5):
    k=k+1
    d = (k * fai_n + 1) / e
print("d=",d)
d=int(d)

print("plaintext is:",plaintext)
if(plaintext>=n):
    print("too big! max num is",n)
secrettext=plaintext**e%n
print("secrettext is:",secrettext)
solve=secrettext**d%n
print("the solving text is:",int(solve))