function [maxw,maxcruise] =flightperformance(S,q)
    Cl0=0.12;
    dCl=0.126;
    aoastall=10;
    
    Clm=Cl0+aoastall*dCl;
    
    maxw=q*Clm*S;
    
    Clc=Cl0+5*dCl;
    
    maxcruise=q*Clc*S;
end