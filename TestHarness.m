SignalT = 48 * 1;
SignalBufferLength = 2000;
SignalMagnitude = 10;
Offset = 0.5;

FilterT = SignalT / 4;
[HCosine, HSine] = HalfCycleFilterD(FilterT, SignalT);

% RealGain = 1;
% ImaginaryGain = 1;
RealGain = abs(HCosine);
ImaginaryGain = abs(HSine);

SignalBuffer = zeros(1, SignalBufferLength);
for Index = 1 : SignalBufferLength
    SignalBuffer(Index) = SignalMagnitude * cos(2 * pi * Index / SignalT);
end

CosineCoef = zeros(1, FilterT);
SineCoef = zeros(1, FilterT);
for Index = 1 : FilterT
    CosineCoef(Index) = cos(2 * pi * (Index - Offset) / (FilterT * 2));
    SineCoef(Index) = sin(2 * pi * (Index - Offset) / (FilterT * 2));
end

RealArray = zeros(1, SignalBufferLength);
ImaginaryArray = zeros(1, SignalBufferLength);
MagnitudeArray = zeros(1, SignalBufferLength);
AngleArray = zeros(1, SignalBufferLength);

for Index = FilterT : SignalBufferLength
   Real = 0;
   Imaginary = 0;
   for Counter = 1 : FilterT
      Real = Real + SignalBuffer(Index - Counter + 1) * CosineCoef(Counter);
      Imaginary = Imaginary + SignalBuffer(Index - Counter + 1) * SineCoef(Counter);
   end
   Real = Real / RealGain;
   Imaginary = Imaginary / ImaginaryGain;
   RealArray(Index) = Real;
   ImaginaryArray(Index) = Imaginary;
   Temp = complex(Real, Imaginary);
   MagnitudeArray(Index) = abs(Temp);
   AngleArray(Index) = rad2deg(angle(Temp));
end

XT = 1 : SignalBufferLength;
plot(XT, SignalBuffer, XT, MagnitudeArray);
