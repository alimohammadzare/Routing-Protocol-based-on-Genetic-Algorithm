a = 0;
b = 100;
for i = 1:200 % number of nodes
Data(i,1) = (b-a).*rand(1,1) + a;
Data(i,2) = (b-a).*rand(1,1) + a;
Data(i,3) = (b-a).*rand(1,1) + a;
Data(i,4) = (b-a).*rand(1,1) + a;
end
X = Data(:,1);
Y = Data(:,2);
EnergyLevel = Data(:,3);
EnergyRate = Data(:,4);