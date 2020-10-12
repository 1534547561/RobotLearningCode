%% ����������ϵ����Ժ��������Թ켣��
% ���μӼ��٣�����������ٶȺ������ٶ�
% �û�������ʼ�ٶȡ���ֹ�ٶȡ����ٶȡ����ٶȡ�����ٶȼ�λ�Ʋ���
% ���㷨��Ҫ��������ٶΡ����ٶ��Լ����ٶζ�Ӧ��ʱ��Ta Tv Td
% t0 = 0, p0 = 5, p1 = 30, v0 = 50, vmax = 150, v1 = 20, aa = 1000
% ad = -1500
t0 = 2;
p0 = 5; p1 = 30;
v0 = 50; vmax = 150; v1 = 50;
aa = 1000; ad = -aa;
h = p1 - p0;
% �ɴﵽ������ٶ�
vf = sqrt((2.0*aa*ad*h - aa*v1^2 + ad*v0^2) / (ad - aa));
% ȷ�����ٽ׶��ٶ�
if (vf < vmax)
    vv = vf;
else
    vv = vmax;
end
% ������ٽ׶ε�ʱ���λ��
Ta = (vv - v0) / aa;
La = v0*Ta + (1.0/2.0)*aa*Ta^2;
% �������ٽ׶ε�ʱ���λ��
Tv = (h - (vv^2 - v0^2)/(2.0*aa) - (v1^2 - vv^2)/(2.0*ad)) / vv;
Lv = vv*Tv;
% ������ٽ׶ε�ʱ���λ��
Td = (v1 - vv) / ad;
% Td = Ta;
Ld = vv*Td + (1.0/2.0)*ad*Td^2;
k = 1;
ts = 0.001;
% ����켣����ɢ��
for t = t0: ts: (t0+Ta+Tv+Td)
    time(k) = t;
    t = t - t0;
    if (t >= 0 && t < Ta)
        p(k) = p0 + v0*t + (1.0/2.0)*aa*t^2;
        pd(k) = v0 + aa*t;
        pdd(k) = aa;
    elseif (t >= Ta && t < Ta+Tv)
        p(k) = p0 + La + vv*(t - Ta);
        pd(k) = vv;
        pdd(k) = 0;
    elseif (t >= Ta+Tv && t <= Ta+Tv+Td)
        p(k) = p0 + La + Lv + vv*(t - Ta - Tv) + (1.0/2.0)*ad*power(t - Ta - Tv, 2);
        pd(k) = vv + ad*(t - Ta - Tv);
        pdd(k) = ad;
    end
    k = k + 1;
end
figure(1)
subplot(3, 1, 1)
plot(time, p, 'r', 'LineWidth', 1.5)
ylabel('position')
grid on
subplot(3, 1, 2)
plot(time, pd, 'b', 'LineWidth', 1.5)
ylabel('velocity')
grid on
subplot(3, 1, 3)
plot(time, pdd, 'g', 'LineWidth', 1.5)
ylabel('acceleration')
grid on









