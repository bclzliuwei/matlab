FilterLength = 48;
ArraySize = 2500;
Magnitudes = zeros(1, ArraySize);
Angles = zeros(1, ArraySize);

Index = 0;
for Coefficient = 0 : 0.001 : 1
    Result = 0;
    for Step = 1 : FilterLength
       Result = Result + cos(2 * pi * Step / FilterLength) * exp(-2 * pi * Coefficient * Step / 2 * 1i); 
    end
    Index = Index + 1;
    Magnitudes(Index) = abs(Result);
    Angles(Index) = rad2deg(angle(Result));
end

X = 0 : 0.001 : 1;
plot(X, Magnitudes(1:Index));
