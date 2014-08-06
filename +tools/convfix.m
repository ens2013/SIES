function Y = convfix(X, width)
% Convolute X with a constant window h:
% h = 1/width*[1,1,...1], length(h) = width
% so that the output Y satisfies
% Y(1)=X(1), Y(end)=X(end)

X = reshape(X, 1, []);

if length(X)==0
    error('Input vector must not be empty!');
end

h = ones(1, width) / width;

toto = ones(1,width-1);
X1 = [toto*X(1), X, toto*X(end)];
Y1 = conv(X1, h, 'full');
Y = Y1(width:end-width+1);

end