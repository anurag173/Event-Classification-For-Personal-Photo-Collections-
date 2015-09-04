P_meta=zeros(200,4);
beach=[];
for i=1:50
    c=find(IDx(i,:)<=200);
    d=find(IDx(i,:)>200&IDx(i,:)<=600);
    e=find(IDx(i,:)>400&IDx(i,:)<=600);
    f=find(IDx(i,:)>600);
    P_meta(i,:)=[size(c,2)/4,size(d,2)/4,size(e,2)/4,size(f,2)/4];
    beach=[beach,size(c,2)];
end

    find_beach=find(beach>=2); 
    beach_detected_out_of_50=size(find_beach,2)
christmas=[];
for i=51:100
    c=find(IDx(i,:)<=200 );
    d=find(IDx(i,:)>200&IDx(i,:)<=600);
    e=find(IDx(i,:)>400&IDx(i,:)<=600);
    f=find(IDx(i,:)>600);   
        P_meta(i,:)=[size(c,2)/4,size(d,2)/4,size(e,2)/4,size(f,2)/4];
    christmas=[christmas,size(d,2)];
end
 find_christmas=find(christmas>=2);
    christmas_detected_out_of_50=size(find_christmas,2)
family=[];
for i=101:150
    c=find(IDx(i,:)<=200);
    d=find(IDx(i,:)>200&IDx(i,:)<=600);
    e=find(IDx(i,:)>400&IDx(i,:)<=600);
    f=find(IDx(i,:)>600);
        P_meta(i,:)=[size(c,2)/4,size(d,2)/4,size(e,2)/4,size(f,2)/4];
    family=[family,size(e,2)];
end
 find_family=find(family>=2);
    family_detected_out_of_50=size(find_family,2)
halloween=[];
for i=151:199
    c=find(IDx(i,:)<=200);
    d=find(IDx(i,:)>200&IDx(i,:)<=600);
    e=find(IDx(i,:)>400&IDx(i,:)<=600);
    f=find(IDx(i,:)>600);
        P_meta(i,:)=[size(c,2)/4,size(d,2)/4,size(e,2)/4,size(f,2)/4];
    halloween=[halloween,size(f,2)];
end
 find_halloween=find(halloween>=2);
    halloween_detected_out_of_50=size(find_halloween,2)
    P_meta