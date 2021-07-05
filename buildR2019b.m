%% Compiler and other relevant Information
% Microsoft Windows 20H2 19042.1052
% MATLAB Version: 9.7.0.1586710 (R2019b) Update 8
% Intel(R) Fortran Intel(R) 64 Compiler Classic for applications running on Intel(R) 64, Version 2021.2.0 Build 20210228_000000
% Visual Studio 2017 version 15.9.36
% Microsoft (R) Incremental Linker Version 14.16.27045.0
% 
% 
% Note that this fortran compiler is not officially support by MathWorks.
% However, it works.

% License GPL-2

%%
clc; clear; close all;

BUILD = 'R2019b_Windows';

% setup build directory
copyfile('source', BUILD);


% This configures mex to use the intel 2021 compiler on my machine
mex -setup:compiler_configuration\intel_fortran_21_vs2017.xml FORTRAN

oldfolder = cd(BUILD);
try 

    % record the build process
    diary(strcat(BUILD,'_mex_build.log'));
    mex -v COMPFLAGS='$COMPFLAGS /real_size:64 /integer_size:64' -largeArrayDims glmnetMex.F GLMnet.f 
    diary('off')

    % create the release
    zipFileName = fullfile(oldfolder,strcat(BUILD,'.zip'));
    zip(zipFileName,'*');
    
    % go back to the old folder
    cd(oldfolder);
catch e
    cd(oldfolder);
    rethrow(e);
end

% clean up
rmdir(BUILD,'s');