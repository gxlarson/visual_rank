close all

EXTRACT_FEATURES = 1;

path = '/Users/davidlarson/stefan/matlab_sandbox/VisualRank/images/mona_';
N = 8;

if EXTRACT_FEATURES
    db_feats = {};  % holds SURF feature descriptors of each image
    db_points = {}; % holds feature locations of each image
    % extract SURF feature descriptors / locations of each image
    for i = 1:N
        % read image and convert to grayscale
        db_im = strcat(path,num2str(i),'.png');
        im = imread(db_im);
        im = rgb2gray(im);

        % detect SURF features
        points = detectSURFFeatures(im); 

        % SURF feature descriptor extraction
        [feats, points] = extractFeatures(im, points);
        db_feats{i} = feats;
        db_points{i} = points.Location;
    end
end


% construct similarity matrix
S = zeros(N,N);
Sn = zeros(N,N);
Sg = zeros(N,N);
for i = 1:N
    feats1 = db_feats{i};
    points1 = db_points{i};
    for j = 1:N
        feats2 = db_feats{j};
        points2 = db_points{j};
        
        
        imPairs = matchFeatures(feats1, feats2);
        matched1 = points1(imPairs(:, 1), :);
        matched2 = points2(imPairs(:, 2), :);
        num_matched = size(matched1,1);
        S(i,j) = num_matched;
        normalize = mean([size(points1,1), size(points2,1)]);
        Sn(i,j) = num_matched / normalize;
    end
end
Sn = Sn';
col_sums = sum(Sn,1);
for i = 1:N
    Sn(:,i) = Sn(:,i) / col_sums(i);
end

[U,V] = eig(Sn);
vr = U(:,2);
vr = vr / sum(vr)









