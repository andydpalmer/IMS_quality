function [val, varargout] = localCOV( I, type, kernelSize, varargin )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if ~isa(type, 'function_handle')
     error('argument type should be a function handle')
end
% compute metric and return value
Icov = covFilt(I, kernelSize);
val = feval(type,Icov(~isnan(Icov)));

if nargout == 2
    varargout{1} = Icov;
end

if nargin >= 4 && varargin{1} == 1
    figure; hist(Icov(~isnan(Icov)), 30);
    title(['CoV deviation Histogram, kernelSize = [' num2str(kernelSize) ']'])
end

end

