function [A_lon,B_lon,A_lat,B_lat] = compute_ss_model(filename,x_trim,u_trim)
% x_trim is the trimmed state,x_trim������״̬
% u_trim is the trimmed input,u_trim����������
% x_trim,u_trimΪ�����Ի�simulinkģ���״̬������

% add stuff here  �Ѽ�
[A,B,C,D] = linmod(filename, x_trim, u_trim);

E1 = [...
      0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0;...
      0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0;...
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1;...
      0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;...
      0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0;...
      ];
E2 = [...
      0, 1, 0, 0;...
      0, 0, 1, 0;...
      ];
A_lat = E1 * A * E1';
B_lat = E1 * B * E2';%����״̬�ռ䷽��

E3 = [...
      0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0;...
      0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0;...
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0;...
      0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0;...
      0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0;...
      ];
E4 = [...
      1, 0, 0, 0;...
      0, 0, 0, 1;...
      ];

A_lon = E3 * A * E3';
B_lon = E3 * B * E4';%����״̬�ռ䷽��