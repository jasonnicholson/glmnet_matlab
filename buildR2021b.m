%% Compiler and other relevant Information
% Microsoft Windows 21H2 19044.1415
% MATLAB Version: 9.11.0.1809720 (R2021b) Update 1
% Intel(R) Fortran Intel(R) 64 Compiler Classic for applications running on Intel(R) 64, Version 2021.2.0 Build 20210228_000000
% Visual Studio 2017 version 15.9.36
% Microsoft (R) Incremental Linker Version 14.16.27045.0
% 
% 
% License GPL-2

%%
clc; clear; close all;

% get the matlab version
matlabVersion = version('-release');

% name of the build
BUILD = strcat(matlabVersion,'_Windows');

% Version of glmet
glmnetVersion = getGlmnet_MatlabVersion();

% clean up if a build folder was left behind
if exist(BUILD,'dir')
    rmdir(BUILD,'s');
end

% setup build directory
copyfile('source', BUILD);

oldfolder = cd(BUILD);
try 

    % record the build process
    diary(strcat(BUILD,'_mex_build.log'));
    mex -v COMPFLAGS='$COMPFLAGS /real_size:64 /integer_size:64' -largeArrayDims glmnetMex.F GLMnet.f 
    diary('off')

    % create the release
    zipFileName = fullfile(oldfolder,strcat('MATLAB_', BUILD, ',_glmnet_matlab_ver_', glmnetVersion,'.zip'));
    zip(zipFileName,'*');
    
    % go back to the old folder
    cd(oldfolder);
catch e
    cd(oldfolder);
    rethrow(e);
end

% clean up
rmdir(BUILD,'s');