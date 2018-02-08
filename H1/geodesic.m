function geoDist = geodesic(distGraph)
    size = numnodes(distGraph);
    geoDist = zeros(size);
    for i=1:size
        for j=1:size
            geoDist(i,j) = length(shortestpath(distGraph,i,j,'Method','positive')) - 1;
            if geoDist(i,j) == -1
                geoDist(i,j) = Inf;
            end
        end
    end
end