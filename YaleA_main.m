clear all;
clc
rng(22)


load('yaleA_3view.mat');
X{1} = X{1}';
X{2} = X{2}';
X{3} = X{3}';
X = X';
gt =Y;
Clus_num = size(unique(gt),1); % number of clusters

%parameters
alpha = 80;gamma = 17;m = 3;  %%m =3c

U = AARLMC(X,gt,alpha,gamma,m); 
pre_labels  = kmeans(U,Clus_num,'emptyaction','singleton','replicates',20,'display','off');
result = EvaluationMetrics(gt,pre_labels);
fprintf("AC = %5.4f，NMI = %5.4f，purity = %5.4f\n",result(1),result(2),result(3));
