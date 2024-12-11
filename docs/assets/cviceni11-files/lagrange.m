function [result] = lagrange(definingPoints,definingFunctionValues,evaluationPoints)
% LAGRANGE function returning evaluation of Lagrange interpolation
% polynomial defined by definingPoints and definingFunctionValues at
% evaluationPoints
% 
% Inputs: 
% definingPoints
% definingFunctionValues
% evaluationPoints
%
% Output:
% result - vector contaning the evaluations of Lagrange interpolation polynomial
% at evaluationPoints


result = zeros(1,length(evaluationPoints));

for i = 1:length(definingPoints)
    numerator = ones(1,length(evaluationPoints));
    denominator = 1;
    for j = 1:length(definingPoints)
        if (j~=i)
        numerator = numerator.*(evaluationPoints - definingPoints(j)*ones(1,length(evaluationPoints))); 
        denominator = denominator*(definingPoints(i)- definingPoints(j));
        end
    end
    result = result + numerator.*(definingFunctionValues(i)/denominator);
end

