%% Environment Initialization 
clear; clc; close all;
%% Load Geometric Mesh and Constraint Data
CRF_data = 'Example_Input/Example_5_3D';
[Nodes, Element, Set, Set_data, dim, n_node, n_Set] = read_data_CRF(CRF_data);
%% Kriging Fitting of Mean
gp_model = fitrgp(Nodes(:,Set)', Set_data, ...
    'OptimizeHyperparameters','auto', ...
    'HyperparameterOptimizationOptions', ...
    struct('ShowPlots',false,'Verbose',0));
CRF_mean = predict(gp_model, Nodes');    % Mean_Kriging prediction
clc; set(0, 'DefaultFigureVisible', 'on'); 
%% Unconditional Covariance Matrix: C_uncon
C_uncon = Cov_uncon_Mat(Nodes,dim);
%% Interpolation Covariance Matrix: C_interp (Nystrom appraoch)
C_interp = C_uncon(:,Set)*((C_uncon(Set,Set) + 1e-6*eye(n_Set))\C_uncon(:,Set)') ;
%% Conditional Covariance Matrix: C_con
C_con = C_uncon - C_interp + 1e-6*eye(n_node);    % Regularization
C_con = (C_con + C_con')/2;
check_positive_def(C_con);
C_con(Set,:) = 0; C_con(:,Set) = 0;
%% KLE of Unconditional Covariance
KL_terms = 10;    % Need to be assigned
[evec_f, eval_lam] = eigs(C_con, KL_terms);    % Eigendecomposition
trun = 1 - eval_lam(end,end)/sum(sum(eval_lam)); % Truncation error
%% Conditional Random Sample Generation
n_sam = 1e3;    % Number of samples
rng('default');
CRF_sam = CRF_mean + evec_f*sqrt(eval_lam)*randn(KL_terms, n_sam);
%% Save data
Ev = evec_f*sqrt(eval_lam);
save(fullfile('Example_Output/',[CRF_data(15:end),'_data']), ...
    'CRF_mean','Ev','Nodes', 'Element', 'Set', 'Set_data', 'dim')
%% Postprocessing
Visualization(CRF_sam, Nodes, Element, Set, Set_data, dim);
%% END
