function y = illuminate(object, x, y, object_x, object_y, illumination_distance, wave_number)
    %% illuminates 'object' with an LED at distance x,y
    % generate kx and ky
    wavevector_denominator = sqrt(x^2 + y^2 + illumination_distance^2);
    kx = wave_number*x/wavevector_denominator;
    ky = wave_number*y/wavevector_denominator;

    % generate the illumination matrix
    illumination_matrix = object_x*kx + object_y*ky;

    % Then we apply the plane wave to the object
    % given by exp(jk.r)*obj
    illuminated_object = 10*object.*exp(j*illumination_matrix);
    y = illuminated_object;
end