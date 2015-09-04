clear all;
close all
clc;
Codeword1=[];Codeword2=[];
for i=1:4 % No. of objects
    %% Reading the correct image
       a='Database\';% Enter path of the database;
    b=char('beach_train','christmas_train','family_train','halloween_train'); % My path contains folder names motorbikes_train..so..
    b(i,:) % Track Training
    str=strcat(a,b(i,:));
    for j=1:200 % No. of images used to train..My database contains 200 images with names img001,img011,img111...
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
        im=imread(str1); % Read image
        info=imfinfo(str1);
        %% 
        if(strcmp(info.ColorType,'truecolor'))
            im=rgb2gray(im);% Conver image to grayscale if it is not
        end
        sigma=4; % Input values to harris
        thresh=3000;
        radius=3;
        disp=0;
        [cim, r, c] = harris(im, sigma, thresh, radius, disp);
        sift_radius=6; % Radius around the corners to be considered for calculating SIFT vector
        circles=zeros([size(c,1),3]);
        circles(:,1)=c;
        circles(:,2)=r;
        circles(:,3)=sift_radius*ones([size(c,1),1]);
        sift_arr = find_sift(im, circles, 1.5); % Find sift vector around the corner
        if(i<=2)
            Codeword1=[Codeword1;sift_arr]; % Store that vector in to a matrix
        else
            Codeword2=[Codeword2;sift_arr]; % To avoid 'Out of memory problem'
        end
    end
end
X=[Codeword1;Codeword2];% Combine both codewords..to avoid 'Out of memory' problem
save('modified_4_3000_3_6.mat','X');% Just save for experimenting
X=X';
CX=vgg_kmeans(X, 500);% Clustering
CX=CX';
save('CX.mat','CX');
train
test
evaluation_visual