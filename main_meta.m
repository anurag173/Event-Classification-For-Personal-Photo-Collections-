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
        X(200*(i-1) + j) = datenum(info.FileModDate);
    end
end
CX=vgg_kmeans(X, 100);% Clustering
CX=CX';
save('CX.mat','CX');
train_meta
test_meta
evaluation_meta