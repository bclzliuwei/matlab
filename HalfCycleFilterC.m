function [ HCosine, HSine ] = HalfCycleFilterC( F0, F, AngleOffsetByRadian )
%HalfCycleFilterC 此处显示有关此函数的摘要
%   此处显示详细说明
% For full cycle filter, just replace ConstUpperLimit with 2 * pi and
% ConstK with 2.
ConstUpperLimit = pi;
ConstLowerLimit = 0;
ConstK = 4;

if F0 == F
   HCosine = 1 / (ConstK * F0) * exp(1i * AngleOffsetByRadian);
   HSine = 1 / (ConstK * 1i * F0) * exp(1i * AngleOffsetByRadian);
else
   Part1 = exp(1i * (1 - F / F0) * ConstUpperLimit + 1i * AngleOffsetByRadian) ...
       / (1i *(1 - F / F0)) ...
       - exp(1i * (1 - F / F0) * ConstLowerLimit + 1i * AngleOffsetByRadian) ...
       / (1i *(1 - F / F0));
   Part2 = exp(-1i * (1 + F / F0) * ConstUpperLimit - 1i * AngleOffsetByRadian) ...
       / (-1i *(1 + F / F0)) ...
       - exp(-1i * (1 + F / F0) * ConstLowerLimit - 1i * AngleOffsetByRadian) ...
       / (-1i *(1 + F / F0));
   HCosine = 1 / (4 * pi * F0) * (Part1 + Part2);
   HSine = 1 / (4i * pi * F0) * (Part1 - Part2);
end

end

