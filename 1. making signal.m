f = 2000:5000;                      % 2khz ~5khz
fs = 10*max(f);                     % ���ø� �̷� max�� �ּ� 2�� �̻�, ���������� 5~6��
Ts = 1/fs;
t = 0:Ts:10/min(f);                 % ���ø� �ֱ�� 10�ֱ� �׷���
                                    % x/min(f) ���ļ��� �ּ� ������ x�ֱ� �׷���

y = zeros(length(f), length(t));    % 3001x251 �ʱⰪ  �����


for i=1:length(f)
    y(i,:) = sin(2*pi*t.*f(1,i));   % 
end    

subplot(3,1,1)
plot(t,y(1,:));                     % 2khz plotting

subplot(3,1,2)
plot(t,y(2000,:));                  % 2000��°�ϱ� �� 4khz plotting

y_sum = zeros(1,length(t));         % sum �ʱ� ��
for k=1:length(f)
    y_sum = y_sum+y(k,:);           % 2khz ~ 5khz for���� �̿��� ����
end

subplot(3,1,3)          
plot(t,y_sum);                      % 2khz ~ 5khz ���� ������ y_sum plotting


