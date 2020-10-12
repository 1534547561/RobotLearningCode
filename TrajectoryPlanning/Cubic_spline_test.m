    %% ������������
    %ԭʼ���ݵ�
    X = [0, 0.422955130, 0.598557636, 0.734591320, 0.850603738, 0.953558869, 1.056514000, 1.159469131, 1.274332912, 1.409208218, 1.585026197, 2];
    Y = [0, 0.14881055128822188, 0.2976136037517004, 0.4464166562151788, 0.5952197086786574, 0.7440227611421358, 0.8928258136056142, 1.0416288660690929, 1.1904319185325714, 1.3392349709960498, 1.4880380234595283, 1.6368410759230068];
    s = csapi(X,Y);   %��������
    fnplt(s, 'r');         %������������
    hold on
        grid on
    plot(X,Y,'o')       %����ԭʼ���ݵ�
    v=fnder(s,1);     %��������һ�׵����õ��ٶ�����
    fnplt(v, 'g');        %�����ٶ�����
    hold on
    a=fnder(v,1);     %�������߶��׵����õ����ٶ�����
    fnplt(a, 'b');        %���Ƽ��ٶ�����
    legend('λ����������','ԭʼ���ݵ�','�ٶ�����','���ٶ�����')
    
%% ��дcubicSpline_1��������
q = [1, 1, 1, 1, 1 ,1, 1];
t = [0, 5, 7, 8, 10, 15, 18];
v = [2, 1, 2, 0, 1, 2, -3];
n = length(t);
tt = 0.1;
[yy dyy ddyy] = cubicSpline_1(q, t, v, tt);
subplot(3, 1, 1)
plot(t, q, 'o');
ylabel('λ��')
grid on
hold on
plot([t(1):tt:t(n)], yy);
subplot(3, 1, 2)
plot(t, v, '*');
grid on
hold on
plot([t(1):tt:t(n)], dyy);
ylabel('�ٶ�')
subplot(3, 1, 3)
grid on
hold on
plot([t(1):tt:t(n)], ddyy);
ylabel('���ٶ�')

%% ��дcubicSpline_2��������
q = [3, -2, -5, 0, 6, 12, 8];
t = [0, 5, 7, 8, 10, 15, 18];
n = length(t);
v0 = 2; vn = -3; tt = 0.1;
[yy dyy ddyy] = cubicSpline_2(q, t, v0, vn, tt);
subplot(3, 1, 1)
plot(t, q, 'o');
ylabel('λ��')
grid on
hold on
plot([t(1):tt:t(n)], yy);
subplot(3, 1, 2)
plot([t(1), t(n)], [v0, vn], 'o');
grid on
hold on
plot([t(1):tt:t(n)], dyy);
ylabel('�ٶ�')
subplot(3, 1, 3)
grid on
hold on
plot([t(1):tt:t(n)], ddyy);
ylabel('���ٶ�')


%% ��дcubicSpline_3��������
q = [3, -2, -5, 0, 6, 12, 3];
t = [0, 5, 7, 8, 10, 15, 18];
t1 = [18, 23, 25, 26, 28, 33, 36];
n = length(t);
tt = 0.1;
[yy dyy ddyy] = cubicSpline_3(q, t, tt);
[yy_, dyy_, ddyy_] = cubicSpline_3(q, t1, tt);
subplot(3, 1, 1)
plot(t, q, 'o');
ylabel('λ��')
grid on
hold on
plot([t(1):tt:t(n)], yy);
plot([t1(1):tt:t1(n)], yy_);
subplot(3, 1, 2)
% plot([t(1), t(n)], [v0, vn], 'o');
grid on
hold on
plot([t(1):tt:t(n)], dyy);
plot([t1(1):tt:t1(n)], dyy_);
ylabel('�ٶ�')
subplot(3, 1, 3)
grid on
hold on
plot([t(1):tt:t(n)], ddyy);
plot([t1(1):tt:t1(n)], ddyy_);
ylabel('���ٶ�')

%% ��дcubicSpline_4��������
q = [3, -2, -5, 0, 6, 12, 8];
t = [0, 5, 7, 8, 10, 15, 18];
v0 = 2; vn = -3; a0 = 0; an = 0;
tt = 0.1;
n = length(t);
[yy dyy ddyy q1 qn_1] = cubicSpline_4(q, t, v0, vn, a0, an, tt);
% �������������q1_��qn-1_�����������Ӧ��ʱ���
t1_ = (t(1)+t(2)) / 2;
tn_1_ = (t(n-1)+t(n)) / 2;
% ����ʱ������
t = [t(1), t1_, t(2: n-1), tn_1_, t(n)];
n = length(t);% ����n 
% ����q
q = [q(1), q1, q(2: n-3), qn_1, q(n-2)];
subplot(3, 1, 1)
plot(t, q, 'o');
ylabel('λ��')
grid on
hold on
plot([t(1):tt:t(n)], yy);
hold on
plot(t(2), q(2), 'r*');
plot(t(n-1), q(n-1), 'r*');
subplot(3, 1, 2)
% plot([t(1), t(n)], [v0, vn], 'o');
grid on
hold on
plot([t(1):tt:t(n)], dyy);
ylabel('�ٶ�')
subplot(3, 1, 3)
grid on
hold on
plot([t(1):tt:t(n)], ddyy);
ylabel('���ٶ�')








