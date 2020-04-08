%Labb 1 / uppgift : Olinjär skalär ekvation
%Magnus Thulin 
%Bestäm samtliga rötter till: x^2-9*x-12sin(3*x+1)+20 = 0
% a): Plotta f(x) = x^2 - 9*x - 12sin(3*x+1) + 20 

function [y]=nollstallen(x)  %skapar en funktion 

f =@(x)x.^2-9.*x-12*sin(3*x+1)+20; %defninerar funktionen 
x = [-12:0.1:12];  %Skapar ett intervall för plotten, och förhoppningvis finna nollställen 
y = f(x);          %härnvisar y tillfunktionen f(x) för plotten 
plot(x, y);        %plottar indatan X i funktionen Y
xlabel('x')        %defninerar x-axeln 
ylabel('y')        %definierar y-axeln 
hold on            % sparar pltten i figuren 
grid on    
S = solve(x.^2-9.*x-12*sin(3*x+1)+20 == 0) %lägger på ett rutnät på plotten, så man enkklare kan se skärningspunkterna 
end

%Via plotten kan man se 6 nollställen: [1.95;
%rötter ; f(1.95), f(2.759), f(3.9), f(4.9), f(6),f(6.65)





