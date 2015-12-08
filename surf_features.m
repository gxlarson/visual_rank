% Detect and display SURF features in an image.

clear
close all

fname = '/Users/davidlarson/stefan/matlab_sandbox/VisualRank/images/mona_1.png';

% read images
im1 = imread(fname);
im1 = rgb2gray(im1);

% detect SURF features
points1 = detectSURFFeatures(im1);

% display features
imshow(im1); hold on;
plot(points1.selectStrongest(50));