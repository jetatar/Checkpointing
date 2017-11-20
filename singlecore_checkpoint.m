if exist( 'checkpoint.mat','file' ) % If a checkpoint file exists, load it
    fprintf('Checkpoint file found - Loading\n');
    load('checkpoint.mat')

else %otherwise, start from the beginning
    fprintf('No checkpoint file found - starting from beginning\n');
    mysum=0;
    countmin=1;
end

for count = countmin:100
    mysum = mysum + count;
    pause(1);           %Let's pretend that this is a complicated calculation

    %save checkpoint
    countmin = count+1;  %If we load this checkpoint, we want to start on the next iteration
    fprintf('Saving checkpoint\n');
    save('checkpoint.mat');

    fprintf('Completed iteration %d \n',count);
end
fprintf('The sum is %f \n',mysum);
