r11=[];
r21=[];
r31=[];

t = [0 3];
y0=[100 20 20 50 10];






% opt =odeset('OutputFcn',@odephas3,'OutputSel',[3 4 5]);
beta = 0.06;
p=	0.4;
b=	0.05;
l=	0.3;
epsilon=0.03;
alpha = 0.025;
mu=0.003;
xi =0.005;
r=100;
gamma = 0.03;
fg = 0.5;

ttl={'General Population','Exposed','Source','Mediums','Skeptic'};

% For different Intended/Source Population
figure
y0 = 10:10:50;
for k = 1:length(y0)

    %Rate of External Influences
    for alpha = linspace(0,1,length(t))
        [t,y]= ode45(@(t,y)  odefun(t,y,r,b,beta,xi,l,p,epsilon,mu,gamma,alpha,fg), t, [100 20 y0(k) 50 10]);
        r11=[r11 alpha*t];
        r21=[r21 gamma*t];
        %     r31=[r31 epsilon*t];

        subplot(2,2,1)
        plot3(t, y(:,5),y(:,3),'LineWidth',2);hold on
        hold on
        grid on
        box on
        hold on
        ylabel('Skeptics')
        xlabel('Time')
        zlabel('Sources')

        %     ylabel('Exposed') xlabel('Susceptible') zlabel('Population')
        subplot(2,2,2)
        plot3(y(:,5),y(:,4),y(:,3),'LineWidth',2);hold on
        xlabel('Skeptics')
        ylabel('Mediums')
        zlabel('Sources')
        hold on
        grid on
        box on
        subplot(2,2,3)
        plot(t,r11,'LineWidth',2);hold on
        ylabel('Influences')
        zlabel('\gamma')
        xlabel('Time')
        hold on
        grid on
        box on
        subplot(2,2,4)
        plot3(t,r11,y(:,3),'LineWidth',2);hold on
        ylabel('\alpha')
        xlabel('Time')
        hold on
        grid on
        box on


        grid on
        %
    end
end

% r12=[]; r22=[]; r32=[]; t = [0 5];
%
%
% % opt =odeset('OutputFcn',@odephas3,'OutputSel',[3 4 5]); beta = 0.06; p=
% 0.4; b=	0.05; l=	0.3; epsilon=0.03; alpha = 0.025;
%  mu=0.003; xi =0.005; r=100; gamma = 0.03; fg = 0.5;
%
% ttl={'General Population','Exposed','Source','Mediums','Skeptic'};
%
%
% figure y0 = 0:10:100; for k = 1:length(y0) for gamma = -1:2
%     [t,y]= ode45(@(t,y)
%     odefun(t,y,r,b,beta,xi,l,p,epsilon,mu,gamma,alpha,fg), t, [100 20
%     y0(k) 50 10]); r12=[r12 gamma*t]; r22=[r22 alpha*t];
%
% subplot(2,2,1)
%     plot3(t, y(:,5),y(:,3),'LineWidth',2);hold on hold on grid on box on
%       hold on
%
% %     ylabel('Exposed') %     xlabel('Susceptible') %
% zlabel('Population')
%     subplot(2,2,2) plot3(y(:,5),y(:,4),y(:,3),'LineWidth',2);hold on
% %         ylabel('Exposed') %     xlabel('Susceptible') %
% zlabel('Population')
%     hold on grid on box on subplot(2,2,3)
%     plot3(t,r12,r22,'LineWidth',2);hold on ylabel('\alpha')
%     xlabel('Time') hold on grid on box on subplot(2,2,4)
%     plot3(t,r12,y(:,3),'LineWidth',2);hold on ylabel('\gamma')
%     xlabel('Time') hold on grid on box on
%
%
%     grid on
% end end
r13=[];
r23=[];
r33=[];
t = [0 3];
% y0=[100 20 0 50 10];






% opt =odeset('OutputFcn',@odephas3,'OutputSel',[3 4 5]);
beta = 0.06;
p=	0.4;
b=	0.05;
l=	0.3;
epsilon=0.03;
alpha = 0.025;
mu=0.003;
xi =0.005;
r=100;
gamma = 0.03;
fg = 0.5;

ttl={'General Population','Exposed','Source','Mediums','Skeptic'};

figure
y0 = 5:5:25;
for k = 1:length(y0)
    for alpha = linspace(0,1,length(t))

        [t,y]= ode45(@(t,y)  odefun(t,y,r,b,beta,xi,l,p,epsilon,mu,gamma,alpha,fg), t, [100 20 10 50 y0(k)]);
        r13=[r13 alpha*t];
        r23=[r23 gamma*t];
        %     r33=[r33 epsilon*t];

        subplot(2,2,1)
        plot3(t, y(:,5),y(:,3),'LineWidth',2);hold on
        hold on
        grid on
        box on
        hold on

        %     ylabel('Exposed') xlabel('Susceptible') zlabel('Population')
        subplot(2,2,2)
        plot3(y(:,5),y(:,4),y(:,3),'LineWidth',2);hold on
        %         ylabel('Exposed')
        %     xlabel('Susceptible') zlabel('Population')
        hold on
        grid on
        box on
        subplot(2,2,3)
        plot(t,r13,'LineWidth',2);hold on
        ylabel('\gamma')
        xlabel('Time')
        hold on
        grid on
        box on
        subplot(2,2,4)
        plot3(t,r13,y(:,3),'LineWidth',2);hold on
        ylabel('\epsilon')
        xlabel('Time')
        hold on
        grid on
        box on


        grid on
        %
    end
end
function dydt = odefun(t,y,r,b,beta,xi,l,p,epsilon,mu,gamma,alpha,fg)
dydt = zeros(5,1);
S = y(1);
E= y(2);
C = y(3);
I = y(4);
Z= y(5);

dydt(1)= r-(beta* I* S)- ((b)*S*Z)-(((gamma*t)*S));
dydt(2) =  -(epsilon*E*t)./Z+((1-l)*(b)*S)*Z + ((1-p)*beta*I*S);
dydt(3) =(alpha*t)*I*C - mu*C+(((1-fg)*(gamma*t)*S));
dydt(4) =   p*beta*I*S+ (epsilon*E*t)./Z+(((gamma*t*fg)*S))-(alpha*t)*I*C;
dydt(5) =  l*(b)*S*Z -xi*Z ;

end
