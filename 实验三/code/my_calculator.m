function output = my_calculator(input_image)
%in this function, you should finish the character recognition task.
%the input parameter is a matrix of an image which contains several expressions
%the output parameter is a matrix of an image which contains the results of expressions
startr = 6;
startc = 6;
endr = 99;
endc = 337;                           %������������ͼ��ʶ��ʶ�𾫶Ȳ��Ǻܸߣ�Ч�������룬���Կ��Խ�������ͼ����Ϊһ����С�飬������ȷ����һ�����ʼ���������
for i = 1 : 10
    for j = 1 : 3
        out = input_image(startr + 10:endr - 10,startc + 10:endc - 10);
        ocrResults = ocr(out, 'CharacterSet','0 1 2 3 4 5 6 7 8 9 - + =');      %����matlab�Դ��Ŀ⺯������ʶ���ַ�����Ҫ��ʶ���ַ��ķ�Χ�������Լ�����֮��
        text1 = ocrResults.Text;                  %���ʶ�����ַ���
        if (strlength(text1) ~= 0)
            %text1(1)
            if(text1(2) == '-')                   %�����Ƕ��ַ������зֽ����
                result = (text1(1) - '0') -( text1(3) - '0');
            else
                result = (text1(1) - '0') + (text1(3) - '0');
            end
            if (result >= 0 && result <= 9)
            str = num2str(result);
            input_image = insertText(input_image, [startc + 260 startr], str,'FontSize',50,'BoxColor','white','BoxOpacity',0);     %������õ��Ľ����ӵ�ͼƬ��ȥ������ʹ����insertText��������������Ķ���ֱ�Ϊ�����С��������ɫ��������ɫ͸����
            end
        else
              input_image1 = insertText(input_image, [startc + 100 startr + 20], ' ','FontSize',30,'BoxColor','black','BoxOpacity',1);   %������һ��������ʵ���з��ֶ��ڡ�- 1���޷���ȷʶ����Ҫ���⴦��
              out = input_image1(startr + 10:endr - 10,startc + 10:endc - 10);
%             H = im2double(out);
%             [M , N] = size(H);
              ocrResults = ocr(out, 'CharacterSet','0 1 2 3 4 5 6 7 8 9 - +');
              text = ocrResults.Text;
              result = (text(1) - '0') - (text(3) - '0');
              str = num2str(result);
              input_image = insertText(input_image, [startc + 260 startr], str,'FontSize',50,'BoxColor','white','BoxOpacity',0);
%               startk = 0; endk = 0;
%               for t = 1 : N
%                  for k = 1 : M - 1
%                     if(H(k,t) == 1 && H(k, t+1) ~= 1)
%                         startk = t;
%                         break;
%                     end
%                  end
%               end
%               for t = startk + 1: N
%                   for k = 1 : M
%                     if(input_image(k,t) ~= 1 && input_image(k, t+1) == 1)
%                         endk = t;
%                     end
%                  end
%               end  
%               startk
%               endk
%               out = input_image(startr + 10 : endr - 10 , startk : endk);
%               figure;
%               imshow(out);
        end
        startc = startc +  331;       %�����һ�������ʼ�����Ͻǣ�����β�����½ǣ�����
        endc = endc +  331;
    end
    startc = 11;
    endc = 335;
    startr = startr + 93;
    endr = endr + 93;
end
output = input_image;



