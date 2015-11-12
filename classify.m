clear all;
clc;
load ProcessedData70&200.mat;


[totalCenters,totalBetas]=getHiddenLayerParameters(trainPeakData,trainDataLabel,6);
Weights=getOutputLayerParameters(trainPeakData,trainDataLabel,totalCenters,totalBetas);

noOfTestData=size(testPeakData,1);

    count=0;    
    for i=1:noOfTestData
       squaredDifference=(bsxfun(@minus,totalCenters,testPeakData(i,:))).^2;
       sum1=sum(squaredDifference,2);
  
       rbfnFunctionValues=exp(-totalBetas.*sum1);
       
       Activation=transpose(rbfnFunctionValues);
       Activation=[1,Activation];
       
       values = transpose(Weights)*transpose(Activation);
       
       [maxValue, class]=max(values);
       
       if(class~=testDataLabel(i,1))
           count=count+1;
       end
    end
    
    errorRate=(count/noOfTestData)*100;
    
    