x = inputs';
t = outputs';

trainFcn = 'trainscg';

% Create a Pattern Recognition Network
hiddenLayerSize = 5;
net = patternnet(hiddenLayerSize, trainFcn);
net.divideFcn ='divideblock';

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 30/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 60/100;

net.initFcn = 'initlay';
rng(0);
% Train the Network
[net,tr] = train(net,x,t);

if (true)
    % Generate a matrix-only MATLAB function for neural network code
    % generation with MATLAB Coder tools.
    genFunction(net,'myNeuralNetworkFunction','MatrixOnly','yes');
    y = myNeuralNetworkFunction(x);
end

y = double(y' > 0.5);
t = t';

testIndices = tr.testInd;
tTest = t(testIndices, :);
yTest = y(testIndices, :);

%Confusion matrix
C = confusionmat(tTest, yTest);
fprintf('Confusion matrix:\n');
disp(C);

% TP, TN, FP, FN
TP = C(2, 2);
TN = C(1, 1);
FP = C(1, 2);
FN = C(2, 1);

% Calculating rates
TNR = TN/(TN+FP) * 100;
TPR = TP/(TP+FN) * 100;
FNR = FN/(TP+FN) * 100;
FPR = FP/(TN+FP) * 100;

accuracy = (TP + TN)/(TP + TN + FP + FN) * 100;
precision = TP/(TP + FP) * 100;
f1Score = (2*TP)/(2*TP+FP+FN) * 100;

fprintf('TP: %d\n', TP);
fprintf('TN: %d\n', TN);
fprintf('FP: %d\n', FP);
fprintf('FN: %d\n', FN);
fprintf('TPR: %.2f\n', TPR);
fprintf('TNR: %.2f\n', TNR);
fprintf('FPR: %.2f\n', FPR);
fprintf('FNR: %.2f\n', FNR);
fprintf('Accuracy: %.2f%%\n', accuracy);
fprintf('Precision: %.2f%%\n', precision);
fprintf('F1Score: %.2f%%\n', f1Score);


