function Weights = getOutputLayerParameters(trainPeakData,trainDataLabel,totalCenters,totalBetas)
   
    classes = unique(trainDataLabel);
    noOfClasses = size(classes,1);

    [noOfTrainData, dimension]=size(trainPeakData);
    totalHiddenNeurons=size(totalCenters,1);

    Activation=zeros(noOfTrainData,totalHiddenNeurons);

    for i=1:noOfTrainData
       squaredDifference=(bsxfun(@minus,totalCenters,trainPeakData(i,:))).^2;
       sum1=sum(squaredDifference,2);
  
       rbfnFunctionValues=exp(-totalBetas.*sum1);
       
       Activation(i,:)=transpose(rbfnFunctionValues);
    end
    
    Activation=[ones(noOfTrainData,1),Activation];
    
    Weights=zeros(totalHiddenNeurons+1,noOfClasses);
    
    for i=1:noOfClasses
        modifiedTrainDataLabel = (trainDataLabel == i);
      
        Weights(:, i) = pinv(Activation' * Activation) * Activation' * modifiedTrainDataLabel;
    end
end


    
    
    