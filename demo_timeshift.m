clear; close all;
L=200; % transform length
D=50; % displayed length
N=600; % signal length
t=1:N;
P=12;
f1=cos(2*pi*t/P+pi/5);
f2=cos(2*pi*t/P+2*pi/5);

s1_rft=rftmtx(N)*f1';
s1_iipf=iipfspec(f1,20);
figure; stem(s1_rft(1:20));
axis([0,21,-0.05,0.5]);
grid on; xlabel('q');
hgexport(gcf, 'shift_s1_rft.eps', hgexport('factorystyle'), 'Format', 'eps');
figure; stem(s1_iipf);
axis([0,21,-0.05,0.5]);
grid on; xlabel('q');
hgexport(gcf, 'shift_s1_iipf.eps', hgexport('factorystyle'), 'Format', 'eps');

s2_rft=rftmtx(N)*f2';
s2_iipf=iipfspec(f2,20);
figure; stem(s2_rft(1:20));
axis([0,21,-0.05,0.5]);
grid on; xlabel('q');
hgexport(gcf, 'shift_s2_rft.eps', hgexport('factorystyle'), 'Format', 'eps');
figure; stem(s2_iipf);
axis([0,21,-0.05,0.5]);
grid on; xlabel('q');
hgexport(gcf, 'shift_s2_iipf.eps', hgexport('factorystyle'), 'Format', 'eps');