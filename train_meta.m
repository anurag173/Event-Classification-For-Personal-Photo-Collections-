% Run this after running main.m
% Creates an array of histograms.
load CX.mat
traindata=[];
for i=1:4
       a='Database\';% Enter path of the database;
    b=char('beach_train','christmas_train','family_train','halloween_train');
    b(i,:)
    str=strcat(a,b(i,:));
    for j=201:400 % Other 200 images are used for this purpose
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
        n2 = dist2(CX,datenum(info.FileModDate));% Calculate the nearest sift feature
        [H,I]=min(n2);
        mx=1:1:500;
        n=hist(I,mx);% Form Histograms of similars features
        n=n./sum(n);
        traindata=[traindata;n];% Store histograms in traindata matrix
    end
end
save('traindata.mat','traindata');% Save it
