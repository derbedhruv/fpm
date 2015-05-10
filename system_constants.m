%% ALL DIMENSIONS ARE IN MICRONS

% sample object constants
initial_px = 0.275;     % initial pixel size in microns
intensity_image = double(imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\cameraman.tif'));
phase_image = double(imcrop(imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\westconcordorthophoto.png'), [0 0 256 256]));

% Imaging system constants
sampled_px = 5.5;
NA = 0.08;              % Numerical aperture of simulated imaging system

% Illumination system constants
wavelength = 0.632;     % wavelength of light used for simulated illumination, in microns
LED_distance = 4000;    % vertical and horizontal distance between center of each LED in the array, in microns
