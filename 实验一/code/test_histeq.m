%test histeq
I = imread('HSV_unchanged.jpg');
[J] = Histogram_equalization(I);
figure, imshow(I)
figure, imshow(J) ,title('RGBͼ����⻯')