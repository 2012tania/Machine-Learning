clear all;
clc;


load ProcessedData60&200.mat;

Indices=crossvalind('KFold',trainDataLabel,4);

partitition1Data=trainPeakData((Indices==1),:);
partitition2Data=trainPeakData((Indices==2),:);
partitition3Data=trainPeakData((Indices==3),:);
partitition4Data=trainPeakData((Indices==4),:);

partitition1Label=trainDataLabel((Indices==1),:);
partitition2Label=trainDataLabel((Indices==2),:);
partitition3Label=trainDataLabel((Indices==3),:);
partitition4Label=trainDataLabel((Indices==4),:);

save('PartitionedData60&200','partitition1Data','partitition2Data','partitition3Data','partitition4Data',...
    'partitition1Label','partitition2Label','partitition3Label','partitition4Label')