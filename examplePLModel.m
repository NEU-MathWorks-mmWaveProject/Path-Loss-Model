%*************************************************************************
%
% Project Name: Path Loss (PL) Modeling for Indoor and Outdoor mmWave
%               transmissions
% File Name: examplePLModel.m
%
% Author: Miead Tehrani-Moayyed
% Work address: Wireless Networks and System Lab, 301 Ell Hall 
% Northeastern University, 360 Huntington Ave. Boston, MA 02115
% email: tehranimoayyed.m@husky.neu.edu
% Website: http://sites.google.com/site/mieadt/
% Last revision: 16-Feb-2018
%
% This is an example of using the "pathLossModel.m" function to provide the
% large-scale channel characterization (Path Loss) for mmWave
% transmissions.
%
% This example shows how to use the function pathLossModel() for two
% different scenarios: 
%   1) Customizable (complex, semi-complex, simple) conference room in LOS
%   2) Vehicular-to-Infrastructure (V2I) communications in NLOS
% 
% The path loss model parameters are displayed in the command window, while 
% the generated graphs are plotted in separate pop-up windows.
%
% m-files required: pathLossModel.m
% Subfunctions: none
% Input data files required: use the provided ".mat" files or your own
% files containing the path loss values to be analyzed.
%
% See also: pathLossModel.m, getCIR.m, exampleGetCIR.m
%
%*************************************************************************

%------------- BEGIN CODE --------------

clc

%Indoor LOS scenario: Customizable Conference Room
%Use any of the three "ConferenceRoom_xxx.mat" files to customize the
%conference room
scenario='Complex Conference Room Scenario';
load('ConferenceRoom_complex.mat')
f=60e9;

%Obtain PL model parameters (path loss exponent and shadowing factor) for
%the given scenario
[n,sigma,FSPL_d0]=pathLossModel(pl,f,1);
disp(['Given the ' scenario char(10) ...
    'PL Parameters: n=' num2str(n) '    sigma=' num2str(sigma) ]);

%plot Path Loss model for the given scenario
pathLossModel(pl,f,1);
title(scenario);


%Outdoor NLOS scenario: V2I with two types of horn antennas, and Tx-Rx
%antenna beam alignment procedure
%Use any of the four "V2I_NLOS_xxx.mat" files provided in this folder 
scenario='V2I NLOS scenario, 22deg/15dBi antenna and no Beam Aligning';
load('V2I_NLOS_22deg15dBi_noBeamAligning.mat')
f=28e9;

%Obtain PL model parameters (path loss exponent and shadowing factor) for the given scenario
[n,sigma,FSPL_d0]=pathLossModel(pl,f,1);
disp(['Given the ' scenario char(10) ...
    'PL Parameters: n=' num2str(n) '    sigma=' num2str(sigma) ]);

%plot Path Loss model for the given scenario
pathLossModel(pl,f,1);
title(scenario);

%------------- END OF CODE --------------


