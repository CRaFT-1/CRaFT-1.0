function [Nodes, Element, Set, Set_data, dim, n_node, n_Set] = read_data_CRF(CRF_data)
    %warning('off','all');
    load(CRF_data);
    %%
    dim = size(Nodes,1);
    n_node = size(Nodes,2);
    %
    Set = Measurement_data(1,:);
    Set_data = Measurement_data(2,:)';
    n_Set = length(Set);
end
%% END