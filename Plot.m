XRange = 0 : 0.01 : 0.5;
XLabel = XRange;

HArray = zeros(1, length(XRange));

for Index = 1 : length(XRange)
    HResponse = TriangularFIRFilter(3200, XRange(Index));
    
    HArray(Index) = HResponse;
end

subplot(2,1,1);
plot(XLabel, abs(HArray));
subplot(2,1,2);
plot(XLabel, rad2deg(angle(HArray)));
% subplot(2, 1, 1);
% plot(XLabel, abs(HCosineArray), XLabel, abs(HSineArray));
% title('Magnitude vs Frequency');
% xlabel('Normalized Frequency');
% ylabel('Magnitude');
% legend('Cosine Filter', 'Sine Filter');
% grid on;
% subplot(2, 1, 2);
% plot(XLabel, rad2deg(angle(HCosineArray)), XLabel, rad2deg(angle(HSineArray)));
% title('Angle vs Frequency');
% xlabel('Normalized Frequency');
% ylabel('Angle (Deg)');
% legend('Cosine Filter', 'Sine Filter');
% grid on;