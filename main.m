main_visual
main_meta
w_visual=ones(1,50);
w_meta=ones(1,50);
alpha=0;
P_final_1 = (alpha*(w_visual*P_visual(1:50,:)) + (1-alpha)*(w_meta*P_meta(1:50,:)) )/50;
P_final_2 =( alpha*(w_visual*P_visual(51:100,:)) + (1-alpha)*(w_meta*P_meta(51:100,:)))/50;
P_final_3 = (alpha*(w_visual*P_visual(101:150,:)) + (1-alpha)*(w_meta*P_meta(101:150,:)))/50;
P_final_4 = (alpha*(w_visual*P_visual(151:200,:)) + (1-alpha)*(w_meta*P_meta(151:200,:)))/50;
Meta_Confusion_matrix=[P_final_1;P_final_2;P_final_3;P_final_4]

alpha=1;
P_final_1 = (alpha*(w_visual*P_visual(1:50,:)) + (1-alpha)*(w_meta*P_meta(1:50,:)) )/50;
P_final_2 =( alpha*(w_visual*P_visual(51:100,:)) + (1-alpha)*(w_meta*P_meta(51:100,:)))/50;
P_final_3 = (alpha*(w_visual*P_visual(101:150,:)) + (1-alpha)*(w_meta*P_meta(101:150,:)))/50;
P_final_4 = (alpha*(w_visual*P_visual(151:200,:)) + (1-alpha)*(w_meta*P_meta(151:200,:)))/50;
Visual_Confusion_matrix=[P_final_1;P_final_2;P_final_3;P_final_4]

alpha=1;
P_final_1 = (alpha*(w_visual*P_visual(1:50,:)) + (1-alpha)*(w_meta*P_meta(1:50,:)) )/50;
P_final_2 =( alpha*(w_visual*P_visual(51:100,:)) + (1-alpha)*(w_meta*P_meta(51:100,:)))/50;
P_final_3 = (alpha*(w_visual*P_visual(101:150,:)) + (1-alpha)*(w_meta*P_meta(101:150,:)))/50;
P_final_4 = (alpha*(w_visual*P_visual(151:200,:)) + (1-alpha)*(w_meta*P_meta(151:200,:)))/50;
Final_Confusion_matrix=[P_final_1;P_final_2;P_final_3;P_final_4]
