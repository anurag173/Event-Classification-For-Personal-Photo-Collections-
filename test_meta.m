% Run this after running main.m and train.m
% same as training but in test mode. Finds out
load traindata.mat
load CX.mat
Q=[];
for i=1:4
    a='Database\';% Enter path of the database;
    b=char('beach_test','christmas_test','family_test','halloween_test');
    b(i,:)
    str=strcat(a,b(i,:));
    for j=1:50% 50 images are used for testing
        if(j/10<1)
            f='00';
            str1=strcat(str,'\','img',f,num2str(j),'.jpg');
        else if(j/10<10)
                f='0';
                str1=strcat(str,'\','img',f,num2str(j),'.jpg');
            else
                str1=strcat(str,'\','img',num2str(j),'.jpg');
            end
        end
        im=imread(str1);
        info=imfinfo(str1);
        if(strcmp(info.ColorType,'truecolor'))
            im=rgb2gray(im);
        end
        n2 = dist2(CX,datenum(info.FileModDate));
        [H,I]=min(n2);
        mx=1:1:500;
        n=hist(I,mx);
        n=n./sum(n);
        Q=[Q;n];% Same as in training
    end
end
IDx=knnsearch(Q,traindata,4);% Find out 4 nearest neighbours
