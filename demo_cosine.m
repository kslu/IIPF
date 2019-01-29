close all;
L=500; % transform length
D=50; % displayed length
N=1000; % signal length
t=1:N;
P1=6; P2=12; P3=18;
f1=cos(2*pi*t/P1);
f2=2*cos(2*pi*t/P2);
f3=3*cos(2*pi*t/P3);

n=wgn(1,N,0.5);
f=f1+f2+f3+n;

figure;
Y=rsmap(f,D,L,1);
hgexport(gcf, 'cosdecomp_rsmap.png', hgexport('factorystyle'), 'Format', 'png');

s=iipfspec(f,40);
figure; stem(s);
axis([0,40,-0.2,2.4]);
grid on; xlabel('q');
set(gcf,'Position',[300 300 800 300])
hgexport(gcf, 'cosdecomp_iipfspec.eps', hgexport('factorystyle'), 'Format', 'eps');