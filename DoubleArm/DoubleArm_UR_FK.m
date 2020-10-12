clear all;
clc;
% ˫�� ÿ��������UR����
figure(2)
dis_shoulder = 0.2;
% theta d ,a , alpha
L(1)=Link([0       0.0891+dis_shoulder    0        pi/2      0     pi/2  ]); % �ؽ�1��������һ����ƫ��
L(2)=Link([0       0          -0.425      0         0     0]);
L(3)=Link([0       0          -0.392      0         0     0 ]);
L(4)=Link([0       0.1091        0        pi/2      0     -pi/2]);
L(5)=Link([0       0.0946        0       -pi/2      0     0]);
L(6)=Link([0       0.0823        0        0      0     0]);
%                  0.262
urL=SerialLink(L,'name','LEFT');
% urL.tool=[0 -1 0 0;
%                1 0 0 0;
%                0 0 1 0.262 ;
%                0 0 0 1;]; 
           
R(1)=Link([0       -0.0891-dis_shoulder   0        pi/2      0     pi/2  ]); % �ؽ�1��������һ����ƫ��
R(2)=Link([0       0          -0.425      0         0     0]);
R(3)=Link([0       0          -0.392      0         0     0 ]);
R(4)=Link([0       0.1091        0        pi/2      0     -pi/2]);
R(5)=Link([0       0.0946        0       -pi/2      0     0]);
R(6)=Link([0       0.0823        0        0      0     0]);
%                  0.262
urR=SerialLink(R,'name','RIGHT');
% urR.tool=[0 -1 0 0;
%                1 0 0 0;
%                0 0 1 0.262 ;
%                0 0 0 1;]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   platform
offset_ang = 0;
dis_waist = 0;
platform=SerialLink([0 dis_waist 0 pi/2+offset_ang 0 0],'name','platform');%�����ؽ�
platform.base=[1 0 0 0;
               0 1 0 0;
               0 0 1 0 ;
               0 0 0 1;]; %�����߶�
           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   R
pR=SerialLink([platform,urR],'name','R'); % �����ұ�ģ�ͣ���װ����

view(3)
hold on
grid on
axis([-1.5, 1.5, -1.5, 1.5, -1.5, 1.5])

pR.plot([0 0 0 0 0 0 0]) % ��һ�����̶�Ϊ0��Ŀ����Ϊ��ģ�����ؽڣ������ͬ
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   L
pL=SerialLink([platform, urL],'name','L'); % �������ģ�ͣ���װ����

pL.plot([0 0 0 0 0 0 0])
hold on
