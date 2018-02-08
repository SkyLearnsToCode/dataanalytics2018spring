function [ adjMatless6, adjMat5nn, distGraphLess6, distGraph5nn] = plotGraph( graphMat )
    size = length(graphMat);
    sorted = zeros(200,5);
    for i=1:size
        tmp = sort(graphMat(i,:));
        % minimal is oneself, counting from 2 to 6
        sorted(i,:) = tmp(2:6);
    end
    adjMatless6 = zeros(size);
    adjMat5nn = zeros(size);

    for i=1:size
        adjMat5nn(i,:) = ismember(graphMat(i,:),sorted(i,:));
        adjMat5nn(i,i) = 0;
        for j=1:size
            if graphMat(i,j) < 6
                if i == j
                    adjMatless6(i,j) = 0;
                else
                    adjMatless6(i,j) = 1;
                end
            end
        end
    end

    distGraphLess6 = graph(adjMatless6);
    distGraph5nn = digraph(adjMat5nn);
    f1 = figure;
    f2 = figure;
    figure(f1);
    plot(distGraphLess6);
    figure(f2);
    plot(distGraph5nn);

end

