%Labb 1, uppgift 3 a,b)
%Magnus Thulin 
%Fråga a) Ta fram jakobianen:
%Anropning av funktionen: xrot = punkter1([x1 y1 x2 y2], 0.8,
%1.4, [-1 1], [2 0], 1e-10)

function xrot = punkter1(x0,ra,rb,a,b,tou) 
% x0 = startgisninng 
% tou = tolerance 
% rb = radie för cirkel b 
% ra = radie för cirkel a 
% b = centrum för cirkel b 
% a = centrum för cirkel a

%Variabler 
%a = [xa ya]; %centrum för a 
%b = [xb yb]; %centrum för b 
%x = [x1 y1 x1 y2]; %definierar X-vektorn  
%r = [ra rb]; %vektor som lagrar raidrna 
x = x0; %x = startgissning

%Ekvationssystemet:
f1 = @(x1,y1) dot([x1-a(1),y1-a(2)],[x1-a(1);y1- a(2)]) - ra.^2; 
f2 = @(x2,y2) dot([x2-b(1),y2-b(2)],[x2-b(1);y2-b(2)]) - rb.^2;
f3 = @(x1,y1,x2,y2) dot([x1-x2,y1-y2],[x1-a(1),y1-a(2)]);
f4 = @(x1,y1,x2,y2) dot([x1-x2,y1-y2],[x2-b(1),y2-b(2)]);

%Sammansatta vektor funktionen F(f1,f2,f3,f4) = 0; 
F = @(x)[f1(x(1), x(2));...
    f2(x(3), x(4));...
    f3(x(1), x(2), x(3), x(4));...
    f4(x(1), x(2), x(3), x(4))];

%jakobianen (Partiella-derivatan med avseende på (x1,y1,x2,y2) av ekvationsystemet):

J = @(x)[2*(x(1)-a(1)), 2*(x(2)-a(2)), 0, 0; ...
    0, 0, 2*(x(3)-b(1)), 2*(x(4)-b(2));...
    2*x(1)-x(3)-a(1), ((x(3)-a(2))+(x(3)-x(4))), -(x(1)-a(1)), -(x(2)-a(2));...
    (x(3)-b(1)), (x(4)-b(2)), -2*x(3)+x(1)+b(1), -2*x(4)+x(2)+b(2)];

%Fråga b) Newtons medtod för icke-lnjära ekvationssystem:
hnorm = 100; %start värde/ uppdateras genom loopen 
tol = tou; %toleranse 
%While-loop tills hnorm är större än toleransen:
while hnorm > tol
    
h = x - J(x)\F(x);
hnorm = norm(h-x);
x = h
    
end 

h = x;
hold on;
axis equal; 
C = linspace(0,2*pi,100); %parametrisera cirklar med 200 punkter mellan 0:2*pi
%illustration av cirklarna 
D = [b(1) + rb*cos(C)]; %Cirkel b
E = [b(2)+ rb*sin(C)]; %Cirkel b
plot(D,E) %plotta cirkel b

hold on %väntar in cirkel a 

A = [a(1) + ra*cos(C)]; %cirkel a
B = [a(2)+ ra*sin(C)]; %cirkel a
plot(A,B) %plotta cirkel a 
%illustrerar linjen mellan objekten  
plot([h(1),h(3)], [h(2),h(4)]) %plottar den korrekta roten 
xrot = h 
end

%förstaroot -1 1.8 2 3.4
%andraroot -1.3924 0.3028 1.3133 -1.2200
%Tredjeroot -0.2903 1.3692 0.7580 -0.6461
%fjärderoot -0.6537 0.2788 1.3940 1.2621
%Det finns alltså fyra olika rötter. 


