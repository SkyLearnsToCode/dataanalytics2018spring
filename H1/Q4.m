load data.mat
% the Euclidean distances between each pair of the data points (xi, xj) 
%(a 200×200 distance matrix)
EuclideanDistMat = dist(X_data', X_data);
%distances among the first 8 data points (a 8×8 distance matrix)
First8 = EuclideanDistMat(1:8,1:8);

%construct neighborhood graphs
[adjMatless6_200, adjMat5nn_200, distGraphLess6_200, distGraph5nn_200] = plotGraph(EuclideanDistMat);
[adjMatless6_8, adjMat5nn_8, distGraphLess6_8, distGraph5nn_8] = plotGraph(First8);

% part 2: geodist
distMatLess6 = geodesic(distGraphLess6_8);
distMat5nn = geodesic(distGraph5nn_8);