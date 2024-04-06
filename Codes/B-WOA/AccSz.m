
%% ========================================================================
%           Feature selection based on whale optimization algorithm
%                       for disease diagnosis
%                Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki

%        International Journal of Computer Science and Information Security
%                   (IJCSIS),Vol. 14, No. 9, September 2016
%            -----------------------------------------------------------
%                    Source codes developed in MATLAB R2016b
%                                Programmers:
%                 Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki
%                E-Mail: hoda_zamani@yahoo.com,nadimi@ieee.org
%           -----------------------------------------------------------
%  Homepage: https://scholar.google.com/citations?user=sT0YnDIAAAAJ&hl=en
%  Homepage: https://scholar.google.com/citations?user=bpZOZWsAAAAJ&hl=en
% ========================================================================


function FitnessValue = AccSz(x)
global DataSet trn vald SzW
SzW = 0.01;
x = x > 0.5;
x = cat(2, x, zeros(size(x,1), 1));
x = logical(x);
k = 3;

if sum(x) == 0
    FitnessValue = inf;
    return;
end

Mdl = fitcknn(DataSet(trn, x), DataSet(trn, end), 'NumNeighbors', k);
predictedLabels = predict(Mdl, DataSet(vald, x));
[cm,~] = confusionmat(DataSet(vald, end), predictedLabels);
TP = diag(cm); 
FP = sum(cm, 1) - TP; 
FN = sum(cm, 2) - TP; 
TN = sum(cm(:)) - TP - FP - FN; 
accuracy = sum(TP) / sum(cm(:));
errorRate = 1 - accuracy; % Error rate
precision = TP ./ (TP + FP);
recall = TP ./ (TP + FN);
FitnessValue = errorRate;
end