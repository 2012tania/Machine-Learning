clear all;
clc;


load PartitionedData60&200.mat;

trainPeakData=[partitition2Data;partitition3Data;partitition4Data];
validationPeakData=partitition1Data;

trainDataLabel=[partitition2Label;partitition3Label;partitition4Label];
validationDataLabel=partitition1Label;

[totalCenters,totalBetas]=getHiddenLayerParameters(trainPeakData,trainDataLabel,2);
Weights=getOutputLayerParameters(trainPeakData,trainDataLabel,totalCenters,totalBetas);

noOfValidationData=size(validationPeakData,1);

    count=0;    
    for i=1:noOfValidationData
       squaredDifference=(bsxfun(@minus,totalCenters,validationPeakData(i,:))).^2;
       sum1=sum(squaredDifference,2);
  
       rbfnFunctionValues=exp(-totalBetas.*sum1);
       
       Activation=transpose(rbfnFunctionValues);
       Activation=[1,Activation];
       
       values = transpose(Weights)*transpose(Activation);
       
       [maxValue, class]=max(values);
       
       if(class~=validationDataLabel(i,1))
           count=count+1;
       end
    end
    
    errorRate1=(count/noOfValidationData)*100;
    
    
    
trainPeakData=[partitition1Data;partitition3Data;partitition4Data];
validationPeakData=partitition2Data;

trainDataLabel=[partitition1Label;partitition3Label;partitition4Label];
validationDataLabel=partitition2Label;

[totalCenters,totalBetas]=getHiddenLayerParameters(trainPeakData,trainDataLabel,2);
Weights=getOutputLayerParameters(trainPeakData,trainDataLabel,totalCenters,totalBetas);

noOfValidationData=size(validationPeakData,1);

    count=0;    
    for i=1:noOfValidationData
       squaredDifference=(bsxfun(@minus,totalCenters,validationPeakData(i,:))).^2;
       sum1=sum(squaredDifference,2);
  
       rbfnFunctionValues=exp(-totalBetas.*sum1);
       
       Activation=transpose(rbfnFunctionValues);
       Activation=[1,Activation];
       
       values = transpose(Weights)*transpose(Activation);
       
       [maxValue, class]=max(values);
       
       if(class~=validationDataLabel(i,1))
           count=count+1;
       end
    end
    
    errorRate2=(count/noOfValidationData)*100;
    
    
trainPeakData=[partitition1Data;partitition2Data;partitition4Data];
validationPeakData=partitition3Data;

trainDataLabel=[partitition1Label;partitition2Label;partitition4Label];
validationDataLabel=partitition3Label;

[totalCenters,totalBetas]=getHiddenLayerParameters(trainPeakData,trainDataLabel,2);
Weights=getOutputLayerParameters(trainPeakData,trainDataLabel,totalCenters,totalBetas);

noOfValidationData=size(validationPeakData,1);

    count=0;    
    for i=1:noOfValidationData
       squaredDifference=(bsxfun(@minus,totalCenters,validationPeakData(i,:))).^2;
       sum1=sum(squaredDifference,2);
  
       rbfnFunctionValues=exp(-totalBetas.*sum1);
       
       Activation=transpose(rbfnFunctionValues);
       Activation=[1,Activation];
       
       values = transpose(Weights)*transpose(Activation);
       
       [maxValue, class]=max(values);
       
       if(class~=validationDataLabel(i,1))
           count=count+1;
       end
    end
    
    errorRate3=(count/noOfValidationData)*100;
    
    
trainPeakData=[partitition1Data;partitition2Data;partitition3Data];
validationPeakData=partitition4Data;

trainDataLabel=[partitition1Label;partitition2Label;partitition3Label];
validationDataLabel=partitition4Label;

[totalCenters,totalBetas]=getHiddenLayerParameters(trainPeakData,trainDataLabel,2);
Weights=getOutputLayerParameters(trainPeakData,trainDataLabel,totalCenters,totalBetas);

noOfValidationData=size(validationPeakData,1);

    count=0;    
    for i=1:noOfValidationData
       squaredDifference=(bsxfun(@minus,totalCenters,validationPeakData(i,:))).^2;
       sum1=sum(squaredDifference,2);
  
       rbfnFunctionValues=exp(-totalBetas.*sum1);
       
       Activation=transpose(rbfnFunctionValues);
       Activation=[1,Activation];
       
       values = transpose(Weights)*transpose(Activation);
       
       [maxValue, class]=max(values);
       
       if(class~=validationDataLabel(i,1))
           count=count+1;
       end
    end
    
    errorRate4=(count/noOfValidationData)*100;
    
    avgErrorRate=(errorRate1+errorRate2+errorRate3+errorRate4)/4;