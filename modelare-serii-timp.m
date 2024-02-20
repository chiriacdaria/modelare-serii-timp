clear all
close all
clc

%incarcare date din fisier
load("product_36.mat")

%impartire vectori date in identificare/validare
y_id=[]
for i=1:(((80/100)*length(y))+1) 
   y_id=[ y_id,y(i)];
end
y_val=[]
for i=length(y_id)+1 :length(time)
   y_val=[y_val, y(i)];
end

time_id=[]
for i=1:(((80/100)*length(time))+1 ) 
   time_id=[time_id,time(i)];
end

time_val=[];
for i=length(time_id)+1 :length(time)
   time_val=[time_val, time(i)];
end
plot(y, 'k','lineWidth',1.5), title('Date furnizate   ')
xlabel('t')
ylabel('y')
legend({'date furnizate'},'Location','southwest')
grid
% for m=1:100 %am incercat diferite capete pentru m si am dedus ca pentru m=10
% mse este minim
% m=8

for m=1:8
% m=2
%___________________________________________________________________________%
%%%%%%%%%%%%%%%%%%%%%%%%%% IDENTIFICARE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%___________________________________________________________________________%
P=12;
Q=zeros(length(y_id),2+2*m);
u=zeros(1,2*m);
ya=zeros(1,2+2*m);

for i=1:length(y_id)
  %luam elementele ce trebuie adaugate in plus in functie de m ul nostru si
  %le stocam pe pozitia adecvata lor
 for k=0:m-1
 nr1 = cos((2*pi*(k+1)*time_id(i))/P);
 nr2 = sin((2*pi*(k+1)*time_id(i))/P);
 u(k*2+1)=nr1;
 u(k*2+2)=nr2;
 end
     ya=[1 time_id(i) u];
   
      Q(i,:)=ya;
end
% length(Q)
%teta
O=zeros(length(Q) ,1);
O=Q\(y_id)'

y_aprox=Q*O;

%___________________________________________________________________________%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VALIDARE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%___________________________________________________________________________%
Q_val=zeros(length(y_val),2+2*m);
u_val=zeros(1,2*m);
y_validare=zeros(1,2+2*m);

for i=1:length(y_val)
 for k=0:m-1
 nr1_val = cos((2*pi*(1+k)*time_val(i))/P);
 nr2_val = sin((2*pi*(1+k)*time_val(i))/P);
 u(k*2+1)=nr1_val;
 u(k*2+2)=nr2_val;
 end
     y_validare=[1 time_val(i) u];
      Q_val(i,:)=y_validare;
 end
% length(Q)
%teta validare
O_validare=zeros(length(Q_val) ,1);

%___________________________________________________________________________%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% APROXIMARI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%___________________________________________________________________________%
% y aproximat pt identificare
y_aprox=Q*O;
% y aproximat pt validare
y_aprox_val=Q_val*O;

%___________________________________________________________________________%
%%%%%%%%%%%%%%%%%%%%%%%%% EVALUARE PERFORMANTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ERORI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%___________________________________________________________________________%
N=length(y_id);
mse(m) =(1/N)*sum(((y_aprox)'-y_id).^2); 
N_val=length(y_val);
mse_val(m) = (1/N_val)*sum(((y_aprox_val)'-y_val).^2);
end
%aflam valoarea minima pt m
[c,m]=min(mse_val)
% end

%___________________________________________________________________________%
%%%%%%%%%%%%%%%%%%%%%%%%%%% EROARE MINIMA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%___________________________________________________________________________%
%GRAFICE
figure
plot(time_id,y_id,'m',time_id,y_aprox,'black' ,'lineWidth',1.5),title('Identificare')
xlabel('t')
ylabel('y')
legend({'date furnizate','y aproximat identificare'},'Location','southwest')
grid
figure
plot(time_val,y_val,'m',time_val,y_aprox_val,'black','lineWidth',1.5),title('Validare')
xlabel('t')
ylabel('y')
legend({'date furnizate','y aproximat validare'},'Location','southwest')
grid

% garfic erori 
figure
subplot(211)
plot(mse,'black','lineWidth',1.5),title('Eroare Identificare')
xlabel('gradul m')
ylabel('mse')
legend({'eroare minima patratica identificare'},'Location','southwest')
grid
subplot(212)
plot(mse_val,'r','lineWidth',1.5),title('Eroare Validare')
xlabel('gradul m')
ylabel('mse')
legend({'eroare minima patratica validare'},'Location','southwest')
grid
figure

yy=[y_aprox;y_aprox_val]

plot(time,y,'black',time,yy','lineWidth',1.5), title('Reprezentare')
xlabel('t')       
ylabel('y')
legend({'date furnizate','y aproximat'},'Location','southwest')
grid
