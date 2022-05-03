

f1 = 3000;    #3k
f2 = 5000;    #5k
f3 = 7000;    #7k

fs = 100000;  #100k
Ts = 1/fs;

t = 0 : Ts : 200*Ts;

y1 = cos(2*pi*f1*t);          % 3k ���ļ�
y2 = cos(2*pi*f2*t);          % 5k ���ļ�
y3 = cos(2*pi*f3*t);          % 7k ���ļ�  



y_final = y1+y2+y3;
## time domain y_final�� freq domain���� plotting
N = length(t);
k = (0:N-1)*fs/N;  
Y_FINAL = abs(fft(y_final));
figure(1), plot(k,Y_FINAL);


## filter design

## filter spec
## cut-off frequency = 4k
## TW = 1k

n = -172 : 172;                          ## �ع��������� n = 3.44 * fs/TW = 344
hamming_window = hamming(length(n))';      
h = 0.08*sinc(0.08*n);                   ## freq domain���� 4k���� ���̴� ����
                                         ## time domain���� sinc�� ǥ��
H = h.*hamming_window;                   ## freq filter�� ������ ���̱� ���� window

result = conv(y_final,H);                ## �ð� �࿡�� conv
##figure(2), plot(result)

RESULT = abs(fft(result));               ## 3k�� ����
figure(2),plot(RESULT)




