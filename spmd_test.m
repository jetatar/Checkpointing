% SERIAL REGION
[c name] = system('hostname');
fprintf('SERIAL REGION:  hostname:%s\n', name)
cluster = parcluster( 'local' );
cluster.NumWorkers = 4;
p = parpool(cluster, cluster.NumWorkers);
fprintf('                    hostname                         numlabs  labindex\n')
fprintf('                    -------------------------------  -------  --------\n')
tic;

% PARALLEL REGION
spmd
    [c name] = system('hostname');
    name = name(1:length(name)-1);
    fprintf('PARALLEL REGION:  %-31s  %7d  %8d\n', name,numlabs,labindex)
    pause(2);
end

% SERIAL REGION
elapsed_time = toc;          % get elapsed time in parallel region
delete(p);
fprintf('\n')
[c name] = system('hostname');
name = name(1:length(name)-1);
fprintf('SERIAL REGION:  hostname:%s\n', name)
fprintf('Elapsed time in parallel region:   %f\n', elapsed_time)
quit;
