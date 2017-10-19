close all
clear all
clc
span = 0.6;
m = 0.026;
v=4;
rho=1.225;
q=0.5*rho*v.^2;

for k = 2:5
    [cr,ct,sweep,lambda,ac,gc,S,maxct] = flift(k,v,m);
    f=figure(k);
    cp = maxct-cr;
    x=[0 0 span/2 span span span/2 0];
    y=[0 ct maxct ct 0 cp 0];
    a=maxct-ac;
    hold on
    plot(x,y,'r');
    refline(0,a);
    plot(gc(1),gc(2),'g*');
    pbaspect([span/maxct 1 1]);
    [maxw,maxcruise]=flightperformance(S,q);
    d={'angle of attack',k,'[°]';
       'speed',v,'[m/s]';
       'mass',m,'[kg]';
       'root chord',cr,'[m]';
       'tip chord',ct,'[m]';
       'sweep angle',sweep,'[°]';
       'taper',lambda,'dimensionless';
       'position of the ac from the nose',ac,'[m]';
       'max Lift at 10°',maxw,'[N]';
       'max Cruise Lift 5°',maxcruise,'[N]'};
    t = uitable(f,'Data',d,'Position',[0 0 300 200]);
    
    switch k
        case 2
            p='2.png';
        case 3
            p='3.png';
        case 4
            p='4.png';
        case 5
            p='5.png';
    end
    
    saveas(f,p);
end