%Labb 1, uppgift 3 d)
%Magnus Thulin 

%Utnyttjar funktionen 'punkter' för att hitta rötternas koordinater mellan cirklarna
rot1 = punkter([0; 3.5; 4; 1], 1.5, 1, [-0.5, 2], [3.8; 0], 1e-10); 
rot2 = punkter([4.2; -0.8; 1.4; -3], 1.0, 0.7, [3.8; 0], [0.8; -2.8], 1e-10); 
rot3 = punkter([-1.9; 1.9; 0.1; -3], 1.5, 0.7, [-0.5; 2.0],[0.8, -2.8], 1e-10);

%Punkternas koordinater minus varandra för att få fram differensen 
langd1 = norm([rot1(1)-rot1(3), rot1(2)-rot1(4)]); %Längden genom att ta fram normalen av differensen 
langd2 = norm([rot2(1)-rot2(3), rot2(2)-rot2(4)]); 
langd3 = norm([rot3(1)-rot3(3), rot3(2)-rot3(4)]);


Ca = [rot1(1)+0.5, rot1(2)-2.0]; %skapar cirkelskivan vars bågläng vi vill ha
Cb = [rot3(1)+0.5, rot3(2)-2.0]; 
V1 = acos((dot(Ca,Cb))/(norm(Ca)*norm(Cb))) %Beräknar vinkel av "tårtbiten" där ingen rät linje finns

bl_a = V1*1.5; %Vinkel V1 multiplicerad med a:s radien för att få båglängden av en cirkel

Da = [rot1(3)-3.8, rot1(4)];
Db = [rot2(1)-3.8, rot2(2)];
V2 = acos((dot(Da,Db))/(norm(Da)*norm(Db)))

bl_b = V2*1.0; 

Ba = [rot2(3)-0.8, rot2(4)+2.8];% -.-
Bb = [rot3(3)-0.8, rot3(4)+2.8];% -.-
V3 = acos((dot(Ba,Bb))/(norm(Ba)*norm(Bb)))% -.-

bl_c = V3*0.7;

Summa_langd = langd1 + langd2 + langd3 + bl_a + bl_b + bl_c   
%Summerar totallängden och får det till 20.7221 




