% Run this after running main.m and train.m
% same as training but in test mode. Finds out
clear all;close all;clc;
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
        sift_arr = find_sift(im, circles, 1.5);
        n2 = dist2(CX,sift_arr);
        [H,I]=min(n2);
        mx=1:1:500;
        n=hist(I,mx);
        n=n./sum(n);
        Q=[Q;n];% Same as in training
    end
end
IDx=knnsearch(Q,traindata,4);% Find out 4 nearest neighbours
