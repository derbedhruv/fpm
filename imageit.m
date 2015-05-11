function y = imageit(illuminated_object, initial_px, sampled_px, pupil_radius)
%% Image the illuminated object and throw the imaged image
    ft = fftshift(fft2(illuminated_object));
    lpf_mask = maskk(0, 0, 2*pupil_radius, size(ft, 1), size(ft, 2));
    lpf_ft = zeros(size(ft));
    lpf_ft(lpf_mask) = ft(lpf_mask);
    lpf_image = ifft2(ifftshift(lpf_ft));
    % imshow(real(imaged_image.*2), []);

    %% After doing so, it is sampled with the 'sensor', which is a 5.5um pixel size, which means it is down-sampled by 20
    imaged_image = imresize(lpf_image, (initial_px/sampled_px));
    y = imaged_image;
end