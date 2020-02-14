function [ ret ] = conIneq( Xc,Uc,D,scale )
% inequality constraint
nS = 12;
nU = 6;
Xc = reshape(Xc,nS,numel(Xc)/nS);
Uc = reshape(Uc,nU,numel(Uc)/nU);
Acc = (D*(Xc(7:12,:).')/scale).';
Jerk = (D*(Acc.')/scale).';
Ucd = (D*(Uc.')/scale).';
% pos, velocity, torque constraints, considering motor feedforward
temp = [Xc;...
    Uc;...
    Ucd];

ret = [temp(:);...
    Xc(1:6,1);...
    Xc(7:12,1);...
    Acc(:,1);...
    Jerk(:,1);...
    Xc(1:6,end);...
    Xc(7:12,end);...
    Acc(:,end);...
    Jerk(:,end);...
    scale*2];

end

