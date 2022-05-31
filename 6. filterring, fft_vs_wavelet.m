pkg load image          # �̹��� ó�� ��Ű�� �ε�
pkg load ltfat          # FWT�� ����ϱ� ���� ��Ű�� �ε�

## 1. �پ��� ���� �����غ���

img = imread('lenna.jpg');

# �׷��� �̹��� �����
gray_img = rgb2gray(img);
figure(1)
imshow(gray_img)

# ��հ� ���� (LPF)�� �׷��� �̹����� conv2
kernel = ones(9,9)/81;
result = conv2(gray_img,kernel);
figure(2)
imshow(result,[]);      # ��հ� ���͸� conv ���ָ鼭 ���� ������ Ÿ���� �����ϱ� ���� []


# �Һ� ���͸� �̿��Ͽ� ���� �Լ��� ��� 
edge_img = edge(gray_img,'sobel')
figure(3)
imshow(edge_img)

# ���� ���͸� ���� �����Ͽ� ����� Ȯ��
sharpen_kerner = [0,-1,0;-1,5,-1;0,-1,0];
sharpen_img = conv2(gray_img,sharpen_kerner);
figure(4)
imshow(sharpen_img,[])


## 2. FFT�� FWT ���ϱ�

# �׷��� �̹��� ���� �����
sample = imread(��lenna.jpg��)
sample_g = rgb2gray(sample);
kernal = [0,0,0;0,1,0;0,0,0];
original_sample = conv2(sample_g, kernel)

# wavelet decomposition Ȯ��
C= fwt2(original_sample,��db8��,4)
imagesc(dynlimit(20*log10(abs(c)), 70)) 

# wavelet decomposition data �ս�
# HH ������ data�� 0���� ������ ����
C(500:900, 500:1000) = 0;

# �ջ�� data�� inverse wavelet ���� �� display
re_sample = ifwt2(c,��db8��,4);
Imshow(re_sample, [])

# fft ������ �����Ϳ� ���� �����ϰ� �����Ͽ� ��
test = fft2(original_sample);
test(500:900, 500:1000) = 0;
test_re =ifft2(test);
imshow(test_re,[]);

