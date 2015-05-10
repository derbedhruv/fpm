%% ALL DIMENSIONS ARE IN MICRONS

initial_px = 0.275;     % initial pixel size in microns
sampled_px = 5.5;
wavelength = 0.632;     % wavelength of light used for simulated illumination, in microns
intensity_image = double(imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\cameraman.tif'));
phase_image = double(imcrop(imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\westconcordorthophoto.png'), [0 0 256 256]));
