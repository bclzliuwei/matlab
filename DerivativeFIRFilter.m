function [ HResponse ] = DerivativeFIRFilter( Multiplier )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
DerivativeFIRCoef = [3 -4 1];

Result = 0;

for Index = 1 : length(DerivativeFIRCoef)
    Result = Result + DerivativeFIRCoef(Index) ...
        * exp(-2 * pi * Multiplier * Index * 1i / 2);
end

HResponse = Result;
end

