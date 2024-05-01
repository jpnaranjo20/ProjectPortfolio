function [p_x_c] = pdf_c(X,Mu_c,Q_c)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n = length(Q_c);

p_x_c = exp(-1/2 .* (X' - Mu_c') * inv(Q_c) * (X - Mu_c));
p_x_c = p_x_c/(sqrt(det(Q_c))*(2*pi)^(n/2));

end

