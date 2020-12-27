function [] = VesselSegmentation(origImg)

grayImg = rgb2gray(origImg);
greenImg = origImg(:,:,2);
[rows,columns] = size(grayImg);
%--contrast improvement via histogram equalization
flatGray = flat(grayImg);
flatGreen = flat(greenImg);
%--background exclusion
beGray = bgExclusion(flatGray);
beGreen = bgExclusion(flatGreen);
%--thresholding
sGray = otsu(beGray);
sGreen = otsu(beGreen);
%--remove white border
mask = rgb2gray(origImg);
maskedGray = sGray;
maskedGreen = sGreen;
    %--creating a mask
for x=1:rows
    for y=1:columns
        if(mask(x,y)<20)
            mask(x,y) = 255;
        else
            mask(x,y) = 0;
        end 
    end
end
    %--subtracting mask
for x=1:rows
    for y=1:columns
        difGray = maskedGray(x,y) - mask(x,y);
		difGreen = maskedGreen(x,y) - mask(x,y);
        if(difGray<=0)
            maskedGray(x,y) =0;
        end 
		if(difGreen<=0)
			maskedGreen(x,y) =0;
		end
    end
end
%--removing objects smaller than 50 pixels
grayResult = bwareaopen(maskedGray,500);
greenResult = bwareaopen(maskedGreen,500);


%--display 
figure;
    subplot(1,2,1); 
    imshow(grayImg);
    title('gray scale');
    subplot(1,2,2) ;
    imshow( greenImg);
	title('green channal');
figure;
	subplot(1,2,1) ;
    imshow( flatGray);
	title('after histogram equalization (gray scale)');
	subplot(1,2,2) ;
    imshow( flatGreen);
	title('after histogram equalization (green channal)');
figure;
	subplot(1,2,1) ;
    imshow( beGray);
	title('background excluded(gray scale)');
	subplot(1,2,2) ;
    imshow( beGreen);
	title('background excluded (green channal)');
figure;
	subplot(1,2,1) ;
    imshow(sGray);
	title('after thresholding (gray scale)');
	subplot(1,2,2) ;
    imshow(sGray);
	title('after thresholding (green channal)');
figure	
	subplot(1,3,1) ;
    imshow(mask);
	title('mask');
	subplot(1,3,2) ;
    imshow(maskedGray);
	title('white border removed (gray scale)');
	subplot(1,3,3) ;
    imshow(maskedGreen);
	title('white border removed (green channal)');
figure;
	subplot(1,2,1) ;
    imshow(grayResult);
	title('result (gray scale)');
	subplot(1,2,2) ;
    imshow(greenResult);
	title('result (green channal)');	
	

	
end

