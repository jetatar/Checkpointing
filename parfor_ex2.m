% SERIAL REGION
[c name] = system('hostname');
fprintf('SERIAL REGION:  hostname:%s\n', name)
%numlabs = parpool('poolsize');
cluster = parcluster( 'local' );
cluster.NumWorkers = 4;
p = parpool(cluster, cluster.NumWorkers);
fprintf('        hostname                         numlabs  labindex  iteration\n')
fprintf('        -------------------------------  -------  --------  ---------\n')
tic;

% PARALLEL LOOP
parfor i = 1:2000000
    [c name] = system('hostname');
    name = name(1:length(name)-1);
    fprintf('PARALLEL LOOP:  %-31s  %7d  %8d  %9d\n', name,numlabs,labindex,i)
    pause(2);
end

% SERIAL REGION
elapsed_time = toc;        % get elapsed time in parallel loop
fprintf('\n')
[c name] = system('hostname');
name = name(1:length(name)-1);
fprintf('SERIAL REGION:  hostname:%s\n', name)
fprintf('Elapsed time in parallel loop:   %f\n', elapsed_time)
