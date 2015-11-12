function [totalCenters,totalBetas]=getHiddenLayerParameters(trainPeakData,trainDataLabel,hiddenBlocksPerClass)
    
    classes = unique(trainDataLabel);
    noOfClasses = size(classes,1);
    
    k=hiddenBlocksPerClass;
    totalHiddenBlocks=noOfClasses*k;
    
    dimension=size(trainPeakData,2);
    
    totalCenters=[];
    totalBetas=[];
    %totalCenters=zeros(totalHiddenBlocks,dimension);
    %totalBetas=zeros(totalHiddenBlocks,1);
    
    for i=1:noOfClasses
        classTrainData=trainPeakData((trainDataLabel==i),:);
        
        [noOfClassData, dimension]=size(classTrainData);
        
        %newCenters=classTrainData(1:noOfHiddenBlocks,:);
        oldClassCenters=classTrainData(1:hiddenBlocksPerClass,:);
        
        for j=1:150
            %clustAssignment = findCluster(classTrainData,oldCenters);
            
            %k=size(oldClassCenters,1);
            allDistances=zeros(noOfClassData,k);
            classClusterAssignment=zeros(noOfClassData,1);
            
            for m=1:k
                squaredDifference=(bsxfun(@minus,classTrainData,oldClassCenters(m,:))).^2;
                sum1=sum(squaredDifference,2);
                euclideanDistances=sqrt(sum1);
                allDistances(:,m)=euclideanDistances;
            end
            
            [leastDistance, classClusterAssignment]=min(allDistances,[],2);
            
            %newCenters=getNewCenters(classTrainData,oldCenters,clusterAssignment,k);
            
            newClassCenters=zeros(k,dimension);
            
            for m=1:k
                if(~any(classClusterAssignment==m))
                    newClassCenters(m,:)=oldClassCenters(m,:);
                else
                    clusterData=classTrainData(classClusterAssignment==m,:);
                    newClassCenters(m,:)=mean(clusterData);
                end
                %if(sum1(classClusterAssignment==m)>=1)
                %    clusterData=classTrainData(classClusterAssignment==m,:);
                %    newClassCenters(m,:)=mean(clusterData);
                %else
                %    newClassCenters(m,:)=oldClassCenters(m,:);
                %end
            end
            
            if(newClassCenters==oldClassCenters)
                break;
            else
                oldClassCenters=newClassCenters;
            end 
        end  
            
        classBetas=zeros(k,1);
        
        for j=1:k
            group=classTrainData((classClusterAssignment==j),:);
            squaredDifference=(bsxfun(@minus,group,newClassCenters(j,:))).^2;
            sum1=sum(squaredDifference,2);
            euclideanDistances=sqrt(sum1);
            classBetas(j)=1/(2*(mean(euclideanDistances)).^2);
        end
       
        %numberOfClassCenters=size(newClassCenters);
        %numberOfTotalCenters=size(totalCenters,1);
        %totalCenters(numberOfTotalCenters+1:numberOfClassCenters,:)=newClassCenters(:,:);
        
        %numberOfClassBetas=size(classBetas);
        %numberOfTotalBetas=size(totalBetas,1);
        %totalBetas(numberOfTotalBetas+1:numberOfClassBetas,:)=classBetas(:,:); 
        
        totalCenters=[totalCenters;newClassCenters];
        totalBetas=[totalBetas;classBetas]; 
    end
end