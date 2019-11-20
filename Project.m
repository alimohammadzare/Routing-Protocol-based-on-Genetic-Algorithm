clc
clear all
Data=load('data.m');
Node=load('Node.m');
EnergyLevel = [];
ClusterHead = [];
EnergyRate = [];
sum = 1;
X = Data(:,1);
Y = Data(:,2);
EnergyLevel = Data(:,3);
EnergyRate = Data(:,4);
figure;
plot(X,Y,'bo');
axis([-30 110 -10 110])
hold on
plot(-20,50,'rs')
 hold on

for j = 1:length(EnergyLevel)
    if EnergyLevel(j)>70 && EnergyRate(j)>70 %minimum level of energy
        ClusterHead(sum,:) = Data(j,:);
        sum = sum + 1;
    end
end
NumberOfCH = length(ClusterHead)
plot(ClusterHead(:,1),ClusterHead(:,2),'r^');
hold off
figure;
plot(X,Y,'wo');
axis([-30 110 -10 110])
hold on
plot(-20,50,'rs')
hold on
plot(ClusterHead(:,1),ClusterHead(:,2),'r^');
hold off
[distance_ga,path_ga,g_num] = GA(Node);
distance_ga
path = [1 3 8 11 15]
g_num