% ���ؽڶ���ʽ�ؽڿռ�켣
%% ���׶���ʽtheta(t) = a0 + a1*t + a2*t^2 + a3*t^3
% ָ����ʼ����ֹ���λ��theta_s theta_f��ͬʱ�ٶȾ�Ϊ0
theta_s = 120; theta_f = 60; tf = 1;
a0_3 = theta_s;
a1_3 = 0;
a2_3 = (3/tf^2)*(theta_f - theta_s);
a3_3 = (-2/tf^3)*(theta_f - theta_s);
j = 1;
for t = 0: 0.02: 1
   theta_3(j) = a0_3 + a1_3*t + a2_3*t^2 + a3_3*t^3;
   theta_3d(j) = a1_3 + 2*a2_3*t + 3*a3_3*t^2;
   theta_3dd(j) = 2*a2_3 + 6*a3_3*t;
   theta_3ddd(j) = 6*a3_3;
   j = j + 1;
end
figure(1)
subplot(4, 1, 1)
plot([0:0.02:1], theta_3)
grid on
title('�ؽڽ�(��)')
subplot(4, 1, 2)
plot([0:0.02:1], theta_3d)
grid on
title('���ٶ�(��/s)')
subplot(4, 1, 3)
plot([0:0.02:1], theta_3dd)
grid on
title('�Ǽ��ٶ�(��/s^2)')
subplot(4, 1, 4)
plot([0:0.02:1], theta_3ddd)
grid on
title('�Ǽ��ٶȱ仯��')
hold on

%% ��׶���ʽtheta(t) = a0 + a1*t + a2*t^2 + a3*t^3 + a4*t^4 + a5*t^5
% ָ����ʼ����ֹ���λ�ã������ٶȺͼ��ٶȾ�Ϊ0
theta_s =1; theta_f = 2; tf = 0.05;
theta_fd = 0; theta_fdd = 0; theta_sd = 4.32; theta_sdd = 32;
a0_5 = theta_s; a1_5 = theta_sd; a2_5 = theta_sdd / 2;
a3_5 = (20*theta_f - 20*theta_s - (8*theta_fd + 12*theta_sd)*tf - (3*theta_sdd - theta_fdd)*tf^2) / (2*tf^3);
a4_5 = (30*theta_s - 30*theta_f + (14*theta_fd + 16*theta_sd)*tf + (3*theta_sdd - 2*theta_fdd)*tf^2) / (2*tf^4);
a5_5 = (12*theta_f - 12*theta_s - (6*theta_fd + 6*theta_sd)*tf - (theta_sdd - theta_fdd)*tf^2) / (2*tf^5);
k = 1;
for t = 0: 0.02: 1
   theta_5(k) = a0_5 + a1_5*t + a2_5*t^2 + a3_5*t^3 + a4_5*t^4 + a5_5*t^5;
   theta_5d(k) = a1_5 + 2*a2_5*t + 3*a3_5*t^2 + 4*a4_5*t^3 + 5*a5_5*t^4;
   theta_5dd(k) = 2*a2_5 + 6*a3_5*t + 12*a4_5*t^2 + 20*a5_5*t^3;
   theta_5ddd(k) = 6*a3_5 + 24*a4_5*t + 60*a5_5*t^2;
   k = k + 1;
end
figure(2)
subplot(4, 1, 1)
plot([0:0.02:1], theta_5)
grid on
title('�ؽڽ�(��)')
subplot(4, 1, 2)
plot([0:0.02:1], theta_5d)
grid on
title('���ٶ�(��/s)')
subplot(4, 1, 3)
plot([0:0.02:1], theta_5dd)
grid on
title('�Ǽ��ٶ�(��/s^2)')
subplot(4, 1, 4)
plot([0:0.02:1], theta_5ddd)
grid on
title('�Ǽ��ٶȱ仯��')

%% ���δ����м����������ʽ(Լ������Ϊ���ӵ���ٶȺͼ��ٶ����)
% theta(t)_1 = a10 + a11*t1 + a12*t1^2 + a13*t1^3
% theta(t)_2 = a20 + a21*t2 + a22*t2^2 + a23*t2^3
theta_s_ = 60; theta_v_ = 120; theta_f_ = 30;
t = 1; tf = 2;
theta_s_d_ = 0; theta_s_dd_ = 0; 
theta_f_d_ = 0; theta_f_dd_ = 0;
a10 = theta_s_; a11 = 0;
a12 = (12*theta_v_ - 3*theta_f_ - 9*theta_s_) / (4*t^2);
a13 = (-8*theta_v_ + 3*theta_f_ + 5*theta_s_) / (4*t^3);
a20 = theta_v_; 
a21 = (3*theta_f_ - 3*theta_s_) / (4*t);
a22 = (-12*theta_v_ + 6*theta_f_ + 6*theta_s_) / (4*t^2);
a23 = (8*theta_v_ - 5*theta_f_ - 3*theta_s_) / (4*t^3);
s = 1;
for T = 0: 0.02: 1
    theta_1(s) = a10 + a11*T + a12*T^2 + a13*T^3;
    theta_d_1(s) = a11 + 2*a12*T + 3*a13*T^2;
    theta_dd_1(s) = 2*a12 + 6*a13*T;
    theta_ddd_1(s) = 6*a13;
    s = s + 1;
end
s = 1;
for T = 0: 0.02: 1
    theta_2(s) = a20 + a21*T + a22*T^2 + a23*T^3;
    theta_d_2(s) = a21 + 2*a22*T + 3*a23*T^2;
    theta_dd_2(s) = 2*a22 + 6*a23*T;
    theta_ddd_2(s) = 6*a23;
    s = s + 1;
end
% ȥ����β
theta_ = [theta_1, theta_2(2: 51)];
theta_d_ = [theta_d_1, theta_d_2(2: 51)];
theta_dd_ = [theta_dd_1, theta_dd_2(2: 51)];
theta_ddd_ = [theta_ddd_1, theta_ddd_2(2: 51)];
figure(3)
subplot(4, 1, 1)
plot([0:0.02:2], theta_)
grid on
title('�ؽڽ�(��)')
subplot(4, 1, 2)
plot([0:0.02:2], theta_d_)
grid on
title('���ٶ�(��/s)')
subplot(4, 1, 3)
plot([0:0.02:2], theta_dd_)
grid on
title('�Ǽ��ٶ�(��/s^2)')
subplot(4, 1, 4)
plot([0:0.02:2], theta_ddd_)
grid on
title('�Ǽ��ٶȱ仯��')

%% ��δ����м������ζ���ʽ
% ָ�������ʱ�估���Ӧ��λ�á��ٶ�
% t0 = 0, t1 = 2, t2 = 4, t3 = 8, t4 = 10
% p0 = 10, p1 = 20, p2 = 0, p3 = 30, p4 = 40
% v0 = 0, v1 = -10, v2 = 10, v3 = 3, v4 = 0
t = [0, 2, 4, 8, 10];
p = [10, 20, 0, 30, 40];
v = [0, -10, 10, 3, 0];
% ��ʼ��
T = t(1); P = p(1); V = v(1);
for i = 1:4
    % �ĸ����׶���ʽ�ĸ������
    a0(i) = p(i);
    a1(i) = v(i);
    Tf = t(i+1) - t(i);
    a2(i) = (3/Tf^2)*(p(i+1) - p(i)) - (2/Tf)*v(i) - (1/Tf)*v(i+1);
    a3(i) = (-2/Tf^3)*(p(i+1) - p(i)) + (1/Tf^2)*(v(i+1) + v(i));
    % ʱ�����100��,���ۼ�ʱ�������
    N = linspace(t(i), t(i+1), 100);
    T = [T, N(2: 100)];% �ۼ�ʱ������
    % ���������ʽ
    pk = a0(i) + a1(i)*(N - N(1)) + a2(i)*power(N - N(1), 2) + a3(i)*power(N - N(1), 3);
    vk = a1(i) + 2*a2(i)*(N - N(1)) + 3*a3(i)*power(N - N(1), 2);
    qk = 2*a2(i) + 6*a3(i)*(N - N(1));
    P = [P, pk(2: 100)];
    V = [V, vk(2: 100)];
    if (i == 1)
        Q = 2*a2(i);
    end
    Q = [Q, qk(2: 100)];
%     Q = [qk(1: 100)];
end
figure(4)
subplot(3, 1, 1);
plot(T, P, 'r')
grid on
hold on
plot(t, p, 'or')
title('�ؽڽ�(��)')
subplot(3, 1, 2)
plot(T, V, 'b')
grid on
hold on
plot(t, v, 'ob')
title('���ٶ�(��/s)')
subplot(3, 1, 3)
plot(T, Q, 'g')
grid on
title('�Ǽ��ٶ�(��/s^2)')

%% ��δ��м�����ζ���ʽ��ͬʱ�м��ٶ�ƽ�����������ζ���ʽ���бȽϣ�
% �÷������ڶ��м����ٶȽ���ƽ����������м���ٶȲ�һ���������ٶȣ������ڶ��м���ٶ���Ҫ������
% ָ�������ʱ�估���Ӧ��λ�á��ٶ�
% t0 = 0, t1 = 2, t2 = 4, t3 = 8, t4 = 10
% p0 = 10, p1 = 20, p2 = 0, p3 = 30, p4 = 40
% v0 = 0, v1 = -10, v2 = 10, v3 = 3, v4 = 0
% ��ʼ���м�㼰��ֹ��ļ��ٶȾ�Ϊ0
t = [0, 2, 4, 8, 10];
p = [10, 20, 0, 30, 40];
v = [0, -10, 10, 3, 0];
a = [0, 0, 0, 0, 0];
% ��ʼ��
T = t(1); P_ = p(1); V_ = v(1); A_ = a(1);
% �����м��ٶ�
for k = 1: 4
    if (k == 1)
        v2(k) = v(k);
    else
        dk1 = (p(k) - p(k-1)) / (t(k) - t(k-1));
        dk2 = (p(k+1) - p(k)) / (t(k+1) - t(k));
        if (dk1 >= 0 && dk2 >= 0 || dk1 <= 0 && dk2 <= 0)
            v2(k) = (1/2)*(dk1 + dk2);
        else
            v2(k) = 0;
        end
    end
end
v2(5) = v(5);
for i = 1: 4
    % �����ĸ���ζ���ʽ�ĸ���ϵ��
    tf = t(i+1) - t(i);
    a0(i) = p(i); 
    a1(i) = v2(i); 
    a2(i) = a(i) / 2;
    a3(i) = (20*p(i+1) - 20*p(i) - (8*v2(i+1) + 12*v2(i))*tf - (3*a(i) - a(i+1))*tf^2) / (2*tf^3);
    a4(i) = (30*p(i) - 30*p(i+1) + (14*v2(i+1) + 16*v2(i))*tf + (3*a(i) - 2*a(i+1))*tf^2) / (2*tf^4);
    a5(i) = (12*p(i+1) - 12*p(i) - (6*v2(i+1) + 6*v2(i))*tf - (a(i) - a(i+1))*tf^2) / (2*tf^5);
    % ʱ�����100��,���ۼ�ʱ�������
    N = linspace(t(i), t(i+1), 100);
    T = [T, N(2: 100)]; % �ۼ�ʱ������
    % ���������ʽtheta(t) = a0 + a1*t + a2*t^2 + a3*t^3 + a4*t^4 + a5*t^5
    % position
    pk = a0(i) + a1(i)*(N - N(1)) + a2(i)*power(N - N(1), 2) + a3(i)*power(N - N(1), 3) + a4(i)*power(N - N(1), 4) + a5(i)*power(N - N(1), 5);
    % velocity
    vk = a1(i) + 2*a2(i)*(N - N(1)) + 3*a3(i)*power(N - N(1), 2) + 4*a4(i)*power(N - N(1), 3) + 5*a5(i)*power(N - N(1), 4);
    % acceleration
    ak = 2*a2(i) + 6*a3(i)*(N - N(1)) + 12*a4(i)*power(N - N(1), 2) + 20*a5(i)*power(N - N(1), 3);
    P_ = [P_, pk(2: 100)];
    V_ = [V_, vk(2: 100)];
    A_ = [A_, ak(2: 100)];
end
figure(5)
subplot(3, 1, 1);
plot(T, P_, 'r')
grid on
hold on
plot(T, P, 'r--')
plot(t, p, 'or')
title('�ؽڽ�(��)')
subplot(3, 1, 2)
plot(T, V_, 'b')
grid on
hold on
plot(T, V, 'b--')
plot(t, v2, 'ob')
title('���ٶ�(��/s)')
subplot(3, 1, 3)
plot(T, A_, 'g')
hold on
plot(T, Q, 'g--')
grid on
title('�Ǽ��ٶ�(��/s^2)')


   

    
    



    
    
    
    
    
    
    
    
    
    





