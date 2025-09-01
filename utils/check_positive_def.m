function check_positive_def(C_con)
    [~,p] = chol(C_con);
    if p > 0
        fprintf('Conditional covariance matrix is negative definite: Execution terminated! \n');
        error('( T_T )');
    end
end
%% END
