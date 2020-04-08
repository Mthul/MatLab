%Labb 1, uppgift 2 d) 
%Magnus Thulin 

%Optimera svaret i c) gneom LU-faktorisering av A
%Bestäm tidsåtgångan av avrje fall 
%Samla resultaten i en tabell

%Modell 1:
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
tid1 = toc/261;

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
tid2 =toc/261;

%Modell 2 med LU fktorisering:
load eiffel2.mat
l=length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:399
    
b = rand(2*l,1);
b(2*j) = -1;   
y = L\b;
x = U\y;
D = [D;norm(x)];

end

[Y,I]= max(D);
[O,P]= max(D);
 tid3 = toc/399;
%MOdell 2 utan LU-faktorisering:
load eiffel2.mat;
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
tid4 = toc/399;

%Modell 3 med LU-faktorisering 
load eiffel3.mat
l = length(xnod);
[L,U] = lu(A);
D = [];
tic;

for j = 1:1:561
    
b=rand(2*l,1);
b(2*j)= -1;
y=L\b;
x=U\y;
D = [D;norm(x)];

end

[Y,I]= max(D);
[O,P]= max(D);
tid5 = toc/561;

%Modell 3 utan LU fakt:
load eiffel3.mat
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
tid6 = toc/561;

%Modell 4 med LU-fakt:
load eiffel4.mat
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
tid7 = toc/1592;

%Modell 4 utan LU-fakt:
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
tid8 = toc/1592;
%Konstruktion av tabell för opreationstid av varje modell
Modell = ['eiffel1'; 'eiffel2';'eiffel3';'eiffel4';];
Backlash_tid = [tid2; tid4; tid6; tid8;];
LU_fakt_tid = [tid1; tid3; tid5; tid7;];
table(Modell, Backlash_tid, LU_fakt_tid)
    