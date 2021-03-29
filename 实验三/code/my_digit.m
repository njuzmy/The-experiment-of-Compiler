function output = my_digit(input_image)
%in this function, you should finish the digit recognition task.
%the input parameter is a matrix of an image which contains a digit.
%the output parameter represents which digit it is.
%����1  ʹ��knn����ģ��Ԥ����������
input_image = im2bw(input_image);
[M,N] = size(input_image);
startr = 0;
endr = 0;
startc = 0;
endc = 0;                         %����Ϊ�и�ͼƬ�е�����
for i = 1 : M
    for j = 1 : N
        if (input_image(i,j) == 0)
            startr = i;
            break;
        end
    end
    if (startr ~= 0)
        break;
    end
end

for i = M : -1 : 1
    for j = 1 : N
        if (input_image(i,j) == 0)
            endr = i;
            break;
        end
    end
    if (endr ~= 0)
        break;
    end
end

for i = 1 : N
    for j = 1 : M
        if(input_image(j,i) == 0)
            startc = i;
            break;
        end
        if(startc ~= 0)
            break;
        end
    end
end

for i = N : -1 : 1
    for j = 1 : M
        if(input_image(j,i) == 0)
            endc = i;
            break;
        end
        if(endc ~= 0)
            break;
        end
    end
end
out = input_image(startr:endr, startc:endc);
out = imresize(out,[40,30]);
X = zeros(10,1200);
for i = 0 : 9
    filename = ['../assert/train/' num2str(i) '.JPG'];
    image = imread(filename);
    image = im2bw(image);
    image = imresize(image, [40,30]);
    t = image(:)';
    X(i + 1, :) = double(t);
end
X = double(X);                       %ѵ������ÿһ����ÿһ�����ֵ���������
Y = ['0';'1';'2';'3';'4';'5';'6';'7';'8';'9'];
mdl = fitcknn(X,Y,'NumNeighbors',1);  %����matlab�ڲ���knnѵ������
out = out(:)';
out = double(out);
outclass = predict(mdl,out);          %ʹ��knn������ģ��ʶ�������ַ�ͼƬ
output = outclass;
%����2  ʹ��matlab�Դ�ocr����ʶ������
% H = im2double(input_image);    %����ʶ��һ�������޷�ʶ����Ҫ��һ�����⴦��
% [M,N,Z] = size(H);
% input_image = insertText(input_image, [N/4 M/2 - 25], ' ','FontSize',30,'BoxColor','black','BoxOpacity',1);
% input_image = insertText(input_image, [N/8 M/2 - 25], ' ','FontSize',30,'BoxColor','black','BoxOpacity',1);
% figure;
% imshow(input_image);
% ocrResults = ocr(input_image, 'CharacterSet','0 1 2 3 4 5 6 7 8 9');
% text = ocrResults.Text
% for i = 1 : strlength(text)
%     if(text(i) >= '0' && text(i) <= '9')
%         output = text(i);
%         break;
%     end
% end