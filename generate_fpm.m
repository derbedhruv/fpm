%% We're going to generate obliquely illuminated images of an object and sample them at 20 times loss of resolution
%% Images chosen are cameraman.tif for intensity and westconcordorthophoto.png from imdata

% First we load constants
system_constants;

% We generate the simulated object
phase_image = (pi/256.0).*phase_image;   % normalize phase image to [0, pi] to prevent loss of information in euler's decomposition of exponent
object = intensity_image.*exp(j*phase_image);

%% Illuminate the object at different angles, save images formed
%% we choose the origin to be the center of the image, for ease of calculation of the illumination wavevector
%% The light source is assumed to be an LED matrix centered at origin - the origin being at the center of an LED. We will always illuminate with an odd-numbered square of LEDs, with one always at the center
N = 2*illumination_layers - 1;   % side of square of illumination matrix

for a = 1:N
    for b = 1:N
        % illumination is done in layers
        % we will calculate the x,y coordinates of the current LED
        x = (a - illumination_layers)*LED_spacing;
        y = (b - illumination_layers)*LED_spacing;
        
        % illuminate it
        illuminated_object = illuminate(object, x, y, object_x, object_y, illumination_distance, wave_number);
                
        %% Next, the object thus illuminated is IMAGED by an imaging sysem with given NA, which will behave like an LPF for spatial frequencies.
        %{
        % Hence we need to filter in the fourier domain to get the final images.
        ft = fftshift(fft2(illuminated_object));
        lpf_mask = maskk(0, 0, 224, size(ft, 1), size(ft, 2));
        lpf_ft = zeros(size(ft));
        lpf_ft(lpf_mask) = ft(lpf_mask);
        lpf_image = ifft2(ifftshift(lpf_ft));
        % imshow(real(imaged_image.*2), []);
        
        %% After doing so, it is sampled with the 'sensor', which is a 5.5um pixel size, which means it is down-sampled by 20
        imaged_image = imresize(lpf_image, (initial_px/sampled_px));
        %}
        imaged_image = imageit(illuminated_object, initial_px, sampled_px);
        figure; imshow(abs(imaged_image), []);
        
        fileName = sprintf('%i%i%s',a,b,'.png');
        % imwrite(uint8(abs(illuminated_object.^2)), fileName);
    end
end
