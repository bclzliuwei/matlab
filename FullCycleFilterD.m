function [ HCosine, HSine ] = FullCycleFilterD( FilterT, SignalT )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if FilterT == 0
    error('FilterT should not be zero!');
end

if SignalT == 0
    error('SignalT should not be zero!');
end

HCosine = 0;
HSine = 0;
for Index = 1 : FilterT
   HCosine = HCosine ...
       + cos(2 * pi * Index / FilterT) ...
       * exp(-2 * pi / SignalT * Index * 1i);
   
   HSine = HSine ...
       + sin(2 * pi * Index / FilterT) ...
       * exp(-2 * pi / SignalT * Index * 1i);
end

end

