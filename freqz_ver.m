constlimit = 48;
index = 1 : constlimit;
coef = cos(2 * pi * index / constlimit);
[h, w] = freqz(coef);
arraylength = length(w);

plot(w / pi, abs(h));
