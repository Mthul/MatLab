%Labb 1, uppgift 4 a) 
%Magnus Thulin 
%Simpson integrations metod 
%V(30) = 1.69096256
%V(60) = 1.69214695

function V = simpson(n)
y = @(x) pi.*(4./((1+x).*(7-4.*cos(pi.*x))))^2; %integrationen av volymen 
x0 = 0;  %startvärde 
L = 2.9; %längden av trapetsen 
h = L/(n-1); %Steglängden h 

I = linspace(0,L,n); %Vektor från 0:L med jämna delintervallen n
x1 = (h/3)*y(I(1));%Första termen x1
xs = (h/3)*y(I(n));%Sista termen xs 
U = 0;

%loop som visar alla  ojämnavärden mellan x1 och xs inom inervallt n
for i = 3:2:(n-1)
    z = y(I(i));%Steglängden som funktion av y av i:nte 
    U = U + z; %Sparar resultatet i U 
end

J = 0;
%loop som visar alla jämna värden mellan x1 och xs inom intervallet n
for i = 2:2:(n-1)
    
    v = y(I(i));%Steglängden som funktion av y 
    J = J + v;%Sparar resultatet i J 
    
end

U = 2*(U); %Multiplicerar de ojämna med 2 
J = 4*(J);%MUltiplicerar de jämna talen med 4 
UJ = (h/3)*(U+J);%MUltiplicerar U och J med h/3
%Lång format av V: 
format long
V = UJ + x1 + xs; %Summerar volymen 

end
