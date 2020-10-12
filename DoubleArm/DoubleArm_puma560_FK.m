clear all;
clc;
% ˫�� ÿ��������puma560����
L(1)=Link([0       -0.25        0        pi/2      0     -pi/2  ],'modified'); % �ؽ�1��������һ����ƫ��-pi/2������Ϊ�˽�puma560���͵ı۴�ֱ��ȥ
L(2)=Link([0       0          0        -pi/2      0    0  ],'modified');
L(3)=Link([0       0           0.2        0          0    -pi/2 ],'modified');
L(4)=Link([0       0.248        0           -pi/2      0     ],'modified');
L(5)=Link([0       0           0           -pi/2       0     ],'modified');
L(6)=Link([0       0            0           pi/2      0     ],'modified');
%                  0.262
p560L=SerialLink(L,'name','LEFT');
p560L.tool=[0 -1 0 0;
               1 0 0 0;
               0 0 1 0.262 ;
               0 0 0 1;]; 
           
R(1)=Link([0       0.25        0        pi/2      0     -pi/2   ],'modified');  % �ؽ�1��������һ����ƫ��-pi/2������Ϊ�˽�puma560���͵ı۴�ֱ��ȥ
R(2)=Link([0      0          0           -pi/2      0    0  ],'modified');
R(3)=Link([0       0           0.2        0          0     -pi/2],'modified');
R(4)=Link([0       0.248         0           -pi/2      0     ],'modified');
R(5)=Link([0       0           0           -pi/2       0     ],'modified');
R(6)=Link([0       0           0           pi/2      0     ],'modified');
%                  0.262
p560R=SerialLink(R,'name','RIGHT');
p560R.tool=[0 -1 0 0;
               1 0 0 0;
               0 0 1 0.262 ;
               0 0 0 1;]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   platform

platform=SerialLink([0 0 0 0],'name','platform','modified');%�����ؽ�
platform.base=[1 0 0 0;
               0 1 0 0;
               0 0 1 0 ;
               0 0 0 1;]; %�����߶�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   R

pR=SerialLink([platform,p560R],'name','R'); % �����ұ�ģ�ͣ���װ����

view(3)
hold on
grid on
axis([-1.2, 1.2, -1.2, 1.2, -1.2, 1.2])

pR.plot([0 0 0 0 0 0 0]) % ��һ�����̶�Ϊ0��Ŀ����Ϊ��ģ�����ؽڣ������ͬ
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   L
pL=SerialLink([platform,p560L],'name','L'); % �������ģ�ͣ���װ����

pL.plot([0 0 0 0  0 0 0])
hold on
