function y = spiral(n)      % specify the no of layers in the spiral.

    N = 2*n-1;  % this is the length of each side in the square matrix so formed
    mat = zeros(N, N);

    % we're going to generate this spiral from the outside in
    for j = 1:n
        N = 2*(j)-1;
        for i = 0:(N-1)        
            k = n-(j-1);        % helped variable

            mat(i+k, k) = (N-2)^2 + i;          % top left to bottom
            mat(i+k, k+(N-1)) = N^2 -(N-1) - i;       % top right to bottom
            mat(k,i+k) = N^2 - i;               % top left to right
            mat(k+(N-1),i+k) = N^2 - (3*N - 3) + i;   % bottom left to right
        end
    end
    y = mat;
end
