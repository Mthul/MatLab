%Labb 1 
%Uppgift 1 b) : Fixpunktiteration 
%fixpuntken menas med att inuten = outputen, vilket motsvarar whileloopen 
%Startgissningar: f(1.95), f(2.759), f(3.9), f(4.9), f(6),f(6.65)

function xrot = fixpunkt(x0, tou) %deff funktion med in data x0 och tou  
%x0 = Start gisningsvärde 
% tou = tolerans 
%xrot = utdata 
format long 
h = @(x)(1/15).*x.^2+(11/20).*x-(3/5).*sin(3.*x+1)+1 % omskirven f(x), har brutit ut x från 9x  
f = @(x)x.^2-9.*x-12.*sin(3.*x+1)+20 %orginalfunktionen 

start = 0; %  start värde för iteration
slut = 1000; % maxvärde för iteration 
x = x0; %startgissning 
x1 = h(x);  %funktionsvärdet av startgissningen 

while (abs(x1-x) > tou) %medans differensen mellan input och 
%funktionsvärdet < tollererat fel, kommer det förgågna funktionsvärdet bli
%det nya inputvärdet 
%plot([x, x], [x, h(x)], 'k-');
%hold on 
%plot([x, x1], [x, h(x1)], 'k--');
 
    if slut < start 
        disp('iterationen har nått sin max gräns %d \n', slut);
        
        break;
    end
x = x1;    
x1 = h(x);
start = start + 1;
fprintf('Nya x värdet: %f\n',x); 
fprintf('Differanse:');
disp(abs(x1-x));
fprintf('Itteration: %d\n', start);
disp(' ');
end 

xrot = x; 

end 

%Följd frågor:
% Varför är h(x) en fixpunktitteration för f(x);
% teorin: x.^2-9.*x-12.*sin(3.*x+1)+20 = 0
% f(x) = x.^2-9.*x-12.*sin(3.*x+1)+20
% x = (1/15).*x.^2+(11/20).*x-(3/5).*sin(3.*x+1)+1
% h(x) = x;
% h(x) = (1/15).*x.^2+(11/20).*x-(3/5).*sin(3.*x+1)+1

%Varför kan nolställen hittas via fixpunktiteration:
%Teroin går ut på att lösa f(x) = 0 
% Metoden itererar tills en tolerans är nådd, toleransen baseras på att
% nya xvärdet - förgående xvärdet skall vara så nära noll som möjligt.

%Hur skall |x1 - x| avta enligt teorin:
% |x1 - x| skall avta linjärt om |h'(fixpunkt)|<1, vilket stämmer för detta
% fall, den avtar linjärt 




