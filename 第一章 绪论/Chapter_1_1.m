%% 题目信息
% 上机实验题Chapter_1_1
%% 预处理
clc;clear;
%% 变量定义
x=[1,5,10,20,-1,-5,-10,-15,-20];
%% 变量赋值
x_input=x(4);% 基于矩阵进行x取值选择
num_of_calculation=100;% 设置展开计算项数
current_value_addto_output_single=zeros(1,num_of_calculation,'single');% 保存每次增加展开项的增加值
current_value_addto_output_double=zeros(1,num_of_calculation,'double');
current_output_single=zeros(1,num_of_calculation,'single');% 保存每次增加展开项的总值
current_output_double=zeros(1,num_of_calculation,'double');

%% 结果计算，分别以单精度双精度进行
k=0;% 注意到展开式从k=0开始，而数组从1开始
current_value_addto_output_single(1)=single(x_input)^k/factorial(k);% 进行第一项计算k=0
current_value_addto_output_double(1)=double(x_input)^k/factorial(k);
current_output_single(1)=current_value_addto_output_single(1);
current_output_double(1)=current_value_addto_output_double(1);
for i=2:num_of_calculation
    k=k+1;% 进行第二项计算l=1，以此类推
    current_value_addto_output_single(i)=single(x_input)^k/single(factorial(k));% 采用factorial计算阶乘（默认以双精度进行），使用外套的single（转化为单精度）保证阶乘项溢出后计算停止
    current_output_single(i)=current_output_single(i-1)+current_value_addto_output_single(i);
    current_value_addto_output_double(i)=double(x_input)^k/factorial(k);
    current_output_double(i)=current_output_double(i-1)+current_value_addto_output_double(i);
end
%% 结果绘出
figure;
subplot(2,2,1);
plot(1:num_of_calculation,current_value_addto_output_single);
xlabel('当前计算项数');ylabel('当前计算项数的添加值-单精度');
subplot(2,2,2);
plot(1:num_of_calculation,current_output_single);
hold on;plot(1:num_of_calculation,exp(x_input*ones(1,num_of_calculation)));% 画出理论值
xlabel('当前计算项数');ylabel('当前计算项数的总值-单精度');
subplot(2,2,3);
plot(1:num_of_calculation,current_value_addto_output_double);
xlabel('当前计算项数');ylabel('当前计算项数的添加值-双精度');
subplot(2,2,4);
plot(1:num_of_calculation,current_output_double);
hold on;plot(1:num_of_calculation,exp(x_input*ones(1,num_of_calculation)));
xlabel('当前计算项数');ylabel('当前计算项数的总值-双精度');
