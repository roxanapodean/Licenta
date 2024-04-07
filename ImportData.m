filename = 'EngSpeed_Multiplication_100%_TA_Inputs.asc';
delimiterIn = ',';
data= importdata(filename,delimiterIn);
inputs =data(:,1:end-1);
outputs = data(:,6);