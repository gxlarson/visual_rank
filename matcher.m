% finds matches between two images

clear
close all

ransac = 'projective';

% read images
im1 = imread('/Users/davidlarson/stefan/matlab_sandbox/VisualRank/images/mona_1.png');
im1 = rgb2gray(im1);
im2 = imread('/Users/davidlarson/stefan/matlab_sandbox/VisualRank/images/mona_5.png');
im2 = rgb2gray(im2);

% detect SURF features
points1 = detectSURFFeatures(im1);
points2 = detectSURFFeatures(im2);

% descriptor extraction
[feats1, points1] = extractFeatures(im1, points1);
[feats2, points2] = extractFeatures(im2, points2);

% compute matches
imPairs = matchFeatures(feats1, feats2);

% display matched pairs
matched1 = points1(imPairs(:, 1), :);
matched2 = points2(imPairs(:, 2), :);
figure;
showMatchedFeatures(im1, im2, matched1, matched2, 'montage');

% RANSAC to estimate geometric transformation
% try
[tform, inliers1, inliers2] = estimateGeometricTransform(matched1, matched2, ransac);
% catch
%     disp('not enough matches');
% end

% display inlier pairs
figure;
showMatchedFeatures(im1, im2, inliers1, inliers2, 'montage');


















