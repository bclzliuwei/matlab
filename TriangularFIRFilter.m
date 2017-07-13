function [ HResponse ] = TriangularFIRFilter( Fs, Multiplier )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
TriangularFIRCoef = [1/32 2/32 3/32 4/32 5/32 6/32 7/32 8/32];

Result = 0;

for Index = 1 : length(TriangularFIRCoef)
    Result = Result + TriangularFIRCoef(Index) * exp(-2 * pi * Multiplier * Fs *1i);
end

HResponse = Result;
end

