# visual_rank

Simplified implementation of the VisualRank (Jing and Baluja, 2008) algorithm. Uses SURF features to compute similarity measures between images. Uses brute-force matching as opposed to locality-sensitive hashing to find feature matches across images. The result of running visual_rank.m is a Nx1 VisualRank stochastic vector akin to a PageRank vector.

Requires Matlab and its Computer Vision Toolbox. 
