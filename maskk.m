function y = maskk(ccx, ccy, r, ix, iy)
  % x and y are distances from the center!
  % mask size stuff 
  % ix = size(a, 1); iy = size(a, 2);

  % mask stuff
  cx = ix/2 + ccx; 
  cy = iy/2 + ccy; 
  % r  = 20;

  % make the mask
  [x,y] = meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
  y = ((x.^2+y.^2) <= r^2);
end