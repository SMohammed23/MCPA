%Script for 1D Electron simulation 
set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth',2); 
clear all
close all

x0=0; 
x1=0; 

y=0; 
F=1; %Force
m=1; %mass

dt=1; 
iter=1000;

np=1;
v0= zeros(np,1); 
x0=zeros(np,1); 
t=0; 
%re=0.5; 
re= 1; 

for i = 2:iter
    t(i)= t(i-1)+dt; 
    
    v0(:,i) = v0(:,i-1) + F/m*dt;                                   %calculate electron positon 
    x0(:,i) = x0(:,i-1) + v0(:,i-1)*dt + F/m*dt^2/2; 
    
    r = rand(np,1) < 0.05; %For each step 0.05
    v0(r,i) = re*v0(r,i);  %accounting for scattering 
    AvgVel(i,:) = mean(v0,2); 
    
    subplot(3,1,1),
    plot(t,v0,'-'); 
    hold on 
    subplot(3,1,1),
    plot(t,AvgVel,'g*'); 
    hold off; 
    
    xlabel('time')
    ylabel('v')
    title(['Average Velocity of the Electron:' num2str(AvgVel(i))])  %plot  depicting average velocity of the electon 
    subplot(3,1,2),plot(x0(1,:),v0(1,:),'r-'); 
    hold on 
    subplot(3,1,2),plot(x0(1,:),AvgVel,'g*'); 
    hold off; 
    xlabel('x')
    ylabel('y')
    
    subplot(3,1,3),
    plot(t,x0,'-'); 
    xlabel('Time')
    ylabel('x')
    
    %Calculation of drift velocity 
    n=8.342*10^28;
    q=-1.60*10^-19;
    A=3.310*10^-6;
    I = 20.0 ;
    disp('drift velocity')
    vd=I/n*q*A;
    vd
    
    pause(0.01)
    
end
display('Average Velocity of the elctrons')
mean(v0)
    
    
