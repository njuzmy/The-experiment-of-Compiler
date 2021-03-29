function output = my_operator(input_image)
%in this function, you should finish the operator recognition task.
%the input parameter is a matrix of an image which contains an operator.
%the output parameter represents which operator it is. 
%H = im2double(input_image);
%��һ�ַ��� ʹ��knn�����㷨ʶ���ַ�
[M,N,Z] = size(input_image);    %����������ʶ��Ҳ��Ч����Ҫ�����⴦��
binary = im2bw(input_image);
out = binary(M/2 - 20:M/2 + 20, N/2 - 20:N/2 + 20, :);    %ʹ�ñ���������Ҫ��֤��Ҫʶ����ַ���ͼƬ����
plus = imread('../assert/train/plus.JPG');
minus = imread('../assert/train/minus.JPG');
equal = imread('../assert/train/equal.JPG');
plus = im2bw(plus);
minus = im2bw(minus);
equal = im2bw(equal);
plus = imresize(plus,[41,41]);
minus = imresize(minus,[41,41]);
equal = imresize(equal,[41,41]);      %��ȡѵ��ͼƬ����������ͬһ�ֹ��41 * 41�ľ��󣩱�ʾ
p = plus(:)';
m = minus(:)';
e = equal(:)';
X = [p;m;e];                          %ѵ������ÿһ�ж�Ӧһ����������
X = double(X);
Y = ['+';'-';'='];                    %��ǩ�����ڱ�ʾÿ�������ı�ǩ������ֱ��ʹ�ö�Ӧ���ַ���Ϊ��ǩ
mdl = fitcknn(X,Y,'NumNeighbors',1);  %����matlab�ڲ���knnѵ������
out = out(:)';
out = double(out);
outclass = predict(mdl,out);          %ʹ��knn������ģ��ʶ�������ַ�ͼƬ
output = outclass
%out = rgb2gray(out);
% input_image(1:M, N/2:N/2 + 20,:) = out;
% input_image(1:M, N/2+20:N/2+40,:) = out;
% input_image(1:M, N/2+40:N/2+60,:) = out;
%input_image = input_image(M/2 - 30: M/2 +30, N/2 - 100:N/2 + 100, :);
% input_image(1:M, N - 60:N) = out;
% 
% level = graythresh(input_image);
% BW = imbinarize(input_image,level);
% % ocrResults1 = ocr(out, 'CharacterSet','+ - =');
% % text1 = ocrResults1.Text
% figure;
% imshow(input_image);
% input_image = insertText(input_image, [N * 3/4 M/2 - 25], ' ','FontSize',30,'BoxColor','black','BoxOpacity',1);
%input_image = insertText(input_image, [N * 6/8 M/2 - 55], '6','FontSize',60,'BoxColor','white','BoxOpacity',0);
% figure;
% imshow(input_image);

% �ڶ��ַ���  ʹ��matlab�Դ�ocr����
% input_image = insertText(input_image, [N/8 M/2 - 25], ' ','FontSize',30,'BoxColor','black','BoxOpacity',1);
% input_image = insertText(input_image, [N/4 M/2 - 25], ' ','FontSize',30,'BoxColor','black','BoxOpacity',1);
% ocrResults = ocr(input_image);
% text = ocrResults.Text
% if(strlength(text)~=0)                  %- = ����������ô���޷�ʶ������ֻ���Լ�Ѱ�������ֶ�����
% for i = 1 : strlength(text)
%     if(text(i) == '-' || text(i) == '+' || text(i) == '=')
%         output = text(i)
%         break;
%     end
% end
% else
%     t = 1;
%     for k = 1 : M - 1
%         if((input_image(k,N/2) >50 && input_image(k + 1,N/2) < 10))
%             t = t +1;
%         end
%     end
%     if (t == 2)
%         output = '-'
%     else
%         output = '='
%     end
% end  