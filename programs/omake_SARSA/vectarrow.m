function vectarrow(p0,p1)

	alpha = 0.5;  % Size of arrow head relative to the length of the vector
	beta = 0.5;  % Width of the base of the arrow head relative to the length

	x0 = p0(1);
	y0 = p0(2);
	x1 = p1(1);
	y1 = p1(2);
	plot([x0;x1],[y0;y1],'r');   % Draw a line between p0 and p1
        
	p = p1-p0;
        
	hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
	hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];
        
	plot(hu(:),hv(:),'r')  % Plot arrow head

end