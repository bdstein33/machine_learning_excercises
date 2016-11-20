function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% Store the count of examples assigned to each cluser to find the average later
centroid_X_count = zeros(K,1);

for i = 1:m
  cur_cluster = idx(i);
  cur_X = X(i,:);

  centroid_X_count(cur_cluster) = centroid_X_count(cur_cluster) + 1;

  centroids(cur_cluster,:) = centroids(cur_cluster,:) + cur_X;
end

for i = 1:K
  centroids(i,:) = centroids(i,:) / centroid_X_count(i);
end


% =============================================================


end

