if exist( 'checkpoint.mat','file' ) % If a checkpoint file exists, load it
    fprintf('Checkpoint file found - Loading\n');
    fprintf( 'the value of var_i is: %d', i );
    load('checkpoint.mat')

else %otherwise, start from the beginning
    fprintf('No checkpoint file found - starting from beginning\n');
end

delete( gcp );
cluster = parcluster( 'local' );
cluster.NumWorkers = 16;
parpool( cluster, cluster.NumWorkers );

a = zeros( 200 );

parfor i = 1:2000000
    fprintf( 'iterr: %d', i );
    a(i) = max(abs(eig(rand(500))));    

    fprintf('checkpoint %d\n', i);
    parsave('checkpoint.mat', i);
    pause(1);
end
fprintf('Done.\n');
