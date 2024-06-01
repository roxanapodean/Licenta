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

fprintf('TP: %d\n', TP);
fprintf('TN: %d\n', TN);
fprintf('FP: %d\n', FP);
fprintf('FN: %d\n', FN);


