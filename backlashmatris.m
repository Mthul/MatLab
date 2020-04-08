%Labb 1, uppgift 2 a) 
%av Magnus Thulin 

%load eiffel1.mat %importerar eiffel1.mat från matlab filer 
%plottar figuren som illustreras i trussplut med givna värden 
trussplot(xnod,ynod,bars); %hämtar funktion trussplot 
hold on %bevarar plotten i figuren 
grid on %adderar ett rutnät till plotten 

l = length(xnod); %längen av x-vektorn 
n = 261; %skapar en matrisdimension på 522
j = 260; %utvald nod av j:te värdet 

b = zeros(2*n,1); %Alla noder = 0, förutom någon nod (Fj = 1), x noderna påverkas 
b(j*2-1) = 1; %
x = A\b; %backlash operation för att få fram gausselimonationen 

xbel =xnod+x(1:2:end); %xbel = gamla koordinaten + förksjutningen i xled 
ybel =ynod+x(2:2:end); %ybel = gamla koordinaten + förskjutningen i yled

%plottar samma figur fast med nya förskjutningsvärderna (xbel,ybel)
trussplot(xbel,ybel,bars);
hold on 
plot(xbel(260), ybel(260), '*'); %utvald nod 
plot(xbel,ybel,'.'); %markerar varje nod med en prick för tydlighet 