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

for i = 1:N
    for j = 1:N
        % illumination is done in layers
        % we will calculate the x,y coordinates of the current LED
        x = (i - illumination_layers)*LED_spacing;
        y = (j - illumination_layers)*LED_spacing;
        
        % Then we convert that into a wave vector
        wavevector_denominator = sqrt(x^2 + y^2 + illumination_distance^2);
        kx = wave_number*x/wavevector_denominator;
        ky = wave_number*y/wavevector_denominator;
        
        % generate the illumination matrix
        illumination_matrix = object_x*kx + object_y*ky;
        % imshow(illumination_matrix,[])
        
        % Then we apply the plane wave to the object
        % given by exp(jk.r)*obj
        illuminated_object = illumination_matrix.*object;
        imshow(abs(illuminated_object),[])
    end
end
