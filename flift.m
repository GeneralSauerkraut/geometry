function [cr,ct,sweep,lambda,ac,gc,S,maxct] = flift(aoa,v,m)
   %% set parameters
%Br1
Cl0=0.12;
dCl=0.126;
W=m*9.81;
rho=1.225;
q=rho*0.5*v.^2;
minct=0.065;
maxct=0.2;
span=0.6;

%% calculate
Cl=Cl0+aoa*dCl;
S=W/(q*Cl);
ca=S/span;
cr=2*ca-minct;
ct = minct;
if cr>maxct
    ct=2*ca-maxct;
    cr=maxct;
end
if cr<0.065
    cr=0.065;
end
lambda=ct/cr;

%% sweep
caplamb=atan((maxct-ct)/(span/2));
sweep=radtodeg(caplamb);

%% aerodynamic center
%ac=tan(caplamb)*span/4+(cr+ct)/8;

Ages=0.3*maxct;
A1=0.3*(maxct-cr)*0.5;
A2=0.3*(maxct-ct)*0.5;

xges=0.3/2;
x1=0.3/3;
x2=0.3*2/3;

x=(Ages*xges-A1*x1-A2*x2)/(Ages-A1-A2);

cx=cr-((cr-ct)/0.3)*x;

ac=x*sin(caplamb)+0.25*cx;

%% geometric center

yges=maxct/2;
y1=maxct-(maxct-cr)/3;
y2=(maxct-ct)/3;

y=(Ages*yges-A1*y1-A2*y2)/(Ages-A1-A2);

gc=[span/2 y];
end