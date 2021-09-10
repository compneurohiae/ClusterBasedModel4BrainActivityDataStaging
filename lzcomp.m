% FUNCTION: lzfunction.m

% Function for estimating the Kolmogorov complexity as per:
% "Easily Calculable Measure for the Complexity of Spatiotemporal Patterns"
% by F Kaspar and HG Schuster, Physical Review A 36, 842 (1987)

% Input is a digital string, so conversion from signal to a digital stream
% must be carried out a priori

function clz = lzfunction(x)

n = length(x);
c = 1;
l = 1;

i = 0;
k = 1;
kmax = 1;
stop = 0;

while stop == 0
	if x(i + k) ~= x(l + k)
        if k > kmax
            kmax = k;
        end
        i = i + 1;
        if i == l
            c = c + 1;
            l = l + kmax;
            if l + 1 > n
                stop = 1;
            else
                i = 0;
                k = 1;
                kmax = 1;
            end
        else
            k = 1;
        end
	else
        k = k + 1;
        if l + k > n
            c = c + 1;
            stop = 1;
        end
	end
end

b = n / log2(n);

% Lempel and Ziv, IEEE Trans Inf Theory IT-22, 75 (1976) 
% clz(n) = c(n) / b(n) where c(n) is the kolmogorov complexity and
% clz(n) is a normalized measure of complexity

clz = c / b;
