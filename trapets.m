%Labb 1, uppgift 4 a)
%Magnus Thulin 
%V(30) = 1.70203990
%V(60) = 1.69489872
function V = trapets(n)
y = @(x) pi.*(4./((1+x).*(7-4.*cos(pi.*x))))^2; %deff integranden
x0 = 0; %startvärde 
L = 2.9; %längdne av trapetsen 
 
I = linspace(0,L,n); %vektor med jämna intervall från 0:L med n 
h = L/(n-1); %Steglängdne h 
j = 0; %deff j inför for-loopen 

xs = (h/2)*y(I(n)); %Tar fram  sista termen
x1 = (h/2)*y(I(1)); %Tar fram första termen 

%loop som tar fram alla värden genom n:s intervall 
for i = 2:1:n-1 
    c = y(I(i)); %Steglängden som funktion y inom det n:te värdet 
    j = j + c;   %Sparar summan från vajre iteration i j 
end

j = h*(j); %alla element mellan x0 och xs och multiplicerar dem med h
V = j + x1 + xs; %Summerar de färdiga elementen för att få fram Volymen 
