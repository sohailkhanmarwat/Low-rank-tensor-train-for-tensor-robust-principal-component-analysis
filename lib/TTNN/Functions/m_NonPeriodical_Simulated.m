function [NonP_Stripe,S]   =  m_NonPeriodical_Simulated(Ori,rate,mean)
%% 
%case1:
%%%%%%%%%%%%%%%%%%%%-----------Chang creat stripe noise---------%%%%%%
%��1����10�������������ʼ�У�Ȼ����10Ϊ���ڼ���������
%ǰ�����ͬʱ����һ���̶�������mean
%�������ͬʱ��ȥһ���̶�������mean
%������Ч���Ϳ��Դﵽ�ӵ���������Ϊ1
rand('seed',2);
[Row, Col] = size(Ori);
S=zeros(Row,Col);
Location = randperm(Col,round(rate*Col));
S(:,Location(1:round(rate*Col/2)))=S(:,Location(1:round(rate*Col/2))) + mean;
S(:,Location(round(rate*Col/2)+1:round(rate*Col)))=...
           S(:,Location(round(rate*Col/2)+1:round(rate*Col))) - mean;
N=0.01*randn(Row,Col);
NonP_Stripe=Ori+S+N;
 %%
 %case2  ��   �����ϵ�ֵ��ͬ�����ǲ�ͬ�����ϵ�ֵ��ͬ(�����и���������Ҳ���Դﵽ��������Ϊ1
%  rand('seed',2);
% [Row, Col] = size(Ori);
% Location = randperm(Col,round(rate*Col));
% u=randi([0 50],1,length(Location));
% S=zeros(Row,Col);
% S(:,Location(1:round(rate*Col/2)))=S(:,Location(1:round(rate*Col/2)))...
%     + repmat(u(1:round(rate*Col/2)),Row,1);
% S(:,Location(round(rate*Col/2)+1:round(rate*Col)))=...
%            S(:,Location(round(rate*Col/2)+1:round(rate*Col))) - repmat(u(round(rate*Col/2)+1:length(Location)),Row,1);
%  N=0.01*randn(Row,Col);
% NonP_Stripe=Ori+S+N;