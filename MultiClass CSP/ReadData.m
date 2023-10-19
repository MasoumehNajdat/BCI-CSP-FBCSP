clc
clear
close all
format compact
format short
rng(123, 'twister')

%% Read Data
AvailableData = '12456789';

for Sbj = AvailableData
    FileName = ['DatasetMultiClass\A0' Sbj 'T.gdf'];
    [Signal, h] = sload(FileName);
    Fs = h.SampleRate;

    %% Missing Value Removal
    indx = find(isnan(Signal));
    Signal(indx) = 0;

    %% Band-Pass Filtering to Extract Mu and Beta Rhythms
    % Filter Design
    order = 3;
    fl = 8;
    fh = 30;
    wn = [fl fh] / (Fs/2);
    type = 'bandpass';
    [b, a] = butter(order, wn, type);

    % Filter Application
    Signal = filtfilt(b, a, Signal(:, 1:22));

    %% Separate Data Trials
    Gp = h.EVENT.TYP;
    Pos = h.EVENT.POS;
    TrialLen = h.EVENT.DUR;

    % Empty Data Arrays
    X1 = [];
    X2 = [];
    X3 = [];
    X4 = [];

    for i = 1:length(Gp)

        Idx = Pos(i): Pos(i) + TrialLen(i)-1;
        Trial = Signal(Idx, :);

        if Gp(i) == 769
            X1 = cat(3, X1, Trial);

        elseif Gp(i) == 770
            X2 = cat(3, X2, Trial);

        elseif Gp(i) == 771
            X3 = cat(3, X3, Trial);

        elseif Gp(i) == 772
            X4 = cat(3, X4, Trial);
        end
    end

    %% Save Data
    FileName = ['A' Sbj '.mat'];
    save(FileName, "X1", "X2", "X3", "X4", "Fs")
end

%% Notes
% Make sure to install BioSig Matlab Toolbox to be able to read the
%   gdf files and extract data properties. Otherwise this Code wont work!

