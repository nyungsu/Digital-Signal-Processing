f1 = 2100;
f2 = 2400;

fs = max(f1,f2)*10;                   % ���ø� �̷п� ��� 
                                      % ������ �ִ� ���ļ� �� ū �ͺ��� 2�� �̻��ε�
                                      % ���������� 5~6�� 10��

t1 = 0: 1/fs : 2/f1;                    
                                                                                     
y1_1 = cos(2*pi*f1*t1);               % 2.1khz signal
y1_2 = cos(2*pi*f2*t1);               % 2.4khz signal

y1 = y1_1 + y1_2;                     % 2.1k + 2.4k hz signal
Y1 = abs(fft(y1));                    % fft

N1 = length(t1);
k1 = (0:N1-1)*fs/N1;                  % frequency domain x axis
                                      
subplot(211)
plot(k1,Y1)

% ������� ��ȣ�� �� ���� Resolution�� ���� ������.
% -> frequency domain���� x���� �������� �ʾƼ� �׷����� 
% -> k�� �����ϴ� �Ķ���� 1)fs, 2)N
% -> fs�� �ø��ٸ� �� ���� ���ļ�(�� ª�� �ֱ�)�� ��ȣ�� ������ ,Resource ����
% -> N�� �ø��� -> ��ȣ�� �� ���� ��������

t2 = 0: 1/fs : 200/f1;              % 2 -> 200 ���� ����

y2_1 = cos(2*pi*f1*t2);
y2_2 = cos(2*pi*f2*t2);

y2 = y2_1 + y2_2;
Y2 = abs(fft(y2));

N2 = length(t2);

k2 = (0:N2-1)*fs/N2;     

subplot(212)
plot(k2,Y2)
