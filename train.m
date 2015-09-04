% Run this after running main.m
% Creates an array of histograms.
clear all;
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
        sigma=4;
        thresh=3000;
        radius=3;
        disp=0;
        [cim, r, c] = harris(im, sigma, thresh, radius, disp);
        sift_radius=6;
        circles=zeros([size(c,1),3]);
        circles(:,1)=c;
        circles(:,2)=r;
        circles(:,3)=sift_radius*ones([size(c,1),1]);
        sift_arr = find_sift(im, circles, 1.5);% Same procedure as in main
        n2 = dist2(CX,sift_arr);% Calculate the nearest sift feature
        [H,I]=min(n2);
        mx=1:1:500;
        n=hist(I,mx);% Form Histograms of similars features
        n=n./sum(n);
        traindata=[traindata;n];% Store histograms in traindata matrix
    end
end
save('traindata.mat','traindata');% Save it
