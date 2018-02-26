%*************************************************************************
%
% Project Name: Path Loss (PL) Modeling for Indoor and Outdoor mmWave
%               transmissions
% File Name: pathLossModel.m
%
% Author: Miead Tehrani-Moayyed
% Work address: Wireless Networks and System Lab, 301 Ell Hall 
% Northeastern University, 360 Huntington Ave. Boston, MA 02115
% email: tehranimoayyed.m@husky.neu.edu
% Website: http://sites.google.com/site/mieadt/
% Last revision: 16-Feb-2018
%
% pathLossModel() function calculates the parameters of the Path Loss model
%   Input arguments:
%   pl  - input dataset contains two columns
%           1st column - the distance between Tx and Rx
%           2nd column - measured path loss values vs. distance from Tx
%      
%   f   - frequency in Hz
%   d0  - refence distance in meters
%
%   Output arguments:
%   n   -  Path Loss Exponent
%   sigma - standard deviation of the Shadowing Factor (SF) 
%
%   The pathLossModel() function with no output arguments plots the PL
%   model for the measured path loss values saved in the ".mat" files.
%
% Example of usage:
%   To obtain the Path Loss (PL) model parameters
%    load('ConferenceRoom_complex.mat');
%    [n,sigma,FSPL_d0]=pathLossModel(pl,60e9,1);
%   To plot the PL model
%    load('ConferenceRoom_complex.mat');
%    pathLossModel(pl,60e9,1);
%
% m-files required: none
% Subfunctions: none
% Input data files required: use provided ".mat" files or your own files
% containing the path loss values to be analyzed.
%
% See also: examplePLModel.m, getCIR.m, exampleGetCIR.m
%
%*************************************************************************


%------------- BEGIN CODE --------------    

function [n,sigma,FSPL_d0]=pathLossModel(pl,f,d0)
%specify default value for the arguments (f and d0) when they are not
%assigned
if nargin==1
    f=60*10^9; % in Hz
    d0=1; % in meter
elseif nargin==2
    d0=1; % in meters
end

% calculate distances
d=10*log10(pl(:,1));

% calculate free-space path loss for the given frequency f and d0=1m
FSPL_d0=20*log10(4*pi*d0/(3e8/(f)));

% calculate A as PL(f,d)[dB]-FSPL(f,1m)
A=pl(:,2)-FSPL_d0;

% calculate n, path loss exponent and sigma of the SF
n=sum(A.*d)/sum(d.^2);
sigma=sqrt(sum((A-n*d).^2)/size(pl,1));


if nargout==0
    %plot measured pl values when no output arguments are specified
    figure
    subplot(1,2,1);
    plot (pl(:,1), pl(:,2), 'r.');
    hold on;
    
    
    R=d0:0.1:2*max(pl(:,1));
    pl_bar=FSPL_d0+10*n*log10(R/d0);
    plot(R,pl_bar,'b-.');

    
    xlabel('Tx-Rx Distance (m)');
    ylabel('Path Loss (dB)');
    legend('Measured PL Values',...
          ['PL Model' char(10)...
          'n=' num2str(n) char(10)...
          '\sigma=' num2str(sigma) char(10)...
          'FSPL(d_0)=' num2str(FSPL_d0) ]);
    grid minor;
    %write path loss model equation on the plot
    text(xlim*[3/4;1/4],ylim*[3/4;1/4]+1,'PL Model: PL(D)=FSPL(d_0)+n*10*log(D/D_0)+\chi_\sigma');
    %text(xlim*[3/4;1/4],ylim*[3/4;1/4]-1,['PL Model:' ' PL(D)=' num2str(FSPL_d0) '+' num2str(n) '*10*log(D/D_0)+\chi_\sigma']);
    
    % plot the distribution of path loss values
    subplot(1,2,2)
    chi_sigma=pl(:,2)-FSPL_d0-n*d;
    h=histogram(chi_sigma, 'normalization','pdf');
    hold on;
    mu=mean(chi_sigma);
    x=h.BinEdges;
    y = (   1/(sigma*sqrt(2*pi))   )  *  exp(-0.5*((x-mu)/sigma).^2  );
    plot (x,y)
        
    grid on;
    title('Distribution of \chi_\sigma')
    xlabel('\chi_\sigma');
    ylabel('PDF_\chi_\sigma(\chi_\sigma)');
    legend('Distribution of \chi_\sigma',....
        ['Normal Approximation' char(10)...
        'mu=' num2str(mu) char(10)...
        '\sigma=' num2str(sigma)])
    set(gcf,'units','normalized','position',[1/4 1/4 1/2 1/2])
   
end

end
%------------- END OF CODE --------------


        




