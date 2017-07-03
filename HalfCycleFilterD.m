function [ HCosine, HSine ] = HalfCycleFilterD( FilterT, SignalT )
%HalfCycleFilter 此处显示有关此函数的摘要
%   此处显示详细说明

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
       + cos(2 * pi * Index / (FilterT * 2)) ...
       * exp(-2 * pi / SignalT * Index * 1i);
   
   HSine = HSine ...
       + sin(2 * pi * Index / (FilterT * 2)) ...
       * exp(-2 * pi / SignalT * Index * 1i);
end

end

