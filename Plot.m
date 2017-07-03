XRange = 0.5 : 0.01 : 2;
XLabel = XRange;

HCosineArray = zeros(1, length(XRange));
HSineArray = zeros(1, length(XRange));

for Index = 1 : length(XRange)
    [HCosine, HSine] = FullCycleFilterD(48, XRange(Index) * 48);
    
    HCosineArray(Index) = HCosine;
    HSineArray(Index) = HSine;
end

subplot(2, 1, 1);
plot(XLabel, abs(HCosineArray), XLabel, abs(HSineArray));
title('Magnitude vs Frequency');
xlabel('Normalized Frequency');
ylabel('Magnitude');
legend('Cosine Filter', 'Sine Filter');
grid on;
subplot(2, 1, 2);
plot(XLabel, rad2deg(angle(HCosineArray)), XLabel, rad2deg(angle(HSineArray)));
title('Angle vs Frequency');
xlabel('Normalized Frequency');
ylabel('Angle (Deg)');
legend('Cosine Filter', 'Sine Filter');
grid on;