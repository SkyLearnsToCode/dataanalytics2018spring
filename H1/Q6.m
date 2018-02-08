% 1. (2 points) Import: Import the data file food.csv in Matlab.
rawfood = csvread('food.csv',1,1);

% 2. Processing: Centering
food = rawfood;
meanFood = mean(food);
meanFood = repmat(meanFood,length(food(:,1)),1);
centeredFood = food-meanFood;

% 2. Processing: Scaling centered data
stdFood = std(food);
stdFood = repmat(stdFood,length(food(:,1)),1);
scaledFood = centeredFood./stdFood;

%4. customized correlation matrix
numDim = length(food(1,:));
numObs = length(food(:,1));
corrMat = zeros(numDim);
n = length(food(:,1));
for i=1:numDim
    for j=1:numDim
        corrMat(i,j) = (1/(numObs-1)) * scaledFood(:,i)'*scaledFood(:,j);
    end
end

% 5. eigenvalues and eigen vectors
[V,D] = eigs(corrMat);

% 6. sort eigen values from largest to smalelst
[c, ind]=sort(diag(D),'descend');
D2=diag(c);

% 6. accordingly update the order of the eigenvectors in matrix
V2 = V(:,ind);

% Plot the percentage of variance captured by the individual components 
% in decreasing order
allDim = length(D2);
cumG = c/sum(c);
figure();
plot(cumG,'b-o');
xlabel('Principal Component')
ylabel('Variance Explained (%)')

numComponents = 2;
projMatPCA = V2(:,1:numComponents);
figure();
scatter(scaledFood*projMatPCA(:,1),scaledFood*projMatPCA(:,2));

% 10. SVD
[U,S,V] = svd(scaledFood);
% sort s matrix from largest to smalelst
[c, ind]=sort(diag(S),'descend');
S2=diag(c);
% project
projMatSVD = S2(1:numComponents,:)';
figure()
scatter(scaledFood*projMatSVD(:,1), scaledFood*projMatSVD(:, 2));