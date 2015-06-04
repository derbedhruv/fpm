%% We're going to generate obliquely illuminated images of an object and sample them at 20 times loss of resolution
%% Images chosen are cameraman.tif for intensity and westconcordorthophoto.png from imdata

% First we load constants
system_constants;

% We generate the simulated object
phase_image = (pi/256.0).*phase_image;   % normalize phase image to [0, pi] to prevent loss of information in euler's decomposition of exponent
phase_image = zeros(size(phase_image));    % for ease of working, have a constant phase to begin with
object = intensity_image.*exp(j*phase_image);

%% Illuminate the object at different angles, save images formed
%% we choose the origin to be the center of the image, for ease of calculation of the illumination wavevector
%% The light source is assumed to be an LED matrix centered at origin - the origin being at the center of an LED. We will always illuminate with an odd-numbered square of LEDs, with one always at the center
N = 2*illumination_layers - 1;   % side of square of illumination matrix

imaged_images = [];

for a = 1:N
    for b = 1:N
        % illumination is done in layers
        % we will calculate the x,y coordinates of the current LED
        x = (a - illumination_layers)*LED_spacing;
        y = (b - illumination_layers)*LED_spacing;
        
        % illuminate it
        illuminated_object = illuminate(object, x, y, object_x, object_y, illumination_distance, wave_number);
        fff = abs(fftshift(fft2(illuminated_object)));
        % imshow(fff,[]);
                
        %% Next, the object thus illuminated is IMAGED by an imaging sysem with given NA, which will behave like an LPF for spatial frequencies.
        imaged_image = imageit(illuminated_object, initial_px, sampled_px, pupil_radius);
        % figure; imshow(abs(imaged_image), []);
        
        % scale the images to [0 255] and save them either as images or append them to an array of images
        % imaged_image = 255*(imaged_image - min(imaged_image(:)))/(max(max(abs(imaged_image))));
        imaged_image = imaged_image.*conj(imaged_image);
        imaged_images = cat(3, imaged_images, imaged_image);
        
        % fileName = sprintf('%s%i%i%s',folder,a,b,'.tif');
        % imwrite(uint8(imaged_image), fileName);
    end
end
