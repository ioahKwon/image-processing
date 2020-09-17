E = 50
m = 0.25
r =0:0.1:1
s = 1./(1+(m./(double(r))).^E)
plot(r,s)