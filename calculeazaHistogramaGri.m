function [h] = untitled(img, interval)

% h = hist(double(img), interval);

% florin shto
% [n,x] = hist( double(imagineGri), interval);
% delta_x = x(2)-x(1);
% aria = delta_x * sum(n);
% h = n / aria;
% end florin shto


[counts, ~] = hist(double(img), interval);
h = counts / sum(counts);

end

