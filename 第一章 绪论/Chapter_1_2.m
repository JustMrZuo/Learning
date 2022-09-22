%% 题目信息
% 上机实验题Chapter_1_2
%% 预处理
clc;clear;
%% 变量定义
I1=zeros(1,21);% 注意到矩阵索引需为正值，I1(1)表示I0，以此类推。
I2=I1;
num_length=length(I1);
%% 变量赋值
I1(1)=0.154;% I0
I2(21)=0;% I20
%% 递推公式（1）
for i=2:num_length
    I1(i)=1/(i-1)-6*I1(i-1);
end
%% 递推公式（2）
for i=num_length:-1:2
    I2(i-1)=1/6/(i-1)*(1-(i-1)*I2(i));
end
%% 结果绘出
figure;
plot(1:num_length,I1,'-');
hold on;
plot(1:num_length,I2,'-.');
xlabel('n的取值');ylabel('In的值');
legend('迭代计算式1','迭代计算式2')