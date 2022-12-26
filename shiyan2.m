%传递函数建立 tf
A = tf(1,[1 1 0]);
B = tf(10,1);
C = tf([0.4682 1],[0.1018 1]);
G0 = A*B;
G = A*B*C;

%单位反馈系统闭环传递函数 feedback
A1=feedback(G0,1,-1);
B1=feedback(A,1,-1);
G1=feedback(G,1,-1);

%阶跃响应 step
[y0, t0]=step(B1, 0:0.001:30);
[y1, t1]=step(A1, 0:0.001:30);
[y2, t2]=step(G1, 0:0.001:30);

plot(y0)
hold on;
plot(y1)
hold on;
plot(y2)
axis([0 30000,0 1.8])
legend('校正前','校正前（K=10）','校正后')

% Bode图 bode
% bode(A);
% hold on;
% bode(C);
% hold on;
% bode(G0);
% hold on;
% bode(G);

	
% %奈式图nyquist
% nyquist(A);

%求裕度margin；
% margin(A);
% hold on;
% margin(G0);
% hold on;
% margin(G);

%斜坡响应：

% t=0:0.001:30;
% u=t;
% y_1 = lsim(A1,u,t);
% y_2 = lsim(G1,u,t);
% yticks(0:0.001:30)
% plot(u);
% hold on;
% plot(y_1)
% hold on;
% plot(y_2)
% legend('单位斜坡输入','校正前','校正后')




