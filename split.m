X=4;%X blocks
Y=4;%Y blocks
n=0;

I=imread('72461410_p1.png');
I = im2double(I);
[H,W,t]=size(I);
M = uint32(W/X)-1;%-1 for compensation start loc
N = uint32(H/Y)-1;

xSkipStep=M;
ySkipStep=N;
xStepNum = X;
yStepNum = Y;
PImg = zeros(N,M,3,uint32(X*Y));%premollac

for m=1:yStepNum
    for j=1:xStepNum
        n=n+1;
        PImg(:,:,:,n)=I((m-1)*ySkipStep+1:(m-1)* ySkipStep+N,(j-1)*xSkipStep+1:(j-1)*xSkipStep+M,:);
        a = strcat(num2str(n),'.png');
        imwrite(double(PImg(:,:,:,n)),a);
        imshow(double(PImg(:,:,:,n)));
    end
end

%some process
%CImg = zeros(ySkipStep*Y,xSkipStep*X,3);  %prelocation

ran = randperm(X*Y);

CImg = [];
final = [];
n=0;
for m=1:yStepNum
    for j=1:xStepNum
        n=n+1;
        r = ran(n);
        CImg = [CImg PImg(:,:,:,r)];
        
        %a = strcat(num2str(n),'.png');
    end
        final = [final ; CImg];
        CImg = [];
end
imshow(double(final));


