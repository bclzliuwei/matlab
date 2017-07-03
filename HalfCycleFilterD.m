function [ HCosine, HSine ] = HalfCycleFilterD( FilterT, SignalT )
%HalfCycleFilter 此处显示有关此函数的摘要
%   此处显示详细说明

% 0.5 is very special 
% and if 0.5 is applied, HCosine and HSine are orthogonal.
Offset = 0.5;

if FilterT == 0
    error('Parameter FilterT should not be zero!');
end

if SignalT == 0
    error('Parameter SignalT should not be zero!');
end

HCosine = 0;
HSine = 0;
for Index = 1 : FilterT
   HCosine = HCosine ...
       + cos(2 * pi * (Index - Offset) / (FilterT * 2)) ...
       * exp(-2 * pi / SignalT * Index * 1i);
   
   HSine = HSine ...
       + sin(2 * pi * (Index - Offset) / (FilterT * 2)) ...
       * exp(-2 * pi / SignalT * Index * 1i);
end

end

