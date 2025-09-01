function cov_mat = Cov_uncon_Mat(Nodes,dim)
    dis = 0;
    for id = 1:dim
        [X1,X2] = meshgrid(Nodes(id,:));
        l_id = max(Nodes(id,:)) - min(Nodes(id,:));
        dis = dis + abs(X1-X2)/l_id;
    end
    sigma = 0.5;  % Variance
    cov_mat = sigma*exp(-dis);  % Covariance
end
%% END 