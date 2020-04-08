%Labb 1, uppgift 2 e)
%Magnus Thulin 
%Via framhävan av att A är en Gles matris, testa om ny beräkningsmetod går
%snabbare 

%Med LU-faktorisering 
load eiffel1.mat 
[L,U] = lu(A); %LU faktorisering av A så att A = L*U, där L är undertriangulär och U övertriangulär 
l = length(xnod); %längden av x-vekotrn 
D = []; %tom lista som kommer användas för lagring 
tic; %start av tidtagningen för modell 1 

for j = 1:1:261
    
b = rand(2*l,1);
b(2*j)= -1;
y = L\b; 
x = U\y;
D = [D;norm(x)];

end

[O,P]= max(D);
[Y,I]= max(D);
M1LU = toc/261;

%Utan LU faktorisergin: 
load eiffel1.mat
l = length(xnod);
D = [];
tic;

for j = 1:1:261
    
b =rand(2*l,1);
b(2*j)= -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[S,J] = min(D);
M1B =toc/261;

%Modell 1 med LU fktorisering och Sparese:
load eiffel1.mat
spy(A)
A = sparse(A);
l=length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:261
    
b = rand(2*l,1);
b(2*j) = -1;   
y = L\b;
x = U\y;
D = [D;norm(x)];

end

[Y,I]= max(D);
[O,P]= max(D);
M1LUS = toc/261;
%MOdell 1 utan LU-faktorisering med sparse:
load eiffel1.mat
A = sparse(A);
l = length(xnod);
D = [];
tic;

for j = 1:1:261
    
b = rand(2*l,1);
b(2*j) = -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[O,P] = min(D);
M1BS = toc/261;

%Modell 2 med LU-faktorisering: 
load eiffel2.mat
l = length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:399
    
b=rand(2*l,1);
b(2*j)= -1;
y=L\b;
x=U\y;
D = [D;norm(x)];

end

[Y,I]= max(D);
[O,P]= max(D);
M2LU = toc/399;

%Modell 3 utan LU fakt:
load eiffel3.mat
l = length(xnod);
D = [];
tic;

for j = 1:1:399;
    
b = rand(2*l,1);
b(2*j) = -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[O,P] = min(D);
M2B = toc/399;

%Modell 2 med LU-fakt och sparse:
load eiffel2.mat
A = sparse(A);
l = length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:399;
    
b = rand(2*l,1);
b(2*j)= -1;  
y = L\b;
x = U\y;
D = [D;norm(x)];

end

[Y,T]= max(D);
[O,P]= max(D);
M2LUS = toc/399;

%Modell 2 utan LU-fakt med Sparse:
load eiffel2.mat
l = length(xnod);
D = [];
tic;

for j = 1:1:399
    
b = rand(2*l,1);
b(2*j) = -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[O,P] = min(D);
M2BS = toc/399;

%Modell 3 ed LU-faktorisering:
load eiffel3.mat
[L,U] = lu(A); %LU faktorisering av A så att A = L*U, där L är undertriangulär och U övertriangulär 
l = length(xnod); %längden av x-vekotrn 
D = []; %tom lista som kommer användas för lagring 
tic; %start av tidtagningen för modell 1 

for j = 1:1:561
    
b = rand(2*l,1);
b(2*j)= -1;
y = L\b; 
x = U\y;
D = [D;norm(x)];

end

[O,P]= max(D);
[Y,I]= max(D);
M3LU = toc/561;

%Utan LU faktorisergin: 
load eiffel3.mat
l = length(xnod);
D = [];
tic;

for j = 1:1:561
    
b =rand(2*l,1);
b(2*j)= -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[S,J] = min(D);
M3B =toc/561;

%Modell 3 med LU fktorisering och Sparese:
load eiffel3.mat
A = sparse(A);
l=length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:561
    
b = rand(2*l,1);
b(2*j) = -1;   
y = L\b;
x = U\y;
D = [D;norm(x)];

end

[Y,I]= max(D);
[O,P]= max(D);
M3LUS = toc/561;
 
%MOdell 3 utan LU-faktorisering med sparse:
load eiffel3.mat
A = sparse(A);
l = length(xnod);
D = [];
tic;

for j = 1:1:561
    
b = rand(2*l,1);
b(2*j) = -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[O,P] = min(D);
M3BS = toc/561;

%Modell 2 med LU-faktorisering: 
load eiffel4.mat
l = length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:1592
    
b=rand(2*l,1);
b(2*j)= -1;
y=L\b;
x=U\y;
D = [D;norm(x)];

end

[Y,I]= max(D);
[O,P]= max(D);
M4LU = toc/1592;

%Modell 4 utan LU fakt:
load eiffel4.mat
l = length(xnod);
D = [];
tic;

for j = 1:1:1592
    
b = rand(2*l,1);
b(2*j) = -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[O,P] = min(D);
M4B = toc/1592;

%Modell 4 med LU-fakt och sparse:
load eiffel4.mat
A = sparse(A);
l = length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:1592
    
b = rand(2*l,1);
b(2*j)= -1;  
y = L\b;
x = U\y;
D = [D;norm(x)];

end

[Y,T]= max(D);
[O,P]= max(D);
M4LUS = toc/1592;

%Modell 4 utan LU-fakt med Sparse:
load eiffel4.mat
A = sparse(A);
l = length(xnod);
D = [];
tic;

for j = 1:1:1592
    
b = rand(2*l,1);
b(2*j) = -1;
x = A\b;
D = [D;norm(x)];

end

[Y,I] = max(D);
[O,P] = min(D);
M4BS = toc/1592;

Backlash_tid=[M1B; M2B; M3B; M4B;];
Spare_Backlash_tid=[M1BS; M2BS; M3BS; M4BS];
LU_fakt_tid=[M1LU; M2LU; M3LU; M4LU;];
LU_fakt_Sparse_tid=[M1LUS; M2LUS; M3LUS; M4LUS;];
table(Backlash_tid, Sparse_Backlash_tid, LU_fakt_tid, LU_fakt_Sparse_tid)