nt = 1000
seed = 99
m = ACQR_simula(nt,seed)
y = m["y"]

############################### starting point
nx = 4
i = nx+1
Ai,Ci,Qi,Ri,Si = ACQRS_sub(y,nx,i)
m1i = Ci\y[:,1:1]
P1i = 0*Ai

#######################
max_iter=10
tol=1e-6
txo=false
print("Testing ACQR_em: ")
A,C,Q,R,m1,P1,loglik,aic = ACQR_em(y,Ai,Ci,Qi,Ri,m1i,P1i,max_iter,tol,txo)
if sum(A.^2) > 1e-6
    println("OK")
end
