# Fourier Ptychographic Microscopy (FPM) Simulation
Implementation of a simulation of FPM as described by Zheng *et al* in their paper [1]. In the supplmentary information of this paper, a simulation of FPM has been described which I will be copying almost exactly, using inbuilt MATLAB images as the authors have done. The demo video of this can be seen at https://www.youtube.com/watch?v=gnFBuvy0bh4

# Image generation  and explanation in brief
The first part tackled shall be 'generation' of images for FPM - i.e. using a simulated object with known intensity and phase profiles, it shall be 'illuminated' at different known angles by a monochromatic light source (632 nm) to give a greyscale image at the output representing the obliquely illumation object. The original object shall have dimensions 256x256 pixels and each pixel is assumed to be of 275nm dimension - this is important in the plane wave calculation.

The obliquely illumated intensity images will be sampled at 5.5 micron pixel width (i.e. 20 times less resolution) and these low-res images will be the end point of the image generation part.

# Image reconstruction
The generated images will be stitched together in fourier space as described in the publication referred to earlier to get back the original high-resolution image as well as the phase information that is hidden in the complex portion of the sampled image. The reconstruction of the high-res object as well as phase image shall be taken as onfirmation that the algorithm written for FPM reconstruction works. This code will be used as-is (after re-writing in python and subsequently in C++) for reconstruction of images in the real world through microscopy.

# References
[1] http://dx.doi.org/10.1038/nphoton.2013.187
