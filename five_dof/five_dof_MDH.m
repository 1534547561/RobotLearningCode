% Modified DH
% five_dof robot
% �����������ĩ��ִ��������ϵ{e}�������˵�theta����ʼ��Ϊ0
% ����ʵ���Ϲؽ�5�����껹Ҫ����-y0����ƫ��0.0012
% ʵ���Ϲؽ�1�͹ؽ�2��z0��������λ�ƣ�MDH����û������
clear;
clc;
th(1) = 0; d(1) = 0; a(1) = 0; alp(1) = 0;
th(2) = 90*pi/180; d(2) = 0; a(2) = 0; alp(2) = pi/2;   
th(3) = 0; d(3) = 0; a(3) = 0.104; alp(3) = 0;
th(4) = -90*pi/180; d(4) = 0; a(4) = 0.096; alp(4) = 0;
th(5) = 0; d(5) = 0.0585; a(5) = 0.0279; alp(5) = -pi/2;
th(6) = 0; d(6) = 0.104; a(6) = 0; alp(6) = 0;

qlim6 = [0, 0]*pi/180;
% DH parameters  th     d    a    alpha  sigma
L1 = Link([th(1), d(1), a(1), alp(1), 0], 'modified');
L2 = Link([th(2), d(2), a(2), alp(2), 0], 'modified');
L3 = Link([th(3), d(3), a(3), alp(3), 0], 'modified');
L4 = Link([th(4), d(4), a(4), alp(4), 0], 'modified');
L5 = Link([th(5), d(5), a(5), alp(5), 0], 'modified');  
L6 = Link([th(6), d(6), a(6), alp(6), 0], 'modified', 'qlim', qlim6);
robot = SerialLink([L1, L2, L3, L4, L5, L6]); 
robot.name='MyRobot-5-dof';
robot.display()
% theta = [0 120 -60 -150 60 0]*pi/180;
robot.teach();
robot.plot(th); 
t = robot.fkine(th)    %ĩ��ִ����λ��
% ik_T = five_dof_ikine(t)
% ik_t = robot.ikine(t)


