%% ALL DIMENSIONS ARE IN MICRONS

% sample object constants
initial_px = 0.275;     % initial pixel size in microns
upsample = 5;
intensity_image = double(imresize(imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\cameraman.tif'), upsample));
phase_image = double(imresize(imcrop(imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\westconcordorthophoto.png'), [0 0 256 256]), upsample));
object_length = 0.275*size(intensity_image, 1);     % length (and width) in microns
[object_x, object_y] = meshgrid(-object_length/2:0.275:object_length/2 - 0.275, -object_length/2:0.275:object_length/2 - 0.275);

% Imaging system constants
sampled_px = 5.5;
NA = 0.08;              % Numerical aperture of simulated imaging system

% Illumination system constants
wavelength = 0.632;     % wavelength of light used for simulated illumination, in microns
wave_number = 2*pi/wavelength;
LED_spacing = 4000;    % vertical and horizontal distance between center of each LED in the array, in microns
illumination_distance = 80000;  % distance from the LED matrix to the object, in microns
illumination_layers = 3; % no of layers of a spiral square matrix of LEDs used to illuminate the setup
