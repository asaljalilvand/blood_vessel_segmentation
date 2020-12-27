function [img] = bgExclusion( img )

[rows,columns] = size(img);
avFiltered = zeros(rows,columns);

for x=5:rows-4
    for y=5:columns-4
        avFiltered(x,y) = mean2(img(x-4:x+4,y-4:y+4));        
    end
end

avFiltered = uint8(avFiltered);
for x=1:rows
    for y=1:columns
       dif = avFiltered(x,y)-img(x,y);
       if(dif <= 0) 
          img(x,y) = 0;
       else
           img(x,y)=dif;
       end            
    end
end

end

