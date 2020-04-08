%Labb 1: uppgift 1 c) Newtins metod 
%Magnus Thuln 
%Startgissningar; f(1.95), f(2.759), f(3.9), f(4.9), f(6),f(6.65)

function nroot=newton(x0, tou)

format long 
f = @(x)x.^2-9.*x-12.*sin(3.*x+1)+20;
df=@(x)2.*x-9-36.*cos(3.*x+1);

x2 = [x0]; %bevarar start gisningen för felberäkningen 
start =0;
slut =1000;
x =x0; 
x1 =x-f(x)/df(x);

while (abs(x-x1) > tou) 
    if start > slut
        disp('iterationen är slut');
        break;
    end
x = x1;
x1 = x-f(x)/df(x);
x2 =[x2; x1];
start = start+1;
disp(start); %testa fprintf(för att printa en sträng) 
disp(x);
disp(abs(x1-x));
 %
end 
format long 
iteration=(0:start)';  %antal upprepningar 
table(iteration,x2);
Felberakning=abs(x2(2:end)-x2(1:end-1));   %tabel som listar upp felbärkningarna inom från 
%repsketive iteration, detta för att se konvergens takten/förändringen. 
table(iteration(2:end),x2(2:end),Felberakning);
loglog(iteration(2:end),Felberakning); 
hold on
grid on
nroot=x;
end 

%Vilken av fixpunkt och Newton konvergerar snabbast:
%Om newton konvergerar mot fixpunkten kommer den ha en snabbare
%konvergenshastigeht än fixpunktiterationen. Detta för att Newton har en
%kvadragtisk konvergens medans fipunktitteration har en lijnär konvergens 

%Dubbleras antalt korrekta siffor efter varje iteration?
%Mycket sannolikt att det stämmer 

 