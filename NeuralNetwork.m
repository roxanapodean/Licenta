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